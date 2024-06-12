/// @description Inicialización de variables de logros
show_debug_message("Obj_Game_Init creado y variables de logros inicializadas");

// Variables para el sistema de logros
global.desechosReciclados = 0;
global.tiempoInicio = current_time; // Inicializa el tiempo de inicio
global.logroReciclaje = false; // Indica si el logro ya ha sido desbloqueado
global.tiempoLimite = 60 * 5; // Por ejemplo, 5 minutos (60 ticks por segundo * 300 segundos)
global.desechosObjetivo = 40; // La cantidad de desechos que deben ser reciclados
global.logrosObtenidos = ds_list_create();
global.errorCometido = false; // Indica si el usuario ha cometido algún error
global.logroMaestria = false; // Indica si el logro de maestría ya ha sido desbloqueado
global.medallaOroNvl1 = false;
global.medallaOroNvl2 = false;
global.medallaOroNvl3 = false;
global.logroHeroeMedioAmbiente = false;
global.logroAprendizPreproceso = false; // Indica si el logro ya ha sido desbloqueado
global.logroMaestroPreproceso = false; // Indica si el logro ya ha sido desbloqueado
global.totalClasificados = 0; // Añade esta línea para rastrear el total de desechos clasificados
global.rondaCompletada = false; // Añade esta línea para rastrear si se ha completado una ronda
global.dineroNvl1 = 0;
global.dineroNvl2 = 0;
global.dineroNvl3 = 0;
global.dineroFinal = 0;
global.clasificadosNoReciclables = 0;
global.logroDiosPreproceso = false;




if (file_exists("progreso.txt")) {
    var file = file_text_open_read("progreso.txt");
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
    global.objetosPreprocesados = 0; // Solo inicializa a 0 si el archivo de progreso no existe
}

show_debug_message("Variables de logros inicializadas");

if (file_exists("logros.txt")) {
    var file = file_text_open_read("logros.txt");
    while (!file_text_eof(file)) {
        var logroObtenido = file_text_read_string(file);
        file_text_readln(file);
        ds_list_add(global.logrosObtenidos, logroObtenido);
    }
    file_text_close(file);
}
