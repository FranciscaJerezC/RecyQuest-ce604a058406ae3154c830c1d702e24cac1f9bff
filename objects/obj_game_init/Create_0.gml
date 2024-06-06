/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
/// @description Inicialización de variables de logros
show_debug_message("Obj_Game_Init creado y variables de logros inicializadas");

// Variables para el sistema de logros
global.desechosReciclados = 0;
global.tiempoInicio = current_time; // Inicializa el tiempo de inicio
global.logroReciclaje = false; // Indica si el logro ya ha sido desbloqueado
global.tiempoLimite = 60 * 5; // Por ejemplo, 5 minutos (60 ticks por segundo * 300 segundos)
global.desechosObjetivo = 5; // La cantidad de desechos que deben ser reciclados

show_debug_message("Variables de logros inicializadas");
