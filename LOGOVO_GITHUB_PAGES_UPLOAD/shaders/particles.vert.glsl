attribute vec3 aPosA;
attribute vec3 aPosB;
attribute float aSeed;
uniform float uProgress;
uniform float uTime;
uniform vec2 uMouse;
uniform float uPixelRatio;
uniform float uIntensity;
uniform float uSize;
varying float vAlpha;
varying float vSeed;

void main() {
  float eased = smoothstep(0.0, 1.0, uProgress);
  vec3 point = mix(aPosA, aPosB, eased);
  float phase = aSeed * 18.0 + uTime * 0.65;
  float displacement = 0.022 + sin(phase * 0.65) * 0.013;
  point *= 1.0 + 0.014 * sin(uTime * 0.5);
  point += vec3(cos(phase) * displacement, sin(phase) * displacement, sin(phase * 0.67) * 0.07);
  point.xy += uMouse * (0.055 + aSeed * 0.1);
  gl_Position = projectionMatrix * modelViewMatrix * vec4(point, 1.0);
  gl_PointSize = (0.65 + pow(aSeed, 4.0) * 2.15) * uPixelRatio * uSize;
  vAlpha = uIntensity * (0.2 + 0.62 * aSeed + 0.18 * sin(phase));
  vSeed = aSeed;
}
