//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}





///**
// This shader is basically an improvement upon a previous fireworks shader I did a while
// ago (www.shadertoy.com/view/Ws3SRS). Here, each firework spawns at a random position
// instead of the just following the same pattern in a loop, so the fireworks show can be
// watched and enjoyed infinitely. The fireworks spawn from behind the buildings, but in
// front of the mountains. I hope everyone finds watching this relaxing and enjoyable!

// I wish a very happy and a prosperous new year to everyone!
//*/

//#define PI  3.141592653589793
//#define TAU 6.283185307179586

//// Helper macros 
//#define C(x) clamp(x, 0., 1.)
//#define S(a, b, x) smoothstep(a, b, x)
//#define F(x, f) (floor(x * f) / f)

//// Fireworks control variables
//#define FIREWORK_COUNT 8
//#define FIREWORK_DURATION 8.
//#define FIREWORK_LOW .75
//#define FIREWORK_HIGH 1.05
//#define ROCKET_PARTICES 32
//#define ROCKET_DURATION 1.5
//#define FLASH_DURATION ROCKET_DURATION + .2 
//#define THRUSTER_SPEED .25
//#define EXPLOSION_STRENGTH .03;
//#define EXPLOSION_PARTICLES 100

//// Hash functions by Dave_Hoskins
//vec2 hash21(float p)
//{
//	vec3 p3 = fract(vec3(p) * vec3(.1031, .1030, .0973));
//	p3 += dot(p3, p3.yzx + 33.33);
//    return fract((p3.xx + p3.yz) * p3.zy);

//}

//vec3 hash31(float p)
//{
//	uvec3 n = uint(int(p)) * uvec3(1597334673U, 3812015801U, 2798796415U);
//	n = (n.x ^ n.y ^ n.z) * uvec3(1597334673U, 3812015801U, 2798796415U);
//	return vec3(n) * (1. / float(0xffffffffU));
//}

//float hash11(float p)
//{
//	uvec2 n = uint(int(p)) * uvec2(1597334673U, 3812015801U);
//	uint q = (n.x ^ n.y) * 1597334673U;
//	return float(q) * (1. / float(0xffffffffU));
//}

//// Function to remap a value from [a, b] to [c, d]
//float remap(float x, float a, float b, float c, float d)
//{
//    return (((x - a) / (b - a)) * (d - c)) + c;
//}

//// Noise (from iq)
//float noise (in vec3 p) {
//	vec3 f = fract (p);
//	p = floor (p);
//	f = f * f * (3. - 2. * f);
//	f.xy += p.xy + p.z * vec2 (37., 17.);
//	f.xy = texture (iChannel0, (f.xy + .5) / 256., -256.).yx;
//	return mix (f.x, f.y, f.z);
//}

//// Tiny fbm
//float fbm (in vec3 p) {
//	return noise (p) + noise (p * 2.) / 2. + noise (p * 4.) / 4.;
//}

//// Building window lights from www.shadertoy.com/view/wtt3WB
//float windows (vec2 uv, float offset)
//{
//    vec2 grid = vec2(20., 1.);
//    uv.x += offset;
//    float n1 = fbm((vec2(ivec2(uv * grid)) + .5).xxx);
//    uv.x *= n1 * 6.;
//    vec2 id = vec2(ivec2(uv * grid)) + .5;
//    float n = fbm(id.xxx);
//    vec2 lightGrid = vec2(79. * (n + .5), 250. * n);
//    float n2 = fbm((vec2(ivec2(uv * lightGrid + floor(iTime * .4) * .2)) + .5).xyx);
//    vec2 lPos = fract(uv * lightGrid);
//    n2 = (lPos.y < .2 || lPos.y > .7) ? 0. : n2;
//    n2 = (lPos.x < .5 || lPos.y > .7) ? 0. : n2;
//    n2 = smoothstep(.225, .5, n2);
//	return (uv.y < n - 0.01) ? n2 : 0.;
//}

