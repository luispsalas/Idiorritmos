# IDIORRITMOS

**An idiorhythmic texturizer — everlasting layers of sound, chopped by human rhythm.**

IDIORRITMOS is a stereo texture processor for your DAW (AU / VST3), built in Max/MSP `gen~` and exported with RNBO. It turns any input — a synth pad, a guitar, a voice, a field recording — into sustained, evolving beds of sound, and then lets you carve those beds rhythmically: frozen textures, grid-locked stutters, tempo-synced chops, and slow autonomous drift.

> **Status: pre-release.** Engine v1.3.2 is feature-complete and verified by ear; DAW validation (Ableton Live, Logic Pro) and the first plugin release are in progress. The final goal of this repository is to offer IDIORRITMOS as open source.

---

## The concept

IDIORRITMOS grows out of *Prácticas Idiorítmicas* (Salas, 2021), a sound-art research project on how we perceive, interpret, and modulate rhythmic events in everyday life. Its core insight: **rhythm is not just timing — it reveals behavior, intention, and emotion.** The way someone washes dishes, walks, or speaks carries a rhythmic signature you can hear.

The plugin translates that idea into four **cause-human rhythmic personas** — named as gerunds, because each is an *action*, a way of moving through time. They organize its presets and its future interface:

| Persona | Rhythmic behavior | In the plugin |
|---|---|---|
| **Percutiendo** *(drumming)* | Metronomic, grid-aligned, predictable | Tempo-locked gate, quantized freeze, marching tap spacing |
| **Bailando** *(dancing)* | Embodied continuous flow | Voice clouds, smooth sway, slow breathing drift, endless sustain |
| **Hablando** *(talking)* | Speech phrasing — irregular, expressive | Rubato tap clusters, stepped sample-and-hold motion, scattered placement |
| **Patinando** *(skating)* | Momentum, then the cut | Long glides, morph toward glitch, short freeze windows, grit |

Even the parameter vocabulary is rhythmic: taps are **Pulses**, their spacing is the **Stride**, their distribution curve is the **Gait** (Rush, March, Divide, Multiply, Even, Rubato…), the per-pulse motion is **Sway**, the texture's own slow drift is its **Breath**, and the rhythmic gate is the **Chop**.

## Features

- **12-pulse distribution-driven delay matrix** — seven Gait curves (exponential, harmonic, subharmonic, even, random-held rubato, and more) shape how echoes distribute in time, reused across taps, modulation rates, cloud voice speeds, and stereo placement.
- **Everlasting sustain** — stereo decorrelated feedback with cross-coupled left/right lines, accurate loop filtering, DC control, and a unity-safe soft limiter: feedback reaches 1.0 without runaway. Layers can genuinely last forever.
- **In-loop diffusion** — a four-stage allpass chain *inside* the feedback path smears echoes progressively into wash on every recirculation — a mechanism no external effect placed before or after the plugin can replicate.
- **True static freeze** — decay-free, color-free hold of the current texture, with a click-free crossfade in and out. Long freeze windows give eternal pads; short windows become rhythmic stutters.
- **Capture cloud** — the live input is continuously recorded and replayed by 16 voices at distributed speeds: instant choirs, detuned washes, or pitch clusters from whatever you feed it.
- **Host-grid phase lock** — gate, modulation, and freeze can align to your DAW's beat grid, with launch-quantized freeze commits. Per-domain sync toggles let, say, the pulses float free in milliseconds while the chop stays on the grid.
- **Performance macros** — Morph (one knob from texture to glitch), rhythmic gate with depth and duty, bit-crush and downsampling on the wet path only, re-roll for all random tables, and a click-free panic.
- **Evolve** — two incommensurate slow phases drift the pulse distribution so the texture breathes on its own.
- 47 host-automatable parameters, NaN/Inf-hardened DSP, soft-limited output.

## Factory bank

Ten presets in three tiers:

**Personas** — canonical definitions of each rhythmic behavior: *Percutiendo*, *Bailando*, *Hablando*, *Patinando*.

**Scenes** — persona hybrids: *Murmur* (Bailando × Hablando — a granular murmur of speech-like voices), *Stutter Step* (Percutiendo × Patinando — the signature grid-locked freeze-stutter), *Pavement* (Patinando × Hablando — dark lo-fi grit), *Vigil* (deep Bailando — a near-motionless eternal bed).

