/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
global.dinero = global.platita;
global.clasificados2 = 0;
global.oportunidades = 1;
global.acciones = 20;
global.lavando = false;
global.aplastando = false;
global.clasificando = false;
global.quitando = false;
global.nuevoDeshecho = true;

/*
global.jugar = function(tipo, lavado, material_quitado, 
aplastado, clasificado, error){
	// vidrio
	if(tipo == 0){
		global.jugarVidrio( lavado, material_quitado, 
		aplastado, clasificado, error);
	}
}

global.jugarVidrio = function( lavado, material_quitado, 
aplastado, clasificado, error){
	if(global.lavando){
		global.acciones-=1;
		global.lavando = false;
		if (lavado == false){
			lavado = true
			image_index = 1;
			audio_play_sound(Snd_Right,1,false);
		}else{
			audio_play_sound(Snd_Error,1,false);
			error++;
		}
	}
	else if (global.quitando){
		global.acciones-=1;
		global.quitando = false;
		if(lavado and material_quitado==false){
			material_quitado = true;
			image_index = 2;
			audio_play_sound(Snd_Right,1,false);
		}else{
			audio_play_sound(Snd_Error,1,false);
			error++;
		}
	}
	else if (global.aplastando){
		global.acciones-=1;
		global.aplastando = false;
		if(material_quitado){
			aplastado = true;
			image_index = 3
		}
		audio_play_sound(Snd_Error,1,false);
		error++;
	}
	else if(global.clasificando){
		global.acciones-=1;
		global.clasificando = false;
		if(lavado and material_quitado){
			clasificado=true;
			global.clasificados+=1;
			ds_list_add(global.listaPreprocesados, Obj_botella1);
			ds_list_add(global.listaIndex, image_index);
			show_debug_message(global.listaPreprocesados);
			show_debug_message(global.listaIndex);
			instance_destroy();
			global.nuevoDeshecho = true;
			audio_play_sound(Snd_Right,1,false);
		}else{
			audio_play_sound(Snd_Error,1,false);
			error++;
		}
	}

	//--- nivel 2 ---
	if (global.NoClasificando){
		global.acciones-=1;
		global.NoClasificando = false;
		audio_play_sound(Snd_Error,1,false);
		error++;
	}

	if (error >=3){
		error = 0;
		instance_create_layer(2800,600, "Instances", Obj_ErrorVidrio);
	}
	
	//return  lavado, material_quitado, aplastado, clasificado, error;
}

*/