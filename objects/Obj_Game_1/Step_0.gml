/// @description creacion de objetos

// Puede escribir su código en este editor
if (global.nuevoDeshecho){
	if(!ds_list_empty(global.listaPreprocesados)){
		nuevoObjeto = global.listaPreprocesados[|0];
		ds_list_delete(global.listaPreprocesados, 0);
		instance_create_layer(100,820, "Instances", nuevoObjeto); 
		x = clamp(x,0, room_width);
		y= clamp(y,0,room_height);
	}else{
		//Cambio de sala
		room_goto(FinalNivel);	
	}
	
}

