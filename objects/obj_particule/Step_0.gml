/// @description Insert description here
// You can write your code in this editor

if(mouse_check_button(mb_left)){
	part_particles_create(global.partSystem,mouse_x,mouse_y,global.ptBasic,1);

}


if(gamepad_is_connected(0)){
	if(gamepad_button_check(0,gp_face1)){
	show_debug_message("time: " + string(current_time));}
	var haxis = gamepad_axis_value(0, gp_axislh);
	var vaxis = gamepad_axis_value(0, gp_axislv);
	show_debug_message("x: " + string(haxis) + " y: " + string(vaxis));
}
