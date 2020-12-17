//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

uniform vec4 u_vA;
uniform vec4 u_vB;

varying vec2 v_vTexcoord_A;
varying vec2 v_vTexcoord_B;
varying vec4 v_vColour;
varying vec2 v_vPosition;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_vPosition = in_Position.xy;
    v_vColour = in_Colour;
    v_vTexcoord_A = in_TextureCoord;
	v_vTexcoord_B = u_vB.xy + ( in_TextureCoord - u_vA.xy ) * u_vB.zw / u_vA.zw;
}
