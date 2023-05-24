/// @description realizar accion

switch(type){
	case "lavar":
		global.lavando = true;
		global.lavandoSound = true;
		break;
	
	case "clasificar":
	if global.lavandoSound == false || global.quitandoSound == false {
		audio_play_sound(Snd_Error,1,false);
		break;
	}
		global.clasificando = true;
		audio_play_sound(Snd_Right,1,false);
		global.lavandoSound = false;
		global.quitandoSound = false;
		global.aplastandoSound = false;
		break;
	
	case "matAd":
	if global.lavandoSound == false {
		audio_play_sound(Snd_Error,1,false);
		break;
	}
		global.quitando = true;
		global.quitandoSound = true;
		break;
		
	case "aplastar":
		global.aplastando = true;
		global.aplastandoSound = true;
		break;
}


