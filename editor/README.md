# IDIORRITMOS — plugin editor

*[← Back to README](../README.md)*

The plugin's custom interface: a JUCE plugin whose editor is a web page (HTML/JS) shown inside a JUCE `WebBrowserComponent`, bound to the RNBO parameters.

These files are **overlays on Cycling '74's [`rnbo.example.juce`](https://github.com/Cycling74/rnbo.example.juce) template**, not a standalone project. Each one replaces the file at the same path in that template. They were last built against template commit `88b1817`, which ships JUCE 8.0.12.

| File | What changed from the template |
|---|---|
| `Plugin.cmake` | Plugin identity: effect (no MIDI), product name, manufacturer and plugin codes, copy-after-build |
| `src/CustomAudioProcessor.{h,cpp}` | Copies input and output audio into a lock-free ring buffer for the visualizations, and reads host tempo and play state |
| `src/webui/WebBrowserAudioEditor.{h,cpp}` | Parameter bindings (including BPM), the preset menu, and a 30 Hz timer that pushes analysis data to the page |
| `src/webui/index.html`, `src/webui/main.js` | The interface itself: controls, labels, scope, goniometer, spectrum |

## Building

Requirements: everything in the template's own README (CMake, Ninja, Xcode Command Line Tools), plus **Node.js** for the web UI and an **RNBO** license to export.

1. Clone the template and its JUCE submodule:
   ```bash
   git clone https://github.com/Cycling74/rnbo.example.juce.git
   ```
   ```bash
   cd rnbo.example.juce && git checkout 88b1817 && git submodule update --init --recursive
   ```
2. Copy this folder's files over the template, keeping their paths.
3. Open `engine/export_mc_textures_FIXED.maxpat` in Max and run the RNBO **C++ Source Code Export** target into the template's `export/` folder, with presets included.
4. Install the web UI's dependencies once, from `src/webui/`: `npm install`.
5. Configure and build from a `build/` folder inside the template. CMake runs the web UI build itself:
   ```bash
   cmake .. -DRNBO_EDITOR_MODE=WEBVIEW -DRNBO_CLASS_FILE_NAME=rnbo_source.cpp -G Ninja
   ```
   ```bash
   cmake --build .
   ```

`RNBO_EDITOR_MODE` is reversible: `DEFAULT` builds the generic RNBO parameter editor, `WEBVIEW` builds this one.

## Working on the interface

The plugin first tries to load its page from a dev server at `http://localhost:3000/` and falls back to the copy compiled into the build. So with `npm run dev` running in `src/webui/`, HTML and JS edits show up without rebuilding. Changes to the C++ files need a rebuild **and a full DAW restart**: reopening the plugin window reloads only the page.

## License

These files are modified copies of template files. The template repository carries no license file, and JUCE is dual-licensed (AGPLv3 or a commercial JUCE license). See the main README's License section.
