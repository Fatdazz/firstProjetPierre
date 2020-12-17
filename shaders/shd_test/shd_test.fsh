varying vec2 v_vTexcoord_A;
varying vec2 v_vTexcoord_B;
varying vec4 v_vColour;

uniform sampler2D overlayTexture;

void main()
{
	
	
	if(texture2D( overlayTexture, v_vTexcoord_B ).r==1.0){
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord_A );
	}else{
	gl_FragColor = vec4(1.,0.,1.,0.0);
	}
	
	
	gl_FragColor = vec4(texture2D( gm_BaseTexture, v_vTexcoord_A ).rgb,texture2D( overlayTexture, v_vTexcoord_B ).r);
	
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord_A );
	//gl_FragColor = v_vColour * texture2D( overlayTexture, v_vTexcoord_B );
}
