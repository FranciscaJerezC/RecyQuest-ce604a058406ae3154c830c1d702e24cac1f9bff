/// @description crear nuevos desechos

if (global.nuevoDeshecho){
	roomname = room_get_name(room)
	if (roomname == "Nvl1_Preproceso"){
		instance_create_layer(100,820, "Instances", choose(Obj_botella1,Obj_botella2,Obj_botella3,
															Obj_plastico1,Obj_plastico2,Obj_plastico3));
	}else if(roomname == "Nvl2_Preproceso"){
		instance_create_layer(100,820, "Instances", choose(Obj_noReciclable, Obj_botella2, Obj_botella3, 
															Obj_plastico2, Obj_plastico3, Obj_noReciclable,
															Obj_carton1, Obj_carton2, Obj_carton3));
	}else if(roomname == "Nvl3_Preproceso"){
		instance_create_layer(100,820, "Instances", choose(Obj_lata, Obj_lata2, Obj_lata3,
														Obj_noReciclable, Obj_botella3, Obj_plastico3
														));
	}
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
