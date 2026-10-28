# IDIORRITMOS — Parameter reference

*[← Back to README](../README.md)*

All 47 parameters are host-automatable. Each row gives the on-screen **Control** name, the **Automation ID** your DAW shows (path-prefixed `idr/…`), the **allowed values** (default in **bold**), and what it does. Names in *italics* are the planned Tier-2 GUI labels; the shipped Tier-1 plugin currently exposes the raw IDs.

Several controls share one **distribution engine**, the *Gait*, which shapes how a set of values spreads across the 12 pulses (or 16 cloud voices). Its seven modes and their two arguments **A** and **B**:

| Gait mode | # | Formula (per index *i*) | A | B |
|---|---|---|---|---|
| Rush (exponential) | 1 | `B^(A·i)` | exponent (+accelerate / −decelerate) | base |
| Rush² (scaled exp) | 2 | `B^(A·i/12)` | exponent, gentler | base |
| March (linear) | 3 | `B + A·i` | step size | first value |
| Divide (harmonic) | 4 | `B·A·(i+1)` → ×1 ×2 ×3… | multiplier | fundamental |
| Multiply (subharmonic) | 5 | `B·A÷(i+1)` → ÷1 ÷2 ÷3… | multiplier | fundamental |
| Even (spread) | 6 | `A → B` linear fan | first value | last value |
| Rubato (random held) | 7 | `B ± A·random` | spread | center |

## Source — Capture Cloud

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Cloud | `idr/cloud` | 0 – 1 (**0**) | Blend from raw input (0) to a 16-voice multi-speed replay of the live input (1). The cloud feeds the texture, so **Mix** scales it. |
| Cloud Speed | `idr/playspeed` | 0.25 – 4 (**1**) | Global playback speed of the replayed voices (pitch). |
| Cloud Gait | `idr/spmode` | modes 1–7 (**6 Even**) | Distribution of the 16 voice speeds. |
| Cloud A / B | `idr/spA` · `idr/spB` | A −8…8 (**0.9**) · B 0…16 (**1.4**) | Gait arguments for the voice speeds. |
| Cloud Hold | `idr/cloudhold` | 0 / 1 (**0**) | 1 = stop recording, freeze the captured buffer into a clean loop. |

## Tempo & grid lock

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

## Texture engine

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Pulses | `idr/tapcount` | 1 – 12 (**12**) | Number of active delay taps. |
| Stride | `idr/basems` | 1 – 2000 ms (**150**) | Overall delay size (in ms, or beats via Stride Div when locked). |
| Tap Gait | `idr/mode` | modes 1–7 (**6 Even**) | How tap spacing distributes across the pulses. |
| Gait A / B | `idr/A` · `idr/B` | A −8…8 (**1**) · B 0…16 (**6**) | Gait arguments for tap spacing. |
| Everlast (Feedback) | `idr/fbk` | 0 – 1 (**0.5**) | Regeneration. Unity-safe: **1.0** = self-limiting infinite sustain, no runaway. |
| Tone | `idr/lopass` | 20 – 20000 Hz (**6000**) | Low-pass on the recirculating signal, which sets how dark the repeats sound. |
| Wash (Diffusion) | `idr/diffusion` | 0 – 1 (**0**) | In-loop allpass smear; echoes melt further into wash on every pass. |
| Freeze | `idr/freeze` | 0 / 1 (**0**) | Hold the current texture (decay-free). Launch-quantized under Freeze Lock. |
| Freeze Window | `idr/freezelen` | 10 – 2000 ms (**2000**) | Length of the frozen loop. Long = eternal pad, short = rhythmic stutter. |

## Sway (per-pulse motion)

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Sway Rate | `idr/lforate` | 0 – 20 Hz (**0.3**) | Base modulation rate of the per-tap delay LFO. |
| Sway Gait | `idr/lfomode` | modes 1–7 (**6 Even**) | Distribution of per-tap LFO rates. |
| Sway A / B | `idr/lfoA` · `idr/lfoB` | A −8…8 (**1**) · B 0…16 (**2**) | Gait arguments for the LFO rates. |
| Sway Depth | `idr/lfodepth` | 0 – 1 (**0**) | Modulation depth as a fraction of tap time. |
| Sway Shape | `idr/lfoshape` | 0 Flow (sine) / 1 Steps (S&H) (**0**) | Smooth vs. stepped (sample-and-hold) motion. |

## Performance

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Morph | `idr/morph` | 0 – 1 (**0**) | One-knob macro: 0 = your texture, 1 = glitch (shorter, drier, sparser). |
| Chop | `idr/gateon` | 0 / 1 (**0**) | Rhythmic amplitude gate that chops the **wet** texture only (dry passes clean). |
| Chop Rate | `idr/gatediv` | 0.0156 – 4 beats (**0.25** = 1/16) | Gate cycle length. |
| Chop Depth | `idr/gatedepth` | 0 – 1 (**1**) | How deep the gate cuts (1 = full chop, <1 = tremolo). |
| Chop Length | `idr/gateduty` | 0.02 – 0.98 (**0.5**) | Open fraction of each cycle (low = staccato stabs, high = sustained). |

## Grit

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Grit | `idr/crushbits` | 1 – 16 bits (**16** = clean) | Bit-depth reduction on the wet path only. ⚠ The GUI **Grit slider is display-inverted**: 0 % = clean (16 bits), 100 % = brutal (1 bit). The underlying parameter/automation range is unchanged. At 1 bit, quiet signals quantize to silence. |
| Grain | `idr/downsamp` | 1 – 64 (**1** = full rate) | Sample-rate reduction / decimation, wet only. |

## Breath (autonomous drift)

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Breathe | `idr/evolve` | 0 – 1 (**0**) | Depth of autonomous slow drift on the tap distribution, so the texture evolves by itself. |
| Breath Rate | `idr/evolverate` | 0.001 – 2 Hz (**0.05**) | Speed of that drift. |

## Stereo image

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Width | `idr/width` | 0 – 1 (**1**) | Stereo spread of the taps (0 = mono). |
| Placement | `idr/panmode` | 6 Spread / 7 Scatter (**6**) | Ordered L→R spread, or random scatter, of tap pan positions. |
| Place A / B | `idr/panA` · `idr/panB` | A −1…1 (**0**) · B 0…1 (**1**) | Spread ends, or Scatter range/center. |

## Output & transport

| Control | Automation ID | Values | What it does |
|---|---|---|---|
| Mix | `idr/mix` | 0 – 1 (**0**) | Dry/wet. **0 = untouched input** (true bypass); governs **all** processing including Cloud. |
| Output | `idr/outgain` | 0 – 2 (**1**) | Master output level, before the soft limiter. |
| Panic | `idr/panic` | trigger | Click-free mute + full buffer/freeze flush. A safety utility, not a performance control. |
| Re-roll | `idr/reroll` | trigger | Re-randomize the held-random tables (taps + pan + cloud speeds) used by Rubato/Scatter. |

> **Note on names.** The rhythm vocabulary (Pulses, Stride, Gait, Sway, Breath, Chop, Wash, Everlast) and the four personas *Percutiendo · Bailando · Hablando · Patinando* are the semantic layer of the instrument. Tier-1 RNBO exposes raw parameter IDs; the friendly names and value labels above are the specification for the Tier-2 interface.
