# Changelog

What changed in IDIORRITMOS and why. Engine versions refer to `engine/texture_gen_stereo.gendsp`.

## Unreleased

- **Repository reorganized.** The engine moved from `rnbo_spike/` to `engine/`, since it is no longer a spike. The custom plugin interface is now in the repository (`editor/`). Earlier work moved to `legacy/`, and the parameter reference to `docs/PARAMETERS.md`.

## Engine v1.3.3

- **The Cloud blend is smoothed** (~5 ms), like Mix, Width and Diffusion already were. It was the one blend control that changed in steps.

## Engine v1.3.2

- **Mix 0 is now a true dry path: the input passes untouched.** Before, the dry signal followed the Cloud setting, so Cloud bypassed the Mix knob. Mix now governs all processing.
- **Chop gates the wet signal only**, so the dry signal always passes clean.
- Two **Source presets** added for live instruments: *Harmonic Shadows* and *Vocal Halo*.

## Engine v1.3.1

- **Renamed from IDIORHYTHM to IDIORRITMOS**, with the four personas renamed as Spanish gerunds: *Percutiendo*, *Bailando*, *Hablando*, *Patinando*.
- Fixes: random distribution tables are seeded on the first sample; the Cloud is guarded against invalid values; mode selectors round to whole numbers, because host automation can land between them; Panic also clears the freeze buffer.

## Engine v1.3 — first pre-release

- The `gen~` engine, test harnesses, RNBO export patch and factory bank, built as IDIORHYTHM.
