/// @description preproceso


// Evento "Step" (Paso) del objeto
if (moving) {
    var mouseX = mouse_x;
    var mouseY = mouse_y;

    // Movimiento horizontal
    var diffX = mouseX - startX;
    if (diffX != 0) {
        x = startX + diffX;
    }

    // Movimiento vertical
    var diffY = mouseY - startY;
    if (diffY != 0) {
        y = startY + diffY;
    }
}

// Restringir el movimiento dentro de los límites de la sala, menos un poco de valor del ancho y alto del sprite
x = clamp(x, 0, 3840-100);
y = clamp(y, 0, 2160-300);
roomname = room_get_name(room)

if (roomname == "Nvl2_Clasificacion" || roomname == "Nvl1_Clasificacion" || roomname == "Nvl3_Clasificacion"){

	if (x + 100 == room_width) {
		// El objeto Desecho ha sobrepasado los límites de la pantalla a la derecha
		global.clasificados -=1;
		// Destruir el objeto actual
		instance_destroy();
		instance_create_layer(100, 820, "Instances", Obj_Game_1); 
	}
} 


if (roomname == "Nvl2_Preproceso" || roomname == "Nvl1_Preproceso" || roomname == "Nvl3_Preproceso"){
	
	if (x + 100 == room_width) {
		instance_destroy();
	
		if (roomname == "Nvl1_Preproceso"){
				instance_create_layer(100,820, "Basureros", choose(Obj_botella1,Obj_botella2,
																	Obj_plastico1,Obj_plastico2));
			}else if(roomname == "Nvl2_Preproceso"){
				instance_create_layer(100,820, "Basureros", choose(Obj_noReciclable, Obj_botella2, Obj_botella3, 
																	Obj_plastico2, Obj_plastico3, Obj_noReciclable,
																	Obj_carton1, Obj_carton2));
			}else if(roomname == "Nvl3_Preproceso"){
				instance_create_layer(100,820, "Basureros", choose(Obj_lata, Obj_lata2, Obj_lata3, Obj_organicos,
																Obj_noReciclable, Obj_botella3, Obj_plastico3,
																Obj_carton2, Obj_carton3, Obj_organicos));
		}
	}
}



if(global.lavando){
	global.acciones-=1;
	global.lavando = false;
	if(lavado == false){
		lavado = true
		image_index = 1;
		audio_play_sound(Snd_Right,1,false);
	}else{
		audio_play_sound(Snd_Error,1,false);
		error++;
	}
}
if (global.quitando){
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
if (global.aplastando){
	global.acciones-=1;
	global.aplastando = false;
	if(material_quitado and aplastado==false){
		aplastado = true;
		image_index = 3
		audio_play_sound(Snd_Right,1,false);
	}else{
		audio_play_sound(Snd_Error,1,false);
		error++;
	}
}
if(global.clasificando){
	global.acciones-=1;
	global.clasificando = false;
	if(lavado and material_quitado and aplastado){
		clasificado=true;
		global.clasificados+=1;
		ds_list_add(global.listaPreprocesados, Obj_plastico2);
		ds_list_add(global.listaIndex, image_index);
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
	error++;
	audio_play_sound(Snd_Error,1,false);
}

if (error >=3){
	error = 0;
	instance_create_layer(2800,600, "Instances", Obj_ErrorPlastico);
}
