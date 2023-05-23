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
	lavado = true
	global.acciones-=1;
	global.lavando = false;
}
if (global.quitando){
	material_quitado = true;
	global.acciones-=1;
	global.quitando = false;
}
if (global.aplastando){
	aplastado = true;
	global.acciones-=1;
	global.aplastando = false;
}
if(global.clasificando){
	if(lavado and material_quitado and aplastado){
		clasificado=true;
		global.clasificados+=1;
		global.clasificando = false;
		instance_destroy();
		global.nuevoDeshecho = true;
		
	}
	global.clasificando = false;
}

// Evento "Step" (Paso) del objeto del contador de acciones
if (global.acciones <= 0) {
    room_goto(Nvl2_Clasificacion); // Reemplaza "otro_room" con el nombre del room al que deseas redirigir al jugador
}