**Sources** — plain-named starting points tuned to a live instrument, built to blend as you raise **Mix**: *Harmonic Shadows* (melodic input / guitar — the dry note plus a fan of harmonic delay shadows, a pitched cloud halo, and diffusion for fat, spread full-width) and *Vocal Halo* (voice, spoken or sung — a harmonic cloud choir of sub, fifth and octave, a long diffuse wash, scattered across the stereo field).

## Parameter reference

All 47 parameters are host-automatable. Each row gives the on-screen **Control** name, the **Automation ID** your DAW shows (path-prefixed `idr/…`), the **allowed values** (default in **bold**), and what it does. Names in *italics* are the planned Tier-2 GUI labels; the shipped Tier-1 plugin currently exposes the raw IDs.

Several controls share one **distribution engine** — the *Gait* — which shapes how a set of values spreads across the 12 pulses (or 16 cloud voices). Its seven modes and their two arguments **A** and **B**:

| Gait mode | # | Formula (per index *i*) | A | B |
|---|---|---|---|---|
| Rush (exponential) | 1 | `B^(A·i)` | exponent (+accelerate / −decelerate) | base |
| Rush² (scaled exp) | 2 | `B^(A·i/12)` | exponent, gentler | base |
| March (linear) | 3 | `B + A·i` | step size | first value |
| Divide (harmonic) | 4 | `B·A·(i+1)` → ×1 ×2 ×3… | multiplier | fundamental |
| Multiply (subharmonic) | 5 | `B·A÷(i+1)` → ÷1 ÷2 ÷3… | multiplier | fundamental |
| Even (spread) | 6 | `A → B` linear fan | first value | last value |
| Rubato (random held) | 7 | `B ± A·random` | spread | center |

### Source — Capture Cloud

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Cloud | `idr/cloud` | 0 – 1 (**0**) | Blend from raw input (0) to a 16-voice multi-speed replay of the live input (1). The cloud feeds the texture, so **Mix** scales it. |
| Cloud Speed | `idr/playspeed` | 0.25 – 4 (**1**) | Global playback speed of the replayed voices (pitch). |
| Cloud Gait | `idr/spmode` | modes 1–7 (**6 Even**) | Distribution of the 16 voice speeds. |
| Cloud A / B | `idr/spA` · `idr/spB` | A −8…8 (**0.9**) · B 0…16 (**1.4**) | Gait arguments for the voice speeds. |
| Cloud Hold | `idr/cloudhold` | 0 / 1 (**0**) | 1 = stop recording, freeze the captured buffer into a clean loop. |

### Tempo & grid lock

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Meter Lock | `idr/sync` | 0 / 1 (**0**) | Master tempo sync. 0 = free (ms/Hz); 1 = lock times to the beat grid. |
| Tempo | `idr/bpm` | 20 – 300 (**120**) | Fallback tempo; overridden by the DAW transport when the plugin is playing. |
| Stride Div | `idr/tapdiv` | 0.0625 – 8 beats (**0.5** = 1/8) | Delay spacing in beats when Pulse Lock is on. |
| Sway Div | `idr/lfodiv` | 0.0625 – 16 beats (**1**) | LFO cycle length in beats when Sway Lock is on. |
| Freeze Div | `idr/freezediv` | 0.0625 – 16 beats (**1**) | Frozen loop window in beats, and the launch-quantize grid, when Freeze Lock is on. |
| Pulse Lock | `idr/tapsync` | 0 / 1 (**1**) | Under Meter Lock, taps follow the grid (0 = stay free in ms). |
| Sway Lock | `idr/lfosync` | 0 / 1 (**1**) | Under Meter Lock, the LFO follows the grid (0 = free Hz). |
| Freeze Lock | `idr/freezesync` | 0 / 1 (**1**) | Under Meter Lock, freeze length + launch-quantize follow the grid (0 = free ms, instant freeze). |

