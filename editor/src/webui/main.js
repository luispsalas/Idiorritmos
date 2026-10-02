import { getSliderState, getToggleState } from 'juce-framework-frontend';

/* ============================================================================
   IDIORRITMOS — Tier-2 web editor (J5 port of gui_mockup_tier2.html)
   Controls are discovered from the <em>paramName</em> badges in the layout.
   Each param binds to the C++ relay named idr_<param>; sliders operate in
   normalized 0..1 (matches the relay). The visualizations read a live NORM{}
   map (synthetic data) — real audio-driven data arrives with the JV-hook.
   ========================================================================== */

// engine [min,max] per param (gen declaration order / frozen v1.3.3 set)
const RANGE = {
  cloud:[0,1], playspeed:[0.25,4], spmode:[1,7], spA:[-8,8], spB:[0,16], cloudhold:[0,1],
  sync:[0,1], bpm:[20,300], tapdiv:[0.0625,8], lfodiv:[0.0625,16], freezediv:[0.0625,16],
  tapsync:[0,1], lfosync:[0,1], freezesync:[0,1],
  tapcount:[1,12], basems:[1,2000], mode:[1,7], A:[-8,8], B:[0,16], fbk:[0,1],
  lopass:[20,20000], diffusion:[0,1], freeze:[0,1], freezelen:[10,2000],
  lforate:[0,20], lfomode:[1,7], lfoA:[-8,8], lfoB:[0,16], lfodepth:[0,1], lfoshape:[0,1],
  morph:[0,1], gateon:[0,1], gatediv:[0.0156,4], gatedepth:[0,1], gateduty:[0.02,0.98],
  crushbits:[1,16], downsamp:[1,64], evolve:[0,1], evolverate:[0.001,2],
  width:[0,1], panmode:[6,7], panA:[-1,1], panB:[0,1], mix:[0,1], outgain:[0,2],
  panic:[0,1], reroll:[0,1],
};
// musical-division option value tables (engine units) for the div selects
const DIVS = {
  tapdiv:   [0.25, 0.5, 1, 2, 4, 6, 8],
  lfodiv:   [0.25, 0.5, 1, 2, 4, 8],
  freezediv:[0.25, 0.5, 1, 2, 4],
  gatediv:  [0.03125, 0.0625, 0.125, 0.25, 0.5],
};
const GHINT = [
 'B^(A·i) · geometric · A=exponent (±=accel/decel) · B=base',
 'B^(A·i/12) · geometric, count-normalized · gentler',
 'B+A·i · linear steps · A=step · B=first',
 'B·A·(i+1) · harmonic ×1×2×3 · B=fund · A=mult',
 'B·A÷(i+1) · subharmonic ÷1÷2÷3 · B=fund · A=mult',
 'A→B · even linear fan (first→last pulse)',
 'B±A·rand · held random · B=center · A=spread · RE-ROLL redraws'];

const NORM = {};                       // normalized live values, keyed by param
const rid = p => 'idr_' + p;
const norm   = (p,v)=>{const[a,b]=RANGE[p];return (v-a)/(b-a);};
const scaled = (p,n)=>{const[a,b]=RANGE[p];return a+n*(b-a);};
const nearestIdx = (vals,v)=>{let best=0,bd=1e9;vals.forEach((x,i)=>{const d=Math.abs(x-v);if(d<bd){bd=d;best=i;}});return best;};
const $ = id => document.getElementById(id);

