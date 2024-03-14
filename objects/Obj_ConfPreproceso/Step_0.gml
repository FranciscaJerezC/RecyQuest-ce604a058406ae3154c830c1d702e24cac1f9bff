/// @description crear nuevos desechos

if (global.nuevoDeshecho){
	roomname = room_get_name(room)
	if (roomname == "Nvl1_Preproceso"){
		var desecho_lista1 = [Obj_botella1, Obj_botella2, Obj_plastico1, Obj_plastico2];
		var desecho_lista1_shuffled = array_shuffle(desecho_lista1); // Mezclar la lista de objetos
		var index_elegido = irandom(array_length_1d(desecho_lista1_shuffled) - 1);
		var objeto_elegido1 = desecho_lista1_shuffled[index_elegido];
		
		instance_create_layer(100,820, "Basureros", objeto_elegido1);
		
	}else if(roomname == "Nvl2_Preproceso"){
		
		var desecho_lista2 = [Obj_noReciclable, Obj_botella2, Obj_botella3, 
															Obj_plastico2, Obj_plastico3, Obj_noReciclable,
															Obj_carton1, Obj_carton2];
		var desecho_lista2_shuffled = array_shuffle(desecho_lista2); // Mezclar la lista de objetos
		var index_elegido2 = irandom(array_length_1d(desecho_lista2_shuffled) - 1);
		var objeto_elegido2 = desecho_lista2_shuffled[index_elegido2];
		
		instance_create_layer(100,820, "Basureros", objeto_elegido2);
		
	}else if(roomname == "Nvl3_Preproceso"){
		
		var desecho_lista3 = [Obj_lata, Obj_lata2, Obj_lata3, Obj_organicos,
														Obj_noReciclable, Obj_botella3, Obj_plastico3,
														Obj_carton2, Obj_carton3, Obj_organicos];
		var desecho_lista3_shuffled = array_shuffle(desecho_lista3); // Mezclar la lista de objetos
		var index_elegido3 = irandom(array_length_1d(desecho_lista3_shuffled) - 1);
		var objeto_elegido3 = desecho_lista3_shuffled[index_elegido3];
		
		instance_create_layer(100,820, "Basureros", objeto_elegido3);
		
		

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
