#include "WebBrowserAudioEditor.h"
#include "CustomAudioProcessor.h"
#include "BinaryData.h"
#include <cmath>

// Dev server (optional): serve src/webui over :3000 to iterate without recompiling.
// pageLoadHadNetworkError falls back to the compiled-in resource provider.
#if JUCE_ANDROID
static const juce::String kDevServerAddress = "http://10.0.2.2:3000/";
#else
static const juce::String kDevServerAddress = "http://localhost:3000/";
#endif

//==============================================================================
bool WebBrowserAudioEditor::SinglePageBrowser::pageAboutToLoad (const String& newURL)
{
    setVisible (false);
    return newURL.startsWith (kDevServerAddress)
        || newURL == getResourceProviderRoot();
}

bool WebBrowserAudioEditor::SinglePageBrowser::pageLoadHadNetworkError (const String& /*errorInfo*/)
{
    if (! _devServerFailed)
    {
        _devServerFailed = true;
        goToURL (getResourceProviderRoot());
        return false;
    }
    return true;
}

void WebBrowserAudioEditor::SinglePageBrowser::pageFinishedLoading (const String& /*url*/)
{
    setVisible (true);
}

//==============================================================================
namespace
{
    static const char* getMimeForExtension (const String& ext)
    {
        if (ext == "html" || ext == "htm") return "text/html";
        if (ext == "css")                  return "text/css";
        if (ext == "js")                   return "text/javascript";
        if (ext == "json")                 return "application/json";
        if (ext == "svg")                  return "image/svg+xml";
        if (ext == "png")                  return "image/png";
        if (ext == "jpg" || ext == "jpeg") return "image/jpeg";
        if (ext == "ico")                  return "image/vnd.microsoft.icon";
        if (ext == "woff2")                return "font/woff2";
        return "application/octet-stream";
    }
}

static juce::RangedAudioParameter&
findParameter(RNBO::JuceAudioProcessor* p, const juce::String& name)
{
    for (auto* param : p->getParameters())
        if (param->getName(128) == name)
            return static_cast<juce::RangedAudioParameter&>(*param);
    throw std::runtime_error("Parameter not found: " + name.toStdString());
}