/* ---------- binders (each wrapped so one bad relay can't kill the rest) ---- */
// Display-inverted sliders: engine crushbits 16=clean/1=brutal, but "Grit" should
// read 0%=clean → slider shows 1-norm both directions (param itself unchanged).
const INVERT = new Set(['crushbits']);
function bindSlider(p, input){
  input.min=0; input.max=1; input.step=0.001;
  const inv=INVERT.has(p);
  const st=getSliderState(rid(p));
  const upd=()=>{const n=st.getNormalisedValue();NORM[p]=n;input.value=inv?1-n:n;};
  st.valueChangedEvent.addListener(upd); upd();
  input.addEventListener('mousedown', ()=>st.sliderDragStarted());
  input.addEventListener('touchstart',()=>st.sliderDragStarted(),{passive:true});
  input.addEventListener('mouseup',   ()=>st.sliderDragEnded());
  input.addEventListener('touchend',  ()=>st.sliderDragEnded());
  input.addEventListener('input', ()=>{let n=parseFloat(input.value); if(inv)n=1-n; NORM[p]=n;st.setNormalisedValue(n);});
}
function bindToggle(p, cb){
  const st=getToggleState(rid(p));
  const upd=()=>{cb.checked=st.getValue();NORM[p]=cb.checked?1:0;};
  st.valueChangedEvent.addListener(upd); upd();
  cb.addEventListener('change',()=>{st.setValue(cb.checked);NORM[p]=cb.checked?1:0;});
}
function bindGait(p, sel){
  const st=getSliderState(rid(p));
  const hint=sel.parentElement.querySelector('.gaithint');
  const setHint=()=>{ if(hint) hint.textContent=GHINT[sel.selectedIndex]; };
  const upd=()=>{ let i=Math.round(scaled(p,st.getNormalisedValue()))-1; i=Math.max(0,Math.min(6,i)); sel.selectedIndex=i; setHint(); };
  st.valueChangedEvent.addListener(upd); upd();
  sel.addEventListener('change',()=>{ st.setNormalisedValue(norm(p,sel.selectedIndex+1)); setHint(); });
}
function bindValueSelect(p, sel, vals){          // enum-2 / division selects → slider relay
  const st=getSliderState(rid(p));
  const upd=()=>{ sel.selectedIndex=nearestIdx(vals,scaled(p,st.getNormalisedValue())); };
  st.valueChangedEvent.addListener(upd); upd();
  sel.addEventListener('change',()=>st.setNormalisedValue(norm(p,vals[sel.selectedIndex])));
}
function bindToggleSelect(p, sel){               // 2-option select → toggle relay (lfoshape)
  const st=getToggleState(rid(p));
  const upd=()=>{ const on=st.getValue(); sel.selectedIndex=on?1:0; NORM[p]=on?1:0; };
  st.valueChangedEvent.addListener(upd); upd();
  sel.addEventListener('change',()=>{ const on=sel.selectedIndex===1; st.setValue(on); NORM[p]=on?1:0; });
}
function bindKnob(p, knob){
  const st=getSliderState(rid(p));
  const kp=knob.querySelector('.kp'), kv=knob.parentElement.querySelector('.kv');
  let n=0;
  const render=()=>{ kp.style.transform='rotate('+(-135+270*n)+'deg)'; kv.textContent=Math.round(scaled(p,n)*100)+'%'; };
  const upd=()=>{ n=st.getNormalisedValue(); NORM[p]=n; render(); };
  st.valueChangedEvent.addListener(upd); upd();
  knob.addEventListener('mousedown',e=>{
    e.preventDefault(); st.sliderDragStarted();
    const y0=e.clientY, n0=n;
    const mv=ev=>{ n=Math.max(0,Math.min(1,n0+(y0-ev.clientY)/150)); NORM[p]=n; st.setNormalisedValue(n); render(); };
    const up=()=>{ document.removeEventListener('mousemove',mv); document.removeEventListener('mouseup',up); st.sliderDragEnded(); };
    document.addEventListener('mousemove',mv); document.addEventListener('mouseup',up);
  });
}
function bindTrigger(p, btn, extra){             // momentary: 0→1→0 rising edge (panic/reroll)
  const st=getToggleState(rid(p));
  btn.addEventListener('click',()=>{ st.setValue(true); if(extra)extra(); setTimeout(()=>st.setValue(false),60); });
}
function bindHold(p, btn, onLabel, offLabel){    // freeze/chop toggle button
  const st=getToggleState(rid(p));
  const upd=()=>{ const on=st.getValue(); btn.classList.toggle('on',on); NORM[p]=on?1:0;
    if(onLabel) btn.textContent=on?onLabel:offLabel; };
  st.valueChangedEvent.addListener(upd); upd();
  btn.addEventListener('click',()=>st.setValue(!st.getValue()));
}
const safe = fn => { try{ fn(); }catch(e){ console.warn('bind failed:',e); } };

