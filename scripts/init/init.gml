// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
gml_pragma("global","init()");

#region

var _p = part_type_create();
part_type_shape(_p,pt_shape_circle);
part_type_life(_p,20,40);

global.ptBasic = _p;

#endregion