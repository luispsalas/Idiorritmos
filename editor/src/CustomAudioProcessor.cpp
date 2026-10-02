#include "CustomAudioProcessor.h"
#include <json/json.hpp>
#include "ui-config.h"

#ifdef RNBO_INCLUDE_DESCRIPTION_FILE
#include <rnbo_description.h>
#endif

//create an instance of our custom plugin, optionally set description, presets and binary data (datarefs)
CustomAudioProcessor* CustomAudioProcessor::CreateDefault() {
	nlohmann::json patcher_desc, presets;

#ifdef RNBO_BINARY_DATA_STORAGE_NAME
	extern RNBO::BinaryDataImpl::Storage RNBO_BINARY_DATA_STORAGE_NAME;
	RNBO::BinaryDataImpl::Storage dataStorage = RNBO_BINARY_DATA_STORAGE_NAME;
#else
	RNBO::BinaryDataImpl::Storage dataStorage;
#endif
	RNBO::BinaryDataImpl data(dataStorage);

#ifdef RNBO_INCLUDE_DESCRIPTION_FILE
	patcher_desc = RNBO::patcher_description;
	presets = RNBO::patcher_presets;
#endif
  return new CustomAudioProcessor(patcher_desc, presets, data);
}

CustomAudioProcessor::CustomAudioProcessor(
    const nlohmann::json& patcher_desc,
    const nlohmann::json& presets,
    const RNBO::BinaryData& data
    ) 
  : RNBO::JuceAudioProcessor(patcher_desc, presets, data) 
{
}

void CustomAudioProcessor::processBlock (juce::AudioBuffer<float>& buffer, juce::MidiBuffer& midi)
{
    const int n   = buffer.getNumSamples();
    const int nch = buffer.getNumChannels();

    // Capture the INPUT before RNBO overwrites the buffer (processing is in-place).
    constexpr int MAXB = 4096;
    float ciL[MAXB], ciR[MAXB];
    const int m = juce::jmin (n, MAXB);
    if (nch > 0) { auto* p = buffer.getReadPointer (0); for (int i = 0; i < m; ++i) ciL[i] = p[i]; }
    else         { for (int i = 0; i < m; ++i) ciL[i] = 0.0f; }
    if (nch > 1) { auto* p = buffer.getReadPointer (1); for (int i = 0; i < m; ++i) ciR[i] = p[i]; }
    else         { for (int i = 0; i < m; ++i) ciR[i] = ciL[i]; }

    RNBO::JuceAudioProcessor::processBlock (buffer, midi);

    // host tempo / play state — valid to read here (audio thread)
    if (auto* ph = getPlayHead())
        if (auto pos = ph->getPosition())
        {
            if (auto b = pos->getBpm()) hostBpm.store (*b, std::memory_order_relaxed);
            hostPlaying.store (pos->getIsPlaying(), std::memory_order_relaxed);
        }

    auto* oL = nch > 0 ? buffer.getReadPointer (0) : nullptr;
    auto* oR = nch > 1 ? buffer.getReadPointer (1) : oL;
    int wp = analysis.writePos.load (std::memory_order_relaxed);
    for (int i = 0; i < m; ++i) {
        analysis.inL[wp]  = ciL[i];
        analysis.inR[wp]  = ciR[i];
        analysis.outL[wp] = oL ? oL[i] : 0.0f;
        analysis.outR[wp] = oR ? oR[i] : 0.0f;
        wp = (wp + 1) & (kAnaSize - 1);
    }
    analysis.writePos.store (wp, std::memory_order_release);
}

juce::AudioProcessorEditor* CustomAudioProcessor::createEditor()
{
#if defined(RNBO_EDITOR_NATIVE)
    return new CustomAudioEditor (this, this->_rnboObject);
#elif defined(RNBO_EDITOR_WEBVIEW)
    return new WebBrowserAudioEditor (this, this->_rnboObject);
#else
    return RNBO::JuceAudioProcessor::createEditor();
#endif
}

