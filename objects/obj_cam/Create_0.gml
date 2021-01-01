/// @description Insert description here
// You can write your code in this editor

view_enabled = true;

window_set_rectangle(100,100, room_width,room_height);

var cam = camera_create();

camForFbo = camera_create();


view_camera[0] = cam;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = room_width;
view_hport[0] = room_height;

camera_set_view_pos(cam, 0,0);
camera_set_view_size(cam,room_width,room_height);

camera_set_view_size(cam,room_width,room_height);


view_visible[1] = true;
view_xport[1] = room_width - room_width/4;
view_yport[1] = 0;
view_wport[1] = room_width/4;
view_hport[1] = room_height/4;
view_camera[1] = camForFbo;

global.fboCam = surface_create(view_wport[1],view_hport[1]);

view_surface_id[1] = global.fboCam;


camera_set_begin_script(camForFbo,sr_cam_begin);

camera_set_end_script(view_camera[1],sr_cam_end);
camera_get_end_script(view_camera[1]);

show_debug_message(camera_get_end_script(camForFbo));
//texture_debug_messages(" id sr_end: "  + string(camera_get_end_script(camForFbo)));


camera_set_view_pos(camForFbo,156,0);
camera_set_view_size(camForFbo, 450 - 156, 450 - 156 );
