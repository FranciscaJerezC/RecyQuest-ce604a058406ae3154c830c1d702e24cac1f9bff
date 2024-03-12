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
        // Agregar un mensaje de depuración para verificar si la función se activa
   

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
            // Llamar a la función clasificarDesecho y pasar las variables como argumentos
            clasificarDesecho(Material, container, roomname);
        }

        seleccionando = false; // Restablecer la variable después de verificar las colisiones
    }
}

