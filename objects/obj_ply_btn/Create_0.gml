/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
sprite_index = start;
image_speed = 0;
image_index = 0;

press = false;

// Código para leer el archivo progreso.txt
var file = file_text_open_read("progreso.txt");

if (file != -1) {
    while (!file_text_eof(file)) {
        var line = file_text_readln(file);
        
        // Verificar si la línea no está vacía
        if (string_length(line) > 0) {
            var key = string_copy(line, 1, string_pos("=", line) - 1);
            var value = real(string_copy(line, string_pos("=", line) + 1, string_length(line)));
            
            // Asignar el valor a la variable global correspondiente
            if (key == "objetosPreprocesados") {
                global.objetosPreprocesados = value;
            }
        }
    }
    
    file_text_close(file);
} else {
    show_debug_message("Error: No se pudo abrir el archivo progreso.txt para leer.");
}
