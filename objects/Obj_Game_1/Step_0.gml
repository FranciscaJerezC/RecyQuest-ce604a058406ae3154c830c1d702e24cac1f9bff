/// @description creacion de objetos
		roomname = room_get_name(room)
// Puede escribir su código en este editor
if (global.nuevoDeshecho){
	if(!ds_list_empty(global.listaPreprocesados)){
		nuevoObjeto = global.listaPreprocesados[|0];
		
		instance_create_layer(100,820, "Basura", nuevoObjeto); 
		
		ds_list_delete(global.listaPreprocesados, 0);

		
		x = clamp(x,0, room_width);
		y= clamp(y,0,room_height);
	}else{
		if (roomname == "Nvl3_Clasificacion"){
			gmda_submit(1,global.dinero);
			room_goto(GameOver);
			
		}else{
			room_goto(FinalNivel);
		}

	}
	
}

