//El usuario recicla 40 desechos en un 2 min (130 segundos)
function verificarLogroReciclaje() {
    show_debug_message("Verificando logro de reciclaje");
    if (!global.logroReciclaje) {
        //se divide en 1000 por formato
        var tiempoTranscurrido = (current_time - global.tiempoInicio) / 1000;

        show_debug_message("Tiempo transcurrido: " + string(tiempoTranscurrido));
        
        // Aquí puedes definir el tiempo límite para obtener el logro (en segundos)
        var tiempoLimite = 140; // Por ejemplo, 5 minutos (300 segundos)

        if (global.desechosReciclados >= global.desechosObjetivo && tiempoTranscurrido <= tiempoLimite) {
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
            if (tiempoTranscurrido > tiempoLimite) {
                show_debug_message("Tiempo límite excedido: " + string(tiempoTranscurrido));
            }
            if (global.desechosReciclados < global.desechosObjetivo) {
                show_debug_message("Desechos reciclados insuficientes: " + string(global.desechosReciclados));
            }
        }
    } else {
        show_debug_message("Logro ya desbloqueado");
    }
}

//El usuario no comete errores en la clasificación en ningún nivel
function verificarLogroMaestria() {
    show_debug_message("Verificando logro de maestría en clasificación");
		if (!global.logroMaestria && !global.errorCometido && global.rondaCompletada) {
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

//El usuario consigue medalla de oro en los tres niveles
function verificarLogroHeroeMedioAmbiente() {
    show_debug_message("Verificando logro Héroe del Medio Ambiente");
    if (!global.logroHeroeMedioAmbiente && global.medallaOroNvl1 && global.medallaOroNvl2 && global.medallaOroNvl3) {
        show_debug_message("Condiciones del logro Héroe del Medio Ambiente cumplidas");
        global.logroHeroeMedioAmbiente = true;
        var nombreLogro = "Héroe del Medio Ambiente";
        
        // Verificar si el logro ya está en la lista
        if (ds_list_find_index(global.logrosObtenidos, nombreLogro) == -1) {
            ds_list_add(global.logrosObtenidos, nombreLogro); // Añade el logro a la lista
            mostrarLogro(nombreLogro); // Pasa el nombre del logro a la función
        } else {
            show_debug_message("Logro ya obtenido: " + nombreLogro);
        }
    } else {
        show_debug_message("Condiciones del logro Héroe del Medio Ambiente NO cumplidas");
    }
}


//El usuario preprocesa 50 objetos
function verificarLogroAprendizPreproceso() {
    show_debug_message("Verificando logro Aprendiz del Pre-proceso");
    show_debug_message("Objetos preprocesados: " + string(global.objetosPreprocesados));
    
    if (!global.logroAprendizPreproceso) {
        if (global.objetosPreprocesados >= 50) {
            show_debug_message("Condiciones del logro cumplidas");
            global.logroAprendizPreproceso = true;
            var nombreLogro = "Aprendiz del Preproceso";
            
            // Verificar si el logro ya está en la lista
            if (ds_list_find_index(global.logrosObtenidos, nombreLogro) == -1) {
                mostrarLogro(nombreLogro); // Pasa el nombre del logro a la función
                ds_list_add(global.logrosObtenidos, nombreLogro); // Añade el logro a la lista
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

//El usuario preprocesa 100 objetos
function verificarLogroMaestroPreproceso() {
    show_debug_message("Verificando logro Maestro del Preproceso");
    show_debug_message("Total de objetos preprocesados: " + string(global.objetosPreprocesados));
    
    if (!global.logroMaestroPreproceso) {
        if (global.objetosPreprocesados >= 100) {
            show_debug_message("Condiciones del logro cumplidas");
            global.logroMaestroPreproceso = true;
            var nombreLogro = "Maestro del Preproceso";
            
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

function verificarLogroDiosPreproceso() {
    show_debug_message("Verificando logro Dios del Preproceso");
    show_debug_message("Total de objetos preprocesados: " + string(global.objetosPreprocesados));
    
    if (!global.logroDiosPreproceso) {
        if (global.objetosPreprocesados >= 300) {
            show_debug_message("Condiciones del logro cumplidas");
            global.logroDiosPreproceso = true;
            var nombreLogro = "Dios del Preproceso";
            
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


function mostrarLogro(nombreLogro) {
    // Muestra un mensaje en la pantalla
    show_debug_message("Intentando mostrar logro: " + string(nombreLogro));
    
    if (is_undefined(nombreLogro)) {
        show_debug_message("Error: nombreLogro está indefinido");
        return;
    }
    
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
}