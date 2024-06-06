function verificarLogroReciclaje() {
    show_debug_message("Verificando logro de reciclaje");
    if (!global.logroReciclaje) {
	var tiempoTranscurrido = (current_time - global.tiempoInicio) / 1000;

        show_debug_message("Tiempo transcurrido: " + string(tiempoTranscurrido));
        if (global.desechosReciclados >= global.desechosObjetivo && tiempoTranscurrido <= global.tiempoLimite) {
            show_debug_message("Condiciones del logro cumplidas");
            global.logroReciclaje = true;
            mostrarLogro(); // Función para mostrar al jugador que ha desbloqueado el logro
        } else {
            show_debug_message("Condiciones del logro NO cumplidas");
        }
    } else {
        show_debug_message("Logro ya desbloqueado");
    }
}

function mostrarLogro() {
    // Muestra un mensaje en la pantalla
    show_message("¡Has desbloqueado el logro: Reciclador Experto!");
    // Puedes agregar otros efectos, como reproducir un sonido o mostrar una animación.
    show_debug_message("Logro mostrado al jugador");
}
