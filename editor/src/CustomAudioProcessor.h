#include "RNBO.h"
#include "RNBO_Utils.h"
#include "RNBO_JuceAudioProcessor.h"
#include "RNBO_BinaryData.h"
#include <json/json.hpp>
#include <atomic>

class CustomAudioProcessor : public RNBO::JuceAudioProcessor {
public:
    static CustomAudioProcessor* CreateDefault();
    CustomAudioProcessor(const nlohmann::json& patcher_desc, const nlohmann::json& presets, const RNBO::BinaryData& data);
    juce::AudioProcessorEditor* createEditor() override;

    // Tap the audio for the web-UI visualizations (JV-hook). We capture the
    // stereo input before RNBO processes and the output after, into a lock-free
    // ring the editor's 30 Hz Timer reads. Single producer (audio thread) /
    // single consumer (message thread); relaxed tearing is fine for a scope.
    void processBlock (juce::AudioBuffer<float>&, juce::MidiBuffer&) override;

    static constexpr int kAnaSize = 4096;   // power of two
    struct Analysis {
        float inL[kAnaSize]{}, inR[kAnaSize]{}, outL[kAnaSize]{}, outR[kAnaSize]{};
        std::atomic<int> writePos { 0 };
    };
    Analysis analysis;

    // Host transport, sampled on the audio thread (AudioPlayHead::getPosition() is
    // only valid there); the editor Timer reads these atomics for the readout.
    std::atomic<double> hostBpm { 120.0 };
    std::atomic<bool>   hostPlaying { false };

private:
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (CustomAudioProcessor)
};

