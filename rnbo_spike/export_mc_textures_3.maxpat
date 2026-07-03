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
        "rect": [ 84.0, 136.0, 1000.0, 778.0 ],
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
                    "outlettype": [ "signal", "signal", "list" ],
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
                        "rect": [ 243.0, 196.0, 1000.0, 778.0 ],
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
                                            "classnamespace": "dsp.gen",
                                            "rect": [ 80.0, 80.0, 880.0, 770.0 ],
                                            "boxes": [
                                                {
                                                    "box": {
                                                        "maxclass": "newobj",
                                                        "text": "in 1",
                                                        "patching_rect": [ 40.0, 40.0, 40.0, 22.0 ],
                                                        "numinlets": 0,
                                                        "numoutlets": 1,
                                                        "id": "in1",
                                                        "outlettype": [ "" ]
                                                    }
                                                },
                                                {
                                                    "box": {
                                                        "maxclass": "newobj",
                                                        "text": "in 2",
                                                        "patching_rect": [ 100.0, 40.0, 40.0, 22.0 ],
                                                        "numinlets": 0,
                                                        "numoutlets": 1,
                                                        "id": "in2",
                                                        "outlettype": [ "" ]
                                                    }
                                                },
                                                {
                                                    "box": {
                                                        "maxclass": "codebox",
                                                        "patching_rect": [ 40.0, 90.0, 780.0, 580.0 ],
                                                        "fontname": "<Monospaced>",
                                                        "numinlets": 2,
                                                        "fontface": 0,
                                                        "numoutlets": 2,
                                                        "id": "cb",
                                                        "outlettype": [ "", "" ],
                                                        "fontsize": 11.0,
                                                        "code": "// mc TEXTURES G1 - stereo gen engine (overflow-hardened, dry/wet)\n// 12-tap distribution-driven feedback delay. Per-tap distributed delay (modes incl deviate),\n// per-tap distributed LFO on delay time, pan spread + width, tap-count mask,\n// freeze (recirculate), panic (silence + flush, click-free), dry/wet mix.\n// Param ranges below = the plugin automation limits (host cannot push past them).\nParam mode(6, min=1, max=7);        // 1 exp 2 scaledexp 3 increment 4 harmonic 5 subharm 6 spread 7 deviate\nParam A(1, min=-8, max=8);\nParam B(6, min=0, max=16);\nParam basems(150, min=1, max=2000);\nParam fbk(0.5, min=0, max=0.95);    // hard-capped < 1 = runaway protection\nParam lopass(6000, min=20, max=20000);\nParam lfomode(6, min=1, max=7);\nParam lfoA(1, min=-8, max=8);\nParam lfoB(2, min=0, max=16);\nParam lforate(0.3, min=0, max=20);  // base LFO rate (Hz)\nParam lfodepth(0, min=0, max=1);\nParam lfoshape(0, min=0, max=1);    // P3: 0 = smooth sine, 1 = stepped sample&hold (rhythmic)\nParam panmode(6, min=6, max=7);     // 6 spread (default), 7 deviate\nParam panA(0, min=-1, max=1);\nParam panB(1, min=0, max=1);\nParam width(1, min=0, max=1);       // 0 mono .. 1 full\nParam tapcount(12, min=1, max=12);\nParam mix(0, min=0, max=1);         // 0 = dry (unprocessed original source) .. 1 = fully wet texture\nParam morph(0, min=0, max=1);       // P2 MACRO: 0 = texture (your settings) .. 1 = glitch (short/dry/sparse/static)\nParam crushbits(16, min=1, max=16); // P4: bit depth (16 = clean, low = crushed)\nParam downsamp(1, min=1, max=64);   // P4: sample-rate reduction (1 = full, N = hold N samples)\nParam bpm(120, min=20, max=300);    // P5: host tempo (driven by DAW transport in-plugin)\nParam sync(0, min=0, max=1);        // P5: 0 = free (ms/Hz) .. 1 = lock times to BPM\nParam tapdiv(0.5, min=0.0625, max=8);     // beats per base delay unit (0.5 = 1/8 note)\nParam lfodiv(1, min=0.0625, max=16);      // beats per LFO cycle\nParam freezediv(1, min=0.0625, max=16);   // beats per frozen loop window\nParam gateon(0, min=0, max=1);      // G3: rhythmic amplitude gate on/off (NOT 'gate' - collides w/ tap mask var)\nParam gatediv(0.25, min=0.0156, max=4);   // beats per gate cycle (0.25 = 1/16 at the BPM)\nParam gatedepth(1, min=0, max=1);   // how deep the gate cuts (1 = full chop to silence)\nParam gateduty(0.5, min=0.02, max=0.98);  // open fraction of each cycle (short stabs <-> long)\nParam evolve(0, min=0, max=1);      // G3: autonomous drift depth on tap dist (0 = static, host automation does timed moves)\nParam evolverate(0.05, min=0.001, max=2);  // G3: drift speed (Hz)\nParam outgain(1, min=0, max=2);     // G4: master output level (post-mix, pre soft-limiter)\nParam cloud(0, min=0, max=1);       // CLOUD: capture-replay amount (0 = off, raw input -> matrix)\nParam playspeed(1, min=0.25, max=4);// CLOUD: global playback speed of the re-played input\nParam spmode(6, min=1, max=7);      // CLOUD: per-voice speed distribution (4 harmonic + spA/spB 1 1 = Haiku chord)\nParam spA(0.9, min=-8, max=8);      // CLOUD: speed dist arg A\nParam spB(1.4, min=0, max=16);      // CLOUD: speed dist arg B\nParam cloudhold(0, min=0, max=1);   // CLOUD: 1 = stop recording (freeze the captured buffer for clean looping)\nParam freeze(0, min=0, max=1);      // 1 = stop writing, hold the captured loop\nParam freezelen(2000, min=10, max=2000);  // P1: frozen loop window (ms). long = pad, short = rhythmic stutter\nParam panic(0, min=0, max=1);       // 1 = silence + flush (click-free)\nParam reroll(0, min=0, max=1);      // edge 0->1 refills deviate tables\n\nDelay buf(96000);                   // ~2s @ 48k live shared buffer (= mc.tapin~)\nData cap(96000);                    // FROZEN snapshot loop (true static freeze)\nHistory fbstate(0);\nHistory lpstate(0);\nHistory rrprev(0);\nHistory pnprev(0);\nHistory panctr(0);\nHistory cwpos(0);                   // capture write position (rolling record)\nHistory crpos(0);                   // capture read position (sweeps the frozen loop)\nHistory frzprev(0);\nHistory mgain(1);                   // smoothed output gain (click-free panic)\nHistory fbsm(0);                    // G4 smoothing: feedback (anti-click, no attack cost)\nHistory widsm(1);                   // G4 smoothing: width\nHistory mxsm(0);                    // G4 smoothing: dry/wet mix\nHistory ogsm(1);                    // G4 smoothing: output gain\nHistory dsl(0);                     // P4 sample-rate-reduction hold (L)\nHistory dsr(0);                     // P4 sample-rate-reduction hold (R)\nHistory dscnt(0);                   // P4 downsample counter\nHistory gphase(0);                  // G3 gate phase\nHistory ggain(1);                   // G3 gate gain (smoothed)\nHistory gateprev(0);                // G3 gate enable edge\nHistory evph1(0);                   // G3 evolve drift phase 1\nHistory evph2(0);                   // G3 evolve drift phase 2\nData dev(12);                       // held random, tap deviate\nData pdev(12);                      // held random, pan deviate\nData phase(12);                     // per-tap LFO phase accumulators\nData shval(12);                     // per-tap sample&hold value (P3 stepped LFO)\nData pcap(96000);                   // CLOUD: rolling capture of the live input\nData pph(16);                       // CLOUD: per-voice read phase (samples)\nData spdev(16);                     // CLOUD: held random for speed deviate\nHistory pwpos(0);                   // CLOUD: capture write position\n\ntwopi = 6.28318530718;\nhalfpi = 1.57079632679;\nLcap = 96000;                       // freeze capture loop length (samples)\nLp = 96000;                         // input-capture (cloud) buffer length (~2s @ 48k)\nfbg = clamp(fbk, 0, 0.95);          // belt-and-braces clamps (host or UI out of range)\nfbsm = fbsm + (fbg - fbsm) * 0.004; fbg = fbsm;   // ~5 ms smooth (level only -> no attack loss)\ndep = clamp(lfodepth, 0, 1);\nwid = clamp(width, 0, 1);\nwidsm = widsm + (wid - widsm) * 0.004; wid = widsm;   // smooth width (pan level only)\nfrozen = freeze > 0.5;\n// P5 TEMPO SYNC: when sync on, derive base delay / LFO rate / freeze window from BPM\nbeatms = 60000 / clamp(bpm, 20, 300);\nsynced = sync > 0.5;\nbasems_use    = synced ? (beatms * tapdiv) : basems;\nlforate_use   = synced ? (1000 / (beatms * ((lfodiv < 0.001) ? 0.001 : lfodiv))) : lforate;\nfreezelen_use = synced ? (beatms * freezediv) : freezelen;\nflen = clamp(freezelen_use * samplerate * 0.001, 64, Lcap);   // frozen loop window in samples\n// P2 MORPH MACRO: derive effective values from one knob. morph 0 = exactly the user's settings.\nmph    = clamp(morph, 0, 1);\nbase_e = basems_use * (1 - 0.92 * mph);      // delays shrink toward short slaps\nfbg_e  = fbg * (1 - mph);                     // feedback drops to 0 (no wash)\ndep_e  = dep * (1 - mph);                     // LFO drift fades out\ntc_e   = tapcount * (1 - mph) + 2 * mph;      // taps thin toward sparse/rhythmic\nnact   = clamp(ceil(tc_e), 1, 12);            // # active taps -> spread pan over THESE (keeps L/R balanced)\n// G3 EVOLVE: autonomous slow drift on tap-distribution args = the 'breathing' evolving character.\nevd    = clamp(evolve, 0, 1);                  // 0 = off (static at user A/B)\nerate  = clamp(evolverate, 0.001, 2);          // drift speed (Hz)\nevph1  = evph1 + erate / samplerate;        evph1 = evph1 - floor(evph1);\nevph2  = evph2 + erate * 0.37 / samplerate;  evph2 = evph2 - floor(evph2);   // incommensurate = organic\nAev    = clamp(A + evd * sin(evph1 * twopi) * 3, -8, 8);    // drift ±3 around user A\nBev    = clamp(B + evd * sin(evph2 * twopi) * 3, 0, 16);    // drift ±3 around user B (>=0 keeps pow safe)\n\n// reroll rising edge -> refill held-random tables\nif (reroll > rrprev) {\n\tfor (k = 0; k < 12; k += 1) {\n\t\tdev.poke(noise(), k);\n\t\tpdev.poke(noise(), k);\n\t}\n\tfor (k = 0; k < 16; k += 1) { spdev.poke(noise(), k); }   // CLOUD speed deviate\n}\nrrprev = reroll;\n\n// panic: rising edge starts a one-buffer flush; held level also forces silence.\nif (panic > pnprev) { panctr = 96000; }\npnprev = panic;\nflushing = panctr > 0;\nif (panctr > 0) { panctr = panctr - 1; }\npanik = (panic > 0.5) || flushing;\n\n// feedback state: SANITIZE to recover from NaN/Inf without reopening the patcher\nfb = fbstate;\nfb = (fb == fb) ? fb : 0;            // NaN != NaN  -> reset to 0\nfb = clamp(fb, -1.5, 1.5);           // Inf -> bounded\n\n// CAPTURE-REPLAY CLOUD (Haiku-style): record live input, re-play 16 voices at distributed speeds.\nrawmono = (in1 + in2) * 0.5;\ncl = clamp(cloud, 0, 1);\nif (cloudhold < 0.5) {                 // record (unless held)\n\tpcap.poke(rawmono, pwpos);\n\tpwpos = pwpos + 1;\n\tpwpos = (pwpos >= Lp) ? 0 : pwpos;\n}\ncloudsum = 0;\nfor (v = 0; v < 16; v += 1) {\n\tvf = v / 15;\n\tsr = 1;\n\tif (spmode == 1)      { sr = pow(spB, spA * v); }\n\telse if (spmode == 2) { sr = pow(spB, spA * v / 12); }\n\telse if (spmode == 3) { sr = spB + spA * v; }\n\telse if (spmode == 4) { sr = spB * (v + 1) * spA; }   // harmonic -> 1x,2x,3x... chord\n\telse if (spmode == 5) { sr = spB / (v + 1) * spA; }\n\telse if (spmode == 7) { sr = spB + spdev.peek(v) * spA; }\n\telse                  { sr = spA + (spB - spA) * vf; }\n\tpv = pph.peek(v) + playspeed * sr;\n\tpv = pv - Lp * floor(pv / Lp);\n\tpph.poke(pv, v);\n\tpi0 = floor(pv);\n\tpfr = pv - pi0;\n\tpi1 = (pi0 + 1 >= Lp) ? 0 : pi0 + 1;\n\tcloudsum += pcap.peek(pi0) * (1 - pfr) + pcap.peek(pi1) * pfr;\n}\ncloudmono = cloudsum * 0.0625;          // /16\nmatsrc = (1 - cl) * rawmono + cl * cloudmono;   // matrix source = raw blended with cloud\ndryL = (1 - cl) * in1 + cl * cloudmono;          // dry path follows the source (cloud at amount>0)\ndryR = (1 - cl) * in2 + cl * cloudmono;\n\n// write head: source + lowpassed feedback. freeze = stop writing (read frozen cap); panic = silence.\nsrc = matsrc;\nsrc = frozen ? 0 : src;\nfbamt = frozen ? 0 : fbg_e;\nsrc = panik ? 0 : src;\nfbamt = panik ? 0 : fbamt;\nwr = clamp(src + fb * fbamt, -2, 2);\nbuf.write(wr);\n\n// TRUE FREEZE: mirror the live stream into cap while running; on freeze stop writing it\n// and sweep a read PHASE over a window of 'flen' samples -> eternal hold (long) or stutter (short).\nif (frozen && (frzprev < 0.5)) { crpos = 0; }   // restart the loop phase at freeze onset\nfrzprev = freeze;\nif (frozen) {\n\tcrpos = crpos + 1;\n\tcrpos = (crpos >= flen) ? 0 : crpos;        // P1: wrap over the window length (retrigger)\n} else {\n\tcap.poke(wr, cwpos);\n\tcwpos = cwpos + 1;\n\tcwpos = (cwpos >= Lcap) ? 0 : cwpos;\n}\n\nsumL = 0;\nsumR = 0;\nfor (i = 0; i < 12; i += 1) {\n\tfrac = i / 11;\n\n\t// --- per-tap delay ratio by mode ---\n\tratio = 1;\n\tif (mode == 1)      { ratio = pow(Bev, Aev * i); }       // exponential\n\telse if (mode == 2) { ratio = pow(Bev, Aev * i / 12); }  // scaledexponential\n\telse if (mode == 3) { ratio = Bev + Aev * i; }           // increment\n\telse if (mode == 4) { ratio = Bev * (i + 1) * Aev; }     // harmonic\n\telse if (mode == 5) { ratio = Bev / (i + 1) * Aev; }     // subharmonic\n\telse if (mode == 7) { ratio = Bev + dev.peek(i) * Aev; } // deviate (B=center, A=range)\n\telse                { ratio = Aev + (Bev - Aev) * frac; }// spread (default)\n\n\t// --- per-tap LFO rate by lfomode ---\n\tlr = 1;\n\tif (lfomode == 1)      { lr = pow(lfoB, lfoA * i); }\n\telse if (lfomode == 2) { lr = pow(lfoB, lfoA * i / 12); }\n\telse if (lfomode == 3) { lr = lfoB + lfoA * i; }\n\telse if (lfomode == 4) { lr = lfoB * (i + 1) * lfoA; }\n\telse if (lfomode == 5) { lr = lfoB / (i + 1) * lfoA; }\n\telse                   { lr = lfoA + (lfoB - lfoA) * frac; }\n\tph = phase.peek(i) + lforate_use * lr / samplerate;\n\twrapped = ph >= 1;                    // crossed a cycle this sample\n\tph = ph - floor(ph);\n\tphase.poke(ph, i);\n\tif (wrapped) { shval.poke(noise(), i); }   // S&H: latch a new random per cycle\n\t// lfoshape: 0 = smooth sine (evolving), 1 = stepped random (rhythmic/glitch)\n\tlfo = (lfoshape > 0.5) ? shval.peek(i) : sin(ph * twopi);\n\n\t// --- modulated tap time -> read (dsamp clamp protects the read index) ---\n\tmodms = base_e * (1 + lfo * dep_e);\n\tdsamp = ratio * modms * samplerate * 0.001;\n\tdsamp = clamp(dsamp, 1, 95000);\n\n\tgate = (i < tc_e) ? 1 : 0;\n\t// frozen: linear-interp read from the cap window [cwpos-flen, cwpos); live: read the Delay buffer\n\trphase = crpos - dsamp;\n\trphase = rphase - flen * floor(rphase / flen);   // wrap into [0, flen) (window-relative)\n\tridx = cwpos - flen + rphase;                    // absolute index into cap\n\tridx = ridx - Lcap * floor(ridx / Lcap);         // wrap into the buffer\n\tci0 = floor(ridx);\n\tcfr = ridx - ci0;\n\tci1 = (ci0 + 1 >= Lcap) ? 0 : ci0 + 1;\n\tcs = cap.peek(ci0) * (1 - cfr) + cap.peek(ci1) * cfr;\n\ts = (frozen ? cs : buf.read(dsamp)) * gate;\n\n\t// --- pan position: spread ACTIVE taps across the field (balanced at any tap count) ---\n\tpanfrac = (nact > 1) ? (i / (nact - 1)) : 0.5;\n\tpan = panA + (panB - panA) * panfrac;\n\tif (panmode == 7) { pan = panB + pdev.peek(i) * panA; }\n\tpan = 0.5 + (pan - 0.5) * wid;\n\tpan = clamp(pan, 0, 1);\n\tsumL += s * cos(pan * halfpi);\n\tsumR += s * sin(pan * halfpi);\n}\nsumL = sumL * 0.08333333;\nsumR = sumR * 0.08333333;\n\n// mono-sum feedback through one-pole lopass, sanitized\nmono = (sumL + sumR) * 0.5;\ncoef = clamp(lopass / samplerate, 0, 0.5);\nlpst = lpstate + coef * (mono - lpstate);\nlpst = (lpst == lpst) ? lpst : 0;\nlpst = clamp(lpst, -1.5, 1.5);\nlpstate = lpst;\nfbstate = lpst;\n\n// dry/wet mix (mix 0 = unprocessed original source) + click-free output gain\nmx = clamp(mix, 0, 1);\nmxsm = mxsm + (mx - mxsm) * 0.004; mx = mxsm;   // smooth dry/wet (blend level only)\nwetL = clamp(sumL, -1, 1);\nwetR = clamp(sumR, -1, 1);\n\n// P4 CRUSH: bit-depth + sample-rate reduction on the WET signal only (dry stays clean)\nqstep = 2 / pow(2, clamp(crushbits, 1, 16));      // bits 16 = transparent .. 1 = heavy\nwetL = round(wetL / qstep) * qstep;\nwetR = round(wetR / qstep) * qstep;\nds = clamp(floor(downsamp), 1, 64);               // 1 = full SR .. N = hold N samples (aliasing grit)\ndscnt = dscnt + 1;\nif (dscnt >= ds) { dsl = wetL; dsr = wetR; dscnt = 0; }\nwetL = dsl;\nwetR = dsr;\n\nmtarget = panik ? 0 : 1;\nmgain = mgain + (mtarget - mgain) * 0.002;   // ~10 ms ramp @ 48k\n\n// G3 GATE: tempo-relative rhythmic amplitude gate (click-free). rate = bpm * gatediv.\ngrate = 1000 / (beatms * ((gatediv < 0.0156) ? 0.0156 : gatediv));   // Hz (always bpm-relative)\nif ((gateon > 0.5) && (gateprev < 0.5)) { gphase = 0; }              // restart on enable\ngateprev = gateon;\ngphase = gphase + grate / samplerate;\ngphase = gphase - floor(gphase);\npulse = (gphase < clamp(gateduty, 0.02, 0.98)) ? 1 : 0;              // duty = open fraction\ngtarget = (gateon > 0.5) ? (1 - clamp(gatedepth, 0, 1) * (1 - pulse)) : 1;\nggain = ggain + (gtarget - ggain) * 0.01;                            // ~few ms smoothing\nog = mgain * ggain;\nmixL = (dryL * (1 - mx) + wetL * mx) * og;\nmixR = (dryR * (1 - mx) + wetR * mx) * og;\n// G4 OUTPUT: master gain + soft limiter (tanh = smooth 0 dBFS ceiling, gentle saturation when pushed)\nogsm = ogsm + (outgain - ogsm) * 0.002;   // smooth master gain (~10 ms; protects monitors from level jumps)\nout1 = tanh(mixL * ogsm);\nout2 = tanh(mixR * ogsm);\n"
                                                    }
                                                },
                                                {
                                                    "box": {
                                                        "maxclass": "newobj",
                                                        "text": "out 1",
                                                        "patching_rect": [ 40.0, 690.0, 40.0, 22.0 ],
                                                        "numinlets": 1,
                                                        "numoutlets": 0,
                                                        "id": "out1"
                                                    }
                                                },
                                                {
                                                    "box": {
                                                        "maxclass": "newobj",
                                                        "text": "out 2",
                                                        "patching_rect": [ 100.0, 690.0, 40.0, 22.0 ],
                                                        "numinlets": 1,
                                                        "numoutlets": 0,
                                                        "id": "out2"
                                                    }
                                                }
                                            ],
                                            "lines": [
                                                {
                                                    "patchline": {
                                                        "source": [ "cb", 1 ],
                                                        "destination": [ "out2", 0 ]
                                                    }
                                                },
                                                {
                                                    "patchline": {
                                                        "source": [ "cb", 0 ],
                                                        "destination": [ "out1", 0 ]
                                                    }
                                                },
                                                {
                                                    "patchline": {
                                                        "source": [ "in2", 0 ],
                                                        "destination": [ "cb", 1 ]
                                                    }
                                                },
                                                {
                                                    "patchline": {
                                                        "source": [ "in1", 0 ],
                                                        "destination": [ "cb", 0 ]
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "id": "obj-5",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "signal", "signal" ],
                                    "patching_rect": [ 128.0, 229.0, 209.0, 23.0 ],
                                    "rnbo_classname": "gen~",
                                    "rnbo_extra_attributes": {
                                        "exposeparams": 0
                                    },
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
                                                "aliases": [ "t" ],
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
                                    "text": "gen~ @file texture_gen_stereo.gendsp"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 78.0, 150.0, 43.0, 23.0 ],
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
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 78.0, 63.0, 35.0, 23.0 ],
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
                                    "patching_rect": [ 22.0, 150.0, 43.0, 23.0 ],
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
                                    "outlettype": [ "signal" ],
                                    "patching_rect": [ 22.0, 63.0, 35.0, 23.0 ],
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
                            }
                        ],
                        "lines": []
                    },
                    "patching_rect": [ 331.0, 303.0, 40.0, 22.0 ],
                    "rnboattrcache": {                    },
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
                            "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
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
                                        "__presetid": "f71a7465-7183-11f1-b465-466678cd98a6"
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
            }
        ],
        "lines": [],
        "parameters": {
            "obj-1": [ "rnbo~", "rnbo~", 0 ],
            "parameterbanks": {
                "0": {
                    "index": 0,
                    "name": "",
                    "parameters": [ "-", "-", "-", "-", "-", "-", "-", "-" ],
                    "buttons": [ "-", "-", "-", "-", "-", "-", "-", "-" ]
                }
            },
            "inherited_shortname": 1
        },
        "autosave": 0
    }
}