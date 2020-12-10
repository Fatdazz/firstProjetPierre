/// @description Insert description here
// You can write your code in this editor

draw_clear(c_dkgray);
draw_set_color(c_white);
draw_set_alpha(1);

uni_iResolution = shader_get_uniform(shd_glitch,"iResolution");
uni_iTime = shader_get_uniform(shd_glitch,"iTime");
shader_set(shd_glitch);
shader_set_uniform_f(uni_iTime,delta_time/fps_real);
shader_set_uniform_f(uni_iResolution,sprite_width,sprite_height);
draw_self();
shader_reset();

//	show_debug_message(delta_time/fps_real);


//shader_set(shd_shadertoy);

//var t_sampler = shader_get_sampler_index( shd_shadertoy, "overlayTexture" );
//var t_sprite = sprite_get_texture( spr_rgbNoiseSmall, 0 );

//texture_set_stage( t_sampler, t_sprite );

//var _uvs_a = sprite_get_uvs( spr_shader01, 0 ); // dimension texture0
//var _uvs_b = sprite_get_uvs( spr_rgbNoiseSmall, 0 ); // dimension texture1
//shader_set_uniform_f( shader_get_uniform( shd_shadertoy, "u_vA" ), _uvs_a[0], _uvs_a[1], _uvs_a[2]-_uvs_a[0], _uvs_a[3]-_uvs_a[1] );
//shader_set_uniform_f( shader_get_uniform( shd_shadertoy, "u_vB" ), _uvs_b[0], _uvs_b[1], _uvs_b[2]-_uvs_b[0], _uvs_b[3]-_uvs_b[1] );
//shader_set_uniform_f(uni_iResolution,sprite_width,sprite_height);
//shader_set_uniform_f(uni_iTime,1.);

////draw_sprite( spr_statue, 0, x, y );
//draw_self(); 

//shader_reset();

//show_debug_message(current_second);

