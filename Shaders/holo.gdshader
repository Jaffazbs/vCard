shader_type canvas_item;

uniform float speed = 0.5;
uniform float intensity = 0.15;

void fragment() {
    vec4 base = texture(TEXTURE, UV);
    float shine = sin((UV.x + UV.y) * 4.0 + TIME * speed) * 0.5 + 0.5;
    float shimmer = pow(shine, 3.0);
    vec3 rainbow = vec3(
        sin(shimmer * 6.28) * intensity,
        sin(shimmer * 6.28 + 2.09) * intensity,
        sin(shimmer * 6.28 + 4.18) * intensity
    );
    COLOR = vec4(base.rgb + rainbow * base.a, base.a);
}