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
	audio_play_sound(Snd_Error,1,false);
	error++;
}
if (global.quitando){
	global.acciones-=1;
	global.quitando = false;
	error++;
	audio_play_sound(Snd_Error,1,false);
}
if (global.aplastando){
	global.acciones-=1;
	global.aplastando = false;
	audio_play_sound(Snd_Error,1,false);
	error++;
}
if(global.clasificando){
	global.acciones-=1;
	global.clasificando = false;
	clasificado=true;
	global.clasificados+=1;
	ds_list_add(global.listaPreprocesados, Obj_organicos);
	ds_list_add(global.listaIndex, image_index);
	show_debug_message(global.listaPreprocesados);
	show_debug_message(global.listaIndex);
	instance_destroy();
	global.nuevoDeshecho = true;
	audio_play_sound(Snd_Right,1,false);
	
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


