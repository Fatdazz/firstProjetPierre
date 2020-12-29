//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vTexcoord_B;

uniform sampler2D Texture01;
uniform float     iTime;
uniform vec4 u_vB;
uniform vec4 u_vA;

float speed = 10.0;
float amplitude = .3;


vec4 rgbShift( vec2 p , vec4 shift) {
	shift *= -2.0*shift.w + 1.0;
	vec2 rs = vec2(shift.x,-shift.y);
	vec2 gs = vec2(shift.y,-shift.z);
	vec2 bs = vec2(shift.z,-shift.x);
	float r = texture2D( gm_BaseTexture, mod(p+rs,u_vA.zw)).x;
	float g = texture2D( gm_BaseTexture, mod(p+gs,u_vA.zw)).y;
	float b = texture2D( gm_BaseTexture, mod(p+bs,u_vA.zw)).z;
	return vec4(r,g,b,1.0);
}

vec4 noise( vec2 p ) {
	return texture2D(gm_BaseTexture, p);
}

vec4 vec4pow(  vec4 v,  float p ) {
	return vec4(pow(v.x,p),pow(v.y,p),pow(v.z,p),v.w);
}


void main()
{
    vec4 c = vec4(0.0,0.0,0.0,1.0);
	highp vec4 shift = vec4pow( noise(vec2(mod(iTime*speed,u_vB.z) + u_vB.x, (mod(iTime*speed,u_vB.z) + u_vB)/25.0) ),8.0); //highp
	shift *= vec4(amplitude,amplitude,amplitude,1.0);
	c += rgbShift(v_vTexcoord, shift);
	//shift.w= 0;
	//c = vec4(shift.w/1.5,1.0,1.0,1.0);
    gl_FragColor = vec4(c.rgb,texture2D( gm_BaseTexture,v_vTexcoord).a);
}




/*
// original shader from Eethe -  https://www.shadertoy.com/view/4t23Rc
// exploring color shifting glitch, using texture

float speed = 10.0;
float amplitude = .2; 


    
vec4 rgbShift( in vec2 p , in vec4 shift) {
	shift *= 2.0*shift.w - 1.0;
	vec2 rs = vec2(shift.x,-shift.y);
	vec2 gs = vec2(shift.y,-shift.z);
	vec2 bs = vec2(shift.z,-shift.x);
	float r = texture(iChannel0, p+rs, 0.0).x;
	float g = texture(iChannel0, p+gs, 0.0).y;
	float b = texture(iChannel0, p+bs, 0.0).z;
	return vec4(r,g,b,1.0);
}


vec4 noise( in vec2 p ) {
	return texture(iChannel1, p, 0.0);
}

vec4 vec4pow( in vec4 v, in float p ) {
	return vec4(pow(v.x,p),pow(v.y,p),pow(v.z,p),v.w);
}



void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy/iResolution.xy;
    vec4 c = vec4(0.0,0.0,0.0,1.0);
    highp vec4 shift = vec4pow(noise(vec2(speed*iTime,2.0*speed*iTime/25.0 )),8.0) *vec4(amplitude,amplitude,amplitude,1.0);
	c += rgbShift(uv, shift);
    fragColor = c;
}
*/