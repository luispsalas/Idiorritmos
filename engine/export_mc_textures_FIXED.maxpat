{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 9,
   "minor": 1,
   "revision": 2,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   287.0,
   95.0,
   685.0,
   750.0
  ],
  "boxes": [
   {
    "box": {
     "id": "obj-6",
     "maxclass": "ezdac~",
     "numinlets": 2,
     "numoutlets": 0,
     "patching_rect": [
      497.0,
      28.0,
      45.0,
      45.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-4",
     "lastchannelcount": 0,
     "maxclass": "live.gain~",
     "numinlets": 2,
     "numoutlets": 5,
     "outlettype": [
      "signal",
      "signal",
      "",
      "float",
      "list"
     ],
     "parameter_enable": 1,
     "patching_rect": [
      352.0,
      -25.0,
      101.0,
      134.0
     ],
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "live.gain~",
       "parameter_mmax": 6.0,
       "parameter_mmin": -70.0,
       "parameter_modmode": 3,
       "parameter_shortname": "live.gain~",
       "parameter_type": 0,
       "parameter_unitstyle": 4
      }
     },
     "varname": "live.gain~"
    }
   },
   {
    "box": {
     "data": {
      "clips": [
       {
        "absolutepath": "cherokee.aif",
        "filename": "cherokee.aif",
        "filekind": "audiofile",
        "id": "u551008731",
        "loop": 1,
        "content_state": {
         "loop": 1
        }
       }
      ]
     },
     "id": "obj-3",
     "maxclass": "playlist~",
     "mode": "basic",
     "numinlets": 1,
     "numoutlets": 5,
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "",
      "dictionary"
     ],
     "parameter_enable": 0,
     "patching_rect": [
      173.0,
      28.0,
      150.0,
      30.0
     ],
     "quality": "basic",
     "saved_attribute_attributes": {
      "candicane2": {
       "expression": ""
      },
      "candicane3": {
       "expression": ""
      },
      "candicane4": {
       "expression": ""
      },
      "candicane5": {
       "expression": ""
      },
      "candicane6": {
       "expression": ""
      },
      "candicane7": {
       "expression": ""
      },
      "candicane8": {
       "expression": ""
      }
     }
    }
   },
   {
    "box": {
     "autosave": 1,
     "id": "obj-1",
     "inletInfo": {
      "IOInfo": [
       {
        "type": "signal",
        "index": 1,
        "tag": "in1",
        "comment": ""
       },
       {
        "type": "signal",
        "index": 2,
        "tag": "in2",
        "comment": ""
       }
      ]
     },
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "outletInfo": {
      "IOInfo": [
       {
        "type": "signal",
        "index": 1,
        "tag": "out1",
        "comment": ""
       },
       {
        "type": "signal",
        "index": 2,
        "tag": "out2",
        "comment": ""
       }
      ]
     },
     "outlettype": [
      "signal",
      "signal",
      "list"
     ],
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 9,
       "minor": 1,
       "revision": 2,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "rnbo",
      "rect": [
       327.0,
       95.0,
       536.0,
       750.0
      ],
      "default_fontname": "Lato",
      "title": "untitled",
      "boxes": [
       {
        "box": {
         "genpatcher": {
          "patcher": {
           "fileversion": 1,
           "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 2,
            "architecture": "x64",
            "modernui": 1
           },
           "rect": [
            80,
            80,
            880,
            770
           ],
           "boxes": [
            {
             "box": {
              "id": "in1",
              "maxclass": "newobj",
              "numinlets": 0,
              "numoutlets": 1,
              "outlettype": [
               ""
              ],
              "patching_rect": [
               40,
               40,
               40,
               22
              ],
              "text": "in 1"
             }
            },
            {
             "box": {
              "id": "in2",
              "maxclass": "newobj",
              "numinlets": 0,
              "numoutlets": 1,
              "outlettype": [
               ""
              ],
              "patching_rect": [
               100,
               40,
               40,
               22
              ],
              "text": "in 2"
             }
            },
            {
             "box": {
              "id": "cb",
              "maxclass": "codebox",
              "numinlets": 3,
              "numoutlets": 2,
              "outlettype": [
               "",
               ""
              ],
              "patching_rect": [
               40,
               90,
               780,
               580
              ],
              "fontname": "<Monospaced>",
              "fontface": 0,
              "fontsize": 11.0,
              "code": "// mc TEXTURES \u2014 stereo gen engine (G1-G4 + Cloud + Evolve + Gate + G1+ stereo loop + P5 phase-lock)\n// in 3 = transport-locked beat ramp (phasor~ 4n @lock 1): grid-locks gate/LFO, quantizes freeze,\n// and measures host tempo (overrides bpm param). Stalled ramp or sync=0 -> free-run fallback.\n// 12-tap distribution-driven feedback delay with true static freeze, capture-replay\n// cloud, rhythmic gate, tempo sync, bit-crush, and autonomous evolve drift.\n// Param declaration order = 10-group performance layout (sets DAW automation order).\n// v1.3.1 fixes: deviate tables seeded on first sample; cloud NaN guard; rounded mode\n// selectors (float automation can sit between ints); panic also flushes the freeze cap.\n// v1.3.2: TRUE dry path - Mix 0 = untouched input (was cloud-following, so Cloud bypassed\n// the Mix knob); gate now chops the WET leg only. Mix governs ALL processing.\n// v1.3.3: smooth the cloud blend (~5 ms) to match mix/width/diffusion - was the one\n// blend param that stepped.\n\n// \u2500\u2500 G1 SOURCE \u00b7 Capture Cloud \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam cloud(0, min=0, max=1);          // blend: 0 = raw input, 1 = re-played multi-speed cloud\nParam playspeed(1, min=0.25, max=4);   // global speed of replayed voices (pitch factor)\nParam spmode(6, min=1, max=7);         // per-voice speed distribution mode (4 harmonic = Haiku chord)\nParam spA(0.9, min=-8, max=8);         // speed dist arg A\nParam spB(1.4, min=0, max=16);         // speed dist arg B\nParam cloudhold(0, min=0, max=1);      // 1 = stop recording (freeze captured buffer for clean loop)\n\n// \u2500\u2500 G2 TEMPO sync \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam sync(0, min=0, max=1);           // 0 = free (ms/Hz), 1 = lock times to BPM\nParam bpm(120, min=20, max=300);       // host tempo; driven by DAW transport in-plugin\nParam tapdiv(0.5, min=0.0625, max=8);  // beats per base delay unit (0.5 = 1/8 note)\nParam lfodiv(1, min=0.0625, max=16);   // beats per LFO cycle\nParam freezediv(1, min=0.0625, max=16);// beats per frozen loop window\nParam tapsync(1, min=0, max=1);        // per-domain: taps follow BPM when synced (0 = free basems)\nParam lfosync(1, min=0, max=1);        // per-domain: LFO follows BPM when synced (0 = free Hz)\nParam freezesync(1, min=0, max=1);     // per-domain: freeze len+quantize follow BPM (0 = free ms, instant)\n\n// \u2500\u2500 G3 TEXTURE engine \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam tapcount(12, min=1, max=12);     // active delay taps (gain mask; N fixed 12 in RNBO)\nParam basems(150, min=1, max=2000);    // overall delay size in ms (or beatms*tapdiv when synced)\nParam mode(6, min=1, max=7);           // tap spacing distribution: 1 exp 2 scaledexp 3 increment 4 harmonic 5 subharm 6 spread 7 deviate\nParam A(1, min=-8, max=8);             // tap dist arg A\nParam B(6, min=0, max=16);             // tap dist arg B\nParam fbk(0.5, min=0, max=1);          // feedback / regeneration (G1+: unity-safe \u2014 in-loop tanh limiter)\nParam lopass(6000, min=20, max=20000); // feedback tone (lowpass on the recirculating signal)\nParam diffusion(0, min=0, max=1);      // in-loop allpass smear: echoes melt into wash per pass (0 = off)\nParam freeze(0, min=0, max=1);         // 1 = stop writing, hold the captured loop\nParam freezelen(2000, min=10, max=2000);// P1: frozen loop window (long = eternal pad, short = stutter)\n\n// \u2500\u2500 G4 LFO (per-tap delay modulation) \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam lforate(0.3, min=0, max=20);     // base LFO rate (Hz); per-tap rates derived from lfomode\nParam lfomode(6, min=1, max=7);        // per-tap LFO rate distribution (same 7 modes as tap dist)\nParam lfoA(1, min=-8, max=8);          // LFO dist arg A\nParam lfoB(2, min=0, max=16);          // LFO dist arg B\nParam lfodepth(0, min=0, max=1);       // delay-mod depth (fraction of tap time)\nParam lfoshape(0, min=0, max=1);       // P3: 0 = smooth sine, 1 = stepped sample&hold (rhythmic)\n\n// \u2500\u2500 G5 PERFORMANCE \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam morph(0, min=0, max=1);          // P2 MACRO: 0 = texture (your settings), 1 = glitch (short/dry/sparse)\nParam gateon(0, min=0, max=1);         // G3: rhythmic amplitude gate on/off (the chop tool)\nParam gatediv(0.25, min=0.0156, max=4);// gate cycle length in beats (0.25 = 1/16 note)\nParam gatedepth(1, min=0, max=1);      // how deep the gate cuts (1 = full chop, <1 = tremolo)\nParam gateduty(0.5, min=0.02, max=0.98);// open fraction of each cycle (low = staccato, high = open)\n\n// \u2500\u2500 G6 CRUSH \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam crushbits(16, min=1, max=16);    // P4: bit-depth reduction on wet (16 = clean, 1 = brutal)\nParam downsamp(1, min=1, max=64);      // P4: sample-rate reduction (1 = full SR, N = hold N samples)\n\n// \u2500\u2500 G7 EVOLVE \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam evolve(0, min=0, max=1);         // autonomous drift depth on tap distribution (0 = static)\nParam evolverate(0.05, min=0.001, max=2);// drift speed (Hz)\n\n// \u2500\u2500 G8 STEREO image \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam width(1, min=0, max=1);          // stereo spread (0 = mono, 1 = full width)\nParam panmode(6, min=6, max=7);        // 6 = spread (ordered L\u2192R), 7 = deviate (random scatter)\nParam panA(0, min=-1, max=1);          // pan dist arg A (spread start / deviate range)\nParam panB(1, min=0, max=1);           // pan dist arg B (spread end / deviate center)\n\n// \u2500\u2500 G9 OUTPUT \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam mix(0, min=0, max=1);            // dry/wet: 0 = unprocessed source, 1 = full texture\nParam outgain(1, min=0, max=2);        // master output level (post-mix, pre soft-limiter)\n\n// \u2500\u2500 G10 TRANSPORT \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam panic(0, min=0, max=1);          // rising edge = click-free fade + buffer flush\nParam reroll(0, min=0, max=1);         // rising edge = re-randomize deviate tables\n\n// \u2500\u2500 State \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nDelay bufL(96000);                  // G1+: left delay line (~2s @ 48k)\nDelay bufR(96000);                  // G1+: right delay line (decorrelated loop)\nData cap(96000);                    // FROZEN snapshot loop (true static freeze)\nHistory fbstateL(0);                // G1+: feedback state L\nHistory fbstateR(0);                // G1+: feedback state R\nHistory lpstL(0);                   // G1+: loop lowpass state L\nHistory lpstR(0);                   // G1+: loop lowpass state R\nHistory dcxL(0);                    // G1+: DC blocker x1 L\nHistory dcyL(0);                    // G1+: DC blocker y1 L\nHistory dcxR(0);                    // G1+: DC blocker x1 R\nHistory dcyR(0);                    // G1+: DC blocker y1 R\nDelay apL1(8192);                   // DIFFUSION: allpass stages L (prime ms)\nDelay apL2(8192);\nDelay apL3(8192);\nDelay apL4(8192);\nDelay apR1(8192);                   // DIFFUSION: allpass stages R (different primes)\nDelay apR2(8192);\nDelay apR3(8192);\nDelay apR4(8192);\nHistory difsm(0);                   // DIFFUSION: smoothed amount\nHistory rrprev(0);\nHistory pnprev(0);\nHistory panctr(0);\nHistory cwpos(0);                   // capture write position (rolling record)\nHistory crpos(0);                   // capture read position (sweeps the frozen loop)\nHistory frzprev(0);\nHistory frzxf(0);                   // freeze crossfade (~5 ms, click-free enter AND exit)\nHistory mgain(1);                   // smoothed output gain (click-free panic)\nHistory fbsm(0);                    // smoothing: feedback\nHistory widsm(1);                   // smoothing: width\nHistory mxsm(0);                    // smoothing: dry/wet mix\nHistory clsm(0);                    // v1.3.3 smoothing: cloud blend\nHistory ogsm(1);                    // smoothing: output gain\nHistory dsl(0);                     // P4 sample-rate-reduction hold (L)\nHistory dsr(0);                     // P4 sample-rate-reduction hold (R)\nHistory dscnt(0);                   // P4 downsample counter\nHistory gphase(0);                  // G3 gate phase\nHistory ggain(1);                   // G3 gate gain (smoothed)\nHistory gateprev(0);                // G3 gate enable edge\nHistory evph1(0);                   // G3 evolve drift phase 1\nHistory evph2(0);                   // G3 evolve drift phase 2\nData dev(12);                       // held random, tap deviate\nData pdev(12);                      // held random, pan deviate\nData phase(12);                     // per-tap LFO phase accumulators\nData shval(12);                     // per-tap sample&hold value (P3 stepped LFO)\nData pcap(96000);                   // CLOUD: rolling capture of the live input\nData pph(16);                       // CLOUD: per-voice read phase (samples)\nData spdev(16);                     // CLOUD: held random for speed deviate\nHistory pwpos(0);                   // CLOUD: capture write position\nHistory bphprev(0);                 // P5: beat-ramp previous value (wrap/stall detect)\nHistory beatcnt(0);                 // P5: beats elapsed counter\nHistory wrapsamps(0);               // P5: samples since last beat wrap\nHistory beatsmp(0);                 // P5: measured beat length (samples)\nHistory stallctr(0);                // P5: stalled-ramp counter (transport stopped)\nHistory fqprev(0);                  // P5: freeze-quantize boundary phase\nHistory frzstate(0);                // P5: committed freeze state (armed vs active)\nHistory initdone(0);                // v1.3.1: one-time seed of deviate tables\n\n// \u2500\u2500 DSP \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\ntwopi = 6.28318530718;\nhalfpi = 1.57079632679;\nLcap = 96000;                       // freeze capture loop length (samples)\nLp = 96000;                         // input-capture (cloud) buffer length (~2s @ 48k)\n\nfbg = clamp(fbk, 0, 1);\nfbsm = fbsm + (fbg - fbsm) * 0.004; fbg = fbsm;   // ~5 ms smooth\ndep = clamp(lfodepth, 0, 1);\nwid = clamp(width, 0, 1);\nwidsm = widsm + (wid - widsm) * 0.004; wid = widsm;\n\n// P5 TEMPO SYNC + PHASE-LOCK\nbeatms = 60000 / clamp(bpm, 20, 300);\nsynced = sync > 0.5;\nbph = in3;\nbdelta = bph - bphprev;\nif (bdelta < -0.5) {\n\tbeatcnt = beatcnt + 1;\n\tbeatsmp = wrapsamps;\n\twrapsamps = 0;\n} else {\n\twrapsamps = wrapsamps + 1;\n}\nstallctr = (abs(bdelta) < 0.0000001) ? (stallctr + 1) : 0;\nbphprev = bph;\nbpos = beatcnt + bph;\nlocked = synced && (stallctr < 4800) && (beatsmp > 32);\nbeatms = locked ? (beatsmp * 1000 / samplerate) : beatms;\ntsyn = synced && (tapsync > 0.5);\nlsyn = synced && (lfosync > 0.5);\nfsyn = synced && (freezesync > 0.5);\nllock = locked && lsyn;\nflock = locked && fsyn;\nbasems_use    = tsyn ? (beatms * tapdiv) : basems;\nlforate_use   = lsyn ? (1000 / (beatms * ((lfodiv < 0.001) ? 0.001 : lfodiv))) : lforate;\nfreezelen_use = fsyn ? (beatms * freezediv) : freezelen;\nflen = clamp(freezelen_use * samplerate * 0.001, 64, Lcap);\n\n// P5 FREEZE-QUANTIZE: when locked, freeze commits at the next freezediv boundary\nfrzreq = freeze > 0.5;\nfqx = bpos / ((freezediv < 0.001) ? 0.001 : freezediv);\nfqp = fqx - floor(fqx);\nfqwrap = fqp < (fqprev - 0.5);\nfqprev = fqp;\nif (frzreq == 0) { frzstate = 0; }\nelse if (flock == 0) { frzstate = 1; }\nelse if (fqwrap) { frzstate = 1; }\nfrozen = frzstate > 0.5;\nfrzxf = frzxf + ((frozen ? 1 : 0) - frzxf) * 0.004;   // ~5 ms live<->frozen fade\n\n// P2 MORPH MACRO\nmph    = clamp(morph, 0, 1);\nbase_e = basems_use * (1 - 0.92 * mph);\nfbg_e  = fbg * (1 - mph);\ndep_e  = dep * (1 - mph);\ntc_e   = tapcount * (1 - mph) + 2 * mph;\nnact   = clamp(ceil(tc_e), 1, 12);\n\n// G3 EVOLVE: autonomous drift on tap-distribution args\nevd    = clamp(evolve, 0, 1);\nerate  = clamp(evolverate, 0.001, 2);\nevph1  = evph1 + erate / samplerate;        evph1 = evph1 - floor(evph1);\nevph2  = evph2 + erate * 0.37 / samplerate;  evph2 = evph2 - floor(evph2);\nAev    = clamp(A + evd * sin(evph1 * twopi) * 3, -8, 8);\nBev    = clamp(B + evd * sin(evph2 * twopi) * 3, 0, 16);\n\n// v1.3.1: seed deviate tables on first sample - Data starts zeroed and snapshots\n// don't carry Data, so mode 7 (Rubato) was inert in a fresh plugin until reroll.\nif (initdone < 0.5) {\n\tfor (k0 = 0; k0 < 12; k0 += 1) {\n\t\tdev.poke(noise(), k0);\n\t\tpdev.poke(noise(), k0);\n\t}\n\tfor (k0 = 0; k0 < 16; k0 += 1) { spdev.poke(noise(), k0); }\n\tinitdone = 1;\n}\n\n// reroll rising edge -> refill held-random tables\nif (reroll > rrprev) {\n\tfor (k = 0; k < 12; k += 1) {\n\t\tdev.poke(noise(), k);\n\t\tpdev.poke(noise(), k);\n\t}\n\tfor (k = 0; k < 16; k += 1) { spdev.poke(noise(), k); }\n}\nrrprev = reroll;\n\n// panic: rising edge starts a one-buffer flush\nif (panic > pnprev) { panctr = 96000; }\npnprev = panic;\nflushing = panctr > 0;\nif (panctr > 0) { panctr = panctr - 1; }\nif (flushing) { cap.poke(0, panctr); }  // v1.3.1: sweep-zero the freeze cap too, else a\n                                        // frozen texture comes back after the flush ends\npanik = (panic > 0.5) || flushing;\n\n// G1+ feedback state (stereo): sanitize NaN/Inf every sample\nfbL = fbstateL;\nfbL = (fbL == fbL) ? fbL : 0;\nfbL = clamp(fbL, -1.5, 1.5);\nfbR = fbstateR;\nfbR = (fbR == fbR) ? fbR : 0;\nfbR = clamp(fbR, -1.5, 1.5);\n\n// v1.3.1: round mode selectors once - float params/automation can sit between\n// integers, and exact == tests silently fell through to spread\nmi   = floor(mode + 0.5);\nspmi = floor(spmode + 0.5);\nlfmi = floor(lfomode + 0.5);\npmi  = floor(panmode + 0.5);\n\n// CAPTURE-REPLAY CLOUD: record live input, re-play 16 voices at distributed speeds\nrawmono = (in1 + in2) * 0.5;\ncl = clamp(cloud, 0, 1);\nclsm = clsm + (cl - clsm) * 0.004; cl = clsm;   // v1.3.3: ~5 ms smooth (match mix/width/diffusion)\nif (cloudhold < 0.5) {\n\tpcap.poke(rawmono, pwpos);\n\tpwpos = pwpos + 1;\n\tpwpos = (pwpos >= Lp) ? 0 : pwpos;\n}\ncloudsum = 0;\nfor (v = 0; v < 16; v += 1) {\n\tvf = v / 15;\n\tsr = 1;\n\tif (spmi == 1)      { sr = pow(spB, spA * v); }\n\telse if (spmi == 2) { sr = pow(spB, spA * v / 12); }\n\telse if (spmi == 3) { sr = spB + spA * v; }\n\telse if (spmi == 4) { sr = spB * (v + 1) * spA; }   // harmonic = 1x,2x,3x... chord\n\telse if (spmi == 5) { sr = spB / (v + 1) * spA; }\n\telse if (spmi == 7) { sr = spB + spdev.peek(v) * spA; }\n\telse                  { sr = spA + (spB - spA) * vf; }\n\tsr = clamp(sr, -64, 64);            // v1.3.1: pow(0,neg)=inf would NaN-poison pph forever\n\tpv = pph.peek(v) + playspeed * sr;\n\tpv = (pv == pv) ? pv : 0;           // v1.3.1: Data has no sanitize elsewhere - guard the poke\n\tpv = pv - Lp * floor(pv / Lp);\n\tpph.poke(pv, v);\n\tpi0 = floor(pv);\n\tpfr = pv - pi0;\n\tpi1 = (pi0 + 1 >= Lp) ? 0 : pi0 + 1;\n\tcloudsum += pcap.peek(pi0) * (1 - pfr) + pcap.peek(pi1) * pfr;\n}\ncloudmono = cloudsum * 0.0625;          // /16\nmatsrc = (1 - cl) * rawmono + cl * cloudmono;\ndryL = in1;                             // v1.3.2: TRUE dry (was cloud-following) - Mix governs ALL processing;\ndryR = in2;                             // cloud is heard through the wet matrix only, dry keeps full stereo\n\n// write head: source + lowpassed feedback\nsrc = matsrc;\nsrc = frozen ? 0 : src;\nfbamt = frozen ? 0 : fbg_e;\nsrc = panik ? 0 : src;\nfbamt = panik ? 0 : fbamt;\nwrL = clamp(src + (fbL * 0.7 + fbR * 0.3) * fbamt, -2, 2);\nwrR = clamp(src + (fbR * 0.7 + fbL * 0.3) * fbamt, -2, 2);\nbufL.write(wrL);\nbufR.write(wrR);\n\n// TRUE FREEZE: mirror live stream into cap; on freeze sweep crpos over flen window\nif (frozen && (frzprev < 0.5)) { crpos = 0; }\nfrzprev = frozen ? 1 : 0;\nif (frozen) {\n\tcrpos = crpos + 1;\n\tcrpos = (crpos >= flen) ? 0 : crpos;\n} else {\n\tcap.poke((wrL + wrR) * 0.5, cwpos);\n\tcwpos = cwpos + 1;\n\tcwpos = (cwpos >= Lcap) ? 0 : cwpos;\n}\n\nsumL = 0;\nsumR = 0;\nfbsumL = 0;\nfbsumR = 0;\nfor (i = 0; i < 12; i += 1) {\n\tfrac = i / 11;\n\n\t// per-tap delay ratio by mode\n\tratio = 1;\n\tif (mi == 1)      { ratio = pow(Bev, Aev * i); }\n\telse if (mi == 2) { ratio = pow(Bev, Aev * i / 12); }\n\telse if (mi == 3) { ratio = Bev + Aev * i; }\n\telse if (mi == 4) { ratio = Bev * (i + 1) * Aev; }\n\telse if (mi == 5) { ratio = Bev / (i + 1) * Aev; }\n\telse if (mi == 7) { ratio = Bev + dev.peek(i) * Aev; }\n\telse                { ratio = Aev + (Bev - Aev) * frac; }\n\n\t// per-tap LFO rate by lfomode\n\tlr = 1;\n\tif (lfmi == 1)      { lr = pow(lfoB, lfoA * i); }\n\telse if (lfmi == 2) { lr = pow(lfoB, lfoA * i / 12); }\n\telse if (lfmi == 3) { lr = lfoB + lfoA * i; }\n\telse if (lfmi == 4) { lr = lfoB * (i + 1) * lfoA; }\n\telse if (lfmi == 5) { lr = lfoB / (i + 1) * lfoA; }\n\telse                   { lr = lfoA + (lfoB - lfoA) * frac; }\n\tph = 0;\n\twrapped = 0;\n\tlq = 0;\n\tif (llock) {\n\t\tlq = bpos * lr / ((lfodiv < 0.001) ? 0.001 : lfodiv);\n\t\tph = lq - floor(lq);\n\t\twrapped = ph < (phase.peek(i) - 0.5);\n\t} else {\n\t\tph = phase.peek(i) + lforate_use * lr / samplerate;\n\t\twrapped = ph >= 1;\n\t\tph = ph - floor(ph);\n\t}\n\tphase.poke(ph, i);\n\tif (wrapped) { shval.poke(noise(), i); }\n\tlfo = (lfoshape > 0.5) ? shval.peek(i) : sin(ph * twopi);\n\n\t// modulated tap time\n\tmodms = base_e * (1 + lfo * dep_e);\n\tdsamp = ratio * modms * samplerate * 0.001;\n\tdsamp = clamp(dsamp, 1, 95000);\n\n\tgate = (i < tc_e) ? 1 : 0;\n\trphase = crpos - dsamp;\n\trphase = rphase - flen * floor(rphase / flen);\n\tridx = cwpos - flen + rphase;\n\tridx = ridx - Lcap * floor(ridx / Lcap);\n\tci0 = floor(ridx);\n\tcfr = ridx - ci0;\n\tci1 = (ci0 + 1 >= Lcap) ? 0 : ci0 + 1;\n\tcs = cap.peek(ci0) * (1 - cfr) + cap.peek(ci1) * cfr;\n\trdl = bufL.read(dsamp);\n\trdr = bufR.read(dsamp);\n\tisl = i - 2 * floor(i * 0.5);\n\tlive = (isl < 0.5) ? rdl : rdr;\n\ts = (live * (1 - frzxf) + cs * frzxf) * gate;\n\n\t// pan: spread across ACTIVE taps (balanced at any count)\n\tpanfrac = (nact > 1) ? (i / (nact - 1)) : 0.5;\n\tpan = panA + (panB - panA) * panfrac;\n\tif (pmi == 7) { pan = panB + pdev.peek(i) * panA; }\n\tpan = 0.5 + (pan - 0.5) * wid;\n\tpan = clamp(pan, 0, 1);\n\tsumL += s * cos(pan * halfpi);\n\tsumR += s * sin(pan * halfpi);\n\tif (isl < 0.5) { fbsumL += s; } else { fbsumR += s; }\n}\nsumL = sumL * 0.08333333;\nsumR = sumR * 0.08333333;\n\n// G1+ STEREO LOOP: per-channel filter + DC block + tanh limiter (unity-safe)\nnactL = ceil(nact * 0.5);                   // active even taps\nnactL = (nactL < 1) ? 1 : nactL;\nnactR = floor(nact * 0.5);                  // active odd taps\nnactR = (nactR < 1) ? 1 : nactR;\nfbnL = fbsumL / nactL;                      // normalize: loop gain honest at any tapcount\nfbnR = fbsumR / nactR;\ncoef = 1 - exp(-twopi * clamp(lopass, 20, 20000) / samplerate);  // accurate cutoff (20k ~ transparent)\nlpl = lpstL + coef * (fbnL - lpstL);\nlpl = (lpl == lpl) ? lpl : 0;\nlpl = clamp(lpl, -1.5, 1.5);\nlpstL = lpl;\nlpr = lpstR + coef * (fbnR - lpstR);\nlpr = (lpr == lpr) ? lpr : 0;\nlpr = clamp(lpr, -1.5, 1.5);\nlpstR = lpr;\ndcl = lpl - dcxL + 0.9995 * dcyL;           // DC blocker (~4 Hz): stops low-mud buildup at near-unity\ndcxL = lpl; dcyL = dcl;\ndcr = lpr - dcxR + 0.9995 * dcyR;\ndcxR = lpr; dcyR = dcr;\ndcl = (dcl == dcl) ? dcl : 0;\ndcl = clamp(dcl, -1.5, 1.5);\ndcr = (dcr == dcr) ? dcr : 0;\ndcr = clamp(dcr, -1.5, 1.5);\n\n// IN-LOOP DIFFUSION: 4-stage allpass per channel (mutually-prime delays, L != R primes).\n// Sits inside the recirculation, so each pass smears further: echoes -> wash.\ndif = clamp(diffusion, 0, 1);\ndifsm = difsm + (dif - difsm) * 0.004;\ndif = difsm;\napg = 0.65;\nms2s = samplerate * 0.001;\nz1 = apL1.read(3.1 * ms2s);   v1 = dcl + apg * z1;  a1 = z1 - apg * v1;  apL1.write(v1);\nz2 = apL2.read(7.9 * ms2s);   v2 = a1 + apg * z2;   a2 = z2 - apg * v2;  apL2.write(v2);\nz3 = apL3.read(13.7 * ms2s);  v3 = a2 + apg * z3;   a3 = z3 - apg * v3;  apL3.write(v3);\nz4 = apL4.read(23.3 * ms2s);  v4 = a3 + apg * z4;   a4 = z4 - apg * v4;  apL4.write(v4);\nz5 = apR1.read(3.7 * ms2s);   v5 = dcr + apg * z5;  a5 = z5 - apg * v5;  apR1.write(v5);\nz6 = apR2.read(8.9 * ms2s);   v6 = a5 + apg * z6;   a6 = z6 - apg * v6;  apR2.write(v6);\nz7 = apR3.read(14.9 * ms2s);  v7 = a6 + apg * z7;   a7 = z7 - apg * v7;  apR3.write(v7);\nz8 = apR4.read(26.1 * ms2s);  v8 = a7 + apg * z8;   a8 = z8 - apg * v8;  apR4.write(v8);\ndifl = dcl * (1 - dif) + a4 * dif;\ndifr = dcr * (1 - dif) + a8 * dif;\ndifl = (difl == difl) ? difl : 0;\ndifl = clamp(difl, -1.5, 1.5);\ndifr = (difr == difr) ? difr : 0;\ndifr = clamp(difr, -1.5, 1.5);\nfbstateL = tanh(difl);                      // in-loop soft limiter: fbk 1.0 self-limits, can't run away\nfbstateR = tanh(difr);\n\n// dry/wet mix + click-free output gain\nmx = clamp(mix, 0, 1);\nmxsm = mxsm + (mx - mxsm) * 0.004; mx = mxsm;\nwetL = clamp(sumL, -1, 1);\nwetR = clamp(sumR, -1, 1);\n\n// P4 CRUSH: bit-depth + SR-reduction on WET only (dry stays clean)\nbits = clamp(floor(crushbits), 1, 16);        // floor() = correct integer quantization\nqstep = 2 / pow(2, bits);\nwetL = round(wetL / qstep) * qstep;\nwetR = round(wetR / qstep) * qstep;\nds = clamp(floor(downsamp), 1, 64);\ndscnt = dscnt + 1;\nif (dscnt >= ds) { dsl = wetL; dsr = wetR; dscnt = 0; }\nwetL = dsl;\nwetR = dsr;\n\nmtarget = panik ? 0 : 1;\nmgain = mgain + (mtarget - mgain) * 0.002;   // ~10 ms ramp\n\n// G3 GATE: tempo-relative rhythmic gate (click-free)\ngdv = (gatediv < 0.0156) ? 0.0156 : gatediv;\ngrate = 1000 / (beatms * gdv);\nif ((gateon > 0.5) && (gateprev < 0.5)) { gphase = 0; }\ngateprev = gateon;\ngq = 0;\nif (locked) {\n\tgq = bpos / gdv;\n\tgphase = gq - floor(gq);\n} else {\n\tgphase = gphase + grate / samplerate;\n\tgphase = gphase - floor(gphase);\n}\npulse = (gphase < clamp(gateduty, 0.02, 0.98)) ? 1 : 0;\ngtarget = (gateon > 0.5) ? (1 - clamp(gatedepth, 0, 1) * (1 - pulse)) : 1;\nggain = ggain + (gtarget - ggain) * 0.01;\nmixL = (dryL * (1 - mx) + wetL * ggain * mx) * mgain;   // v1.3.2: gate chops WET only -\nmixR = (dryR * (1 - mx) + wetR * ggain * mx) * mgain;   // Mix 0 = clean bypass (panic stays global)\n\n// G4 OUTPUT: master gain + soft limiter\nogsm = ogsm + (outgain - ogsm) * 0.002;\nout1 = tanh(mixL * ogsm);\nout2 = tanh(mixR * ogsm);\n"
             }
            },
            {
             "box": {
              "id": "out1",
              "maxclass": "newobj",
              "numinlets": 1,
              "numoutlets": 0,
              "patching_rect": [
               40,
               690,
               40,
               22
              ],
              "text": "out 1"
             }
            },
            {
             "box": {
              "id": "out2",
              "maxclass": "newobj",
              "numinlets": 1,
              "numoutlets": 0,
              "patching_rect": [
               100,
               690,
               40,
               22
              ],
              "text": "out 2"
             }
            },
            {
             "box": {
              "id": "in3",
              "maxclass": "newobj",
              "numinlets": 0,
              "numoutlets": 1,
              "outlettype": [
               ""
              ],
              "patching_rect": [
               160,
               40,
               40,
               22
              ],
              "text": "in 3"
             }
            }
           ],
           "lines": [
            {
             "patchline": {
              "source": [
               "in1",
               0
              ],
              "destination": [
               "cb",
               0
              ]
             }
            },
            {
             "patchline": {
              "source": [
               "in2",
               0
              ],
              "destination": [
               "cb",
               1
              ]
             }
            },
            {
             "patchline": {
              "source": [
               "cb",
               0
              ],
              "destination": [
               "out1",
               0
              ]
             }
            },
            {
             "patchline": {
              "source": [
               "cb",
               1
              ],
              "destination": [
               "out2",
               0
              ]
             }
            },
            {
             "patchline": {
              "source": [
               "in3",
               0
              ],
              "destination": [
               "cb",
               2
              ]
             }
            }
           ]
          }
         },
         "id": "obj-5",
         "linecount": 2,
         "maxclass": "newobj",
         "numinlets": 3,
         "numoutlets": 2,
         "outlettype": [
          "signal",
          "signal"
         ],
         "patching_rect": [
          128.0,
          229.0,
          212.0,
          37.0
         ],
         "rnbo_classname": "gen~",
         "rnbo_serial": 1,
         "rnbo_uniqueid": "idr",
         "rnboinfo": {
          "needsInstanceInfo": 1,
          "argnames": {
           "in1": {
            "attrOrProp": 1,
            "digest": "in1",
            "isalias": 0,
            "aliases": [],
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "inlet": 1,
            "type": "number"
           },
           "reset": {
            "attrOrProp": 1,
            "digest": "Reset all param and history objects to initial values",
            "isalias": 0,
            "aliases": [],
            "attachable": 1,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "bang"
           },
           "expr": {
            "attrOrProp": 2,
            "digest": "a gen expression",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol",
            "doNotShowInMaxInspector": 1
           },
           "file": {
            "attrOrProp": 2,
            "digest": "gendsp file to load",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol",
            "doNotShowInMaxInspector": 1
           },
           "title": {
            "attrOrProp": 2,
            "digest": "a title",
            "defaultarg": 1,
            "isalias": 0,
            "aliases": [
             "t"
            ],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol",
            "doNotShowInMaxInspector": 1
           },
           "t": {
            "attrOrProp": 2,
            "digest": "a title",
            "defaultarg": 1,
            "isalias": 1,
            "aliasOf": "title",
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol"
           },
           "exposeparams": {
            "attrOrProp": 2,
            "digest": "Expose gen params as RNBO params.",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "bool",
            "defaultValue": "false"
           }
          },
          "inputs": [
           {
            "name": "in1",
            "type": "auto",
            "digest": "in1",
            "hot": 1,
            "docked": 0
           },
           {
            "name": "in2",
            "type": "auto"
           },
           {
            "name": "in3",
            "type": "auto"
           }
          ],
          "outputs": [
           {
            "name": "out1",
            "type": "signal"
           },
           {
            "name": "out2",
            "type": "signal"
           }
          ],
          "helpname": "gen~",
          "aliasOf": "gen~",
          "classname": "gen~",
          "operator": 0,
          "versionId": 179904306,
          "changesPatcherIO": 0
         },
         "text": "gen~ @file texture_gen_stereo.gendsp @exposeparams 1",
         "varname": "idr"
        }
       },
       {
        "box": {
         "id": "obj-4",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          78.0,
          150.0,
          43.0,
          23.0
         ],
         "rnbo_classname": "out~",
         "rnbo_extra_attributes": {
          "meta": "",
          "comment": ""
         },
         "rnbo_serial": 1,
         "rnbo_uniqueid": "out~_obj-4",
         "rnboinfo": {
          "needsInstanceInfo": 1,
          "argnames": {
           "in1": {
            "attrOrProp": 1,
            "digest": "signal sent to outlet with index 2",
            "isalias": 0,
            "aliases": [],
            "settable": 0,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "inlet": 1,
            "type": "signal"
           },
           "index": {
            "attrOrProp": 2,
            "digest": "outlet number",
            "defaultarg": 1,
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "number",
            "mandatory": 1
           },
           "comment": {
            "attrOrProp": 2,
            "digest": "mouse over comment",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol"
           },
           "meta": {
            "attrOrProp": 2,
            "digest": "A JSON formatted string containing metadata for use by the exported code",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol",
            "defaultValue": "",
            "label": "Metadata",
            "displayorder": 3
           }
          },
          "inputs": [
           {
            "name": "in1",
            "type": "signal",
            "digest": "signal sent to outlet with index 2",
            "displayName": "",
            "hot": 1,
            "docked": 0
           }
          ],
          "outputs": [],
          "helpname": "out~",
          "aliasOf": "out~",
          "classname": "out~",
          "operator": 0,
          "versionId": 1989326771,
          "changesPatcherIO": 1
         },
         "text": "out~ 2"
        }
       },
       {
        "box": {
         "id": "obj-3",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "patching_rect": [
          78.0,
          63.0,
          35.0,
          23.0
         ],
         "rnbo_classname": "in~",
         "rnbo_extra_attributes": {
          "meta": "",
          "comment": ""
         },
         "rnbo_serial": 1,
         "rnbo_uniqueid": "in~_obj-3",
         "rnboinfo": {
          "needsInstanceInfo": 1,
          "argnames": {
           "out1": {
            "attrOrProp": 1,
            "digest": "signal from inlet with index 2",
            "isalias": 0,
            "aliases": [],
            "settable": 0,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "outlet": 1,
            "type": "signal"
           },
           "index": {
            "attrOrProp": 2,
            "digest": "inlet number",
            "defaultarg": 1,
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "number",
            "mandatory": 1
           },
           "comment": {
            "attrOrProp": 2,
            "digest": "mouse over comment",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol"
           },
           "meta": {
            "attrOrProp": 2,
            "digest": "A JSON formatted string containing metadata for use by the exported code",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol",
            "defaultValue": "",
            "label": "Metadata",
            "displayorder": 3
           }
          },
          "inputs": [],
          "outputs": [
           {
            "name": "out1",
            "type": "signal",
            "digest": "signal from inlet with index 2",
            "displayName": "",
            "docked": 0
           }
          ],
          "helpname": "in~",
          "aliasOf": "in~",
          "classname": "in~",
          "operator": 0,
          "versionId": -1654556303,
          "changesPatcherIO": 1
         },
         "text": "in~ 2"
        }
       },
       {
        "box": {
         "id": "obj-2",
         "maxclass": "newobj",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          22.0,
          150.0,
          43.0,
          23.0
         ],
         "rnbo_classname": "out~",
         "rnbo_extra_attributes": {
          "meta": "",
          "comment": ""
         },
         "rnbo_serial": 2,
         "rnbo_uniqueid": "out~_obj-2",
         "rnboinfo": {
          "needsInstanceInfo": 1,
          "argnames": {
           "in1": {
            "attrOrProp": 1,
            "digest": "signal sent to outlet with index 1",
            "isalias": 0,
            "aliases": [],
            "settable": 0,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "inlet": 1,
            "type": "signal"
           },
           "index": {
            "attrOrProp": 2,
            "digest": "outlet number",
            "defaultarg": 1,
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "number",
            "mandatory": 1
           },
           "comment": {
            "attrOrProp": 2,
            "digest": "mouse over comment",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol"
           },
           "meta": {
            "attrOrProp": 2,
            "digest": "A JSON formatted string containing metadata for use by the exported code",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol",
            "defaultValue": "",
            "label": "Metadata",
            "displayorder": 3
           }
          },
          "inputs": [
           {
            "name": "in1",
            "type": "signal",
            "digest": "signal sent to outlet with index 1",
            "displayName": "",
            "hot": 1,
            "docked": 0
           }
          ],
          "outputs": [],
          "helpname": "out~",
          "aliasOf": "out~",
          "classname": "out~",
          "operator": 0,
          "versionId": 1989326771,
          "changesPatcherIO": 1
         },
         "text": "out~ 1"
        }
       },
       {
        "box": {
         "id": "obj-1",
         "maxclass": "newobj",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "patching_rect": [
          22.0,
          63.0,
          35.0,
          23.0
         ],
         "rnbo_classname": "in~",
         "rnbo_extra_attributes": {
          "meta": "",
          "comment": ""
         },
         "rnbo_serial": 2,
         "rnbo_uniqueid": "in~_obj-1",
         "rnboinfo": {
          "needsInstanceInfo": 1,
          "argnames": {
           "out1": {
            "attrOrProp": 1,
            "digest": "signal from inlet with index 1",
            "isalias": 0,
            "aliases": [],
            "settable": 0,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "outlet": 1,
            "type": "signal"
           },
           "index": {
            "attrOrProp": 2,
            "digest": "inlet number",
            "defaultarg": 1,
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "number",
            "mandatory": 1
           },
           "comment": {
            "attrOrProp": 2,
            "digest": "mouse over comment",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol"
           },
           "meta": {
            "attrOrProp": 2,
            "digest": "A JSON formatted string containing metadata for use by the exported code",
            "isalias": 0,
            "aliases": [],
            "settable": 1,
            "attachable": 0,
            "isparam": 0,
            "deprecated": 0,
            "touched": 0,
            "type": "symbol",
            "defaultValue": "",
            "label": "Metadata",
            "displayorder": 3
           }
          },
          "inputs": [],
          "outputs": [
           {
            "name": "out1",
            "type": "signal",
            "digest": "signal from inlet with index 1",
            "displayName": "",
            "docked": 0
           }
          ],
          "helpname": "in~",
          "aliasOf": "in~",
          "classname": "in~",
          "operator": 0,
          "versionId": -1654556303,
          "changesPatcherIO": 1
         },
         "text": "in~ 1"
        }
       },
       {
        "box": {
         "id": "obj-6",
         "maxclass": "newobj",
         "numinlets": 2,
         "numoutlets": 1,
         "outlettype": [
          "signal"
         ],
         "patching_rect": [
          300.0,
          40.0,
          130.0,
          23.0
         ],
         "rnbo_classname": "phasor~",
         "rnbo_serial": 1,
         "rnbo_uniqueid": "phasor~_obj-6",
         "text": "phasor~ 4n @lock 1"
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "destination": [
          "obj-5",
          0
         ],
         "source": [
          "obj-1",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-5",
          1
         ],
         "source": [
          "obj-3",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-2",
          0
         ],
         "source": [
          "obj-5",
          0
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-4",
          0
         ],
         "source": [
          "obj-5",
          1
         ]
        }
       },
       {
        "patchline": {
         "destination": [
          "obj-5",
          2
         ],
         "source": [
          "obj-6",
          0
         ]
        }
       }
      ],
      "export_config": {
       "vst-au-export": {
        "vst-au-export-ins": {
         "plugin_manufacturer_code": "MClp",
         "plugin_manufacturer_name": "AudioClima",
         "plugin_name": "Idiorhythm POCII"
        }
       }
      }
     },
     "patching_rect": [
      117.0,
      87.0,
      170.0,
      22.0
     ],
     "rnboattrcache": {
      "idr/gateduty": {
       "label": "idr/gateduty",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/spA": {
       "label": "idr/spA",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/width": {
       "label": "idr/width",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/tapdiv": {
       "label": "idr/tapdiv",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/outgain": {
       "label": "idr/outgain",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/mode": {
       "label": "idr/mode",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/reroll": {
       "label": "idr/reroll",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/freeze": {
       "label": "idr/freeze",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/lfoB": {
       "label": "idr/lfoB",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/gatediv": {
       "label": "idr/gatediv",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/playspeed": {
       "label": "idr/playspeed",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/evolve": {
       "label": "idr/evolve",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/sync": {
       "label": "idr/sync",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/panB": {
       "label": "idr/panB",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/tapcount": {
       "label": "idr/tapcount",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/lfosync": {
       "label": "idr/lfosync",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/panic": {
       "label": "idr/panic",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/fbk": {
       "label": "idr/fbk",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/lfomode": {
       "label": "idr/lfomode",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/morph": {
       "label": "idr/morph",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/crushbits": {
       "label": "idr/crushbits",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/spB": {
       "label": "idr/spB",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/panmode": {
       "label": "idr/panmode",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/lfodiv": {
       "label": "idr/lfodiv",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/diffusion": {
       "label": "idr/diffusion",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/A": {
       "label": "idr/A",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/freezelen": {
       "label": "idr/freezelen",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/lfodepth": {
       "label": "idr/lfodepth",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/gatedepth": {
       "label": "idr/gatedepth",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/spmode": {
       "label": "idr/spmode",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/evolverate": {
       "label": "idr/evolverate",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/bpm": {
       "label": "idr/bpm",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/mix": {
       "label": "idr/mix",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/basems": {
       "label": "idr/basems",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/freezesync": {
       "label": "idr/freezesync",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/lopass": {
       "label": "idr/lopass",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/lfoA": {
       "label": "idr/lfoA",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/gateon": {
       "label": "idr/gateon",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/cloud": {
       "label": "idr/cloud",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/downsamp": {
       "label": "idr/downsamp",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/cloudhold": {
       "label": "idr/cloudhold",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/panA": {
       "label": "idr/panA",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/freezediv": {
       "label": "idr/freezediv",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/tapsync": {
       "label": "idr/tapsync",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/B": {
       "label": "idr/B",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/lforate": {
       "label": "idr/lforate",
       "isEnum": 0,
       "parsestring": ""
      },
      "idr/lfoshape": {
       "label": "idr/lfoshape",
       "isEnum": 0,
       "parsestring": ""
      }
     },
     "rnboversion": "1.4.2",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_invisible": 1,
       "parameter_longname": "rnbo~",
       "parameter_modmode": 0,
       "parameter_shortname": "rnbo~",
       "parameter_type": 3
      }
     },
     "saved_object_attributes": {
      "optimization": "O1",
      "parameter_enable": 1,
      "uuid": "f71a7465-7183-11f1-b465-466678cd98a6"
     },
     "snapshot": {
      "filetype": "C74Snapshot",
      "version": 2,
      "minorversion": 0,
      "name": "snapshotlist",
      "origin": "rnbo~",
      "type": "list",
      "subtype": "Undefined",
      "embed": 1,
      "snapshot": {
       "idr/evolve": {
        "value": 0.65
       },
       "idr/gateduty": {
        "value": 0.5
       },
       "idr/lfoshape": {
        "value": 0.0
       },
       "idr/lfodepth": {
        "value": 0.2
       },
       "idr/lfomode": {
        "value": 6.0
       },
       "idr/lfoB": {
        "value": 1.5
       },
       "idr/reroll": {
        "value": 0.0
       },
       "idr/panB": {
        "value": 1.0
       },
       "idr/lfoA": {
        "value": 0.5
       },
       "idr/playspeed": {
        "value": 0.5
       },
       "idr/width": {
        "value": 1.0
       },
       "idr/lforate": {
        "value": 0.04
       },
       "idr/panic": {
        "value": 0.0
       },
       "idr/outgain": {
        "value": 1.0
       },
       "idr/freeze": {
        "value": 0.0
       },
       "idr/diffusion": {
        "value": 0.85
       },
       "idr/gatediv": {
        "value": 0.25
       },
       "idr/lfodiv": {
        "value": 1.0
       },
       "idr/lopass": {
        "value": 3200.0
       },
       "idr/freezelen": {
        "value": 2000.0
       },
       "idr/A": {
        "value": 1.0
       },
       "idr/B": {
        "value": 0.5
       },
       "idr/tapcount": {
        "value": 12.0
       },
       "idr/mix": {
        "value": 0.85
       },
       "idr/morph": {
        "value": 0.0
       },
       "idr/mode": {
        "value": 4.0
       },
       "idr/panA": {
        "value": -1.0
       },
       "idr/freezediv": {
        "value": 1.0
       },
       "idr/freezesync": {
        "value": 1.0
       },
       "idr/cloud": {
        "value": 0.2
       },
       "idr/lfosync": {
        "value": 1.0
       },
       "idr/evolverate": {
        "value": 0.015
       },
       "idr/crushbits": {
        "value": 16.0
       },
       "idr/tapsync": {
        "value": 1.0
       },
       "idr/spmode": {
        "value": 6.0
       },
       "idr/spA": {
        "value": 0.98
       },
       "idr/bpm": {
        "value": 120.0
       },
       "idr/tapdiv": {
        "value": 0.5
       },
       "idr/sync": {
        "value": 0.0
       },
       "idr/cloudhold": {
        "value": 0.0
       },
       "idr/gatedepth": {
        "value": 1.0
       },
       "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
       "idr/gateon": {
        "value": 0.0
       },
       "idr/spB": {
        "value": 1.02
       },
       "idr/downsamp": {
        "value": 1.0
       },
       "idr/fbk": {
        "value": 1.0
       },
       "idr/panmode": {
        "value": 6.0
       },
       "idr/basems": {
        "value": 900.0
       }
      },
      "snapshotlist": {
       "current_snapshot": 0,
       "entries": [
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "Percutiendo",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/evolve": {
           "value": 0.65
          },
          "idr/gateduty": {
           "value": 0.5
          },
          "idr/lfoshape": {
           "value": 0.0
          },
          "idr/lfodepth": {
           "value": 0.2
          },
          "idr/lfomode": {
           "value": 6.0
          },
          "idr/lfoB": {
           "value": 1.5
          },
          "idr/reroll": {
           "value": 0.0
          },
          "idr/panB": {
           "value": 1.0
          },
          "idr/lfoA": {
           "value": 0.5
          },
          "idr/playspeed": {
           "value": 0.5
          },
          "idr/width": {
           "value": 1.0
          },
          "idr/lforate": {
           "value": 0.04
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/diffusion": {
           "value": 0.85
          },
          "idr/gatediv": {
           "value": 0.25
          },
          "idr/lfodiv": {
           "value": 1.0
          },
          "idr/lopass": {
           "value": 3200.0
          },
          "idr/freezelen": {
           "value": 2000.0
          },
          "idr/A": {
           "value": 1.0
          },
          "idr/B": {
           "value": 0.5
          },
          "idr/tapcount": {
           "value": 12.0
          },
          "idr/mix": {
           "value": 0.85
          },
          "idr/morph": {
           "value": 0.0
          },
          "idr/mode": {
           "value": 4.0
          },
          "idr/panA": {
           "value": -1.0
          },
          "idr/freezediv": {
           "value": 1.0
          },
          "idr/freezesync": {
           "value": 1.0
          },
          "idr/cloud": {
           "value": 0.2
          },
          "idr/lfosync": {
           "value": 1.0
          },
          "idr/evolverate": {
           "value": 0.015
          },
          "idr/crushbits": {
           "value": 16.0
          },
          "idr/tapsync": {
           "value": 1.0
          },
          "idr/spmode": {
           "value": 6.0
          },
          "idr/spA": {
           "value": 0.98
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.5
          },
          "idr/sync": {
           "value": 0.0
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
          "idr/gateon": {
           "value": 0.0
          },
          "idr/spB": {
           "value": 1.02
          },
          "idr/downsamp": {
           "value": 1.0
          },
          "idr/fbk": {
           "value": 1.0
          },
          "idr/panmode": {
           "value": 6.0
          },
          "idr/basems": {
           "value": 900.0
          }
         },
         "fileref": {
          "name": "Percutiendo",
          "filename": "Percutiendo.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "ececdaac7156a5e24f5fd3bab983817f"
         }
        },
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "Bailando",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/cloud": {
           "value": 0.4
          },
          "idr/playspeed": {
           "value": 1.0
          },
          "idr/spmode": {
           "value": 7.0
          },
          "idr/spA": {
           "value": 0.06
          },
          "idr/spB": {
           "value": 1.0
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/sync": {
           "value": 0.0
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.5
          },
          "idr/lfodiv": {
           "value": 1.0
          },
          "idr/freezediv": {
           "value": 1.0
          },
          "idr/tapcount": {
           "value": 12.0
          },
          "idr/basems": {
           "value": 420.0
          },
          "idr/mode": {
           "value": 6.0
          },
          "idr/A": {
           "value": 1.0
          },
          "idr/B": {
           "value": 8.0
          },
          "idr/fbk": {
           "value": 1.0
          },
          "idr/lopass": {
           "value": 4500.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/freezelen": {
           "value": 2000.0
          },
          "idr/lforate": {
           "value": 0.12
          },
          "idr/lfomode": {
           "value": 6.0
          },
          "idr/lfoA": {
           "value": 0.5
          },
          "idr/lfoB": {
           "value": 2.0
          },
          "idr/lfodepth": {
           "value": 0.3
          },
          "idr/lfoshape": {
           "value": 0.0
          },
          "idr/morph": {
           "value": 0.0
          },
          "idr/gateon": {
           "value": 0.0
          },
          "idr/gatediv": {
           "value": 0.25
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "idr/gateduty": {
           "value": 0.5
          },
          "idr/crushbits": {
           "value": 16.0
          },
          "idr/downsamp": {
           "value": 1.0
          },
          "idr/evolve": {
           "value": 0.5
          },
          "idr/evolverate": {
           "value": 0.03
          },
          "idr/width": {
           "value": 1.0
          },
          "idr/panmode": {
           "value": 6.0
          },
          "idr/panA": {
           "value": -1.0
          },
          "idr/panB": {
           "value": 1.0
          },
          "idr/mix": {
           "value": 0.9
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/diffusion": {
           "value": 0.75
          },
          "idr/tapsync": {
           "value": 1.0
          },
          "idr/lfosync": {
           "value": 1.0
          },
          "idr/freezesync": {
           "value": 1.0
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/reroll": {
           "value": 0.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
         },
         "fileref": {
          "name": "Bailando",
          "filename": "Bailando.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "0532dcbc900cbe2faf7fce250a760007"
         }
        },
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "Hablando",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/cloud": {
           "value": 0.25
          },
          "idr/playspeed": {
           "value": 1.0
          },
          "idr/spmode": {
           "value": 7.0
          },
          "idr/spA": {
           "value": 0.5
          },
          "idr/spB": {
           "value": 1.0
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/sync": {
           "value": 0.0
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.5
          },
          "idr/lfodiv": {
           "value": 1.0
          },
          "idr/freezediv": {
           "value": 1.0
          },
          "idr/tapcount": {
           "value": 7.0
          },
          "idr/basems": {
           "value": 130.0
          },
          "idr/mode": {
           "value": 7.0
          },
          "idr/A": {
           "value": 2.5
          },
          "idr/B": {
           "value": 3.0
          },
          "idr/fbk": {
           "value": 0.55
          },
          "idr/lopass": {
           "value": 6500.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/freezelen": {
           "value": 800.0
          },
          "idr/lforate": {
           "value": 2.8
          },
          "idr/lfomode": {
           "value": 7.0
          },
          "idr/lfoA": {
           "value": 1.5
          },
          "idr/lfoB": {
           "value": 2.0
          },
          "idr/lfodepth": {
           "value": 0.3
          },
          "idr/lfoshape": {
           "value": 1.0
          },
          "idr/morph": {
           "value": 0.0
          },
          "idr/gateon": {
           "value": 0.0
          },
          "idr/gatediv": {
           "value": 0.25
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "idr/gateduty": {
           "value": 0.5
          },
          "idr/crushbits": {
           "value": 16.0
          },
          "idr/downsamp": {
           "value": 1.0
          },
          "idr/evolve": {
           "value": 0.15
          },
          "idr/evolverate": {
           "value": 0.08
          },
          "idr/width": {
           "value": 1.0
          },
          "idr/panmode": {
           "value": 7.0
          },
          "idr/panA": {
           "value": 0.7
          },
          "idr/panB": {
           "value": 0.5
          },
          "idr/mix": {
           "value": 0.9
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/diffusion": {
           "value": 0.15
          },
          "idr/tapsync": {
           "value": 0.0
          },
          "idr/lfosync": {
           "value": 0.0
          },
          "idr/freezesync": {
           "value": 0.0
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/reroll": {
           "value": 0.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
         },
         "fileref": {
          "name": "Hablando",
          "filename": "Hablando.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "66d83339c67ad01210b880b50a8fcde8"
         }
        },
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "Patinando",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/cloud": {
           "value": 0.15
          },
          "idr/playspeed": {
           "value": 1.3
          },
          "idr/spmode": {
           "value": 6.0
          },
          "idr/spA": {
           "value": 0.9
          },
          "idr/spB": {
           "value": 1.6
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/sync": {
           "value": 1.0
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.5
          },
          "idr/lfodiv": {
           "value": 1.0
          },
          "idr/freezediv": {
           "value": 0.5
          },
          "idr/tapcount": {
           "value": 10.0
          },
          "idr/basems": {
           "value": 240.0
          },
          "idr/mode": {
           "value": 1.0
          },
          "idr/A": {
           "value": -1.2
          },
          "idr/B": {
           "value": 2.0
          },
          "idr/fbk": {
           "value": 0.88
          },
          "idr/lopass": {
           "value": 5500.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/freezelen": {
           "value": 220.0
          },
          "idr/lforate": {
           "value": 0.4
          },
          "idr/lfomode": {
           "value": 6.0
          },
          "idr/lfoA": {
           "value": 1.0
          },
          "idr/lfoB": {
           "value": 2.0
          },
          "idr/lfodepth": {
           "value": 0.12
          },
          "idr/lfoshape": {
           "value": 0.0
          },
          "idr/morph": {
           "value": 0.4
          },
          "idr/gateon": {
           "value": 0.0
          },
          "idr/gatediv": {
           "value": 0.25
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "idr/gateduty": {
           "value": 0.5
          },
          "idr/crushbits": {
           "value": 8.0
          },
          "idr/downsamp": {
           "value": 6.0
          },
          "idr/evolve": {
           "value": 0.0
          },
          "idr/evolverate": {
           "value": 0.03
          },
          "idr/width": {
           "value": 1.0
          },
          "idr/panmode": {
           "value": 6.0
          },
          "idr/panA": {
           "value": -1.0
          },
          "idr/panB": {
           "value": 1.0
          },
          "idr/mix": {
           "value": 0.9
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/diffusion": {
           "value": 0.3
          },
          "idr/tapsync": {
           "value": 1.0
          },
          "idr/lfosync": {
           "value": 1.0
          },
          "idr/freezesync": {
           "value": 1.0
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/reroll": {
           "value": 0.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
         },
         "fileref": {
          "name": "Patinando",
          "filename": "Patinando.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "19953357b6c8938d91cdc8bcfce58abe"
         }
        },
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "Murmur",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/cloud": {
           "value": 0.7
          },
          "idr/playspeed": {
           "value": 1.0
          },
          "idr/spmode": {
           "value": 7.0
          },
          "idr/spA": {
           "value": 0.35
          },
          "idr/spB": {
           "value": 1.0
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/sync": {
           "value": 0.0
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.5
          },
          "idr/lfodiv": {
           "value": 1.0
          },
          "idr/freezediv": {
           "value": 1.0
          },
          "idr/tapcount": {
           "value": 10.0
          },
          "idr/basems": {
           "value": 300.0
          },
          "idr/mode": {
           "value": 7.0
          },
          "idr/A": {
           "value": 1.5
          },
          "idr/B": {
           "value": 2.5
          },
          "idr/fbk": {
           "value": 0.8
          },
          "idr/lopass": {
           "value": 5000.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/freezelen": {
           "value": 1500.0
          },
          "idr/lforate": {
           "value": 0.5
          },
          "idr/lfomode": {
           "value": 7.0
          },
          "idr/lfoA": {
           "value": 1.0
          },
          "idr/lfoB": {
           "value": 2.0
          },
          "idr/lfodepth": {
           "value": 0.2
          },
          "idr/lfoshape": {
           "value": 1.0
          },
          "idr/morph": {
           "value": 0.0
          },
          "idr/gateon": {
           "value": 0.0
          },
          "idr/gatediv": {
           "value": 0.25
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "idr/gateduty": {
           "value": 0.5
          },
          "idr/crushbits": {
           "value": 16.0
          },
          "idr/downsamp": {
           "value": 1.0
          },
          "idr/evolve": {
           "value": 0.3
          },
          "idr/evolverate": {
           "value": 0.05
          },
          "idr/width": {
           "value": 1.0
          },
          "idr/panmode": {
           "value": 7.0
          },
          "idr/panA": {
           "value": 0.6
          },
          "idr/panB": {
           "value": 0.5
          },
          "idr/mix": {
           "value": 0.9
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/diffusion": {
           "value": 0.55
          },
          "idr/tapsync": {
           "value": 0.0
          },
          "idr/lfosync": {
           "value": 0.0
          },
          "idr/freezesync": {
           "value": 0.0
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/reroll": {
           "value": 0.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
         },
         "fileref": {
          "name": "Murmur",
          "filename": "Murmur.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "662b1eeeaed47099841d6f380669266d"
         }
        },
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "Stutter Step",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/cloud": {
           "value": 0.0
          },
          "idr/playspeed": {
           "value": 1.0
          },
          "idr/spmode": {
           "value": 6.0
          },
          "idr/spA": {
           "value": 0.9
          },
          "idr/spB": {
           "value": 1.4
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/sync": {
           "value": 1.0
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.25
          },
          "idr/lfodiv": {
           "value": 0.5
          },
          "idr/freezediv": {
           "value": 0.25
          },
          "idr/tapcount": {
           "value": 6.0
          },
          "idr/basems": {
           "value": 120.0
          },
          "idr/mode": {
           "value": 3.0
          },
          "idr/A": {
           "value": 1.0
          },
          "idr/B": {
           "value": 1.0
          },
          "idr/fbk": {
           "value": 0.75
          },
          "idr/lopass": {
           "value": 7000.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/freezelen": {
           "value": 140.0
          },
          "idr/lforate": {
           "value": 0.2
          },
          "idr/lfomode": {
           "value": 6.0
          },
          "idr/lfoA": {
           "value": 1.0
          },
          "idr/lfoB": {
           "value": 2.0
          },
          "idr/lfodepth": {
           "value": 0.05
          },
          "idr/lfoshape": {
           "value": 1.0
          },
          "idr/morph": {
           "value": 0.25
          },
          "idr/gateon": {
           "value": 1.0
          },
          "idr/gatediv": {
           "value": 0.125
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "idr/gateduty": {
           "value": 0.35
          },
          "idr/crushbits": {
           "value": 12.0
          },
          "idr/downsamp": {
           "value": 2.0
          },
          "idr/evolve": {
           "value": 0.0
          },
          "idr/evolverate": {
           "value": 0.03
          },
          "idr/width": {
           "value": 0.8
          },
          "idr/panmode": {
           "value": 6.0
          },
          "idr/panA": {
           "value": -0.7
          },
          "idr/panB": {
           "value": 0.7
          },
          "idr/mix": {
           "value": 0.95
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/diffusion": {
           "value": 0.05
          },
          "idr/tapsync": {
           "value": 1.0
          },
          "idr/lfosync": {
           "value": 1.0
          },
          "idr/freezesync": {
           "value": 1.0
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/reroll": {
           "value": 0.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
         },
         "fileref": {
          "name": "Stutter Step",
          "filename": "Stutter Step.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "5462f1bf15795bfb7260a5e0feaabad4"
         }
        },
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "Pavement",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/cloud": {
           "value": 0.3
          },
          "idr/playspeed": {
           "value": 0.8
          },
          "idr/spmode": {
           "value": 7.0
          },
          "idr/spA": {
           "value": 0.6
          },
          "idr/spB": {
           "value": 0.9
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/sync": {
           "value": 0.0
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.5
          },
          "idr/lfodiv": {
           "value": 1.0
          },
          "idr/freezediv": {
           "value": 0.5
          },
          "idr/tapcount": {
           "value": 9.0
          },
          "idr/basems": {
           "value": 180.0
          },
          "idr/mode": {
           "value": 7.0
          },
          "idr/A": {
           "value": 2.0
          },
          "idr/B": {
           "value": 2.5
          },
          "idr/fbk": {
           "value": 0.7
          },
          "idr/lopass": {
           "value": 3800.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/freezelen": {
           "value": 300.0
          },
          "idr/lforate": {
           "value": 3.5
          },
          "idr/lfomode": {
           "value": 7.0
          },
          "idr/lfoA": {
           "value": 2.0
          },
          "idr/lfoB": {
           "value": 3.0
          },
          "idr/lfodepth": {
           "value": 0.4
          },
          "idr/lfoshape": {
           "value": 1.0
          },
          "idr/morph": {
           "value": 0.55
          },
          "idr/gateon": {
           "value": 0.0
          },
          "idr/gatediv": {
           "value": 0.25
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "idr/gateduty": {
           "value": 0.5
          },
          "idr/crushbits": {
           "value": 6.0
          },
          "idr/downsamp": {
           "value": 10.0
          },
          "idr/evolve": {
           "value": 0.1
          },
          "idr/evolverate": {
           "value": 0.1
          },
          "idr/width": {
           "value": 1.0
          },
          "idr/panmode": {
           "value": 7.0
          },
          "idr/panA": {
           "value": 0.9
          },
          "idr/panB": {
           "value": 0.5
          },
          "idr/mix": {
           "value": 0.9
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/diffusion": {
           "value": 0.2
          },
          "idr/tapsync": {
           "value": 0.0
          },
          "idr/lfosync": {
           "value": 0.0
          },
          "idr/freezesync": {
           "value": 0.0
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/reroll": {
           "value": 0.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
         },
         "fileref": {
          "name": "Pavement",
          "filename": "Pavement.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "5a0524732ba44e626f5a9239e4c87a55"
         }
        },
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "Vigil",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/cloud": {
           "value": 0.2
          },
          "idr/playspeed": {
           "value": 0.5
          },
          "idr/spmode": {
           "value": 6.0
          },
          "idr/spA": {
           "value": 0.98
          },
          "idr/spB": {
           "value": 1.02
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/sync": {
           "value": 0.0
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.5
          },
          "idr/lfodiv": {
           "value": 1.0
          },
          "idr/freezediv": {
           "value": 1.0
          },
          "idr/tapcount": {
           "value": 12.0
          },
          "idr/basems": {
           "value": 900.0
          },
          "idr/mode": {
           "value": 4.0
          },
          "idr/A": {
           "value": 1.0
          },
          "idr/B": {
           "value": 0.5
          },
          "idr/fbk": {
           "value": 1.0
          },
          "idr/lopass": {
           "value": 3200.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/freezelen": {
           "value": 2000.0
          },
          "idr/lforate": {
           "value": 0.04
          },
          "idr/lfomode": {
           "value": 6.0
          },
          "idr/lfoA": {
           "value": 0.5
          },
          "idr/lfoB": {
           "value": 1.5
          },
          "idr/lfodepth": {
           "value": 0.2
          },
          "idr/lfoshape": {
           "value": 0.0
          },
          "idr/morph": {
           "value": 0.0
          },
          "idr/gateon": {
           "value": 0.0
          },
          "idr/gatediv": {
           "value": 0.25
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "idr/gateduty": {
           "value": 0.5
          },
          "idr/crushbits": {
           "value": 16.0
          },
          "idr/downsamp": {
           "value": 1.0
          },
          "idr/evolve": {
           "value": 0.65
          },
          "idr/evolverate": {
           "value": 0.015
          },
          "idr/width": {
           "value": 1.0
          },
          "idr/panmode": {
           "value": 6.0
          },
          "idr/panA": {
           "value": -1.0
          },
          "idr/panB": {
           "value": 1.0
          },
          "idr/mix": {
           "value": 0.85
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/diffusion": {
           "value": 0.85
          },
          "idr/tapsync": {
           "value": 1.0
          },
          "idr/lfosync": {
           "value": 1.0
          },
          "idr/freezesync": {
           "value": 1.0
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/reroll": {
           "value": 0.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
         },
         "fileref": {
          "name": "Vigil",
          "filename": "Vigil.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "670a9d77746e2de3ae6dad2b828f3bf8"
         }
        },
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "Harmonic Shadows",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/cloud": {
           "value": 0.3
          },
          "idr/playspeed": {
           "value": 1.0
          },
          "idr/spmode": {
           "value": 4.0
          },
          "idr/spA": {
           "value": 1.0
          },
          "idr/spB": {
           "value": 1.0
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/sync": {
           "value": 0.0
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.5
          },
          "idr/lfodiv": {
           "value": 1.0
          },
          "idr/freezediv": {
           "value": 1.0
          },
          "idr/tapcount": {
           "value": 10.0
          },
          "idr/basems": {
           "value": 140.0
          },
          "idr/mode": {
           "value": 4.0
          },
          "idr/A": {
           "value": 1.0
          },
          "idr/B": {
           "value": 1.0
          },
          "idr/fbk": {
           "value": 0.62
          },
          "idr/lopass": {
           "value": 6500.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/freezelen": {
           "value": 2000.0
          },
          "idr/lforate": {
           "value": 0.15
          },
          "idr/lfomode": {
           "value": 6.0
          },
          "idr/lfoA": {
           "value": 1.0
          },
          "idr/lfoB": {
           "value": 2.0
          },
          "idr/lfodepth": {
           "value": 0.15
          },
          "idr/lfoshape": {
           "value": 0.0
          },
          "idr/morph": {
           "value": 0.0
          },
          "idr/gateon": {
           "value": 0.0
          },
          "idr/gatediv": {
           "value": 0.25
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "idr/gateduty": {
           "value": 0.5
          },
          "idr/crushbits": {
           "value": 16.0
          },
          "idr/downsamp": {
           "value": 1.0
          },
          "idr/evolve": {
           "value": 0.2
          },
          "idr/evolverate": {
           "value": 0.03
          },
          "idr/width": {
           "value": 1.0
          },
          "idr/panmode": {
           "value": 6.0
          },
          "idr/panA": {
           "value": -1.0
          },
          "idr/panB": {
           "value": 1.0
          },
          "idr/mix": {
           "value": 0.4
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/diffusion": {
           "value": 0.4
          },
          "idr/tapsync": {
           "value": 1.0
          },
          "idr/lfosync": {
           "value": 1.0
          },
          "idr/freezesync": {
           "value": 1.0
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/reroll": {
           "value": 0.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
         },
         "fileref": {
          "name": "Harmonic Shadows",
          "filename": "Harmonic Shadows.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "37014565a4812e05e621219d0e6c8521"
         }
        },
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "Vocal Halo",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/cloud": {
           "value": 0.5
          },
          "idr/playspeed": {
           "value": 1.0
          },
          "idr/spmode": {
           "value": 4.0
          },
          "idr/spA": {
           "value": 0.5
          },
          "idr/spB": {
           "value": 1.0
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/sync": {
           "value": 0.0
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.5
          },
          "idr/lfodiv": {
           "value": 1.0
          },
          "idr/freezediv": {
           "value": 1.0
          },
          "idr/tapcount": {
           "value": 10.0
          },
          "idr/basems": {
           "value": 320.0
          },
          "idr/mode": {
           "value": 6.0
          },
          "idr/A": {
           "value": 1.0
          },
          "idr/B": {
           "value": 8.0
          },
          "idr/fbk": {
           "value": 0.7
          },
          "idr/lopass": {
           "value": 5000.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/freezelen": {
           "value": 2000.0
          },
          "idr/lforate": {
           "value": 0.1
          },
          "idr/lfomode": {
           "value": 6.0
          },
          "idr/lfoA": {
           "value": 0.5
          },
          "idr/lfoB": {
           "value": 2.0
          },
          "idr/lfodepth": {
           "value": 0.25
          },
          "idr/lfoshape": {
           "value": 0.0
          },
          "idr/morph": {
           "value": 0.0
          },
          "idr/gateon": {
           "value": 0.0
          },
          "idr/gatediv": {
           "value": 0.25
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "idr/gateduty": {
           "value": 0.5
          },
          "idr/crushbits": {
           "value": 16.0
          },
          "idr/downsamp": {
           "value": 1.0
          },
          "idr/evolve": {
           "value": 0.3
          },
          "idr/evolverate": {
           "value": 0.04
          },
          "idr/width": {
           "value": 1.0
          },
          "idr/panmode": {
           "value": 7.0
          },
          "idr/panA": {
           "value": 0.8
          },
          "idr/panB": {
           "value": 0.5
          },
          "idr/mix": {
           "value": 0.5
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/diffusion": {
           "value": 0.6
          },
          "idr/tapsync": {
           "value": 1.0
          },
          "idr/lfosync": {
           "value": 1.0
          },
          "idr/freezesync": {
           "value": 1.0
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/reroll": {
           "value": 0.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
         },
         "fileref": {
          "name": "Vocal Halo",
          "filename": "Vocal Halo.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "5b0a054d526b1730a0412d9230259a75"
         }
        }
       ]
      }
     },
     "text": "rnbo~",
     "varname": "rnbo~"
    }
   },
   {
    "box": {
     "id": "exp_hdr",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      130.0,
      1150.0,
      20.0
     ],
     "text": "IDIORRITMOS FACTORY BANK \u2014 4 Personas + 4 Scenes + 2 Sources. Path-prefixed for rnbo~ (varname 'idr'). CAPTURE ORDER = preset menu order: click row -> rnbo~ sidebar -> save snapshot with the row's name."
    }
   },
   {
    "box": {
     "id": "explbl_thedrummer",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      167.0,
      150.0,
      20.0
     ],
     "text": "Percutiendo"
    }
   },
   {
    "box": {
     "id": "expmsg_thedrummer",
     "linecount": 4,
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180.0,
      160.0,
      1052.0,
      62.0
     ],
     "text": "idr/cloud 0, idr/playspeed 1, idr/spmode 6, idr/spA 0.9, idr/spB 1.4, idr/cloudhold 0, idr/sync 1, idr/bpm 120, idr/tapdiv 0.5, idr/lfodiv 1, idr/freezediv 1, idr/tapcount 8, idr/basems 150, idr/mode 3, idr/A 1, idr/B 1, idr/fbk 0.7, idr/lopass 9000, idr/freeze 0, idr/freezelen 500, idr/lforate 0.1, idr/lfomode 6, idr/lfoA 1, idr/lfoB 2, idr/lfodepth 0, idr/lfoshape 0, idr/morph 0, idr/gateon 1, idr/gatediv 0.25, idr/gatedepth 1, idr/gateduty 0.45, idr/crushbits 16, idr/downsamp 1, idr/evolve 0, idr/evolverate 0.03, idr/width 0.7, idr/panmode 6, idr/panA -0.6, idr/panB 0.6, idr/mix 0.9, idr/outgain 1, idr/diffusion 0.1, idr/tapsync 1, idr/lfosync 1, idr/freezesync 1"
    }
   },
   {
    "box": {
     "id": "explbl_thedancer",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      211.0,
      150.0,
      20.0
     ],
     "text": "Bailando"
    }
   },
   {
    "box": {
     "id": "expmsg_thedancer",
     "linecount": 4,
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180.0,
      242.0,
      1050.0,
      62.0
     ],
     "text": "idr/cloud 0.4, idr/playspeed 1, idr/spmode 7, idr/spA 0.06, idr/spB 1, idr/cloudhold 0, idr/sync 0, idr/bpm 120, idr/tapdiv 0.5, idr/lfodiv 1, idr/freezediv 1, idr/tapcount 12, idr/basems 420, idr/mode 6, idr/A 1, idr/B 8, idr/fbk 1, idr/lopass 4500, idr/freeze 0, idr/freezelen 2000, idr/lforate 0.12, idr/lfomode 6, idr/lfoA 0.5, idr/lfoB 2, idr/lfodepth 0.3, idr/lfoshape 0, idr/morph 0, idr/gateon 0, idr/gatediv 0.25, idr/gatedepth 1, idr/gateduty 0.5, idr/crushbits 16, idr/downsamp 1, idr/evolve 0.5, idr/evolverate 0.03, idr/width 1, idr/panmode 6, idr/panA -1, idr/panB 1, idr/mix 0.9, idr/outgain 1, idr/diffusion 0.75, idr/tapsync 1, idr/lfosync 1, idr/freezesync 1"
    }
   },
   {
    "box": {
     "id": "explbl_thetalker",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      255.0,
      150.0,
      20.0
     ],
     "text": "Hablando"
    }
   },
   {
    "box": {
     "id": "expmsg_thetalker",
     "linecount": 4,
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180.0,
      322.0,
      1050.0,
      62.0
     ],
     "text": "idr/cloud 0.25, idr/playspeed 1, idr/spmode 7, idr/spA 0.5, idr/spB 1, idr/cloudhold 0, idr/sync 0, idr/bpm 120, idr/tapdiv 0.5, idr/lfodiv 1, idr/freezediv 1, idr/tapcount 7, idr/basems 130, idr/mode 7, idr/A 2.5, idr/B 3, idr/fbk 0.55, idr/lopass 6500, idr/freeze 0, idr/freezelen 800, idr/lforate 2.8, idr/lfomode 7, idr/lfoA 1.5, idr/lfoB 2, idr/lfodepth 0.3, idr/lfoshape 1, idr/morph 0, idr/gateon 0, idr/gatediv 0.25, idr/gatedepth 1, idr/gateduty 0.5, idr/crushbits 16, idr/downsamp 1, idr/evolve 0.15, idr/evolverate 0.08, idr/width 1, idr/panmode 7, idr/panA 0.7, idr/panB 0.5, idr/mix 0.9, idr/outgain 1, idr/diffusion 0.15, idr/tapsync 0, idr/lfosync 0, idr/freezesync 0"
    }
   },
   {
    "box": {
     "id": "explbl_theskater",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      299.0,
      150.0,
      20.0
     ],
     "text": "Patinando"
    }
   },
   {
    "box": {
     "id": "expmsg_theskater",
     "linecount": 4,
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180.0,
      410.0,
      1050.0,
      62.0
     ],
     "text": "idr/cloud 0.15, idr/playspeed 1.3, idr/spmode 6, idr/spA 0.9, idr/spB 1.6, idr/cloudhold 0, idr/sync 1, idr/bpm 120, idr/tapdiv 0.5, idr/lfodiv 1, idr/freezediv 0.5, idr/tapcount 10, idr/basems 240, idr/mode 1, idr/A -1.2, idr/B 2, idr/fbk 0.88, idr/lopass 5500, idr/freeze 0, idr/freezelen 220, idr/lforate 0.4, idr/lfomode 6, idr/lfoA 1, idr/lfoB 2, idr/lfodepth 0.12, idr/lfoshape 0, idr/morph 0.4, idr/gateon 0, idr/gatediv 0.25, idr/gatedepth 1, idr/gateduty 0.5, idr/crushbits 8, idr/downsamp 6, idr/evolve 0, idr/evolverate 0.03, idr/width 1, idr/panmode 6, idr/panA -1, idr/panB 1, idr/mix 0.9, idr/outgain 1, idr/diffusion 0.3, idr/tapsync 1, idr/lfosync 1, idr/freezesync 1"
    }
   },
   {
    "box": {
     "id": "explbl_murmur",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      343.0,
      150.0,
      20.0
     ],
     "text": "Murmur"
    }
   },
   {
    "box": {
     "id": "expmsg_murmur",
     "linecount": 4,
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180.0,
      487.0,
      1050.0,
      62.0
     ],
     "text": "idr/cloud 0.7, idr/playspeed 1, idr/spmode 7, idr/spA 0.35, idr/spB 1, idr/cloudhold 0, idr/sync 0, idr/bpm 120, idr/tapdiv 0.5, idr/lfodiv 1, idr/freezediv 1, idr/tapcount 10, idr/basems 300, idr/mode 7, idr/A 1.5, idr/B 2.5, idr/fbk 0.8, idr/lopass 5000, idr/freeze 0, idr/freezelen 1500, idr/lforate 0.5, idr/lfomode 7, idr/lfoA 1, idr/lfoB 2, idr/lfodepth 0.2, idr/lfoshape 1, idr/morph 0, idr/gateon 0, idr/gatediv 0.25, idr/gatedepth 1, idr/gateduty 0.5, idr/crushbits 16, idr/downsamp 1, idr/evolve 0.3, idr/evolverate 0.05, idr/width 1, idr/panmode 7, idr/panA 0.6, idr/panB 0.5, idr/mix 0.9, idr/outgain 1, idr/diffusion 0.55, idr/tapsync 0, idr/lfosync 0, idr/freezesync 0"
    }
   },
   {
    "box": {
     "id": "explbl_stutterstep",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      387.0,
      150.0,
      20.0
     ],
     "text": "Stutter Step"
    }
   },
   {
    "box": {
     "id": "expmsg_stutterstep",
     "linecount": 4,
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180.0,
      563.0,
      1050.0,
      62.0
     ],
     "text": "idr/cloud 0, idr/playspeed 1, idr/spmode 6, idr/spA 0.9, idr/spB 1.4, idr/cloudhold 0, idr/sync 1, idr/bpm 120, idr/tapdiv 0.25, idr/lfodiv 0.5, idr/freezediv 0.25, idr/tapcount 6, idr/basems 120, idr/mode 3, idr/A 1, idr/B 1, idr/fbk 0.75, idr/lopass 7000, idr/freeze 0, idr/freezelen 140, idr/lforate 0.2, idr/lfomode 6, idr/lfoA 1, idr/lfoB 2, idr/lfodepth 0.05, idr/lfoshape 1, idr/morph 0.25, idr/gateon 1, idr/gatediv 0.125, idr/gatedepth 1, idr/gateduty 0.35, idr/crushbits 12, idr/downsamp 2, idr/evolve 0, idr/evolverate 0.03, idr/width 0.8, idr/panmode 6, idr/panA -0.7, idr/panB 0.7, idr/mix 0.95, idr/outgain 1, idr/diffusion 0.05, idr/tapsync 1, idr/lfosync 1, idr/freezesync 1"
    }
   },
   {
    "box": {
     "id": "explbl_pavement",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      431.0,
      150.0,
      20.0
     ],
     "text": "Pavement"
    }
   },
   {
    "box": {
     "id": "expmsg_pavement",
     "linecount": 4,
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180.0,
      650.0,
      1051.0,
      62.0
     ],
     "text": "idr/cloud 0.3, idr/playspeed 0.8, idr/spmode 7, idr/spA 0.6, idr/spB 0.9, idr/cloudhold 0, idr/sync 0, idr/bpm 120, idr/tapdiv 0.5, idr/lfodiv 1, idr/freezediv 0.5, idr/tapcount 9, idr/basems 180, idr/mode 7, idr/A 2, idr/B 2.5, idr/fbk 0.7, idr/lopass 3800, idr/freeze 0, idr/freezelen 300, idr/lforate 3.5, idr/lfomode 7, idr/lfoA 2, idr/lfoB 3, idr/lfodepth 0.4, idr/lfoshape 1, idr/morph 0.55, idr/gateon 0, idr/gatediv 0.25, idr/gatedepth 1, idr/gateduty 0.5, idr/crushbits 6, idr/downsamp 10, idr/evolve 0.1, idr/evolverate 0.1, idr/width 1, idr/panmode 7, idr/panA 0.9, idr/panB 0.5, idr/mix 0.9, idr/outgain 1, idr/diffusion 0.2, idr/tapsync 0, idr/lfosync 0, idr/freezesync 0"
    }
   },
   {
    "box": {
     "id": "explbl_vigil",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      475.0,
      150.0,
      20.0
     ],
     "text": "Vigil"
    }
   },
   {
    "box": {
     "id": "expmsg_vigil",
     "linecount": 4,
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180.0,
      724.0,
      1052.0,
      62.0
     ],
     "text": "idr/cloud 0.2, idr/playspeed 0.5, idr/spmode 6, idr/spA 0.98, idr/spB 1.02, idr/cloudhold 0, idr/sync 0, idr/bpm 120, idr/tapdiv 0.5, idr/lfodiv 1, idr/freezediv 1, idr/tapcount 12, idr/basems 900, idr/mode 4, idr/A 1, idr/B 0.5, idr/fbk 1, idr/lopass 3200, idr/freeze 0, idr/freezelen 2000, idr/lforate 0.04, idr/lfomode 6, idr/lfoA 0.5, idr/lfoB 1.5, idr/lfodepth 0.2, idr/lfoshape 0, idr/morph 0, idr/gateon 0, idr/gatediv 0.25, idr/gatedepth 1, idr/gateduty 0.5, idr/crushbits 16, idr/downsamp 1, idr/evolve 0.65, idr/evolverate 0.015, idr/width 1, idr/panmode 6, idr/panA -1, idr/panB 1, idr/mix 0.85, idr/outgain 1, idr/diffusion 0.85, idr/tapsync 1, idr/lfosync 1, idr/freezesync 1"
    }
   },
   {
    "box": {
     "id": "exp_steps",
     "linecount": 2,
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20.0,
      739.0,
      1150.0,
      33.0
     ],
     "text": "EXPORT: 1) double-click gen~ inside rnbo~ and confirm the codebox shows 'Param diffusion' (v1.3). 2) click each row top-to-bottom, saving a named snapshot after each. 3) Export Audio Plugin: name IDIORRITMOS, unique 4-char codes, Effect, VST3+AU, INCLUDE PRESETS checked."
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "destination": [
      "obj-1",
      0
     ],
     "source": [
      "expmsg_murmur",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-1",
      0
     ],
     "source": [
      "expmsg_pavement",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-1",
      0
     ],
     "source": [
      "expmsg_stutterstep",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-1",
      0
     ],
     "source": [
      "expmsg_thedancer",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-1",
      0
     ],
     "source": [
      "expmsg_thedrummer",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-1",
      0
     ],
     "source": [
      "expmsg_theskater",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-1",
      0
     ],
     "source": [
      "expmsg_thetalker",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-1",
      0
     ],
     "source": [
      "expmsg_vigil",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-4",
      1
     ],
     "source": [
      "obj-1",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-4",
      0
     ],
     "source": [
      "obj-1",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-1",
      1
     ],
     "source": [
      "obj-3",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-1",
      0
     ],
     "source": [
      "obj-3",
      0
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-6",
      1
     ],
     "source": [
      "obj-4",
      1
     ]
    }
   },
   {
    "patchline": {
     "destination": [
      "obj-6",
      0
     ],
     "source": [
      "obj-4",
      0
     ]
    }
   }
  ],
  "parameters": {
   "obj-1": [
    "rnbo~",
    "rnbo~",
    0
   ],
   "obj-4": [
    "live.gain~",
    "live.gain~",
    0
   ],
   "parameterbanks": {
    "0": {
     "index": 0,
     "name": "",
     "parameters": [
      "-",
      "-",
      "-",
      "-",
      "-",
      "-",
      "-",
      "-"
     ],
     "buttons": [
      "-",
      "-",
      "-",
      "-",
      "-",
      "-",
      "-",
      "-"
     ]
    }
   },
   "inherited_shortname": 1
  },
  "autosave": 0,
  "snapshot": {
   "filetype": "C74Snapshot",
   "version": 2,
   "minorversion": 0,
   "name": "snapshotlist",
   "origin": "jpatcher",
   "type": "list",
   "subtype": "Undefined",
   "embed": 1,
   "snapshot": {
    "valuedictionary": {
     "parameter_values": {
      "blob": {
       "rnbo~": [
        {
         "filetype": "C74Snapshot",
         "version": 2,
         "minorversion": 0,
         "name": "untitled",
         "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
         "type": "rnbo",
         "subtype": "",
         "embed": 1,
         "snapshot": {
          "idr/evolve": {
           "value": 0.65
          },
          "idr/gateduty": {
           "value": 0.5
          },
          "idr/lfoshape": {
           "value": 0.0
          },
          "idr/lfodepth": {
           "value": 0.2
          },
          "idr/lfomode": {
           "value": 6.0
          },
          "idr/lfoB": {
           "value": 1.5
          },
          "idr/reroll": {
           "value": 0.0
          },
          "idr/panB": {
           "value": 1.0
          },
          "idr/lfoA": {
           "value": 0.5
          },
          "idr/playspeed": {
           "value": 0.5
          },
          "idr/width": {
           "value": 1.0
          },
          "idr/lforate": {
           "value": 0.04
          },
          "idr/panic": {
           "value": 0.0
          },
          "idr/outgain": {
           "value": 1.0
          },
          "idr/freeze": {
           "value": 0.0
          },
          "idr/diffusion": {
           "value": 0.85
          },
          "idr/gatediv": {
           "value": 0.25
          },
          "idr/lfodiv": {
           "value": 1.0
          },
          "idr/lopass": {
           "value": 3200.0
          },
          "idr/freezelen": {
           "value": 2000.0
          },
          "idr/A": {
           "value": 1.0
          },
          "idr/B": {
           "value": 0.5
          },
          "idr/tapcount": {
           "value": 12.0
          },
          "idr/mix": {
           "value": 0.85
          },
          "idr/morph": {
           "value": 0.0
          },
          "idr/mode": {
           "value": 4.0
          },
          "idr/panA": {
           "value": -1.0
          },
          "idr/freezediv": {
           "value": 1.0
          },
          "idr/freezesync": {
           "value": 1.0
          },
          "idr/cloud": {
           "value": 0.2
          },
          "idr/lfosync": {
           "value": 1.0
          },
          "idr/evolverate": {
           "value": 0.015
          },
          "idr/crushbits": {
           "value": 16.0
          },
          "idr/tapsync": {
           "value": 1.0
          },
          "idr/spmode": {
           "value": 6.0
          },
          "idr/spA": {
           "value": 0.98
          },
          "idr/bpm": {
           "value": 120.0
          },
          "idr/tapdiv": {
           "value": 0.5
          },
          "idr/sync": {
           "value": 0.0
          },
          "idr/cloudhold": {
           "value": 0.0
          },
          "idr/gatedepth": {
           "value": 1.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
          "idr/gateon": {
           "value": 0.0
          },
          "idr/spB": {
           "value": 1.02
          },
          "idr/downsamp": {
           "value": 1.0
          },
          "idr/fbk": {
           "value": 1.0
          },
          "idr/panmode": {
           "value": 6.0
          },
          "idr/basems": {
           "value": 900.0
          }
         }
        }
       ]
      }
     }
    }
   },
   "snapshotlist": {
    "current_snapshot": 7,
    "entries": [
     {
      "filetype": "C74Snapshot",
      "version": 2,
      "minorversion": 0,
      "name": "The Drummer",
      "origin": "export_mc_textures_FIXED",
      "type": "patcher",
      "subtype": "Undefined",
      "embed": 1,
      "snapshot": {
       "valuedictionary": {
        "parameter_values": {
         "blob": {
          "rnbo~": [
           {
            "filetype": "C74Snapshot",
            "version": 2,
            "minorversion": 0,
            "name": "untitled",
            "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
            "type": "rnbo",
            "subtype": "",
            "embed": 1,
            "snapshot": {
             "idr/evolve": {
              "value": 0.0
             },
             "idr/gateduty": {
              "value": 0.45
             },
             "idr/lfoshape": {
              "value": 0.0
             },
             "idr/lfodepth": {
              "value": 0.0
             },
             "idr/lfomode": {
              "value": 6.0
             },
             "idr/lfoB": {
              "value": 2.0
             },
             "idr/reroll": {
              "value": 0.0
             },
             "idr/panB": {
              "value": 0.6
             },
             "idr/lfoA": {
              "value": 1.0
             },
             "idr/playspeed": {
              "value": 1.0
             },
             "idr/width": {
              "value": 0.7
             },
             "idr/lforate": {
              "value": 0.1
             },
             "idr/panic": {
              "value": 0.0
             },
             "idr/outgain": {
              "value": 1.0
             },
             "idr/freeze": {
              "value": 0.0
             },
             "idr/diffusion": {
              "value": 0.1
             },
             "idr/gatediv": {
              "value": 0.25
             },
             "idr/lfodiv": {
              "value": 1.0
             },
             "idr/lopass": {
              "value": 9000.0
             },
             "idr/freezelen": {
              "value": 500.0
             },
             "idr/A": {
              "value": 1.0
             },
             "idr/B": {
              "value": 1.0
             },
             "idr/tapcount": {
              "value": 8.0
             },
             "idr/mix": {
              "value": 0.9
             },
             "idr/morph": {
              "value": 0.0
             },
             "idr/mode": {
              "value": 3.0
             },
             "idr/panA": {
              "value": -0.6
             },
             "idr/freezediv": {
              "value": 1.0
             },
             "idr/freezesync": {
              "value": 1.0
             },
             "idr/cloud": {
              "value": 0.0
             },
             "idr/lfosync": {
              "value": 1.0
             },
             "idr/evolverate": {
              "value": 0.03
             },
             "idr/crushbits": {
              "value": 16.0
             },
             "idr/tapsync": {
              "value": 1.0
             },
             "idr/spmode": {
              "value": 6.0
             },
             "idr/spA": {
              "value": 0.9
             },
             "idr/bpm": {
              "value": 120.0
             },
             "idr/tapdiv": {
              "value": 0.5
             },
             "idr/sync": {
              "value": 1.0
             },
             "idr/cloudhold": {
              "value": 0.0
             },
             "idr/gatedepth": {
              "value": 1.0
             },
             "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
             "idr/gateon": {
              "value": 1.0
             },
             "idr/spB": {
              "value": 1.4
             },
             "idr/downsamp": {
              "value": 1.0
             },
             "idr/fbk": {
              "value": 0.7
             },
             "idr/panmode": {
              "value": 6.0
             },
             "idr/basems": {
              "value": 150.0
             }
            }
           }
          ]
         }
        }
       }
      },
      "fileref": {
       "name": "export_mc_textures_FIXED",
       "filename": "export_mc_textures_FIXED.maxsnap",
       "filepath": "~/Documents/Max 9/Snapshots",
       "filepos": -1,
       "snapshotfileid": "997fab3345eca44d7ab180ed5010e16c"
      }
     },
     {
      "filetype": "C74Snapshot",
      "version": 2,
      "minorversion": 0,
      "name": "The Dancer",
      "origin": "export_mc_textures_FIXED",
      "type": "patcher",
      "subtype": "Undefined",
      "embed": 1,
      "snapshot": {
       "valuedictionary": {
        "parameter_values": {
         "blob": {
          "rnbo~": [
           {
            "filetype": "C74Snapshot",
            "version": 2,
            "minorversion": 0,
            "name": "untitled",
            "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
            "type": "rnbo",
            "subtype": "",
            "embed": 1,
            "snapshot": {
             "idr/evolve": {
              "value": 0.5
             },
             "idr/gateduty": {
              "value": 0.5
             },
             "idr/lfoshape": {
              "value": 0.0
             },
             "idr/lfodepth": {
              "value": 0.3
             },
             "idr/lfomode": {
              "value": 6.0
             },
             "idr/lfoB": {
              "value": 2.0
             },
             "idr/reroll": {
              "value": 0.0
             },
             "idr/panB": {
              "value": 1.0
             },
             "idr/lfoA": {
              "value": 0.5
             },
             "idr/playspeed": {
              "value": 1.0
             },
             "idr/width": {
              "value": 1.0
             },
             "idr/lforate": {
              "value": 0.12
             },
             "idr/panic": {
              "value": 0.0
             },
             "idr/outgain": {
              "value": 1.0
             },
             "idr/freeze": {
              "value": 0.0
             },
             "idr/diffusion": {
              "value": 0.75
             },
             "idr/gatediv": {
              "value": 0.25
             },
             "idr/lfodiv": {
              "value": 1.0
             },
             "idr/lopass": {
              "value": 4500.0
             },
             "idr/freezelen": {
              "value": 2000.0
             },
             "idr/A": {
              "value": 1.0
             },
             "idr/B": {
              "value": 8.0
             },
             "idr/tapcount": {
              "value": 12.0
             },
             "idr/mix": {
              "value": 0.9
             },
             "idr/morph": {
              "value": 0.0
             },
             "idr/mode": {
              "value": 6.0
             },
             "idr/panA": {
              "value": -1.0
             },
             "idr/freezediv": {
              "value": 1.0
             },
             "idr/freezesync": {
              "value": 1.0
             },
             "idr/cloud": {
              "value": 0.4
             },
             "idr/lfosync": {
              "value": 1.0
             },
             "idr/evolverate": {
              "value": 0.03
             },
             "idr/crushbits": {
              "value": 16.0
             },
             "idr/tapsync": {
              "value": 1.0
             },
             "idr/spmode": {
              "value": 7.0
             },
             "idr/spA": {
              "value": 0.06
             },
             "idr/bpm": {
              "value": 120.0
             },
             "idr/tapdiv": {
              "value": 0.5
             },
             "idr/sync": {
              "value": 0.0
             },
             "idr/cloudhold": {
              "value": 0.0
             },
             "idr/gatedepth": {
              "value": 1.0
             },
             "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
             "idr/gateon": {
              "value": 0.0
             },
             "idr/spB": {
              "value": 1.0
             },
             "idr/downsamp": {
              "value": 1.0
             },
             "idr/fbk": {
              "value": 1.0
             },
             "idr/panmode": {
              "value": 6.0
             },
             "idr/basems": {
              "value": 420.0
             }
            }
           }
          ]
         }
        }
       }
      },
      "fileref": {
       "name": "The Drummer[1]",
       "filename": "The Drummer[1].maxsnap",
       "filepath": "~/Documents/Max 9/Snapshots",
       "filepos": -1,
       "snapshotfileid": "c9eeb385de5a47444303a4adb1b24c77"
      }
     },
     {
      "filetype": "C74Snapshot",
      "version": 2,
      "minorversion": 0,
      "name": "The Talker",
      "origin": "export_mc_textures_FIXED",
      "type": "patcher",
      "subtype": "Undefined",
      "embed": 1,
      "snapshot": {
       "valuedictionary": {
        "parameter_values": {
         "blob": {
          "rnbo~": [
           {
            "filetype": "C74Snapshot",
            "version": 2,
            "minorversion": 0,
            "name": "untitled",
            "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
            "type": "rnbo",
            "subtype": "",
            "embed": 1,
            "snapshot": {
             "idr/evolve": {
              "value": 0.15
             },
             "idr/gateduty": {
              "value": 0.5
             },
             "idr/lfoshape": {
              "value": 1.0
             },
             "idr/lfodepth": {
              "value": 0.3
             },
             "idr/lfomode": {
              "value": 7.0
             },
             "idr/lfoB": {
              "value": 2.0
             },
             "idr/reroll": {
              "value": 0.0
             },
             "idr/panB": {
              "value": 0.5
             },
             "idr/lfoA": {
              "value": 1.5
             },
             "idr/playspeed": {
              "value": 1.0
             },
             "idr/width": {
              "value": 1.0
             },
             "idr/lforate": {
              "value": 2.8
             },
             "idr/panic": {
              "value": 0.0
             },
             "idr/outgain": {
              "value": 1.0
             },
             "idr/freeze": {
              "value": 0.0
             },
             "idr/diffusion": {
              "value": 0.15
             },
             "idr/gatediv": {
              "value": 0.25
             },
             "idr/lfodiv": {
              "value": 1.0
             },
             "idr/lopass": {
              "value": 6500.0
             },
             "idr/freezelen": {
              "value": 800.0
             },
             "idr/A": {
              "value": 2.5
             },
             "idr/B": {
              "value": 3.0
             },
             "idr/tapcount": {
              "value": 7.0
             },
             "idr/mix": {
              "value": 0.9
             },
             "idr/morph": {
              "value": 0.0
             },
             "idr/mode": {
              "value": 7.0
             },
             "idr/panA": {
              "value": 0.7
             },
             "idr/freezediv": {
              "value": 1.0
             },
             "idr/freezesync": {
              "value": 0.0
             },
             "idr/cloud": {
              "value": 0.25
             },
             "idr/lfosync": {
              "value": 0.0
             },
             "idr/evolverate": {
              "value": 0.08
             },
             "idr/crushbits": {
              "value": 16.0
             },
             "idr/tapsync": {
              "value": 0.0
             },
             "idr/spmode": {
              "value": 7.0
             },
             "idr/spA": {
              "value": 0.5
             },
             "idr/bpm": {
              "value": 120.0
             },
             "idr/tapdiv": {
              "value": 0.5
             },
             "idr/sync": {
              "value": 0.0
             },
             "idr/cloudhold": {
              "value": 0.0
             },
             "idr/gatedepth": {
              "value": 1.0
             },
             "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
             "idr/gateon": {
              "value": 0.0
             },
             "idr/spB": {
              "value": 1.0
             },
             "idr/downsamp": {
              "value": 1.0
             },
             "idr/fbk": {
              "value": 0.55
             },
             "idr/panmode": {
              "value": 7.0
             },
             "idr/basems": {
              "value": 130.0
             }
            }
           }
          ]
         }
        }
       }
      },
      "fileref": {
       "name": "The Dancer[1]",
       "filename": "The Dancer[1].maxsnap",
       "filepath": "~/Documents/Max 9/Snapshots",
       "filepos": -1,
       "snapshotfileid": "f8a63a731162c22e5a6aad0e05c88183"
      }
     },
     {
      "filetype": "C74Snapshot",
      "version": 2,
      "minorversion": 0,
      "name": "The Skater",
      "origin": "export_mc_textures_FIXED",
      "type": "patcher",
      "subtype": "Undefined",
      "embed": 1,
      "fileref": {
       "name": "The Talker[1]",
       "filename": "The Talker[1].maxsnap",
       "filepath": "~/Documents/Max 9/Snapshots",
       "filepos": -1,
       "snapshotfileid": "2b0b7e2cdeea39a02565a7349d595c7b"
      },
      "snapshot": {
       "valuedictionary": {
        "parameter_values": {
         "blob": {
          "rnbo~": [
           {
            "filetype": "C74Snapshot",
            "version": 2,
            "minorversion": 0,
            "name": "untitled",
            "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
            "type": "rnbo",
            "subtype": "",
            "embed": 1,
            "snapshot": {
             "idr/evolve": {
              "value": 0.0
             },
             "idr/gateduty": {
              "value": 0.5
             },
             "idr/lfoshape": {
              "value": 0.0
             },
             "idr/lfodepth": {
              "value": 0.12
             },
             "idr/lfomode": {
              "value": 6.0
             },
             "idr/lfoB": {
              "value": 2.0
             },
             "idr/reroll": {
              "value": 0.0
             },
             "idr/panB": {
              "value": 1.0
             },
             "idr/lfoA": {
              "value": 1.0
             },
             "idr/playspeed": {
              "value": 1.3
             },
             "idr/width": {
              "value": 1.0
             },
             "idr/lforate": {
              "value": 0.4
             },
             "idr/panic": {
              "value": 0.0
             },
             "idr/outgain": {
              "value": 1.0
             },
             "idr/freeze": {
              "value": 0.0
             },
             "idr/diffusion": {
              "value": 0.3
             },
             "idr/gatediv": {
              "value": 0.25
             },
             "idr/lfodiv": {
              "value": 1.0
             },
             "idr/lopass": {
              "value": 5500.0
             },
             "idr/freezelen": {
              "value": 220.0
             },
             "idr/A": {
              "value": -1.2
             },
             "idr/B": {
              "value": 2.0
             },
             "idr/tapcount": {
              "value": 10.0
             },
             "idr/mix": {
              "value": 0.9
             },
             "idr/morph": {
              "value": 0.4
             },
             "idr/mode": {
              "value": 1.0
             },
             "idr/panA": {
              "value": -1.0
             },
             "idr/freezediv": {
              "value": 0.5
             },
             "idr/freezesync": {
              "value": 1.0
             },
             "idr/cloud": {
              "value": 0.15
             },
             "idr/lfosync": {
              "value": 1.0
             },
             "idr/evolverate": {
              "value": 0.03
             },
             "idr/crushbits": {
              "value": 8.0
             },
             "idr/tapsync": {
              "value": 1.0
             },
             "idr/spmode": {
              "value": 6.0
             },
             "idr/spA": {
              "value": 0.9
             },
             "idr/bpm": {
              "value": 120.0
             },
             "idr/tapdiv": {
              "value": 0.5
             },
             "idr/sync": {
              "value": 1.0
             },
             "idr/cloudhold": {
              "value": 0.0
             },
             "idr/gatedepth": {
              "value": 1.0
             },
             "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
             "idr/gateon": {
              "value": 0.0
             },
             "idr/spB": {
              "value": 1.6
             },
             "idr/downsamp": {
              "value": 6.0
             },
             "idr/fbk": {
              "value": 0.88
             },
             "idr/panmode": {
              "value": 6.0
             },
             "idr/basems": {
              "value": 240.0
             }
            }
           }
          ]
         }
        }
       }
      }
     },
     {
      "filetype": "C74Snapshot",
      "version": 2,
      "minorversion": 0,
      "name": "Murmur",
      "origin": "export_mc_textures_FIXED",
      "type": "patcher",
      "subtype": "Undefined",
      "embed": 1,
      "snapshot": {
       "valuedictionary": {
        "parameter_values": {
         "blob": {
          "rnbo~": [
           {
            "filetype": "C74Snapshot",
            "version": 2,
            "minorversion": 0,
            "name": "untitled",
            "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
            "type": "rnbo",
            "subtype": "",
            "embed": 1,
            "snapshot": {
             "idr/evolve": {
              "value": 0.3
             },
             "idr/gateduty": {
              "value": 0.5
             },
             "idr/lfoshape": {
              "value": 1.0
             },
             "idr/lfodepth": {
              "value": 0.2
             },
             "idr/lfomode": {
              "value": 7.0
             },
             "idr/lfoB": {
              "value": 2.0
             },
             "idr/reroll": {
              "value": 0.0
             },
             "idr/panB": {
              "value": 0.5
             },
             "idr/lfoA": {
              "value": 1.0
             },
             "idr/playspeed": {
              "value": 1.0
             },
             "idr/width": {
              "value": 1.0
             },
             "idr/lforate": {
              "value": 0.5
             },
             "idr/panic": {
              "value": 0.0
             },
             "idr/outgain": {
              "value": 1.0
             },
             "idr/freeze": {
              "value": 0.0
             },
             "idr/diffusion": {
              "value": 0.55
             },
             "idr/gatediv": {
              "value": 0.25
             },
             "idr/lfodiv": {
              "value": 1.0
             },
             "idr/lopass": {
              "value": 5000.0
             },
             "idr/freezelen": {
              "value": 1500.0
             },
             "idr/A": {
              "value": 1.5
             },
             "idr/B": {
              "value": 2.5
             },
             "idr/tapcount": {
              "value": 10.0
             },
             "idr/mix": {
              "value": 0.9
             },
             "idr/morph": {
              "value": 0.0
             },
             "idr/mode": {
              "value": 7.0
             },
             "idr/panA": {
              "value": 0.6
             },
             "idr/freezediv": {
              "value": 1.0
             },
             "idr/freezesync": {
              "value": 0.0
             },
             "idr/cloud": {
              "value": 0.7
             },
             "idr/lfosync": {
              "value": 0.0
             },
             "idr/evolverate": {
              "value": 0.05
             },
             "idr/crushbits": {
              "value": 16.0
             },
             "idr/tapsync": {
              "value": 0.0
             },
             "idr/spmode": {
              "value": 7.0
             },
             "idr/spA": {
              "value": 0.35
             },
             "idr/bpm": {
              "value": 120.0
             },
             "idr/tapdiv": {
              "value": 0.5
             },
             "idr/sync": {
              "value": 0.0
             },
             "idr/cloudhold": {
              "value": 0.0
             },
             "idr/gatedepth": {
              "value": 1.0
             },
             "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
             "idr/gateon": {
              "value": 0.0
             },
             "idr/spB": {
              "value": 1.0
             },
             "idr/downsamp": {
              "value": 1.0
             },
             "idr/fbk": {
              "value": 0.8
             },
             "idr/panmode": {
              "value": 7.0
             },
             "idr/basems": {
              "value": 300.0
             }
            }
           }
          ]
         }
        }
       }
      },
      "fileref": {
       "name": "The Skater[1]",
       "filename": "The Skater[1].maxsnap",
       "filepath": "~/Documents/Max 9/Snapshots",
       "filepos": -1,
       "snapshotfileid": "4fb54c572b8bddfc9960d2b814a7cd0c"
      }
     },
     {
      "filetype": "C74Snapshot",
      "version": 2,
      "minorversion": 0,
      "name": "Stutter Step",
      "origin": "export_mc_textures_FIXED",
      "type": "patcher",
      "subtype": "Undefined",
      "embed": 1,
      "snapshot": {
       "valuedictionary": {
        "parameter_values": {
         "blob": {
          "rnbo~": [
           {
            "filetype": "C74Snapshot",
            "version": 2,
            "minorversion": 0,
            "name": "untitled",
            "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
            "type": "rnbo",
            "subtype": "",
            "embed": 1,
            "snapshot": {
             "idr/evolve": {
              "value": 0.0
             },
             "idr/gateduty": {
              "value": 0.35
             },
             "idr/lfoshape": {
              "value": 1.0
             },
             "idr/lfodepth": {
              "value": 0.05
             },
             "idr/lfomode": {
              "value": 6.0
             },
             "idr/lfoB": {
              "value": 2.0
             },
             "idr/reroll": {
              "value": 0.0
             },
             "idr/panB": {
              "value": 0.7
             },
             "idr/lfoA": {
              "value": 1.0
             },
             "idr/playspeed": {
              "value": 1.0
             },
             "idr/width": {
              "value": 0.8
             },
             "idr/lforate": {
              "value": 0.2
             },
             "idr/panic": {
              "value": 0.0
             },
             "idr/outgain": {
              "value": 1.0
             },
             "idr/freeze": {
              "value": 0.0
             },
             "idr/diffusion": {
              "value": 0.05
             },
             "idr/gatediv": {
              "value": 0.125
             },
             "idr/lfodiv": {
              "value": 0.5
             },
             "idr/lopass": {
              "value": 7000.0
             },
             "idr/freezelen": {
              "value": 140.0
             },
             "idr/A": {
              "value": 1.0
             },
             "idr/B": {
              "value": 1.0
             },
             "idr/tapcount": {
              "value": 6.0
             },
             "idr/mix": {
              "value": 0.95
             },
             "idr/morph": {
              "value": 0.25
             },
             "idr/mode": {
              "value": 3.0
             },
             "idr/panA": {
              "value": -0.7
             },
             "idr/freezediv": {
              "value": 0.25
             },
             "idr/freezesync": {
              "value": 1.0
             },
             "idr/cloud": {
              "value": 0.0
             },
             "idr/lfosync": {
              "value": 1.0
             },
             "idr/evolverate": {
              "value": 0.03
             },
             "idr/crushbits": {
              "value": 12.0
             },
             "idr/tapsync": {
              "value": 1.0
             },
             "idr/spmode": {
              "value": 6.0
             },
             "idr/spA": {
              "value": 0.9
             },
             "idr/bpm": {
              "value": 120.0
             },
             "idr/tapdiv": {
              "value": 0.25
             },
             "idr/sync": {
              "value": 1.0
             },
             "idr/cloudhold": {
              "value": 0.0
             },
             "idr/gatedepth": {
              "value": 1.0
             },
             "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
             "idr/gateon": {
              "value": 1.0
             },
             "idr/spB": {
              "value": 1.4
             },
             "idr/downsamp": {
              "value": 2.0
             },
             "idr/fbk": {
              "value": 0.75
             },
             "idr/panmode": {
              "value": 6.0
             },
             "idr/basems": {
              "value": 120.0
             }
            }
           }
          ]
         }
        }
       }
      },
      "fileref": {
       "name": "Murmur[1]",
       "filename": "Murmur[1].maxsnap",
       "filepath": "~/Documents/Max 9/Snapshots",
       "filepos": -1,
       "snapshotfileid": "26e3e9f83dfac610d872a32944637401"
      }
     },
     {
      "filetype": "C74Snapshot",
      "version": 2,
      "minorversion": 0,
      "name": "Pavement",
      "origin": "export_mc_textures_FIXED",
      "type": "patcher",
      "subtype": "Undefined",
      "embed": 1,
      "fileref": {
       "name": "The Skater[1]",
       "filename": "The Skater[1]_20260703.maxsnap",
       "filepath": "~/Documents/Max 9/Snapshots",
       "filepos": -1,
       "snapshotfileid": "5d3eb23351577b87db38d18a68f376a5"
      },
      "snapshot": {
       "valuedictionary": {
        "parameter_values": {
         "blob": {
          "rnbo~": [
           {
            "filetype": "C74Snapshot",
            "version": 2,
            "minorversion": 0,
            "name": "untitled",
            "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
            "type": "rnbo",
            "subtype": "",
            "embed": 1,
            "snapshot": {
             "idr/evolve": {
              "value": 0.1
             },
             "idr/gateduty": {
              "value": 0.5
             },
             "idr/lfoshape": {
              "value": 1.0
             },
             "idr/lfodepth": {
              "value": 0.4
             },
             "idr/lfomode": {
              "value": 7.0
             },
             "idr/lfoB": {
              "value": 3.0
             },
             "idr/reroll": {
              "value": 0.0
             },
             "idr/panB": {
              "value": 0.5
             },
             "idr/lfoA": {
              "value": 2.0
             },
             "idr/playspeed": {
              "value": 0.8
             },
             "idr/width": {
              "value": 1.0
             },
             "idr/lforate": {
              "value": 3.5
             },
             "idr/panic": {
              "value": 0.0
             },
             "idr/outgain": {
              "value": 1.0
             },
             "idr/freeze": {
              "value": 0.0
             },
             "idr/diffusion": {
              "value": 0.2
             },
             "idr/gatediv": {
              "value": 0.25
             },
             "idr/lfodiv": {
              "value": 1.0
             },
             "idr/lopass": {
              "value": 3800.0
             },
             "idr/freezelen": {
              "value": 300.0
             },
             "idr/A": {
              "value": 2.0
             },
             "idr/B": {
              "value": 2.5
             },
             "idr/tapcount": {
              "value": 9.0
             },
             "idr/mix": {
              "value": 0.9
             },
             "idr/morph": {
              "value": 0.55
             },
             "idr/mode": {
              "value": 7.0
             },
             "idr/panA": {
              "value": 0.9
             },
             "idr/freezediv": {
              "value": 0.5
             },
             "idr/freezesync": {
              "value": 0.0
             },
             "idr/cloud": {
              "value": 0.3
             },
             "idr/lfosync": {
              "value": 0.0
             },
             "idr/evolverate": {
              "value": 0.1
             },
             "idr/crushbits": {
              "value": 6.0
             },
             "idr/tapsync": {
              "value": 0.0
             },
             "idr/spmode": {
              "value": 7.0
             },
             "idr/spA": {
              "value": 0.6
             },
             "idr/bpm": {
              "value": 120.0
             },
             "idr/tapdiv": {
              "value": 0.5
             },
             "idr/sync": {
              "value": 0.0
             },
             "idr/cloudhold": {
              "value": 0.0
             },
             "idr/gatedepth": {
              "value": 1.0
             },
             "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
             "idr/gateon": {
              "value": 0.0
             },
             "idr/spB": {
              "value": 0.9
             },
             "idr/downsamp": {
              "value": 10.0
             },
             "idr/fbk": {
              "value": 0.7
             },
             "idr/panmode": {
              "value": 7.0
             },
             "idr/basems": {
              "value": 180.0
             }
            }
           }
          ]
         }
        }
       }
      }
     },
     {
      "filetype": "C74Snapshot",
      "version": 2,
      "minorversion": 0,
      "name": "Vigil",
      "origin": "export_mc_textures_FIXED",
      "type": "patcher",
      "subtype": "Undefined",
      "embed": 1,
      "snapshot": {
       "valuedictionary": {
        "parameter_values": {
         "blob": {
          "rnbo~": [
           {
            "filetype": "C74Snapshot",
            "version": 2,
            "minorversion": 0,
            "name": "untitled",
            "origin": "f71a7465-7183-11f1-b465-466678cd98a6",
            "type": "rnbo",
            "subtype": "",
            "embed": 1,
            "snapshot": {
             "idr/evolve": {
              "value": 0.65
             },
             "idr/gateduty": {
              "value": 0.5
             },
             "idr/lfoshape": {
              "value": 0.0
             },
             "idr/lfodepth": {
              "value": 0.2
             },
             "idr/lfomode": {
              "value": 6.0
             },
             "idr/lfoB": {
              "value": 1.5
             },
             "idr/reroll": {
              "value": 0.0
             },
             "idr/panB": {
              "value": 1.0
             },
             "idr/lfoA": {
              "value": 0.5
             },
             "idr/playspeed": {
              "value": 0.5
             },
             "idr/width": {
              "value": 1.0
             },
             "idr/lforate": {
              "value": 0.04
             },
             "idr/panic": {
              "value": 0.0
             },
             "idr/outgain": {
              "value": 1.0
             },
             "idr/freeze": {
              "value": 0.0
             },
             "idr/diffusion": {
              "value": 0.85
             },
             "idr/gatediv": {
              "value": 0.25
             },
             "idr/lfodiv": {
              "value": 1.0
             },
             "idr/lopass": {
              "value": 3200.0
             },
             "idr/freezelen": {
              "value": 2000.0
             },
             "idr/A": {
              "value": 1.0
             },
             "idr/B": {
              "value": 0.5
             },
             "idr/tapcount": {
              "value": 12.0
             },
             "idr/mix": {
              "value": 0.85
             },
             "idr/morph": {
              "value": 0.0
             },
             "idr/mode": {
              "value": 4.0
             },
             "idr/panA": {
              "value": -1.0
             },
             "idr/freezediv": {
              "value": 1.0
             },
             "idr/freezesync": {
              "value": 1.0
             },
             "idr/cloud": {
              "value": 0.2
             },
             "idr/lfosync": {
              "value": 1.0
             },
             "idr/evolverate": {
              "value": 0.015
             },
             "idr/crushbits": {
              "value": 16.0
             },
             "idr/tapsync": {
              "value": 1.0
             },
             "idr/spmode": {
              "value": 6.0
             },
             "idr/spA": {
              "value": 0.98
             },
             "idr/bpm": {
              "value": 120.0
             },
             "idr/tapdiv": {
              "value": 0.5
             },
             "idr/sync": {
              "value": 0.0
             },
             "idr/cloudhold": {
              "value": 0.0
             },
             "idr/gatedepth": {
              "value": 1.0
             },
             "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
             "idr/gateon": {
              "value": 0.0
             },
             "idr/spB": {
              "value": 1.02
             },
             "idr/downsamp": {
              "value": 1.0
             },
             "idr/fbk": {
              "value": 1.0
             },
             "idr/panmode": {
              "value": 6.0
             },
             "idr/basems": {
              "value": 900.0
             }
            }
           }
          ]
         }
        }
       }
      },
      "fileref": {
       "name": "Pavement[1]",
       "filename": "Pavement[1].maxsnap",
       "filepath": "~/Documents/Max 9/Snapshots",
       "filepos": -1,
       "snapshotfileid": "3c9e2684341c36732a339106fba8bd59"
      }
     }
    ]
   }
  }
 }
}