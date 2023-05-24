/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (global.nuevoDeshecho){
	nuevoObjeto = global.listaPreprocesados[|0];
	ds_list_delete(global.listaPreprocesados, 0);
    instance_create_layer(100,820, "Instances", nuevoObjeto); 
	x = clamp(x,0, room_width);
	y= clamp(y,0,room_height);
}

