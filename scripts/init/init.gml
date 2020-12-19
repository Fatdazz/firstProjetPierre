// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
gml_pragma("global","init()");

#region

var c = choose(c_aqua,c_blue,c_green,c_navy,c_red,c_purple,c_white,c_yellow);

var _p = part_type_create();
part_type_color1(_p,c);
part_type_shape(_p,pt_shape_disk);
part_type_life(_p,20,50);
part_type_scale(_p,0.3,0.3);

part_type_speed(_p,3,5,0,0);
part_type_direction(_p,0,360,0,0);
part_type_orientation(_p,0,0,0,0,true);
part_type_gravity(_p,0.3,270);

global.ptBasic = _p;

var _p = part_type_create();
part_type_color1(_p,c);
part_type_shape(_p,pt_shape_circle);
part_type_life(_p,20,50);
part_type_size(_p,0.4,0.4,-0.02,0.05);

global.ptTrail = _p;

part_type_step(global.ptBasic,1,global.ptTrail);

var _p = part_type_create();
part_type_color1(_p,c);
part_type_shape(_p,pt_shape_flare);
part_type_life(_p,30,40);
part_type_size(_p,0.3,0.4,0.08,0.0);
part_type_alpha3(_p,0.8,1,0);
part_type_blend(_p,true);

global.deathExplo = _p;

part_type_death(global.ptBasic,1,global.deathExplo);

#endregion