// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function vect2(_x, _y) constructor {
	x = _x;
	y = _y;
	set = function ( _x, _y){
		x = _x;
		y = _y;
	}
	distance = function( _other ){
		return  distance_vect2(self,_other);
	}
	angle = function( _other ) {
		return angle_vect2(self,_other);
	}
	normalize = function(){
		zero = new vector2(0,0);
		var dist = self.distance(zero);
		x = x/dist;
		y = y/dist;
		delete zero;
	}
	
	
}

function angle_vect2(_pt1,_pt2){
	return point_direction(_pt1.x,_pt1.y,_pt2.x,_pt2.y);
}

function distance_vect2(_pt1,_pt2){
	return point_distance(_pt1.x,_pt1.y,_pt2.x,_pt2.y);
}

function draw_circle_vec2(_pt, r, outline){
	draw_circle(_pt.x,_pt.y,r,outline)
}
