/// @description obj_score Create

max_score = global.acciones / 4; // Variable para almacenar el puntaje máximo posible
var percentage = (global.dineroNvl1 / 3) / max_score;

if (percentage >= 0.9) {
    instance_create_layer(x, y, "Instances", Obj_medalla_oro);  // Mostrar medalla de oro
    
    // Marcar que se ha ganado la medalla de oro en el nivel correspondiente
    if (room_get_name(room) == "Nvl1") {
        global.medallaOroNvl1 = true;
    } else if (room_get_name(room) == "Nvl2") {
        global.medallaOroNvl2 = true;
    } else if (room_get_name(room) == "Nvl3") {
        global.medallaOroNvl3 = true;
    }
}
else if (percentage >= 0.7) {
   instance_create_layer(x, y, "Instances", Obj_medalla_plata); // Mostrar medalla de plata
}
else {
  instance_create_layer(x, y, "Instances", Obj_medalla_bronce); // Mostrar medalla de bronce
}

// Verificar si se ha cumplido el logro "Héroe del Medio Ambiente"
verificarLogroHeroeMedioAmbiente();
