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

    // Movimiento hacia abajo
    var diffY = mouseY - startY;
    if (diffY > 0) {
        y = startY + diffY;
    }
}


if (x > room_width) {
    // El objeto Desecho ha sobrepasado los límites de la pantalla a la derecha

    // Obtener el puntaje actual antes de crear el nuevo objeto
    var puntaje_actual = global.clasificados2;
	var dinero_actual = global.dinero;
    // Crear una nueva instancia del objeto Desecho o de otro objeto que desees
    instance_create_layer(100, 820, "Instances", Obj_Game_1); 

    // Restaurar el puntaje en el nuevo objeto
    global.clasificados2 = puntaje_actual;
	global.dinero = dinero_actual;
    // Destruir el objeto actual
    instance_destroy();
}



if(global.lavando){
	global.acciones-=1;
	global.lavando = false;
	lavado = true
	image_index = 1;
	audio_play_sound(Snd_Right,1,false);
}
if (global.quitando){
	global.acciones-=1;
	global.quitando = false;
	if(lavado){
		material_quitado = true;
		image_index = 2;
		audio_play_sound(Snd_Right,1,false);
	}else{
		audio_play_sound(Snd_Error,1,false);
	}
	
	
}
if (global.aplastando){
	global.acciones-=1;
	global.aplastando = false;
	if(material_quitado){
		aplastado = true;
		image_index = 3
	}
	audio_play_sound(Snd_Error,1,false);
	
}
if(global.clasificando){
	global.acciones-=1;
	global.clasificando = false;
	if(lavado and material_quitado){
		clasificado=true;
		global.clasificados+=1;
		ds_list_add(global.listaPreprocesados, Obj_botella3);
		ds_list_add(global.listaIndex, image_index);
		instance_destroy();
		global.nuevoDeshecho = true;
		audio_play_sound(Snd_Right,1,false);
	}else{
		audio_play_sound(Snd_Error,1,false);
	}
}