/* ---------- discovery: bind every control carrying an <em> badge ---------- */
document.querySelectorAll('.lb, .tglrow').forEach(host=>{
  const em = host.querySelector(':scope > em');
  if(!em) return;
  const p = em.textContent.trim();
  if(!RANGE[p]) return;
  if(host.classList.contains('tglrow')){
    safe(()=>bindToggle(p, host.querySelector('input[type=checkbox]')));
    return;
  }
  const box = host.parentElement;                        // .ctl / .knobwrap
  const range = box.querySelector('input[type=range]');
  const knob  = box.querySelector('.knob');
  const sel   = box.querySelector('select');
  if(range)      safe(()=>bindSlider(p, range));
  else if(knob)  safe(()=>bindKnob(p, knob));
  else if(sel){
    if(sel.dataset.p) return;                            // div selects handled below
    if(sel.classList.contains('gaitsel')) safe(()=>bindGait(p, sel));
    else if(p==='panmode')  safe(()=>bindValueSelect(p, sel, [6,7]));
    else if(p==='lfoshape') safe(()=>bindToggleSelect(p, sel));
  }
});
// division selects (Stride/Sway/Freeze/Chop) — bound by data-p, no <em>
document.querySelectorAll('select[data-p]').forEach(sel=>{
  const p=sel.dataset.p; if(DIVS[p]) safe(()=>bindValueSelect(p, sel, DIVS[p]));
});
// buttons — PANIC is LATCHING: on = flush + hold silence; off = fade back in
safe(()=>bindHold('freeze', $('frz'), 'FROZEN', 'FREEZE'));
safe(()=>bindHold('gateon', $('chop')));
safe(()=>bindHold('panic',  $('panic')));

// BYPASS = UI macro on Mix (Mix 0 = true clean bypass since v1.3.2): stores the
// current Mix, ramps it to 0 (engine smooths ~5 ms), restores on release.
safe(()=>{
  const byp=$('bypass'), mixState=getSliderState(rid('mix'));
  let prevMix=null;
  byp.addEventListener('click',()=>{
    const on=!byp.classList.contains('on');
    byp.classList.toggle('on',on);
    if(on){ prevMix=mixState.getNormalisedValue(); mixState.setNormalisedValue(0); }
    else if(prevMix!=null){ mixState.setNormalisedValue(prevMix); prevMix=null; }
  });
});

/* ---------- DETAILS toggle + uniform UI scale ---------- */
$('ids').addEventListener('change', e=>document.body.classList.toggle('showids', e.target.checked));
const usc=$('uiscale'), app=$('app');
function applyScale(){
  app.style.zoom=1;
  const baseH=app.offsetHeight||700;
  const f = usc.value==='fit'
    ? Math.max(0.5, Math.min(2, Math.min((innerWidth-16)/1170, (innerHeight-16)/baseH)))
    : (+usc.value)/100;
  app.style.zoom=f;
  setTimeout(()=>dispatchEvent(new Event('resize')),0);
}
usc.addEventListener('change', applyScale);
addEventListener('resize', ()=>{ if(usc.value==='fit') applyScale(); });

/* ---------- beat LEDs (cosmetic placeholder — real via AudioPlayHead, J7) -- */
const leds=[...document.querySelectorAll('.led')]; let li=0;
setInterval(()=>{ li=(li+1)%4; leds.forEach((l,i)=>l.classList.toggle('on',i===li)); },500);

/* ========================================================================== */
/* Visualizations — synthetic data driven by the live NORM{} map + selects.   */
/* ========================================================================== */
const gaitSel=$('gaitTap'), placeSel=$('place'), swSel=$('swshape'), chopBtn=$('chop');
const R = k => NORM[k] ?? 0;
const tapN = () => Math.max(1, Math.round(1 + R('tapcount')*11));

