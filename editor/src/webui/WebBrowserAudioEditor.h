#pragma once

#include "JuceHeader.h"
#include "RNBO.h"
#include "RNBO_JuceAudioProcessor.h"

class CustomAudioProcessor;   // fwd: holds the lock-free viz analysis ring

// IDIORRITMOS web editor — 47 idr/* params. Relay/JS ids are idr_<name>
// (sanitized, no '/'); attachments link each relay to the RNBO param named
// idr/<name> by object reference, so the string id and DAW name are decoupled.
// Also a 30 Hz Timer: pushes real audio-analysis data to the JS visualizations.
class WebBrowserAudioEditor : public AudioProcessorEditor,
                              public juce::Timer,
                              private AudioProcessorListener
{
public:
    WebBrowserAudioEditor (RNBO::JuceAudioProcessor* const p, RNBO::CoreObject& rnboObject);
    ~WebBrowserAudioEditor() override;
    void paint (Graphics& g) override;
    void resized() override;

private:
    void audioProcessorChanged (AudioProcessor*, const ChangeDetails&) override {}
    void audioProcessorParameterChanged (AudioProcessor*, int, float) override {}

    void timerCallback() override;                       // 30 Hz: push viz data to JS
    void applyPreset (int index);                        // load preset, preserving bpm

    std::optional<WebBrowserComponent::Resource> getResource (const String& url);

    RNBO::JuceAudioProcessor* _audioProcessor;
    CustomAudioProcessor*     _proc = nullptr;            // same object, concrete type
    RNBO::CoreObject&         _rnboObject;

    // Relays (declared before _webComponent so they init first).
    WebSliderRelay _cloudRelay { "idr_cloud" };
    WebSliderRelay _playspeedRelay { "idr_playspeed" };
    WebSliderRelay _spmodeRelay { "idr_spmode" };
    WebSliderRelay _spARelay { "idr_spA" };
    WebSliderRelay _spBRelay { "idr_spB" };
    WebToggleButtonRelay _cloudholdRelay { "idr_cloudhold" };
    WebToggleButtonRelay _syncRelay { "idr_sync" };
    WebSliderRelay _bpmRelay { "idr_bpm" };
    WebSliderRelay _tapdivRelay { "idr_tapdiv" };
    WebSliderRelay _lfodivRelay { "idr_lfodiv" };
    WebSliderRelay _freezedivRelay { "idr_freezediv" };
    WebToggleButtonRelay _tapsyncRelay { "idr_tapsync" };
    WebToggleButtonRelay _lfosyncRelay { "idr_lfosync" };
    WebToggleButtonRelay _freezesyncRelay { "idr_freezesync" };
    WebSliderRelay _tapcountRelay { "idr_tapcount" };
    WebSliderRelay _basemsRelay { "idr_basems" };
    WebSliderRelay _modeRelay { "idr_mode" };
    WebSliderRelay _ARelay { "idr_A" };
    WebSliderRelay _BRelay { "idr_B" };
    WebSliderRelay _fbkRelay { "idr_fbk" };
    WebSliderRelay _lopassRelay { "idr_lopass" };
    WebSliderRelay _diffusionRelay { "idr_diffusion" };
    WebToggleButtonRelay _freezeRelay { "idr_freeze" };
    WebSliderRelay _freezelenRelay { "idr_freezelen" };
    WebSliderRelay _lforateRelay { "idr_lforate" };
    WebSliderRelay _lfomodeRelay { "idr_lfomode" };
    WebSliderRelay _lfoARelay { "idr_lfoA" };
    WebSliderRelay _lfoBRelay { "idr_lfoB" };
    WebSliderRelay _lfodepthRelay { "idr_lfodepth" };
    WebToggleButtonRelay _lfoshapeRelay { "idr_lfoshape" };
    WebSliderRelay _morphRelay { "idr_morph" };
    WebToggleButtonRelay _gateonRelay { "idr_gateon" };
    WebSliderRelay _gatedivRelay { "idr_gatediv" };
    WebSliderRelay _gatedepthRelay { "idr_gatedepth" };
    WebSliderRelay _gatedutyRelay { "idr_gateduty" };
    WebSliderRelay _crushbitsRelay { "idr_crushbits" };
    WebSliderRelay _downsampRelay { "idr_downsamp" };
    WebSliderRelay _evolveRelay { "idr_evolve" };
    WebSliderRelay _evolverateRelay { "idr_evolverate" };
    WebSliderRelay _widthRelay { "idr_width" };
    WebSliderRelay _panmodeRelay { "idr_panmode" };
    WebSliderRelay _panARelay { "idr_panA" };
    WebSliderRelay _panBRelay { "idr_panB" };
    WebSliderRelay _mixRelay { "idr_mix" };
    WebSliderRelay _outgainRelay { "idr_outgain" };
    WebToggleButtonRelay _panicRelay { "idr_panic" };
    WebToggleButtonRelay _rerollRelay { "idr_reroll" };

    struct SinglePageBrowser : WebBrowserComponent
    {
        using WebBrowserComponent::WebBrowserComponent;
        bool pageAboutToLoad (const String& newURL) override;
        bool pageLoadHadNetworkError (const String& errorInfo) override;
        void pageFinishedLoading (const String& url) override;
    private:
        bool _devServerFailed = false;
    };

    SinglePageBrowser _webComponent {
        WebBrowserComponent::Options{}
            .withBackend (WebBrowserComponent::Options::Backend::webview2)
            .withWinWebView2Options (WebBrowserComponent::Options::WinWebView2{}
                .withUserDataFolder (File::getSpecialLocation (
                    File::SpecialLocationType::tempDirectory)))
            .withNativeIntegrationEnabled()
            // preset menu → RNBO presets (exposed as JUCE programs by the adapter)
            .withEventListener ("setPreset", [this] (juce::var v)
                { applyPreset ((int) v.getProperty ("index", juce::var (0))); })
            .withOptionsFrom (_cloudRelay)
            .withOptionsFrom (_playspeedRelay)
            .withOptionsFrom (_spmodeRelay)
            .withOptionsFrom (_spARelay)
            .withOptionsFrom (_spBRelay)
            .withOptionsFrom (_cloudholdRelay)
            .withOptionsFrom (_syncRelay)
            .withOptionsFrom (_bpmRelay)
            .withOptionsFrom (_tapdivRelay)
            .withOptionsFrom (_lfodivRelay)
            .withOptionsFrom (_freezedivRelay)
            .withOptionsFrom (_tapsyncRelay)
            .withOptionsFrom (_lfosyncRelay)
            .withOptionsFrom (_freezesyncRelay)
            .withOptionsFrom (_tapcountRelay)
            .withOptionsFrom (_basemsRelay)
            .withOptionsFrom (_modeRelay)
            .withOptionsFrom (_ARelay)
            .withOptionsFrom (_BRelay)
            .withOptionsFrom (_fbkRelay)
            .withOptionsFrom (_lopassRelay)
            .withOptionsFrom (_diffusionRelay)
            .withOptionsFrom (_freezeRelay)
            .withOptionsFrom (_freezelenRelay)
            .withOptionsFrom (_lforateRelay)
            .withOptionsFrom (_lfomodeRelay)
            .withOptionsFrom (_lfoARelay)
            .withOptionsFrom (_lfoBRelay)
            .withOptionsFrom (_lfodepthRelay)
            .withOptionsFrom (_lfoshapeRelay)
            .withOptionsFrom (_morphRelay)
            .withOptionsFrom (_gateonRelay)
            .withOptionsFrom (_gatedivRelay)
            .withOptionsFrom (_gatedepthRelay)
            .withOptionsFrom (_gatedutyRelay)
            .withOptionsFrom (_crushbitsRelay)
            .withOptionsFrom (_downsampRelay)
            .withOptionsFrom (_evolveRelay)
            .withOptionsFrom (_evolverateRelay)
            .withOptionsFrom (_widthRelay)
            .withOptionsFrom (_panmodeRelay)
            .withOptionsFrom (_panARelay)
            .withOptionsFrom (_panBRelay)
            .withOptionsFrom (_mixRelay)
            .withOptionsFrom (_outgainRelay)
            .withOptionsFrom (_panicRelay)
            .withOptionsFrom (_rerollRelay)
            .withKeepPageLoadedWhenBrowserIsHidden()
            .withResourceProvider ([this] (const auto& url) { return getResource (url); })
    };

    // Attachments (declared after _webComponent; initialized in the ctor list).
    WebSliderParameterAttachment _cloudAttachment;
    WebSliderParameterAttachment _playspeedAttachment;
    WebSliderParameterAttachment _spmodeAttachment;
    WebSliderParameterAttachment _spAAttachment;
    WebSliderParameterAttachment _spBAttachment;
    WebToggleButtonParameterAttachment _cloudholdAttachment;
    WebToggleButtonParameterAttachment _syncAttachment;
    WebSliderParameterAttachment _bpmAttachment;
    WebSliderParameterAttachment _tapdivAttachment;
    WebSliderParameterAttachment _lfodivAttachment;
    WebSliderParameterAttachment _freezedivAttachment;
    WebToggleButtonParameterAttachment _tapsyncAttachment;
    WebToggleButtonParameterAttachment _lfosyncAttachment;
    WebToggleButtonParameterAttachment _freezesyncAttachment;
    WebSliderParameterAttachment _tapcountAttachment;
    WebSliderParameterAttachment _basemsAttachment;
    WebSliderParameterAttachment _modeAttachment;
    WebSliderParameterAttachment _AAttachment;
    WebSliderParameterAttachment _BAttachment;
    WebSliderParameterAttachment _fbkAttachment;
    WebSliderParameterAttachment _lopassAttachment;
    WebSliderParameterAttachment _diffusionAttachment;
    WebToggleButtonParameterAttachment _freezeAttachment;
    WebSliderParameterAttachment _freezelenAttachment;
    WebSliderParameterAttachment _lforateAttachment;
    WebSliderParameterAttachment _lfomodeAttachment;
    WebSliderParameterAttachment _lfoAAttachment;
    WebSliderParameterAttachment _lfoBAttachment;
    WebSliderParameterAttachment _lfodepthAttachment;
    WebToggleButtonParameterAttachment _lfoshapeAttachment;
    WebSliderParameterAttachment _morphAttachment;
    WebToggleButtonParameterAttachment _gateonAttachment;
    WebSliderParameterAttachment _gatedivAttachment;
    WebSliderParameterAttachment _gatedepthAttachment;
    WebSliderParameterAttachment _gatedutyAttachment;
    WebSliderParameterAttachment _crushbitsAttachment;
    WebSliderParameterAttachment _downsampAttachment;
    WebSliderParameterAttachment _evolveAttachment;
    WebSliderParameterAttachment _evolverateAttachment;
    WebSliderParameterAttachment _widthAttachment;
    WebSliderParameterAttachment _panmodeAttachment;
    WebSliderParameterAttachment _panAAttachment;
    WebSliderParameterAttachment _panBAttachment;
    WebSliderParameterAttachment _mixAttachment;
    WebSliderParameterAttachment _outgainAttachment;
    WebToggleButtonParameterAttachment _panicAttachment;
    WebToggleButtonParameterAttachment _rerollAttachment;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (WebBrowserAudioEditor)
};
