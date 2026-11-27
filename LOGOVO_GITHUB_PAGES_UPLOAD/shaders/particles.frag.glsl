varying float vAlpha;
varying float vSeed;

void main() {
  float radius = length(gl_PointCoord - 0.5);
  float falloff = 1.0 - smoothstep(0.12, 0.5, radius);
  vec3 color = mix(vec3(0.67, 0.29, 0.08), vec3(1.0, 0.84, 0.62), pow(vSeed, 1.35));
  gl_FragColor = vec4(color, max(0.0, vAlpha) * falloff);
}
