# Legacy

*[← Back to README](../README.md)*

Earlier work, kept for reference. Nothing here is part of the plugin build.

| Folder | What it was |
|---|---|
| `max-instrument/` | The original Max-only modular instrument built from `mc.*` objects, which the plugin grew out of. Open `mc_textures.maxpat`; the abstractions and their `test_*` harnesses sit beside it. |
| `rnbo-spike/` | The feasibility test that proved the engine could be rebuilt in `gen~` and exported with RNBO. `SPIKE.md` holds the plan and the pass criteria. `export_mc_textures_3.maxpat` is an earlier export patch, replaced by `engine/export_mc_textures_FIXED.maxpat`. It loads the engine from `engine/`, so add that folder to Max's search path to open it. |
