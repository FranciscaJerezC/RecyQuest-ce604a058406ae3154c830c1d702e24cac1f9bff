/// @description Basurero carton

if (Material == 4 )
{
	instance_destroy();
	global.nuevoDeshecho = true;
	global.dinero+=3;
	global.clasificados-=1;
	audio_play_sound(Snd_Right,1,false);
}else{
	if (roomname == "Nvl3_Clasificacion"){
		audio_play_sound(Snd_Error,1,false);
		global.dinero+=1;
		global.nuevoDeshecho = true;
		instance_destroy();
	}
}
