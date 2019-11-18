//
// Vertex shader for wind effect on wheat
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
attribute float in_Weight;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

uniform float u_delta;
uniform float u_amplitude;
uniform float u_wavelength;

void main()
{
    vec4 trans_pos = vec4(in_Position.xyz, 1.0);
    
    float wind = -(1.0 + sin((u_delta + in_Position.x) / u_wavelength)) * u_amplitude;
    
    trans_pos.x += smoothstep(0.0, 1.0, in_Weight / 2.0) * wind;
    trans_pos.y += smoothstep(0.0, 1.0, in_Weight / 2.0) * wind;
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * trans_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vPosition = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Fragment shader for wind effect on wheat
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vPosition;

void main()
{
    if(v_vColour.a < 0.5) discard;
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
}