// JV-hook: real audio analysis pushed from C++ at 30 Hz. Scope/gonio/spectrum/
// energy use it when fresh; otherwise they fall back to synthetic (e.g. no host,
// browser preview). The tap constellation stays param-derived either way.
// --- BPM: editable field bound to idr/bpm (the free-run / fallback tempo).
// Shows the host tempo when METER LOCK (sync) is on AND the transport is playing;
// editable (wheel / spinner / type) to set the manual tempo when free-running. ---
const bpmField = document.getElementById('bpmfield');
let hostBpm=120, hostPlaying=false, hostAt=0, bpmState=null;
try{ bpmState = getSliderState('idr_bpm'); }catch(e){ console.warn('bpm state:',e); }
// Simple rule (no sync condition): transport PLAYING → field mirrors the host
// tempo (read-only); transport STOPPED → field is the manual tempo control
// (writes idr/bpm). The engine independently decides what it uses per domain.
function renderBpm(){
  if(!bpmField) return;
  const hostDriven = hostPlaying && (performance.now()-hostAt < 700);
  bpmField.readOnly = hostDriven;
  bpmField.style.opacity = hostDriven ? 0.75 : 1;
  if(document.activeElement===bpmField && !hostDriven) return;   // don't fight typing
  const v = hostDriven ? hostBpm : (bpmState ? bpmState.getScaledValue() : 120);
  bpmField.value = (isFinite(v)?v:120).toFixed(1);
}
setInterval(renderBpm, 500);   // keep readonly/value honest even if events pause
function setBpm(v){ v=Math.max(20,Math.min(300,v)); if(bpmState) bpmState.setNormalisedValue(norm('bpm', v)); }
if(bpmField){
  if(bpmState) bpmState.valueChangedEvent.addListener(renderBpm);
  bpmField.addEventListener('input', ()=>{ const v=parseFloat(bpmField.value); if(!isNaN(v)) setBpm(v); });
  bpmField.addEventListener('blur', renderBpm);
  bpmField.addEventListener('wheel', e=>{ e.preventDefault(); const step=e.shiftKey?1:0.1;
    let v=(parseFloat(bpmField.value)||120) - Math.sign(e.deltaY)*step;
    v=Math.max(20,Math.min(300,Math.round(v*10)/10)); bpmField.value=v.toFixed(1); setBpm(v); }, {passive:false});
}

// --- Preset menu: populated from the C++ payload (RNBO presets = JUCE programs,
// index 0 = "Initial"); selecting emits setPreset back to the processor. ---
const presetSel=$('preset'); let presetNames=null;
if(presetSel) presetSel.addEventListener('change',()=>{
  try{ window.__JUCE__.backend.emitEvent('setPreset',{index:presetSel.selectedIndex}); }catch(e){}
});

let REAL=null, realAt=0;
try{
  if(window.__JUCE__ && window.__JUCE__.backend)
    window.__JUCE__.backend.addEventListener('viz', d=>{ REAL=d; realAt=performance.now();
      if(d && d.bpm!=null){ hostBpm=+d.bpm; hostPlaying=!!d.playing; hostAt=performance.now(); renderBpm(); }
      if(d && d.presets && presetSel){
        if(!presetNames || presetNames.length!==d.presets.length){
          presetNames=d.presets; presetSel.innerHTML='';
          d.presets.forEach(n=>{ const o=document.createElement('option'); o.textContent=n; presetSel.appendChild(o); });
        }
        if(d.preset!=null && document.activeElement!==presetSel && presetSel.selectedIndex!==d.preset)
          presetSel.selectedIndex=d.preset;
      } });
}catch(e){ console.warn('viz subscribe failed:',e); }
const realFresh = () => REAL && (performance.now()-realAt < 400);
renderBpm();

const N=12, rnd=[], rndp=[];
function scatter(){ for(let i=0;i<N;i++){ rnd[i]=Math.random()*2-1; rndp[i]=Math.random()*2-1; } }
scatter();
safe(()=>bindTrigger('reroll', $('reroll'), scatter));

const root=document.documentElement, cv=v=>getComputedStyle(root).getPropertyValue(v).trim();
function fit(c,h){ const r=c.getBoundingClientRect(), d=Math.min(2,devicePixelRatio||1);
  c.width=r.width*d; c.height=h*d; const x=c.getContext('2d'); x.setTransform(d,0,0,d,0,0);
  c._w=r.width; c._h=h; return x; }
const constel=$('constel'), spec=$('spectrum'), gonio=$('gonio'), scope=$('scope');
let cx=fit(constel,132), px=fit(spec,48), gx=fit(gonio,128), sx=fit(scope,56);
addEventListener('resize',()=>{ cx=fit(constel,132); px=fit(spec,48); gx=fit(gonio,128); sx=fit(scope,56); });

