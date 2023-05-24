/// @description crear nuevos desechos

if (global.nuevoDeshecho){
	instance_create_layer(100,820, "Instances", choose(Obj_botella1,Obj_botella2,Obj_botella3,Obj_plastico1,Obj_plastico2))
}

//Cambio de sala
if (global.acciones <= 0) {
	if(global.nivelActual == 1){
		 room_goto(Nvl1_Clasificacion);
	}
	else if(global.nivelActual == 2){
		 room_goto(Nvl2_Clasificacion);
	}
	else if(global.nivelActual == 3){
		 room_goto(Nvl3_Clasificacion);
	}
}
