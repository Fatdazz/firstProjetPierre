/// @description Insert description here
// You can write your code in this editor


 show_debug_message("valeur :" +string(sprite_height))
 
 
var n = sprite_height * sprite_width * densityCreat / 400

//n = 30
for(var i = 0; i < n; i++;){
	
	var i2 = 0
	if(i<nbBigInfuance){
		i2++;
		randCreat(self,sprite_height/2,sprite_width/2,30)
	}
	
	if(i< nbAverageInfuance){
		i2++
		randCreat(self,sprite_height/2,sprite_width/2,30)
	}
	if(i < nbSmallInfuance){
		i2++
		randCreat(self,sprite_height/2,sprite_width/2,30)
	}
	i = i + i2;

	randCreat(self,sprite_height/2,sprite_width/2,15)
	
	//show_debug_message("valeur :" + string(u.image_xscale))
	

	
	
	
}


 
 show_debug_message("valeur :" +string(n))
 
instance_destroy(self);