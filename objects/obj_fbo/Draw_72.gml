/// @description Insert description here
// You can write your code in this editor
if surface_exists(fbo){
	surface_set_target(fbo);
	draw_clear_alpha(0,0);
	surface_reset_target();
}else{
	fbo = surface_create(sprite_width,sprite_height);
}