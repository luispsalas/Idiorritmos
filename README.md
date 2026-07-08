# IDIORRITMOS

**An idiorhythmic texturizer — everlasting layers of sound, chopped by human rhythm.**

IDIORRITMOS is a stereo texture processor for your DAW (AU / VST3), built in Max/MSP `gen~` and exported with RNBO. It turns any input — a synth pad, a guitar, a voice, a field recording — into sustained, evolving beds of sound, and then lets you carve those beds rhythmically: frozen textures, grid-locked stutters, tempo-synced chops, and slow autonomous drift.

> **Status: pre-release.** Engine v1.3 is feature-complete and verified by ear; DAW validation (Ableton Live, Logic Pro) and the first plugin release are in progress. The final goal of this repository is to offer IDIORRITMOS as open source.

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

Two tiers, eight presets:

**Personas** — canonical definitions of each rhythmic behavior: *Percutiendo*, *Bailando*, *Hablando*, *Patinando*.

**Scenes** — persona hybrids: *Murmur* (Bailando × Hablando — a granular murmur of speech-like voices), *Stutter Step* (Percutiendo × Patinando — the signature grid-locked freeze-stutter), *Pavement* (Patinando × Hablando — dark lo-fi grit), *Vigil* (deep Bailando — a near-motionless eternal bed).

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