### Texture engine

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Pulses | `idr/tapcount` | 1 – 12 (**12**) | Number of active delay taps. |
| Stride | `idr/basems` | 1 – 2000 ms (**150**) | Overall delay size (in ms, or beats via Stride Div when locked). |
| Tap Gait | `idr/mode` | modes 1–7 (**6 Even**) | How tap spacing distributes across the pulses. |
| Gait A / B | `idr/A` · `idr/B` | A −8…8 (**1**) · B 0…16 (**6**) | Gait arguments for tap spacing. |
| Everlast (Feedback) | `idr/fbk` | 0 – 1 (**0.5**) | Regeneration. Unity-safe: **1.0** = self-limiting infinite sustain, no runaway. |
| Tone | `idr/lopass` | 20 – 20000 Hz (**6000**) | Low-pass on the recirculating signal — darkness of the repeats. |
| Wash (Diffusion) | `idr/diffusion` | 0 – 1 (**0**) | In-loop allpass smear; echoes melt further into wash on every pass. |
| Freeze | `idr/freeze` | 0 / 1 (**0**) | Hold the current texture (decay-free). Launch-quantized under Freeze Lock. |
| Freeze Window | `idr/freezelen` | 10 – 2000 ms (**2000**) | Length of the frozen loop — long = eternal pad, short = rhythmic stutter. |

### Sway (per-pulse motion)

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Sway Rate | `idr/lforate` | 0 – 20 Hz (**0.3**) | Base modulation rate of the per-tap delay LFO. |
| Sway Gait | `idr/lfomode` | modes 1–7 (**6 Even**) | Distribution of per-tap LFO rates. |
| Sway A / B | `idr/lfoA` · `idr/lfoB` | A −8…8 (**1**) · B 0…16 (**2**) | Gait arguments for the LFO rates. |
| Sway Depth | `idr/lfodepth` | 0 – 1 (**0**) | Modulation depth as a fraction of tap time. |
| Sway Shape | `idr/lfoshape` | 0 Flow (sine) / 1 Steps (S&H) (**0**) | Smooth vs. stepped (sample-and-hold) motion. |

### Performance

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Morph | `idr/morph` | 0 – 1 (**0**) | One-knob macro: 0 = your texture, 1 = glitch (shorter, drier, sparser). |
| Chop | `idr/gateon` | 0 / 1 (**0**) | Rhythmic amplitude gate — chops the **wet** texture only (dry passes clean). |
| Chop Rate | `idr/gatediv` | 0.0156 – 4 beats (**0.25** = 1/16) | Gate cycle length. |
| Chop Depth | `idr/gatedepth` | 0 – 1 (**1**) | How deep the gate cuts (1 = full chop, <1 = tremolo). |
| Chop Length | `idr/gateduty` | 0.02 – 0.98 (**0.5**) | Open fraction of each cycle (low = staccato stabs, high = sustained). |

### Grit

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Grit | `idr/crushbits` | 1 – 16 bits (**16** = clean) | Bit-depth reduction on the wet path only. |
| Grain | `idr/downsamp` | 1 – 64 (**1** = full rate) | Sample-rate reduction / decimation, wet only. |

### Breath (autonomous drift)

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Breathe | `idr/evolve` | 0 – 1 (**0**) | Depth of autonomous slow drift on the tap distribution — the texture evolves by itself. |
| Breath Rate | `idr/evolverate` | 0.001 – 2 Hz (**0.05**) | Speed of that drift. |

### Stereo image

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Width | `idr/width` | 0 – 1 (**1**) | Stereo spread of the taps (0 = mono). |
| Placement | `idr/panmode` | 6 Spread / 7 Scatter (**6**) | Ordered L→R spread, or random scatter, of tap pan positions. |
| Place A / B | `idr/panA` · `idr/panB` | A −1…1 (**0**) · B 0…1 (**1**) | Spread ends, or Scatter range/center. |

### Output & transport

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Mix | `idr/mix` | 0 – 1 (**0**) | Dry/wet. **0 = untouched input** (true bypass); governs **all** processing including Cloud. |
| Output | `idr/outgain` | 0 – 2 (**1**) | Master output level, before the soft limiter. |
| Panic | `idr/panic` | trigger | Click-free mute + full buffer/freeze flush. A safety utility, not a performance control. |
| Re-roll | `idr/reroll` | trigger | Re-randomize the held-random tables (taps + pan + cloud speeds) used by Rubato/Scatter. |