//// Building skyline 
//float buildings(vec2 st)
//{
//    // An fbm style amalgamation of various cos functions
//    float b = .1 * F(cos(st.x*4.0 + 1.7), 1.0);
//    b += (b + .3) * 0.3 * F(cos(st.x*4.-0.1), 2.0);
//    b += (b-.01) * 0.1 * F(cos(st.x*12.0), 4.);
//    b += (b-.05) * 0.3 * F(cos(st.x*24.0), 1.0);
//    return C((st.y + b - .1) * 100.);
//}

//// Twinkly stars, derived and modified from: www.shadertoy.com/view/4s33zf
//float stars(vec2 st, vec2 fragCoord)
//{
//    vec2 uv = (2. * fragCoord - iResolution.xy) / iResolution.y;
//    uv.y += .3;
//    uv.y = abs(uv.y);
//    float t = iTime * .1;
//    vec2 h = pow(hash21(uv.x * iResolution.y + uv.y), vec2(50.));
//    float twinkle = sin((st.x + t + cos(st.y * 50. + t)) * 25.);
//    twinkle *= cos((st.y * .187 - t * 4.16 + sin(st.x * 11.8 + t * .347)) * 6.57);
//    twinkle = twinkle * .5 + .5;
//    return h.x * h.y * twinkle * 1.5;
//}

//// Fireworks improved upon my previous shader: https://www.shadertoy.com/view/Ws3SRS
//vec3 fireworks(vec2 st)
//{
//	vec2 fireworkPos, particlePos;
//    float radius, theta, radiusScale, spark, sparkDistFromOrigin, shimmer,
//        shimmerThreshold, fade, timeHash, timeOffset, rocketPath;
//    vec3 particleHash, fireworkHash, fireworkCol, finalCol;
//    for (int j = 0; j < FIREWORK_COUNT; ++j)
//    {
//        timeHash = hash11(float(j + 1) * 9.6144 + 78.6118);
//        timeOffset = float(j + 1) + float(j + 1) * timeHash;
//        // This hash changes after each firework cycle (rocket + explosion)
//        fireworkHash = hash31(471.5277 * float(j) + 1226.9146
//			+ float(int((iTime+timeOffset) / FIREWORK_DURATION))) * 2. - 1.;
//        fireworkCol = fireworkHash * .5 + .5;
//    	fireworkHash.y = remap(fireworkHash.y, -1., 1., FIREWORK_LOW, FIREWORK_HIGH);
//        // Random firework x coordinate but confined to a certain column based on j
//        fireworkHash.x = ((float(j) + .5 + fireworkHash.x * .25)
//			/ float(FIREWORK_COUNT)) * 2. - 1.;
        
//        // Duration of each firework with a random start time
//        float time = mod(iTime + timeOffset, FIREWORK_DURATION);
//        if (time > ROCKET_DURATION)
//        {
//            fireworkPos = vec2(fireworkHash.x, fireworkHash.y);
//            for (int i = 0; i < EXPLOSION_PARTICLES; ++i)
//            {
//                // Unique hash that yeilds a separate spread pattern for each explosion
//                particleHash = hash31(float(j) * 1291.1978 + float(i) 
//					* 1619.8196 + 469.7119);
//                theta = remap(particleHash.x, 0., 1., 0., TAU); // [0, 2.*PI]
//                radiusScale = particleHash.y * EXPLOSION_STRENGTH;
//                // Radius expands exponentially over time, i.e. explosion effect
//                radius = radiusScale * time * time;
//                particlePos = vec2(radius * cos(theta), radius * sin(theta));
//                particlePos.y -= 8. * pow(particlePos.x, 4.); // fake-ish gravity
//                spark = .0003 / pow(length(st - particlePos - fireworkPos), 1.7);
//                sparkDistFromOrigin = 2. * length(fireworkPos - particlePos);
//                // Shimmering effect for explosion particles
//                shimmer = max(0., sqrt(sparkDistFromOrigin) 
//                    * (sin((iTime + particleHash.y * TAU) * 18.)));
//                shimmerThreshold = FIREWORK_DURATION * .6;
//                // Fade after a certain time threshold
//                fade = C((FIREWORK_DURATION * 2.) * radiusScale - radius);
//                finalCol += mix(spark, spark * shimmer, smoothstep(shimmerThreshold
//					* radiusScale, (shimmerThreshold + 1.) * radiusScale , radius))
//                    * fade * fireworkCol;
//            }
            