let phase=0, tprev=performance.now(), held=null;
function taps(){
 const g=gaitSel.selectedIndex, n=tapN(), m=R('morph'), ev=R('evolve'), w=R('width'),
  scat=placeSel.selectedIndex===1, fb=R('fbk'), swd=R('lfodepth'), step=swSel.selectedIndex===1;
 const nact=Math.max(1,Math.round(n*(1-m)+2*m));
 const out=[];
 for(let i=0;i<N;i++){
  let ratio;
  if(g===0)ratio=Math.pow(1.5,i)/Math.pow(1.5,N-1)*N;
  else if(g===1)ratio=Math.pow(1.5,i/2)/Math.pow(1.5,(N-1)/2)*N;
  else if(g===2)ratio=1+i;
  else if(g===3)ratio=(i+1);
  else if(g===4)ratio=N/(i+1);
  else if(g===6)ratio=1+i+rnd[i]*3;
  else ratio=1+i;
  let t=ratio/(N+2);
  t+=Math.sin(phase*0.6+i*1.7)*ev*0.06;
  let sw=Math.sin(phase*3+i*2.1); if(step)sw=Math.sign(sw);
  t+=sw*swd*0.03;
  t=Math.max(0.02,Math.min(0.98,t));
  let pan=scat?rndp[i]:(nact>1?(i/(nact-1))*2-1:0);
  pan*=w;
  const lvl=Math.pow(Math.max(fb,0.15),i*0.35)*(i<nact?1:0)*(1-m*0.35);
  out.push({t,pan,lvl});
 }
 return out;
}
function grid(x,w,h,r,c){ x.strokeStyle=cv('--grid'); x.lineWidth=1; x.globalAlpha=.8;
 for(let i=1;i<r;i++){const y=h*i/r;x.beginPath();x.moveTo(0,y);x.lineTo(w,y);x.stroke();}
 for(let i=1;i<c;i++){const xx=w*i/c;x.beginPath();x.moveTo(xx,0);x.lineTo(xx,h);x.stroke();}
 x.globalAlpha=1; }
function drawConstel(T){ const w=constel._w,h=constel._h,pad=14,frz=window.__frozen;
 cx.clearRect(0,0,w,h); grid(cx,w,h,4,8);
 for(const tp of T){ if(tp.lvl<=0)continue;
  const X=pad+tp.t*(w-pad*2), Y=h/2-tp.pan*(h/2-10), r=2+tp.lvl*7;
  cx.beginPath();cx.arc(X,Y,r,0,7);
  cx.fillStyle=cv('--tap');cx.globalAlpha=0.25+tp.lvl*0.7;cx.fill();
  cx.globalAlpha=1;cx.strokeStyle=cv('--tap');cx.lineWidth=1;cx.stroke();
  if(frz){cx.globalAlpha=.45;cx.beginPath();cx.arc(X,Y,r+3,0,7);cx.stroke();cx.globalAlpha=1;} }
 if(frz){cx.fillStyle=cv('--out');cx.font='bold 9px '+cv('--font-mono');cx.fillText('❄ FROZEN',w-58,12);} }
const NB=40, sb=new Float32Array(NB);
function drawSpec(T){ const w=spec._w,h=spec._h; px.clearRect(0,0,w,h); grid(px,w,h,2,10);
 const real=realFresh() && REAL.spec;
 const tone=R('lopass'), wash=R('diffusion'), fb=R('fbk');
 for(let b=0;b<NB;b++){
  let t;
  if(real){ t=REAL.spec[b] ?? 0; }
  else{
   t=Math.exp(-b*(0.16-tone*0.12))*(0.3+fb*0.6);
   for(const tp of T)t+=tp.lvl*Math.exp(-Math.pow(b-(2+tp.t*NB*0.7),2)*(0.14-wash*0.12))*0.10;
   t=Math.min(1,t*(0.85+Math.sin(phase*3+b)*0.05));
  }
  sb[b]+=(t-sb[b])*(real?0.4:0.2);
  const bw=w/NB,bh=sb[b]*h*0.92;
  px.fillStyle=cv('--tap');px.globalAlpha=0.3+sb[b]*0.6;
  px.fillRect(b*bw+1,h-bh,bw-2,bh);px.globalAlpha=1; } }
