#version 460

out vec4 fragColor;

uniform vec2 resolution;
uniform float time;

vec2 rotate2D(vec2 uv, float a) {
    float s = sin(a);
    float c = cos(a);
    return mat2(c, s, -s, c) * uv;
}


void main() {
    vec2 uv = (gl_FragCoord.xy - 0.5 * resolution.xy) / resolution.y;
    vec3 col = vec3(0.0);

    uv = rotate2D(uv, time / 50);

    col += 0.2 * sin(uv.x * 300 * (sin(time)/5 + 0.5)) / length(uv - vec2(0.2));
    col += 0.2 * sin(uv.y * 100) / length(uv + vec2(0.2));

    col *= sin(vec3(0.2,0.8,0.9) * time) * 0.25 + 0.25;

    fragColor = vec4(col, 1.0);
}