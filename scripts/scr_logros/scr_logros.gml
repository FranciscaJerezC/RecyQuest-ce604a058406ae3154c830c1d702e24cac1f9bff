function verificarLogroReciclaje() {
    show_debug_message("Verificando logro de reciclaje");
    if (!global.logroReciclaje) {
        var tiempoTranscurrido = (current_time - global.tiempoInicio) / 1000;

        show_debug_message("Tiempo transcurrido: " + string(tiempoTranscurrido));
        if (global.desechosReciclados >= global.desechosObjetivo) {
            show_debug_message("Condiciones del logro cumplidas");
            global.logroReciclaje = true;
            var nombreLogro = "Reciclador Experto";
            
            // Verificar si el logro ya está en la lista
            if (ds_list_find_index(global.logrosObtenidos, nombreLogro) == -1) {
                ds_list_add(global.logrosObtenidos, nombreLogro); // Añade el logro a la lista
                mostrarLogro(nombreLogro); // Pasa el nombre del logro a la función
            } else {
                show_debug_message("Logro ya obtenido: " + nombreLogro);
            }
        } else {
            show_debug_message("Condiciones del logro NO cumplidas");
        }
    } else {
        show_debug_message("Logro ya desbloqueado");
    }
}

function verificarLogroMaestria() {
    show_debug_message("Verificando logro de maestría en clasificación");
    if (!global.logroMaestria && !global.errorCometido && global.clasificados == 0) {
        show_debug_message("Condiciones del logro de maestría cumplidas");
        global.logroMaestria = true;
        var nombreLogro = "Maestría en Clasificación";
        
        // Verificar si el logro ya está en la lista
        if (ds_list_find_index(global.logrosObtenidos, nombreLogro) == -1) {
            ds_list_add(global.logrosObtenidos, nombreLogro); // Añade el logro a la lista
            mostrarLogro(nombreLogro); // Función para mostrar al jugador que ha desbloqueado el logro
        } else {
            show_debug_message("Logro ya obtenido: " + nombreLogro);
        }
    } else {
        show_debug_message("Condiciones del logro de maestría NO cumplidas");
    }
}

function verificarLogroHeroeMedioAmbiente() {
    show_debug_message("Verificando logro Héroe del Medio Ambiente");
    if (!global.logroHeroeMedioAmbiente && global.medallaOroNvl1 && global.medallaOroNvl2 && global.medallaOroNvl3) {
        show_debug_message("Condiciones del logro Héroe del Medio Ambiente cumplidas");
        global.logroHeroeMedioAmbiente = true;
        var nombreLogro = "Héroe del Medio Ambiente";
        ds_list_add(global.logrosObtenidos, nombreLogro); // Añade el logro a la lista
        mostrarLogro(nombreLogro); // Pasa el nombre del logro a la función
    } else {
        show_debug_message("Condiciones del logro Héroe del Medio Ambiente NO cumplidas");
    }
}



function mostrarLogro(nombreLogro) {
    // Muestra un mensaje en la pantalla
    show_debug_message("Intentando mostrar logro: " + string(nombreLogro));
    
    if (is_undefined(nombreLogro)) {
        show_debug_message("Error: nombreLogro está indefinido");
        return;
    }
    
    if (!ds_list_find_index(global.logrosObtenidos, nombreLogro)) {
        var file = file_text_open_append("logros.txt");

        // Verifica si el archivo se abrió correctamente
        if (file != -1) {
            file_text_write_string(file, nombreLogro + "\n");
            file_text_close(file);

            show_message("¡Has desbloqueado el logro: " + nombreLogro + "!");
            show_debug_message("Logro mostrado al jugador: " + nombreLogro);
        } else {
            // Manejo de error si el archivo no se pudo abrir
            show_debug_message("Error: No se pudo abrir el archivo logros.txt para escribir.");
        }
    } else {
        show_debug_message("Logro ya desbloqueado previamente: " + nombreLogro);
    }
}