//==============================================================================
WebBrowserAudioEditor::WebBrowserAudioEditor (RNBO::JuceAudioProcessor* const p,
                                              RNBO::CoreObject& rnboObject)
    : AudioProcessorEditor (p)
    , _audioProcessor (p)
    , _rnboObject (rnboObject)
    , _cloudAttachment(findParameter(p, "idr/cloud"), _cloudRelay, nullptr)
    , _playspeedAttachment(findParameter(p, "idr/playspeed"), _playspeedRelay, nullptr)
    , _spmodeAttachment(findParameter(p, "idr/spmode"), _spmodeRelay, nullptr)
    , _spAAttachment(findParameter(p, "idr/spA"), _spARelay, nullptr)
    , _spBAttachment(findParameter(p, "idr/spB"), _spBRelay, nullptr)
    , _cloudholdAttachment(findParameter(p, "idr/cloudhold"), _cloudholdRelay, nullptr)
    , _syncAttachment(findParameter(p, "idr/sync"), _syncRelay, nullptr)
    , _bpmAttachment(findParameter(p, "idr/bpm"), _bpmRelay, nullptr)
    , _tapdivAttachment(findParameter(p, "idr/tapdiv"), _tapdivRelay, nullptr)
    , _lfodivAttachment(findParameter(p, "idr/lfodiv"), _lfodivRelay, nullptr)
    , _freezedivAttachment(findParameter(p, "idr/freezediv"), _freezedivRelay, nullptr)
    , _tapsyncAttachment(findParameter(p, "idr/tapsync"), _tapsyncRelay, nullptr)
    , _lfosyncAttachment(findParameter(p, "idr/lfosync"), _lfosyncRelay, nullptr)
    , _freezesyncAttachment(findParameter(p, "idr/freezesync"), _freezesyncRelay, nullptr)
    , _tapcountAttachment(findParameter(p, "idr/tapcount"), _tapcountRelay, nullptr)
    , _basemsAttachment(findParameter(p, "idr/basems"), _basemsRelay, nullptr)
    , _modeAttachment(findParameter(p, "idr/mode"), _modeRelay, nullptr)
    , _AAttachment(findParameter(p, "idr/A"), _ARelay, nullptr)
    , _BAttachment(findParameter(p, "idr/B"), _BRelay, nullptr)
    , _fbkAttachment(findParameter(p, "idr/fbk"), _fbkRelay, nullptr)
    , _lopassAttachment(findParameter(p, "idr/lopass"), _lopassRelay, nullptr)
    , _diffusionAttachment(findParameter(p, "idr/diffusion"), _diffusionRelay, nullptr)
    , _freezeAttachment(findParameter(p, "idr/freeze"), _freezeRelay, nullptr)
    , _freezelenAttachment(findParameter(p, "idr/freezelen"), _freezelenRelay, nullptr)
    , _lforateAttachment(findParameter(p, "idr/lforate"), _lforateRelay, nullptr)
    , _lfomodeAttachment(findParameter(p, "idr/lfomode"), _lfomodeRelay, nullptr)
    , _lfoAAttachment(findParameter(p, "idr/lfoA"), _lfoARelay, nullptr)
    , _lfoBAttachment(findParameter(p, "idr/lfoB"), _lfoBRelay, nullptr)
    , _lfodepthAttachment(findParameter(p, "idr/lfodepth"), _lfodepthRelay, nullptr)
    , _lfoshapeAttachment(findParameter(p, "idr/lfoshape"), _lfoshapeRelay, nullptr)
    , _morphAttachment(findParameter(p, "idr/morph"), _morphRelay, nullptr)
    , _gateonAttachment(findParameter(p, "idr/gateon"), _gateonRelay, nullptr)
    , _gatedivAttachment(findParameter(p, "idr/gatediv"), _gatedivRelay, nullptr)
    , _gatedepthAttachment(findParameter(p, "idr/gatedepth"), _gatedepthRelay, nullptr)
    , _gatedutyAttachment(findParameter(p, "idr/gateduty"), _gatedutyRelay, nullptr)
    , _crushbitsAttachment(findParameter(p, "idr/crushbits"), _crushbitsRelay, nullptr)
    , _downsampAttachment(findParameter(p, "idr/downsamp"), _downsampRelay, nullptr)
    , _evolveAttachment(findParameter(p, "idr/evolve"), _evolveRelay, nullptr)
    , _evolverateAttachment(findParameter(p, "idr/evolverate"), _evolverateRelay, nullptr)
    , _widthAttachment(findParameter(p, "idr/width"), _widthRelay, nullptr)
    , _panmodeAttachment(findParameter(p, "idr/panmode"), _panmodeRelay, nullptr)
    , _panAAttachment(findParameter(p, "idr/panA"), _panARelay, nullptr)
    , _panBAttachment(findParameter(p, "idr/panB"), _panBRelay, nullptr)
    , _mixAttachment(findParameter(p, "idr/mix"), _mixRelay, nullptr)
    , _outgainAttachment(findParameter(p, "idr/outgain"), _outgainRelay, nullptr)
    , _panicAttachment(findParameter(p, "idr/panic"), _panicRelay, nullptr)
    , _rerollAttachment(findParameter(p, "idr/reroll"), _rerollRelay, nullptr)
{
    _proc = static_cast<CustomAudioProcessor*> (p);      // always a CustomAudioProcessor here
    addChildComponent (_webComponent);
    _webComponent.goToURL (kDevServerAddress);
    setSize (1186, 658);   // = the web UI's natural 1170×642 content + 16px padding (no dead space)

    // Resizable / maximizable: corner-drag + host resize. Fixed aspect ratio keeps
    // the layout proportional; the web UI's "Fit" mode recomputes its uniform zoom
    // on each resize event, so everything (text included) scales together.
    setResizable (true, true);
    setResizeLimits (712, 395, 2372, 1316);
    if (auto* c = getConstrainer())
        c->setFixedAspectRatio (1186.0 / 658.0);

    startTimerHz (30);                                   // JV-hook: feed the visualizations
}

WebBrowserAudioEditor::~WebBrowserAudioEditor()
{
    stopTimer();
    _audioProcessor->AudioProcessor::removeListener (this);
}

// Load a factory preset while PRESERVING the current tempo: RNBO snapshots carry
// ALL 47 params — including bpm, which was 120 in every authored preset — so a
// plain program change stomps the user's tempo on every preset load. The preset
// applies asynchronously inside RNBO, so the restore is posted slightly later.
void WebBrowserAudioEditor::applyPreset (int index)
{
    const float keepBpm = findParameter (_audioProcessor, "idr/bpm").getValue();   // normalized
    _audioProcessor->setCurrentProgram (index);

    Component::SafePointer<WebBrowserAudioEditor> safe (this);
    juce::Timer::callAfterDelay (200, [safe, keepBpm]
    {
        if (safe == nullptr) return;
        auto& p = findParameter (safe->_audioProcessor, "idr/bpm");
        p.beginChangeGesture();
        p.setValueNotifyingHost (keepBpm);
        p.endChangeGesture();
    });
}

