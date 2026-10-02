# CP5 RNBO Spike — feasibility check before the full gen rebuild

Goal: prove the texture engine can be reimplemented in RNBO-native primitives and shipped as an AU/VST. If all 4 steps pass, commit to the gen rebuild. If a step fails, we adjust the approach before investing.

Files here:
- `texture_gen.gendsp` — the core reimplementation: a 12-tap **distribution-driven feedback delay** in `gen~` (no `mc.` wrapper). Uses only RNBO-supported primitives: `Delay` (multi-tap, = mc.tapin~/tapout~), `History` (feedback), `pow`/`clamp`/`for`, and `Param` controls.
- `test_gen.maxpat` — Max harness to hear it BEFORE touching RNBO.

---

## Step 1 — gen DSP works in plain Max  (validates the matrix + distribution math)
1. Open `test_gen.maxpat`, click `ezdac~` to start audio.
2. Click the **button** (click impulses) → you should hear discrete echoes (the 12 taps).
3. Turn the **mode** number: `6 spread` = even rake, `4 harmonic` = pitched/comb series, `3 increment`, `1 exponential`. Each should give an audibly different tap pattern → **confirms the distribution math computes per-tap delays from params**.
4. Raise **fbk** (0.6–0.9) → echoes regenerate into a tail → **confirms History feedback + lopass**.
5. Move **basems** → overall delay size changes.

PASS = different modes give different textures, feedback builds a tail, no errors.
(Note: `deviate` mode isn't in the spike — random-per-tap needs a held-random `Data`; deterministic modes are the feasibility question. Add deviate in the full build.)

## Step 2 — groove~ playback (already RNBO-native)
`groove~` is a supported RNBO object (variable-rate looping player). Low risk — the existing `playback.maxpat` logic ports directly (per-voice speed → use polyphony OR unrolled groove~ voices). Optional: confirm a single `groove~` at a `Param`-controlled increment plays/loops.

## Step 3 — wrap in rnbo~
1. New Max patch → create `rnbo~`.
2. Inside it: `in~ 1` → `gen~ texture_gen` → `out~ 1` (gen~ loads the .gendsp from this folder).
3. The gen `Param`s (mode/A/B/basems/fbk/lopass) surface as RNBO parameters automatically. Add `param` objects if you want explicit min/max (RNBO defaults to 0–1 if unset — set sensible ranges).
4. Confirm it makes sound inside `rnbo~` and the params show in the RNBO sidebar.

PASS = rnbo~ runs the gen code and exposes the params.

## Step 4 — export to Audio Plugin target  (the real question)
1. In the RNBO sidebar → **Export** → **Audio Plugin (VST3/AU)** target → Export.
2. Load the resulting plugin in **Live** and **Logic** on a track.
3. Confirm: it loads, makes sound, and the params are host-automatable.

PASS = plugin loads in both DAWs and is automatable.

---

## Decision
- **All pass** → green-light the full gen rebuild: port the whole chain (playback voices, distribution per-tap, stereo, output) to gen/RNBO with fixed N, params for everything, `line`-ramp params for the envelopes. Ship as the plugin.
- **Step 1/3 issues** → adjust gen structure (unroll vs polyphony) before scaling.
- **Step 4 issues** → fall back per the recorded strategy (preset bank, or standalone app).

## Notes for the full build (post-spike)
- Per-tap **deviate**: fill a `Data d(12)` with random values, regenerate on a "reroll" trigger, read `d.peek(i)` per tap = held random.
- **Envelopes**: `line`-ramped params (the `env_drift`/`env_ramp` logic) drive Param values at signal rate — fully RNBO-native.
- **N**: keep fixed (12 here). Variable N would need polyphony + `target`/`@exposevoiceparams` (push-in), no self-index — avoid unless needed.
