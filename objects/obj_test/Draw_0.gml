draw_clear(c_dkgray);
draw_set_color(c_white);
draw_set_alpha(1);

shader_set(shd_test);

var t_sampler = shader_get_sampler_index( shd_test, "overlayTexture" );
var t_sprite = sprite_get_texture( spr_checkers, 0 );
texture_set_stage( t_sampler, t_sprite );

var _uvs_a = sprite_get_uvs( spr_statue, 0 );
var _uvs_b = sprite_get_uvs( spr_checkers, 0 );
shader_set_uniform_f( shader_get_uniform( shd_test, "u_vA" ), _uvs_a[0], _uvs_a[1], _uvs_a[2]-_uvs_a[0], _uvs_a[3]-_uvs_a[1] );
shader_set_uniform_f( shader_get_uniform( shd_test, "u_vB" ), _uvs_b[0], _uvs_b[1], _uvs_b[2]-_uvs_b[0], _uvs_b[3]-_uvs_b[1] );

//draw_sprite( spr_statue, 0, x, y );
draw_self();

shader_reset();
