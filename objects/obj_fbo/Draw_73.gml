/// @description Insert description here
// You can write your code in this editor
surface_set_target(fbo);
//draw_sprite(spr_portalCube,0,0,0);
draw_surface(application_surface,0,0);
surface_reset_target();

draw_surface(fbo,x,y);