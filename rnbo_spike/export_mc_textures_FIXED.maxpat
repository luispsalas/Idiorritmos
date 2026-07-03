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
   87.0,
   126.0,
   1260.0,
   760.0
  ],
  "boxes": [
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
       243.0,
       196.0,
       1000.0,
       778.0
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
              "code": "// mc TEXTURES \u2014 stereo gen engine (G1-G4 + Cloud + Evolve + Gate + G1+ stereo loop + P5 phase-lock)\n// in 3 = transport-locked beat ramp (phasor~ 4n @lock 1): grid-locks gate/LFO, quantizes freeze,\n// and measures host tempo (overrides bpm param). Stalled ramp or sync=0 -> free-run fallback.\n// 12-tap distribution-driven feedback delay with true static freeze, capture-replay\n// cloud, rhythmic gate, tempo sync, bit-crush, and autonomous evolve drift.\n// Param declaration order = 10-group performance layout (sets DAW automation order).\n\n// \u2500\u2500 G1 SOURCE \u00b7 Capture Cloud \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam cloud(0, min=0, max=1);          // blend: 0 = raw input, 1 = re-played multi-speed cloud\nParam playspeed(1, min=0.25, max=4);   // global speed of replayed voices (pitch factor)\nParam spmode(6, min=1, max=7);         // per-voice speed distribution mode (4 harmonic = Haiku chord)\nParam spA(0.9, min=-8, max=8);         // speed dist arg A\nParam spB(1.4, min=0, max=16);         // speed dist arg B\nParam cloudhold(0, min=0, max=1);      // 1 = stop recording (freeze captured buffer for clean loop)\n\n// \u2500\u2500 G2 TEMPO sync \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam sync(0, min=0, max=1);           // 0 = free (ms/Hz), 1 = lock times to BPM\nParam bpm(120, min=20, max=300);       // host tempo; driven by DAW transport in-plugin\nParam tapdiv(0.5, min=0.0625, max=8);  // beats per base delay unit (0.5 = 1/8 note)\nParam lfodiv(1, min=0.0625, max=16);   // beats per LFO cycle\nParam freezediv(1, min=0.0625, max=16);// beats per frozen loop window\nParam tapsync(1, min=0, max=1);        // per-domain: taps follow BPM when synced (0 = free basems)\nParam lfosync(1, min=0, max=1);        // per-domain: LFO follows BPM when synced (0 = free Hz)\nParam freezesync(1, min=0, max=1);     // per-domain: freeze len+quantize follow BPM (0 = free ms, instant)\n\n// \u2500\u2500 G3 TEXTURE engine \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam tapcount(12, min=1, max=12);     // active delay taps (gain mask; N fixed 12 in RNBO)\nParam basems(150, min=1, max=2000);    // overall delay size in ms (or beatms*tapdiv when synced)\nParam mode(6, min=1, max=7);           // tap spacing distribution: 1 exp 2 scaledexp 3 increment 4 harmonic 5 subharm 6 spread 7 deviate\nParam A(1, min=-8, max=8);             // tap dist arg A\nParam B(6, min=0, max=16);             // tap dist arg B\nParam fbk(0.5, min=0, max=1);          // feedback / regeneration (G1+: unity-safe \u2014 in-loop tanh limiter)\nParam lopass(6000, min=20, max=20000); // feedback tone (lowpass on the recirculating signal)\nParam diffusion(0, min=0, max=1);      // in-loop allpass smear: echoes melt into wash per pass (0 = off)\nParam freeze(0, min=0, max=1);         // 1 = stop writing, hold the captured loop\nParam freezelen(2000, min=10, max=2000);// P1: frozen loop window (long = eternal pad, short = stutter)\n\n// \u2500\u2500 G4 LFO (per-tap delay modulation) \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam lforate(0.3, min=0, max=20);     // base LFO rate (Hz); per-tap rates derived from lfomode\nParam lfomode(6, min=1, max=7);        // per-tap LFO rate distribution (same 7 modes as tap dist)\nParam lfoA(1, min=-8, max=8);          // LFO dist arg A\nParam lfoB(2, min=0, max=16);          // LFO dist arg B\nParam lfodepth(0, min=0, max=1);       // delay-mod depth (fraction of tap time)\nParam lfoshape(0, min=0, max=1);       // P3: 0 = smooth sine, 1 = stepped sample&hold (rhythmic)\n\n// \u2500\u2500 G5 PERFORMANCE \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam morph(0, min=0, max=1);          // P2 MACRO: 0 = texture (your settings), 1 = glitch (short/dry/sparse)\nParam gateon(0, min=0, max=1);         // G3: rhythmic amplitude gate on/off (the chop tool)\nParam gatediv(0.25, min=0.0156, max=4);// gate cycle length in beats (0.25 = 1/16 note)\nParam gatedepth(1, min=0, max=1);      // how deep the gate cuts (1 = full chop, <1 = tremolo)\nParam gateduty(0.5, min=0.02, max=0.98);// open fraction of each cycle (low = staccato, high = open)\n\n// \u2500\u2500 G6 CRUSH \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam crushbits(16, min=1, max=16);    // P4: bit-depth reduction on wet (16 = clean, 1 = brutal)\nParam downsamp(1, min=1, max=64);      // P4: sample-rate reduction (1 = full SR, N = hold N samples)\n\n// \u2500\u2500 G7 EVOLVE \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam evolve(0, min=0, max=1);         // autonomous drift depth on tap distribution (0 = static)\nParam evolverate(0.05, min=0.001, max=2);// drift speed (Hz)\n\n// \u2500\u2500 G8 STEREO image \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam width(1, min=0, max=1);          // stereo spread (0 = mono, 1 = full width)\nParam panmode(6, min=6, max=7);        // 6 = spread (ordered L\u2192R), 7 = deviate (random scatter)\nParam panA(0, min=-1, max=1);          // pan dist arg A (spread start / deviate range)\nParam panB(1, min=0, max=1);           // pan dist arg B (spread end / deviate center)\n\n// \u2500\u2500 G9 OUTPUT \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam mix(0, min=0, max=1);            // dry/wet: 0 = unprocessed source, 1 = full texture\nParam outgain(1, min=0, max=2);        // master output level (post-mix, pre soft-limiter)\n\n// \u2500\u2500 G10 TRANSPORT \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nParam panic(0, min=0, max=1);          // rising edge = click-free fade + buffer flush\nParam reroll(0, min=0, max=1);         // rising edge = re-randomize deviate tables\n\n// \u2500\u2500 State \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\nDelay bufL(96000);                  // G1+: left delay line (~2s @ 48k)\nDelay bufR(96000);                  // G1+: right delay line (decorrelated loop)\nData cap(96000);                    // FROZEN snapshot loop (true static freeze)\nHistory fbstateL(0);                // G1+: feedback state L\nHistory fbstateR(0);                // G1+: feedback state R\nHistory lpstL(0);                   // G1+: loop lowpass state L\nHistory lpstR(0);                   // G1+: loop lowpass state R\nHistory dcxL(0);                    // G1+: DC blocker x1 L\nHistory dcyL(0);                    // G1+: DC blocker y1 L\nHistory dcxR(0);                    // G1+: DC blocker x1 R\nHistory dcyR(0);                    // G1+: DC blocker y1 R\nDelay apL1(8192);                   // DIFFUSION: allpass stages L (prime ms)\nDelay apL2(8192);\nDelay apL3(8192);\nDelay apL4(8192);\nDelay apR1(8192);                   // DIFFUSION: allpass stages R (different primes)\nDelay apR2(8192);\nDelay apR3(8192);\nDelay apR4(8192);\nHistory difsm(0);                   // DIFFUSION: smoothed amount\nHistory rrprev(0);\nHistory pnprev(0);\nHistory panctr(0);\nHistory cwpos(0);                   // capture write position (rolling record)\nHistory crpos(0);                   // capture read position (sweeps the frozen loop)\nHistory frzprev(0);\nHistory frzxf(0);                   // freeze crossfade (~5 ms, click-free enter AND exit)\nHistory mgain(1);                   // smoothed output gain (click-free panic)\nHistory fbsm(0);                    // smoothing: feedback\nHistory widsm(1);                   // smoothing: width\nHistory mxsm(0);                    // smoothing: dry/wet mix\nHistory ogsm(1);                    // smoothing: output gain\nHistory dsl(0);                     // P4 sample-rate-reduction hold (L)\nHistory dsr(0);                     // P4 sample-rate-reduction hold (R)\nHistory dscnt(0);                   // P4 downsample counter\nHistory gphase(0);                  // G3 gate phase\nHistory ggain(1);                   // G3 gate gain (smoothed)\nHistory gateprev(0);                // G3 gate enable edge\nHistory evph1(0);                   // G3 evolve drift phase 1\nHistory evph2(0);                   // G3 evolve drift phase 2\nData dev(12);                       // held random, tap deviate\nData pdev(12);                      // held random, pan deviate\nData phase(12);                     // per-tap LFO phase accumulators\nData shval(12);                     // per-tap sample&hold value (P3 stepped LFO)\nData pcap(96000);                   // CLOUD: rolling capture of the live input\nData pph(16);                       // CLOUD: per-voice read phase (samples)\nData spdev(16);                     // CLOUD: held random for speed deviate\nHistory pwpos(0);                   // CLOUD: capture write position\nHistory bphprev(0);                 // P5: beat-ramp previous value (wrap/stall detect)\nHistory beatcnt(0);                 // P5: beats elapsed counter\nHistory wrapsamps(0);               // P5: samples since last beat wrap\nHistory beatsmp(0);                 // P5: measured beat length (samples)\nHistory stallctr(0);                // P5: stalled-ramp counter (transport stopped)\nHistory fqprev(0);                  // P5: freeze-quantize boundary phase\nHistory frzstate(0);                // P5: committed freeze state (armed vs active)\n\n// \u2500\u2500 DSP \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\ntwopi = 6.28318530718;\nhalfpi = 1.57079632679;\nLcap = 96000;                       // freeze capture loop length (samples)\nLp = 96000;                         // input-capture (cloud) buffer length (~2s @ 48k)\n\nfbg = clamp(fbk, 0, 1);\nfbsm = fbsm + (fbg - fbsm) * 0.004; fbg = fbsm;   // ~5 ms smooth\ndep = clamp(lfodepth, 0, 1);\nwid = clamp(width, 0, 1);\nwidsm = widsm + (wid - widsm) * 0.004; wid = widsm;\n\n// P5 TEMPO SYNC + PHASE-LOCK\nbeatms = 60000 / clamp(bpm, 20, 300);\nsynced = sync > 0.5;\nbph = in3;\nbdelta = bph - bphprev;\nif (bdelta < -0.5) {\n\tbeatcnt = beatcnt + 1;\n\tbeatsmp = wrapsamps;\n\twrapsamps = 0;\n} else {\n\twrapsamps = wrapsamps + 1;\n}\nstallctr = (abs(bdelta) < 0.0000001) ? (stallctr + 1) : 0;\nbphprev = bph;\nbpos = beatcnt + bph;\nlocked = synced && (stallctr < 4800) && (beatsmp > 32);\nbeatms = locked ? (beatsmp * 1000 / samplerate) : beatms;\ntsyn = synced && (tapsync > 0.5);\nlsyn = synced && (lfosync > 0.5);\nfsyn = synced && (freezesync > 0.5);\nllock = locked && lsyn;\nflock = locked && fsyn;\nbasems_use    = tsyn ? (beatms * tapdiv) : basems;\nlforate_use   = lsyn ? (1000 / (beatms * ((lfodiv < 0.001) ? 0.001 : lfodiv))) : lforate;\nfreezelen_use = fsyn ? (beatms * freezediv) : freezelen;\nflen = clamp(freezelen_use * samplerate * 0.001, 64, Lcap);\n\n// P5 FREEZE-QUANTIZE: when locked, freeze commits at the next freezediv boundary\nfrzreq = freeze > 0.5;\nfqx = bpos / ((freezediv < 0.001) ? 0.001 : freezediv);\nfqp = fqx - floor(fqx);\nfqwrap = fqp < (fqprev - 0.5);\nfqprev = fqp;\nif (frzreq == 0) { frzstate = 0; }\nelse if (flock == 0) { frzstate = 1; }\nelse if (fqwrap) { frzstate = 1; }\nfrozen = frzstate > 0.5;\nfrzxf = frzxf + ((frozen ? 1 : 0) - frzxf) * 0.004;   // ~5 ms live<->frozen fade\n\n// P2 MORPH MACRO\nmph    = clamp(morph, 0, 1);\nbase_e = basems_use * (1 - 0.92 * mph);\nfbg_e  = fbg * (1 - mph);\ndep_e  = dep * (1 - mph);\ntc_e   = tapcount * (1 - mph) + 2 * mph;\nnact   = clamp(ceil(tc_e), 1, 12);\n\n// G3 EVOLVE: autonomous drift on tap-distribution args\nevd    = clamp(evolve, 0, 1);\nerate  = clamp(evolverate, 0.001, 2);\nevph1  = evph1 + erate / samplerate;        evph1 = evph1 - floor(evph1);\nevph2  = evph2 + erate * 0.37 / samplerate;  evph2 = evph2 - floor(evph2);\nAev    = clamp(A + evd * sin(evph1 * twopi) * 3, -8, 8);\nBev    = clamp(B + evd * sin(evph2 * twopi) * 3, 0, 16);\n\n// reroll rising edge -> refill held-random tables\nif (reroll > rrprev) {\n\tfor (k = 0; k < 12; k += 1) {\n\t\tdev.poke(noise(), k);\n\t\tpdev.poke(noise(), k);\n\t}\n\tfor (k = 0; k < 16; k += 1) { spdev.poke(noise(), k); }\n}\nrrprev = reroll;\n\n// panic: rising edge starts a one-buffer flush\nif (panic > pnprev) { panctr = 96000; }\npnprev = panic;\nflushing = panctr > 0;\nif (panctr > 0) { panctr = panctr - 1; }\npanik = (panic > 0.5) || flushing;\n\n// G1+ feedback state (stereo): sanitize NaN/Inf every sample\nfbL = fbstateL;\nfbL = (fbL == fbL) ? fbL : 0;\nfbL = clamp(fbL, -1.5, 1.5);\nfbR = fbstateR;\nfbR = (fbR == fbR) ? fbR : 0;\nfbR = clamp(fbR, -1.5, 1.5);\n\n// CAPTURE-REPLAY CLOUD: record live input, re-play 16 voices at distributed speeds\nrawmono = (in1 + in2) * 0.5;\ncl = clamp(cloud, 0, 1);\nif (cloudhold < 0.5) {\n\tpcap.poke(rawmono, pwpos);\n\tpwpos = pwpos + 1;\n\tpwpos = (pwpos >= Lp) ? 0 : pwpos;\n}\ncloudsum = 0;\nfor (v = 0; v < 16; v += 1) {\n\tvf = v / 15;\n\tsr = 1;\n\tif (spmode == 1)      { sr = pow(spB, spA * v); }\n\telse if (spmode == 2) { sr = pow(spB, spA * v / 12); }\n\telse if (spmode == 3) { sr = spB + spA * v; }\n\telse if (spmode == 4) { sr = spB * (v + 1) * spA; }   // harmonic = 1x,2x,3x... chord\n\telse if (spmode == 5) { sr = spB / (v + 1) * spA; }\n\telse if (spmode == 7) { sr = spB + spdev.peek(v) * spA; }\n\telse                  { sr = spA + (spB - spA) * vf; }\n\tpv = pph.peek(v) + playspeed * sr;\n\tpv = pv - Lp * floor(pv / Lp);\n\tpph.poke(pv, v);\n\tpi0 = floor(pv);\n\tpfr = pv - pi0;\n\tpi1 = (pi0 + 1 >= Lp) ? 0 : pi0 + 1;\n\tcloudsum += pcap.peek(pi0) * (1 - pfr) + pcap.peek(pi1) * pfr;\n}\ncloudmono = cloudsum * 0.0625;          // /16\nmatsrc = (1 - cl) * rawmono + cl * cloudmono;\ndryL = (1 - cl) * in1 + cl * cloudmono;\ndryR = (1 - cl) * in2 + cl * cloudmono;\n\n// write head: source + lowpassed feedback\nsrc = matsrc;\nsrc = frozen ? 0 : src;\nfbamt = frozen ? 0 : fbg_e;\nsrc = panik ? 0 : src;\nfbamt = panik ? 0 : fbamt;\nwrL = clamp(src + (fbL * 0.7 + fbR * 0.3) * fbamt, -2, 2);\nwrR = clamp(src + (fbR * 0.7 + fbL * 0.3) * fbamt, -2, 2);\nbufL.write(wrL);\nbufR.write(wrR);\n\n// TRUE FREEZE: mirror live stream into cap; on freeze sweep crpos over flen window\nif (frozen && (frzprev < 0.5)) { crpos = 0; }\nfrzprev = frozen ? 1 : 0;\nif (frozen) {\n\tcrpos = crpos + 1;\n\tcrpos = (crpos >= flen) ? 0 : crpos;\n} else {\n\tcap.poke((wrL + wrR) * 0.5, cwpos);\n\tcwpos = cwpos + 1;\n\tcwpos = (cwpos >= Lcap) ? 0 : cwpos;\n}\n\nsumL = 0;\nsumR = 0;\nfbsumL = 0;\nfbsumR = 0;\nfor (i = 0; i < 12; i += 1) {\n\tfrac = i / 11;\n\n\t// per-tap delay ratio by mode\n\tratio = 1;\n\tif (mode == 1)      { ratio = pow(Bev, Aev * i); }\n\telse if (mode == 2) { ratio = pow(Bev, Aev * i / 12); }\n\telse if (mode == 3) { ratio = Bev + Aev * i; }\n\telse if (mode == 4) { ratio = Bev * (i + 1) * Aev; }\n\telse if (mode == 5) { ratio = Bev / (i + 1) * Aev; }\n\telse if (mode == 7) { ratio = Bev + dev.peek(i) * Aev; }\n\telse                { ratio = Aev + (Bev - Aev) * frac; }\n\n\t// per-tap LFO rate by lfomode\n\tlr = 1;\n\tif (lfomode == 1)      { lr = pow(lfoB, lfoA * i); }\n\telse if (lfomode == 2) { lr = pow(lfoB, lfoA * i / 12); }\n\telse if (lfomode == 3) { lr = lfoB + lfoA * i; }\n\telse if (lfomode == 4) { lr = lfoB * (i + 1) * lfoA; }\n\telse if (lfomode == 5) { lr = lfoB / (i + 1) * lfoA; }\n\telse                   { lr = lfoA + (lfoB - lfoA) * frac; }\n\tph = 0;\n\twrapped = 0;\n\tlq = 0;\n\tif (llock) {\n\t\tlq = bpos * lr / ((lfodiv < 0.001) ? 0.001 : lfodiv);\n\t\tph = lq - floor(lq);\n\t\twrapped = ph < (phase.peek(i) - 0.5);\n\t} else {\n\t\tph = phase.peek(i) + lforate_use * lr / samplerate;\n\t\twrapped = ph >= 1;\n\t\tph = ph - floor(ph);\n\t}\n\tphase.poke(ph, i);\n\tif (wrapped) { shval.poke(noise(), i); }\n\tlfo = (lfoshape > 0.5) ? shval.peek(i) : sin(ph * twopi);\n\n\t// modulated tap time\n\tmodms = base_e * (1 + lfo * dep_e);\n\tdsamp = ratio * modms * samplerate * 0.001;\n\tdsamp = clamp(dsamp, 1, 95000);\n\n\tgate = (i < tc_e) ? 1 : 0;\n\trphase = crpos - dsamp;\n\trphase = rphase - flen * floor(rphase / flen);\n\tridx = cwpos - flen + rphase;\n\tridx = ridx - Lcap * floor(ridx / Lcap);\n\tci0 = floor(ridx);\n\tcfr = ridx - ci0;\n\tci1 = (ci0 + 1 >= Lcap) ? 0 : ci0 + 1;\n\tcs = cap.peek(ci0) * (1 - cfr) + cap.peek(ci1) * cfr;\n\trdl = bufL.read(dsamp);\n\trdr = bufR.read(dsamp);\n\tisl = i - 2 * floor(i * 0.5);\n\tlive = (isl < 0.5) ? rdl : rdr;\n\ts = (live * (1 - frzxf) + cs * frzxf) * gate;\n\n\t// pan: spread across ACTIVE taps (balanced at any count)\n\tpanfrac = (nact > 1) ? (i / (nact - 1)) : 0.5;\n\tpan = panA + (panB - panA) * panfrac;\n\tif (panmode == 7) { pan = panB + pdev.peek(i) * panA; }\n\tpan = 0.5 + (pan - 0.5) * wid;\n\tpan = clamp(pan, 0, 1);\n\tsumL += s * cos(pan * halfpi);\n\tsumR += s * sin(pan * halfpi);\n\tif (isl < 0.5) { fbsumL += s; } else { fbsumR += s; }\n}\nsumL = sumL * 0.08333333;\nsumR = sumR * 0.08333333;\n\n// G1+ STEREO LOOP: per-channel filter + DC block + tanh limiter (unity-safe)\nnactL = ceil(nact * 0.5);                   // active even taps\nnactL = (nactL < 1) ? 1 : nactL;\nnactR = floor(nact * 0.5);                  // active odd taps\nnactR = (nactR < 1) ? 1 : nactR;\nfbnL = fbsumL / nactL;                      // normalize: loop gain honest at any tapcount\nfbnR = fbsumR / nactR;\ncoef = 1 - exp(-twopi * clamp(lopass, 20, 20000) / samplerate);  // accurate cutoff (20k ~ transparent)\nlpl = lpstL + coef * (fbnL - lpstL);\nlpl = (lpl == lpl) ? lpl : 0;\nlpl = clamp(lpl, -1.5, 1.5);\nlpstL = lpl;\nlpr = lpstR + coef * (fbnR - lpstR);\nlpr = (lpr == lpr) ? lpr : 0;\nlpr = clamp(lpr, -1.5, 1.5);\nlpstR = lpr;\ndcl = lpl - dcxL + 0.9995 * dcyL;           // DC blocker (~4 Hz): stops low-mud buildup at near-unity\ndcxL = lpl; dcyL = dcl;\ndcr = lpr - dcxR + 0.9995 * dcyR;\ndcxR = lpr; dcyR = dcr;\ndcl = (dcl == dcl) ? dcl : 0;\ndcl = clamp(dcl, -1.5, 1.5);\ndcr = (dcr == dcr) ? dcr : 0;\ndcr = clamp(dcr, -1.5, 1.5);\n\n// IN-LOOP DIFFUSION: 4-stage allpass per channel (mutually-prime delays, L != R primes).\n// Sits inside the recirculation, so each pass smears further: echoes -> wash.\ndif = clamp(diffusion, 0, 1);\ndifsm = difsm + (dif - difsm) * 0.004;\ndif = difsm;\napg = 0.65;\nms2s = samplerate * 0.001;\nz1 = apL1.read(3.1 * ms2s);   v1 = dcl + apg * z1;  a1 = z1 - apg * v1;  apL1.write(v1);\nz2 = apL2.read(7.9 * ms2s);   v2 = a1 + apg * z2;   a2 = z2 - apg * v2;  apL2.write(v2);\nz3 = apL3.read(13.7 * ms2s);  v3 = a2 + apg * z3;   a3 = z3 - apg * v3;  apL3.write(v3);\nz4 = apL4.read(23.3 * ms2s);  v4 = a3 + apg * z4;   a4 = z4 - apg * v4;  apL4.write(v4);\nz5 = apR1.read(3.7 * ms2s);   v5 = dcr + apg * z5;  a5 = z5 - apg * v5;  apR1.write(v5);\nz6 = apR2.read(8.9 * ms2s);   v6 = a5 + apg * z6;   a6 = z6 - apg * v6;  apR2.write(v6);\nz7 = apR3.read(14.9 * ms2s);  v7 = a6 + apg * z7;   a7 = z7 - apg * v7;  apR3.write(v7);\nz8 = apR4.read(26.1 * ms2s);  v8 = a7 + apg * z8;   a8 = z8 - apg * v8;  apR4.write(v8);\ndifl = dcl * (1 - dif) + a4 * dif;\ndifr = dcr * (1 - dif) + a8 * dif;\ndifl = (difl == difl) ? difl : 0;\ndifl = clamp(difl, -1.5, 1.5);\ndifr = (difr == difr) ? difr : 0;\ndifr = clamp(difr, -1.5, 1.5);\nfbstateL = tanh(difl);                      // in-loop soft limiter: fbk 1.0 self-limits, can't run away\nfbstateR = tanh(difr);\n\n// dry/wet mix + click-free output gain\nmx = clamp(mix, 0, 1);\nmxsm = mxsm + (mx - mxsm) * 0.004; mx = mxsm;\nwetL = clamp(sumL, -1, 1);\nwetR = clamp(sumR, -1, 1);\n\n// P4 CRUSH: bit-depth + SR-reduction on WET only (dry stays clean)\nbits = clamp(floor(crushbits), 1, 16);        // floor() = correct integer quantization\nqstep = 2 / pow(2, bits);\nwetL = round(wetL / qstep) * qstep;\nwetR = round(wetR / qstep) * qstep;\nds = clamp(floor(downsamp), 1, 64);\ndscnt = dscnt + 1;\nif (dscnt >= ds) { dsl = wetL; dsr = wetR; dscnt = 0; }\nwetL = dsl;\nwetR = dsr;\n\nmtarget = panik ? 0 : 1;\nmgain = mgain + (mtarget - mgain) * 0.002;   // ~10 ms ramp\n\n// G3 GATE: tempo-relative rhythmic gate (click-free)\ngdv = (gatediv < 0.0156) ? 0.0156 : gatediv;\ngrate = 1000 / (beatms * gdv);\nif ((gateon > 0.5) && (gateprev < 0.5)) { gphase = 0; }\ngateprev = gateon;\ngq = 0;\nif (locked) {\n\tgq = bpos / gdv;\n\tgphase = gq - floor(gq);\n} else {\n\tgphase = gphase + grate / samplerate;\n\tgphase = gphase - floor(gphase);\n}\npulse = (gphase < clamp(gateduty, 0.02, 0.98)) ? 1 : 0;\ngtarget = (gateon > 0.5) ? (1 - clamp(gatedepth, 0, 1) * (1 - pulse)) : 1;\nggain = ggain + (gtarget - ggain) * 0.01;\nog = mgain * ggain;\nmixL = (dryL * (1 - mx) + wetL * mx) * og;\nmixR = (dryR * (1 - mx) + wetR * mx) * og;\n\n// G4 OUTPUT: master gain + soft limiter\nogsm = ogsm + (outgain - ogsm) * 0.002;\nout1 = tanh(mixL * ogsm);\nout2 = tanh(mixR * ogsm);\n"
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
          209.0,
          23.0
         ],
         "rnbo_classname": "gen~",
         "rnbo_serial": 1,
         "rnbo_uniqueid": "gen~_obj-5",
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
          "comment": "",
          "meta": ""
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
          "comment": "",
          "meta": ""
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
          "comment": "",
          "meta": ""
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
          "comment": "",
          "meta": ""
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
          300,
          40,
          130,
          22
         ],
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
         "source": [
          "obj-6",
          0
         ],
         "destination": [
          "obj-5",
          2
         ]
        }
       }
      ]
     },
     "patching_rect": [
      95.0,
      80.0,
      40.0,
      22.0
     ],
     "rnboattrcache": {
      "gentilde_obj_5/cloud": {
       "label": "gentilde_obj_5/cloud",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/playspeed": {
       "label": "gentilde_obj_5/playspeed",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/spmode": {
       "label": "gentilde_obj_5/spmode",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/spA": {
       "label": "gentilde_obj_5/spA",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/spB": {
       "label": "gentilde_obj_5/spB",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/cloudhold": {
       "label": "gentilde_obj_5/cloudhold",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/sync": {
       "label": "gentilde_obj_5/sync",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/bpm": {
       "label": "gentilde_obj_5/bpm",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/tapdiv": {
       "label": "gentilde_obj_5/tapdiv",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/lfodiv": {
       "label": "gentilde_obj_5/lfodiv",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/freezediv": {
       "label": "gentilde_obj_5/freezediv",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/tapcount": {
       "label": "gentilde_obj_5/tapcount",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/basems": {
       "label": "gentilde_obj_5/basems",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/mode": {
       "label": "gentilde_obj_5/mode",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/A": {
       "label": "gentilde_obj_5/A",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/B": {
       "label": "gentilde_obj_5/B",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/fbk": {
       "label": "gentilde_obj_5/fbk",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/lopass": {
       "label": "gentilde_obj_5/lopass",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/freeze": {
       "label": "gentilde_obj_5/freeze",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/freezelen": {
       "label": "gentilde_obj_5/freezelen",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/lforate": {
       "label": "gentilde_obj_5/lforate",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/lfomode": {
       "label": "gentilde_obj_5/lfomode",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/lfoA": {
       "label": "gentilde_obj_5/lfoA",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/lfoB": {
       "label": "gentilde_obj_5/lfoB",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/lfodepth": {
       "label": "gentilde_obj_5/lfodepth",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/lfoshape": {
       "label": "gentilde_obj_5/lfoshape",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/morph": {
       "label": "gentilde_obj_5/morph",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/gateon": {
       "label": "gentilde_obj_5/gateon",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/gatediv": {
       "label": "gentilde_obj_5/gatediv",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/gatedepth": {
       "label": "gentilde_obj_5/gatedepth",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/gateduty": {
       "label": "gentilde_obj_5/gateduty",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/crushbits": {
       "label": "gentilde_obj_5/crushbits",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/downsamp": {
       "label": "gentilde_obj_5/downsamp",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/evolve": {
       "label": "gentilde_obj_5/evolve",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/evolverate": {
       "label": "gentilde_obj_5/evolverate",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/width": {
       "label": "gentilde_obj_5/width",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/panmode": {
       "label": "gentilde_obj_5/panmode",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/panA": {
       "label": "gentilde_obj_5/panA",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/panB": {
       "label": "gentilde_obj_5/panB",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/mix": {
       "label": "gentilde_obj_5/mix",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/outgain": {
       "label": "gentilde_obj_5/outgain",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/panic": {
       "label": "gentilde_obj_5/panic",
       "isEnum": 0,
       "parsestring": ""
      },
      "gentilde_obj_5/reroll": {
       "label": "gentilde_obj_5/reroll",
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
       "gentilde_obj_5/reroll": {
        "value": 0.0
       },
       "gentilde_obj_5/panic": {
        "value": 0.0
       },
       "gentilde_obj_5/panmode": {
        "value": 6.0
       },
       "gentilde_obj_5/width": {
        "value": 1.0
       },
       "gentilde_obj_5/evolverate": {
        "value": 0.05
       },
       "gentilde_obj_5/gatedepth": {
        "value": 1.0
       },
       "gentilde_obj_5/panB": {
        "value": 1.0
       },
       "gentilde_obj_5/gateon": {
        "value": 0.0
       },
       "gentilde_obj_5/crushbits": {
        "value": 16.0
       },
       "gentilde_obj_5/gateduty": {
        "value": 0.5
       },
       "gentilde_obj_5/morph": {
        "value": 0.0
       },
       "gentilde_obj_5/lfodepth": {
        "value": 0.0
       },
       "gentilde_obj_5/panA": {
        "value": 0.0
       },
       "gentilde_obj_5/lforate": {
        "value": 0.3
       },
       "gentilde_obj_5/lfomode": {
        "value": 6.0
       },
       "gentilde_obj_5/lfoB": {
        "value": 2.0
       },
       "gentilde_obj_5/freezelen": {
        "value": 2000.0
       },
       "gentilde_obj_5/fbk": {
        "value": 0.5
       },
       "gentilde_obj_5/mode": {
        "value": 6.0
       },
       "gentilde_obj_5/freeze": {
        "value": 0.0
       },
       "gentilde_obj_5/spB": {
        "value": 1.4
       },
       "gentilde_obj_5/A": {
        "value": 1.0
       },
       "gentilde_obj_5/mix": {
        "value": 0.0
       },
       "gentilde_obj_5/basems": {
        "value": 150.0
       },
       "gentilde_obj_5/outgain": {
        "value": 1.0
       },
       "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
       "gentilde_obj_5/tapcount": {
        "value": 12.0
       },
       "gentilde_obj_5/lopass": {
        "value": 6000.0
       },
       "gentilde_obj_5/freezediv": {
        "value": 1.0
       },
       "gentilde_obj_5/gatediv": {
        "value": 0.25
       },
       "gentilde_obj_5/spA": {
        "value": 0.9
       },
       "gentilde_obj_5/bpm": {
        "value": 120.0
       },
       "gentilde_obj_5/playspeed": {
        "value": 1.0
       },
       "gentilde_obj_5/lfoshape": {
        "value": 0.0
       },
       "gentilde_obj_5/lfodiv": {
        "value": 1.0
       },
       "gentilde_obj_5/downsamp": {
        "value": 1.0
       },
       "gentilde_obj_5/cloud": {
        "value": 0.0
       },
       "gentilde_obj_5/B": {
        "value": 6.0
       },
       "gentilde_obj_5/evolve": {
        "value": 0.0
       },
       "gentilde_obj_5/cloudhold": {
        "value": 0.0
       },
       "gentilde_obj_5/spmode": {
        "value": 6.0
       },
       "gentilde_obj_5/lfoA": {
        "value": 1.0
       },
       "gentilde_obj_5/tapdiv": {
        "value": 0.5
       },
       "gentilde_obj_5/sync": {
        "value": 0.0
       }
      },
      "snapshotlist": {
       "current_snapshot": 0,
       "entries": [
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
          "gentilde_obj_5/reroll": {
           "value": 0.0
          },
          "gentilde_obj_5/panic": {
           "value": 0.0
          },
          "gentilde_obj_5/panmode": {
           "value": 6.0
          },
          "gentilde_obj_5/width": {
           "value": 1.0
          },
          "gentilde_obj_5/evolverate": {
           "value": 0.05
          },
          "gentilde_obj_5/gatedepth": {
           "value": 1.0
          },
          "gentilde_obj_5/panB": {
           "value": 1.0
          },
          "gentilde_obj_5/gateon": {
           "value": 0.0
          },
          "gentilde_obj_5/crushbits": {
           "value": 16.0
          },
          "gentilde_obj_5/gateduty": {
           "value": 0.5
          },
          "gentilde_obj_5/morph": {
           "value": 0.0
          },
          "gentilde_obj_5/lfodepth": {
           "value": 0.0
          },
          "gentilde_obj_5/panA": {
           "value": 0.0
          },
          "gentilde_obj_5/lforate": {
           "value": 0.3
          },
          "gentilde_obj_5/lfomode": {
           "value": 6.0
          },
          "gentilde_obj_5/lfoB": {
           "value": 2.0
          },
          "gentilde_obj_5/freezelen": {
           "value": 2000.0
          },
          "gentilde_obj_5/fbk": {
           "value": 0.5
          },
          "gentilde_obj_5/mode": {
           "value": 6.0
          },
          "gentilde_obj_5/freeze": {
           "value": 0.0
          },
          "gentilde_obj_5/spB": {
           "value": 1.4
          },
          "gentilde_obj_5/A": {
           "value": 1.0
          },
          "gentilde_obj_5/mix": {
           "value": 0.0
          },
          "gentilde_obj_5/basems": {
           "value": 150.0
          },
          "gentilde_obj_5/outgain": {
           "value": 1.0
          },
          "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6",
          "gentilde_obj_5/tapcount": {
           "value": 12.0
          },
          "gentilde_obj_5/lopass": {
           "value": 6000.0
          },
          "gentilde_obj_5/freezediv": {
           "value": 1.0
          },
          "gentilde_obj_5/gatediv": {
           "value": 0.25
          },
          "gentilde_obj_5/spA": {
           "value": 0.9
          },
          "gentilde_obj_5/bpm": {
           "value": 120.0
          },
          "gentilde_obj_5/playspeed": {
           "value": 1.0
          },
          "gentilde_obj_5/lfoshape": {
           "value": 0.0
          },
          "gentilde_obj_5/lfodiv": {
           "value": 1.0
          },
          "gentilde_obj_5/downsamp": {
           "value": 1.0
          },
          "gentilde_obj_5/cloud": {
           "value": 0.0
          },
          "gentilde_obj_5/B": {
           "value": 6.0
          },
          "gentilde_obj_5/evolve": {
           "value": 0.0
          },
          "gentilde_obj_5/cloudhold": {
           "value": 0.0
          },
          "gentilde_obj_5/spmode": {
           "value": 6.0
          },
          "gentilde_obj_5/lfoA": {
           "value": 1.0
          },
          "gentilde_obj_5/tapdiv": {
           "value": 0.5
          },
          "gentilde_obj_5/sync": {
           "value": 0.0
          }
         },
         "fileref": {
          "name": "untitled",
          "filename": "untitled_20260626_3.maxsnap",
          "filepath": "~/Documents/Max 9/Snapshots",
          "filepos": -1,
          "snapshotfileid": "e6ed307294f9dceaf25f1bb14bb2bcde"
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
      20,
      130,
      1150,
      20
     ],
     "text": "IDIORHYTHM FACTORY BANK \u2014 4 Personas + 4 Scenes. Path-prefixed for rnbo~ (varname 'idr'). CAPTURE ORDER = preset menu order: click row -> rnbo~ sidebar -> save snapshot with the row's name."
    }
   },
   {
    "box": {
     "id": "explbl_thedrummer",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      167,
      150,
      20
     ],
     "text": "The Drummer"
    }
   },
   {
    "box": {
     "id": "expmsg_thedrummer",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      160,
      1050,
      34
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
      20,
      211,
      150,
      20
     ],
     "text": "The Dancer"
    }
   },
   {
    "box": {
     "id": "expmsg_thedancer",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      204,
      1050,
      34
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
      20,
      255,
      150,
      20
     ],
     "text": "The Talker"
    }
   },
   {
    "box": {
     "id": "expmsg_thetalker",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      248,
      1050,
      34
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
      20,
      299,
      150,
      20
     ],
     "text": "The Skater"
    }
   },
   {
    "box": {
     "id": "expmsg_theskater",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      292,
      1050,
      34
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
      20,
      343,
      150,
      20
     ],
     "text": "Murmur"
    }
   },
   {
    "box": {
     "id": "expmsg_murmur",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      336,
      1050,
      34
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
      20,
      387,
      150,
      20
     ],
     "text": "Stutter Step"
    }
   },
   {
    "box": {
     "id": "expmsg_stutterstep",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      380,
      1050,
      34
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
      20,
      431,
      150,
      20
     ],
     "text": "Pavement"
    }
   },
   {
    "box": {
     "id": "expmsg_pavement",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      424,
      1050,
      34
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
      20,
      475,
      150,
      20
     ],
     "text": "Vigil"
    }
   },
   {
    "box": {
     "id": "expmsg_vigil",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "patching_rect": [
      180,
      468,
      1050,
      34
     ],
     "text": "idr/cloud 0.2, idr/playspeed 0.5, idr/spmode 6, idr/spA 0.98, idr/spB 1.02, idr/cloudhold 0, idr/sync 0, idr/bpm 120, idr/tapdiv 0.5, idr/lfodiv 1, idr/freezediv 1, idr/tapcount 12, idr/basems 900, idr/mode 4, idr/A 1, idr/B 0.5, idr/fbk 1, idr/lopass 3200, idr/freeze 0, idr/freezelen 2000, idr/lforate 0.04, idr/lfomode 6, idr/lfoA 0.5, idr/lfoB 1.5, idr/lfodepth 0.2, idr/lfoshape 0, idr/morph 0, idr/gateon 0, idr/gatediv 0.25, idr/gatedepth 1, idr/gateduty 0.5, idr/crushbits 16, idr/downsamp 1, idr/evolve 0.65, idr/evolverate 0.015, idr/width 1, idr/panmode 6, idr/panA -1, idr/panB 1, idr/mix 0.85, idr/outgain 1, idr/diffusion 0.85, idr/tapsync 1, idr/lfosync 1, idr/freezesync 1"
    }
   },
   {
    "box": {
     "id": "exp_steps",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      522,
      1150,
      60
     ],
     "text": "EXPORT: 1) double-click gen~ inside rnbo~ and confirm the codebox shows 'Param diffusion' (v1.3). 2) click each row top-to-bottom, saving a named snapshot after each. 3) Export Audio Plugin: name IDIORHYTHM, unique 4-char codes, Effect, VST3+AU, INCLUDE PRESETS checked."
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "expmsg_thedrummer",
      0
     ],
     "destination": [
      "obj-1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expmsg_thedancer",
      0
     ],
     "destination": [
      "obj-1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expmsg_thetalker",
      0
     ],
     "destination": [
      "obj-1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expmsg_theskater",
      0
     ],
     "destination": [
      "obj-1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expmsg_murmur",
      0
     ],
     "destination": [
      "obj-1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expmsg_stutterstep",
      0
     ],
     "destination": [
      "obj-1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expmsg_pavement",
      0
     ],
     "destination": [
      "obj-1",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "expmsg_vigil",
      0
     ],
     "destination": [
      "obj-1",
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
   "inherited_shortname": 1
  },
  "autosave": 0
 }
}