/// @description preproceso

if (x > room_width) {
    // El objeto Desecho ha sobrepasado los límites de la pantalla a la derecha

    // Crear una nueva instancia del objeto Desecho o de otro objeto que desees
       instance_create_layer(100,820, "Instances", Obj_Game_1); 
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