> **Note on names.** The rhythm vocabulary (Pulses, Stride, Gait, Sway, Breath, Chop, Wash, Everlast) and the four personas *Percutiendo · Bailando · Hablando · Patinando* are the semantic layer of the instrument. Tier-1 RNBO exposes raw parameter IDs; the friendly names and value labels above are the specification for the Tier-2 interface.

## Use cases

- **Ambient beds from anything** — freeze a single guitar chord or vocal phrase into an infinite pad and play over it.
- **Frozen beds + rhythmic chops** — the signature gesture: hold a wash with Freeze, then carve it with the tempo-locked gate and short freeze stutters, all landing on your DAW's grid.
- **Granular-style clouds from live input** — the capture cloud turns incoming audio into layered multi-speed voices without loading a sample.
- **Textural transitions** — ride the Morph macro from lush texture to sparse glitch for build-ups and breakdowns.
- **Sound design and scoring** — rubato gaits and stepped sway give speech-like, human-irregular movement to static sources.
- **Live performance** — designed around a small set of large gestures (Freeze, Morph, Chop, Re-roll) rather than deep menu editing.

## Installing

### Prebuilt plugin (once releases are published)

1. Download the latest release for macOS (AU `.component` and/or VST3 `.vst3`).
2. Copy to your user plugin folder:
   - AU: `~/Library/Audio/Plug-Ins/Components/`
   - VST3: `~/Library/Audio/Plug-Ins/VST3/`
3. Rescan plugins in your DAW (Live: Preferences → Plug-Ins; Logic: restarts scan automatically).

### Building from source

Requirements: **Max 9.1+** with **RNBO 1.4+** (license required to export), Xcode Command Line Tools (`xcode-select --install`).

1. Open `rnbo_spike/export_mc_textures_FIXED.maxpat` in Max.
2. Double-click the `gen~` inside the `rnbo~` and confirm the codebox is the current engine (it loads `texture_gen_stereo.gendsp` from the same folder).
3. Optionally click each factory-bank row and capture named RNBO snapshots (the preset rows and capture instructions are embedded in the patch).
4. Export via the RNBO sidebar: Audio Plugin target, type Effect, formats VST3 + AU, "Include Presets" checked, output to the user plugin folders above.

## Repository contents

| Path | What it is |
|---|---|
| `rnbo_spike/texture_gen_stereo.gendsp` | **The engine** — v1.3, all DSP in one GenExpr codebox |
| `rnbo_spike/export_mc_textures_FIXED.maxpat` | RNBO export patch with the factory bank wired in |
| `rnbo_spike/test_gen_stereo.maxpat` | Performance test harness: all 48 params, scene + persona banks, source selector |
| `rnbo_spike/playback_gen.gendsp` | 16-voice buffer player (future MIDI Instrument build) |
| `patchers/` | The original Max-only modular instrument the plugin grew from |
| `architecture_signal_flow.html` | Interactive signal-flow diagram with implicit-network tracing |
| `gui_mockup_tier2.html` | Interactive design spec for the future JUCE interface |

## Roadmap

- **v1.0 release** — DAW validation in Live and Logic, first tagged build with factory presets.
- **MIDI Instrument build** — the same engine as a playable sampler (note-driven capture playback).
- **Tier-2 interface (JUCE)** — rhythm-semantic labels, named Gait curves, persona pads (see `gui_mockup_tier2.html`).
- **Archetype phases** — personas as presets today; blendable persona "presence" macros next; generative per-persona rhythm engines after that.

## Lineage and credits

- Built on the sonic character of the original **`mc` multichannel objects** experiments in Max/MSP — the "everlasting layers of sound" that give the texturizer its name.
- The **capture cloud** concept and terminology trace to Haiku-style multi-speed playback experiments.
- Conceptual framework: **_Prácticas Idiorítmicas_** — Luis Paulino Salas, Master's in Sound Art, Universitat de Barcelona, 2021 (advisor: Barbara Held).
- Exported with **RNBO** by Cycling '74.

## License

Not yet licensed — this repository is private during pre-release. The intent is to publish IDIORRITMOS under an open-source license at release (candidates under evaluation; note that RNBO-exported C++ is subject to Cycling '74's RNBO license terms, which permit distributing compiled plugins and released source under their conditions).
