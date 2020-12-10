// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function creatIndivi(){



}


function randCreat(s, h, w, esp){
	var i  = true;
	var xx,yy;
	var n = instance_number(Obj_indivi)
	while(i){
		i= false
		xx = irandom_range(s.x-w,s.x+w);
		yy = irandom_range(s.x-h,s.x+h);
		show_debug_message("xx: " + string(xx) + " yy :" + string(yy))
		for(var j = 0; j < n; j++;){
			var u = instance_find(Obj_indivi,j)
			if(point_distance(u.x,u.y,xx,yy) < esp){
				
				i = true;
				
			}
		}

	}
	instance_create_depth(xx,yy,0,Obj_indivi);
	show_debug_message("instance_number: " + string(n));

}