//            // Initial instant flash for the explosion
//            if(time < FLASH_DURATION)
//            	finalCol += spark / (.01 + mod(time, ROCKET_DURATION));
//        }
//        else
//        {
//            rocketPath = mod(time, ROCKET_DURATION) / ROCKET_DURATION;
//            // ease out sine
//            rocketPath = sin(rocketPath / (ROCKET_DURATION * .75) * PI * .5);
//            fireworkPos = vec2(fireworkHash.x, 
//                    rocketPath * fireworkHash.y);
//            // Slight random wiggle for the rocket's path
//    		fireworkPos.x += sin(st.y * 50. + time) * fireworkCol.z * .0035;
            
//            // Rockets flying before the explosion
//            for (int i = 0; i < ROCKET_PARTICES; ++i)
//            {
//                particleHash = hash31((float(i) * 603.6837) + 1472.3486);
//                // rocket trail size
//                float t = time * (2. - time);
//                radius = mod(time + particleHash.y, THRUSTER_SPEED) / THRUSTER_SPEED
//					* particleHash.z * .1;
//                // Confine theta to a small value for a vertical thrust effect
//                theta = remap(particleHash.x, 0., 1., 0., PI * .1) + PI * 1.45;
//                particlePos = vec2(radius * cos(theta), radius * sin(theta));
//                finalCol += 8e-5 / pow(length(st - particlePos - fireworkPos), 1.1)
//                    * mix(vec3(1.4, .7, .2), vec3(1.4), radius * 16.);
//            }
//        }
//    }  
//    return finalCol;
//}

//void mainImage( out vec4 fragColor, in vec2 fragCoord )
//{
    
//    vec2 uv = (2. * fragCoord - iResolution.xy) / min(iResolution.y, iResolution.x);
//    uv.y += .3; // shift the horizon a bit lower
//    float reflection = 0.;
    
//    if (uv.y < 0.)
//    {
//        reflection = 1.;
//        // watery distortion in the lake (improved)
//        /**
//        uv.x += sin((uv.y * 64. + sin(iTime) * .2)
//			* cos(uv.y * 128. - cos(iTime) * .1)) * .15;
//		*/
        
//        // slightly better looking water waves
//        uv.x += cos(uv.y * 192. - iTime * 1.2) * sin(uv.y * 96. + iTime * 1.5) * .04;
//    }

//    // Our special uv coord that gives us reflection effect for pratically free
//    vec2 st = vec2(uv.x, abs(uv.y));
//    vec3 col = vec3(0.);
    
//    // Background mountain
//    float mountain = sin(1.69 * st.x * 1.38 * cos(2.74 * st.x) + 4.87
//		* sin(1.17 * st.x)) * .1 - .18 + st.y;
//    mountain = C(S(-.005, .005, mountain));
    
//    float building = buildings(st);
    
//    // Finally blend everything together
    
//    // Sky color
//    col += vec3(.18 - st.y * .1, .18 - st.y * .1, .1 + st.y * .03);
//    // Blend the mountain and the sky
//    col = col * mountain + vec3(.1 - st.y * .1, .1 - st.y * .1, .08) * (1. - mountain);
//    // Occlude the mountain with the building skyline
//    col *= building;
    
//    // Yellow-ish window color tint
//    col += windows(st * .8, 2.) * (1.-building) * vec3(1.2, 1., .8); 
    
//    // Moon white circle
//    float moon = smoothstep(.3, .29, length(st-vec2(1., .8)));
    
//    //Twinkly stars, masked by the buildings, mountain, and the moon
//    col += stars(st, fragCoord) * mountain * building * (1. - moon);
    
//    // Cut the main moon circle with an offset inverted one to make a crescent
//    moon *= smoothstep(.3, .4, length(st-vec2(.92, .88)));
    
//    // Add the moon to the scene
//    col += moon * vec3(1.2, 1.18, 1.);
    
//    // Fireworks launch from behind the buildings, but in front of the mountains
//    col += C(fireworks(st)) * (building + moon);
    
//    // Slightly change of the reflections to watery blueish-green
//    col.r -= reflection * .05;
//    col.gb += reflection * .01;
    
//    fragColor = vec4(col, 1.0);
//}