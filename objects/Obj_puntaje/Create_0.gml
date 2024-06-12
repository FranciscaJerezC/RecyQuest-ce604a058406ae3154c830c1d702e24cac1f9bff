max_score = global.acciones / 4; // Variable para almacenar el puntaje máximo posible
var roomname = room_get_name(room);

// Nivel 1
if (roomname == "FinalNivel1") {
    var percentage1 = (global.dineroNvl1 / 3) / max_score;
    show_debug_message("Nivel 1 - Dinero: " + string(global.dineroNvl1) + ", Max Score: " + string(max_score) + ", Porcentaje: " + string(percentage1));
    if (percentage1 >= 0.9) {
        global.medallaOroNvl1 = true;
        instance_create_layer(x, y, "Instances", Obj_medalla_oro);  // Mostrar medalla de oro
    } else if (percentage1 >= 0.7) {
        instance_create_layer(x, y, "Instances", Obj_medalla_plata); // Mostrar medalla de plata
    } else {
        instance_create_layer(x, y, "Instances", Obj_medalla_bronce); // Mostrar medalla de bronce
    }
}

// Nivel 2
if (roomname == "FinalNivel2") {
    var percentage2 = (global.dineroNvl2 / 3) / max_score;
    show_debug_message("Nivel 2 - Dinero: " + string(global.dineroNvl2) + ", Max Score: " + string(max_score) + ", Porcentaje: " + string(percentage2));
    if (percentage2 >= 0.9) {
        global.medallaOroNvl2 = true;
        instance_create_layer(x, y, "Instances", Obj_medalla_oro);  // Mostrar medalla de oro
    } else if (percentage2 >= 0.7) {
        instance_create_layer(x, y, "Instances", Obj_medalla_plata); // Mostrar medalla de plata
    } else {
        instance_create_layer(x, y, "Instances", Obj_medalla_bronce); // Mostrar medalla de bronce
    }
}

// Nivel 3
if (roomname == "FinalNivel3") {
    var percentage3 = (global.dineroNvl3 / 3) / max_score;
    show_debug_message("Nivel 3 - Dinero: " + string(global.dineroNvl3) + ", Max Score: " + string(max_score) + ", Porcentaje: " + string(percentage3));
    if (percentage3 >= 0.9) {
        global.medallaOroNvl3 = true;
        instance_create_layer(x, y, "Instances", Obj_medalla_oro);  // Mostrar medalla de oro
    } else if (percentage3 >= 0.7) {
        instance_create_layer(x, y, "Instances", Obj_medalla_plata); // Mostrar medalla de plata
    } else {
        instance_create_layer(x, y, "Instances", Obj_medalla_bronce); // Mostrar medalla de bronce
    }
}

// Verificar el logro "Héroe del Medio Ambiente" después de asignar las medallas
verificarLogroHeroeMedioAmbiente();