// SPACE goniometer = the spike's clean synthetic Lissajous (motion trail + blue
// stroke), opened by Width, morphed by Mix & Morph. (The JV-hook still emits a
// real L/R goniometer in REAL.gonio if we ever want the true-stereo version back.)
let gt=0;
function drawGonio(){ const w=gonio._w,h=gonio._h;
 gx.fillStyle=cv('--surface-2'); gx.globalAlpha=0.28; gx.fillRect(0,0,w,h); gx.globalAlpha=1;  // trail
 const width=R('width'), mix=R('mix'), morph=R('morph');
 const cxp=w/2, cyp=h/2, Rr=Math.min(w,h)*0.42, NP=256;
 gx.beginPath();
 for(let i=0;i<NP;i++){ const ang=(i/NP)*Math.PI*2;
  const wob=1+0.35*morph*Math.sin(ang*5+gt*3);
  const x=cxp+Math.cos(ang*2+gt)*Rr*(0.4+0.6*width)*wob;
  const y=cyp+Math.sin(ang*3+gt*1.3)*Rr*(0.4+0.6*mix)*wob;
  i?gx.lineTo(x,y):gx.moveTo(x,y);
 }
 gx.closePath(); gx.strokeStyle=cv('--tap'); gx.lineWidth=1.4; gx.stroke();
 gt+=0.03; }
const SB=420, bin=new Float32Array(SB), bout=new Float32Array(SB); let sp=0, pluck=1;
function drawScope(T,dt){ const w=scope._w,h=scope._h;
 sx.clearRect(0,0,w,h); grid(sx,w,h,2,10);
 const trArr=(arr,col)=>{ const n=arr.length; sx.strokeStyle=col; sx.lineWidth=1.4; sx.beginPath();
  for(let i=0;i<n;i++){const xx=i/(n-1)*w,yy=h/2-arr[i]*h*0.42;i?sx.lineTo(xx,yy):sx.moveTo(xx,yy);}sx.stroke(); };
 if(realFresh() && REAL.inScope){ trArr(REAL.inScope,cv('--in')); trArr(REAL.outScope,cv('--out')); return; }
 // synthetic fallback
 pluck-=dt*0.0012; if(pluck<0)pluck=1;
 const mx=R('mix'), fb=R('fbk');
 const inS=Math.sin(phase*38)*Math.exp(-(1-pluck)*3.5)*0.8;
 let tex=0; for(const tp of T)tex+=Math.sin((phase-tp.t*0.4)*38)*Math.exp(-(1-pluck)*(2.2-fb*1.5))*tp.lvl*0.2;
 if(chopBtn.classList.contains('on'))tex*=(Math.sin(phase*12)>0?1:0.08);
 const outS=Math.tanh(inS*(1-mx)+tex*mx*1.6);
 bin[sp]=inS; bout[sp]=outS; sp=(sp+1)%SB;
 const tr=(buf,col)=>{ sx.strokeStyle=col; sx.lineWidth=1.4; sx.beginPath();
  for(let i=0;i<SB;i++){const idx=(sp+i)%SB,xx=i/SB*w,yy=h/2-buf[idx]*h*0.42;i?sx.lineTo(xx,yy):sx.moveTo(xx,yy);}sx.stroke(); };
 tr(bin,cv('--in')); tr(bout,cv('--out')); }

const fbmeter=$('fbmeter');
function frame(now){ const dt=Math.min(50,now-tprev); tprev=now; phase+=dt*0.001;
 let T;
 if(window.__frozen){ if(!held)held=taps(); T=held; } else { held=null; T=taps(); }
 drawConstel(T); drawSpec(T); drawGonio(T); drawScope(T,dt);
 const energy = realFresh() ? Math.min(100, REAL.outRms*160) : R('fbk')*100;
 fbmeter.style.width=energy+'%';
 fbmeter.style.opacity=0.55+0.45*Math.abs(Math.sin(phase*(0.5+R('fbk')*4)));
 requestAnimationFrame(frame); }
applyScale();
requestAnimationFrame(frame);
