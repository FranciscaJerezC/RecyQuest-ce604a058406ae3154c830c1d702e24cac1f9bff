function clasificarDesecho(Material, container, roomname) {
    // Verificar el contenedor proporcionado como argumento
    switch (container) {
        case Obj_Bas_carton:
            objetoMaterial = 4;
            break;
        case Obj_Bas_metal:
            objetoMaterial = 2;
            break;
        case Obj_Bas_organico:
            objetoMaterial = 5;
            break;
        case Obj_Bas_plastico:
            objetoMaterial = 3;
            break;
        case Obj_Bas_vidrio:
            objetoMaterial = 1;
            break;
    }

    if (Material == objetoMaterial) {
        // Clasificación correcta
        instance_destroy();
        global.nuevoDeshecho = true;
        global.dinero += 3;
        global.clasificados -= 1;
        audio_play_sound(Snd_Right, 1, false);
    } else {
        // Clasificación incorrecta
        audio_play_sound(Snd_Error, 1, false);
        if (roomname == "Nvl3_Clasificacion") {
            global.dinero += 1;
            global.nuevoDeshecho = true;
            instance_destroy();
        }
    }
}