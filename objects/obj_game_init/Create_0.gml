/// @description Inicialización de variables de logros
show_debug_message("Obj_Game_Init creado y variables de logros inicializadas");

// Variables para el sistema de logros
global.desechosReciclados = 0;
global.tiempoInicio = current_time; // Inicializa el tiempo de inicio
global.logroReciclaje = false; // Indica si el logro ya ha sido desbloqueado
global.tiempoLimite = 60 * 5; // Por ejemplo, 5 minutos (60 ticks por segundo * 300 segundos)
global.desechosObjetivo = 5; // La cantidad de desechos que deben ser reciclados
global.logrosObtenidos = ds_list_create();
global.errorCometido = false; // Indica si el usuario ha cometido algún error
global.logroMaestria = false; // Indica si el logro de maestría ya ha sido desbloqueado
global.medallaOroNvl1 = false;
global.medallaOroNvl2 = false;
global.medallaOroNvl3 = false;
global.logroHeroeMedioAmbiente = false;

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
