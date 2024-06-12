/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
roomname = room_get_name(room);
if (!global.errorCometido && global.clasificados == 0) {
    // El usuario ha clasificado todos los desechos correctamente sin cometer errores
    ds_list_add(global.logrosObtenidos, "Clasificación Perfecta");
    mostrarLogro();
}




var file = file_text_open_write("progreso.txt");

if (file != -1) {
    file_text_write_string(file, "objetosPreprocesados=" + string(global.objetosPreprocesados) + "\n");
    file_text_close(file);
} else {
    show_debug_message("Error: No se pudo abrir el archivo progreso.txt para escribir.");
}


if (press == true)
{
	if(global.nivelActual == 1){
		room_goto(Nvl2_Preproceso);
	}else if (global.nivelActual == 2){
		room_goto(Nvl3_Preproceso)
	}else if(roomname == "FinalNivel3"){
		room_goto(GameOver)	
	}
	
}