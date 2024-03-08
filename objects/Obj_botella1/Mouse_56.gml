// Evento "Left Global Released" (Izquierdo global soltado)
PuedeMover = false;
moving = false;

// Establecer la nueva posición en el eje Y después de soltar el objeto
if (roomname == "Nvl2_Clasificacion" || roomname == "Nvl1_Clasificacion" || roomname == "Nvl3_Clasificacion") {
    // Establecer la nueva posición en el eje Y (ajusta el valor "nueva_Y" según tus necesidades)
    var nueva_Y = 820; // Cambia este valor según tu diseño de nivel
    y = nueva_Y;

    // Verificar la colisión con los contenedores solo si el objeto estaba siendo seleccionado
    if (seleccionando) {
        var container = noone;

        // Verificar si el mouse está sobre alguno de los contenedores
        if (place_meeting(mouse_x, mouse_y, Obj_Bas_carton)) {
            container = Obj_Bas_carton;
        } else if (place_meeting(mouse_x, mouse_y, Obj_Bas_metal)) {
            container = Obj_Bas_metal;
        } else if (place_meeting(mouse_x, mouse_y, Obj_Bas_organico)) {
            container = Obj_Bas_organico;
        } else if (place_meeting(mouse_x, mouse_y, Obj_Bas_plastico)) {
            container = Obj_Bas_plastico;
        } else if (place_meeting(mouse_x, mouse_y, Obj_Bas_vidrio)) {
            container = Obj_Bas_vidrio;
        }

        if (container != noone) {
            clasificar(container);
        }

        seleccionando = false; // Restablecer la variable después de verificar las colisiones
    }
}

// Función para clasificar el objeto
function clasificar(contenedor) {
    var objetoMaterial = Material;

    switch (contenedor) {
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
