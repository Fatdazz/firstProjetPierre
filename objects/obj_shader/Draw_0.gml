/// @description Insert description here
// You can write your code in this editor

draw_clear(c_dkgray);
draw_set_color(c_white);
draw_set_alpha(1);

uni_iResolution = shader_get_uniform(shd_glitchColorShift,"iResolution");
uni_iTime = shader_get_uniform(shd_glitchColorShift,"iTime");
uni_uvA = shader_get_uniform( shd_glitchColorShift, "u_vA" );
uni_uvB = shader_get_uniform( shd_glitchColorShift, "u_vB" );

var _uvs_b = sprite_get_uvs( spr_rgbNoiseSmall, 0 ); // dimension texture1
var _uvs_a = sprite_get_uvs( spr_portalCube, 0 );
var t_sampler = shader_get_sampler_index( shd_glitchColorShift, "Texture01" );
var t_sprite = sprite_get_texture( spr_rgbNoiseSmall, 0 );


shader_set(shd_glitchColorShift);

shader_set_uniform_f(uni_iTime,(delta_time/fps_real));
shader_set_uniform_f(uni_iResolution,sprite_width,sprite_height);

shader_set_uniform_f( uni_uvB, _uvs_b[0], _uvs_b[1], _uvs_b[2]-_uvs_b[0], _uvs_b[3]-_uvs_b[1] );
shader_set_uniform_f( uni_uvA, _uvs_a[0], _uvs_a[1], _uvs_a[2]-_uvs_a[0], _uvs_a[3]-_uvs_a[1] );

texture_set_stage( t_sampler, t_sprite );

draw_self();

shader_reset();