// 30 Hz: read the processor's lock-free in/out ring, derive scope / goniometer /
// spectrum / RMS, and push them to the JS side as a single "viz" event. The
// frontend uses these when fresh and falls back to synthetic otherwise.
void WebBrowserAudioEditor::timerCallback()
{
    if (_proc == nullptr)
        return;

    auto& a = _proc->analysis;
    constexpr int SZ = CustomAudioProcessor::kAnaSize;
    const int wp = a.writePos.load (std::memory_order_acquire);
    auto tap = [&] (const float* buf, int back) { return buf[(wp - back) & (SZ - 1)]; };

    // scope: last SCOPEN samples of the LEFT in/out, decimated to PTS points
    constexpr int SCOPEN = 1024, PTS = 128;
    Array<var> inScope, outScope;
    for (int i = 0; i < PTS; ++i)
    {
        const int back = SCOPEN - (i * SCOPEN) / PTS;    // oldest -> newest, never 0
        inScope.add  ((double) tap (a.inL,  back));
        outScope.add ((double) tap (a.outL, back));
    }

    // goniometer: last GN output L/R pairs, interleaved [L0,R0,L1,R1,...]
    constexpr int GN = 128;
    Array<var> gonio;
    for (int i = 0; i < GN; ++i)
    {
        const int back = GN - i;
        gonio.add ((double) tap (a.outL, back));
        gonio.add ((double) tap (a.outR, back));
    }

    // spectrum: direct 40-bin log-spaced DFT of the last WN output samples
    constexpr int WN = 512, BINS = 40;
    const double sr   = _proc->getSampleRate() > 0.0 ? _proc->getSampleRate() : 48000.0;
    const double fmin = 50.0, fmax = jmin (16000.0, sr * 0.45);
    Array<var> spec;
    for (int b = 0; b < BINS; ++b)
    {
        const double f = fmin * std::pow (fmax / fmin, b / (double) (BINS - 1));
        const double w = 2.0 * juce::MathConstants<double>::pi * f / sr;
        double re = 0.0, im = 0.0;
        for (int n = 0; n < WN; ++n)
        {
            const double x  = tap (a.outL, WN - n);
            const double ph = w * n;
            re += x * std::cos (ph);
            im -= x * std::sin (ph);
        }
        const double mag = std::sqrt (re * re + im * im) / WN;
        const double db  = mag > 1.0e-6 ? 20.0 * std::log10 (mag) : -120.0;
        spec.add (jlimit (0.0, 1.0, (db + 60.0) / 60.0));    // -60..0 dB -> 0..1
    }

    // in/out RMS over the last 512 samples (energy meters)
    double si = 0.0, so = 0.0;
    for (int n = 1; n <= 512; ++n) { const double xi = tap (a.inL, n), xo = tap (a.outL, n); si += xi * xi; so += xo * xo; }

    DynamicObject::Ptr o = new DynamicObject();
    o->setProperty ("inScope",  var (inScope));
    o->setProperty ("outScope", var (outScope));
    o->setProperty ("gonio",    var (gonio));
    o->setProperty ("spec",     var (spec));
    o->setProperty ("inRms",    std::sqrt (si / 512.0));
    o->setProperty ("outRms",   std::sqrt (so / 512.0));

    // host tempo/play state (sampled on the audio thread — see CustomAudioProcessor)
    o->setProperty ("bpm",     _proc->hostBpm.load (std::memory_order_relaxed));
    o->setProperty ("playing", _proc->hostPlaying.load (std::memory_order_relaxed));

    // factory presets (RNBO presets = JUCE programs; 0 = "Initial")
    o->setProperty ("preset", _audioProcessor->getCurrentProgram());
    Array<var> pn;
    for (int i = 0; i < _audioProcessor->getNumPrograms(); ++i)
        pn.add (_audioProcessor->getProgramName (i));
    o->setProperty ("presets", var (pn));

    _webComponent.emitEventIfBrowserIsVisible ("viz", var (o.get()));
}

void WebBrowserAudioEditor::paint (Graphics& g)
{
    g.fillAll (Colour (0xff16161e));
}

void WebBrowserAudioEditor::resized()
{
    _webComponent.setBounds (getLocalBounds());
}

std::optional<WebBrowserComponent::Resource>
WebBrowserAudioEditor::getResource (const String& url)
{
    const auto filename = (url == "/" || url.isEmpty())
                            ? String ("index.html")
                            : url.fromFirstOccurrenceOf ("/", false, false);
    const auto ext  = filename.fromLastOccurrenceOf (".", false, false).toLowerCase();
    const auto mime = getMimeForExtension (ext);

    String resourceName;
    for (auto c : filename)
        resourceName += (CharacterFunctions::isLetterOrDigit (c) || c == '_') ? c : juce_wchar ('_');

    int dataSize = 0;
    const char* data = RNBOUIData::getNamedResource (resourceName.toRawUTF8(), dataSize);
    if (data != nullptr)
    {
        const auto* begin = reinterpret_cast<const std::byte*> (data);
        return WebBrowserComponent::Resource { std::vector<std::byte> (begin, begin + dataSize), mime };
    }
    return std::nullopt;
}
