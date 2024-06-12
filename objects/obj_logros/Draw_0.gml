// Establecer la opacidad para los sprites en blanco y negro
draw_set_alpha(1);

// Dibuja los logros en blanco y negro por defecto
draw_sprite(Spr_LogroRecicladorBW, 0,  -300, 200);
draw_sprite(Spr_LogroMaestriaBW, 0, -300, 800);
draw_sprite(Spr_LogroHeroeBW, 0, 1000, 200);
draw_sprite(Spr_LogroAprendizBW, 0, 1000, 800);
draw_sprite(Spr_LogroMaestroBW, 0, 2200, 200);
draw_sprite(Spr_LogroDiosBW, 0, 2200, 800);

// Dibuja los logros en color con opacidad completa si se han conseguido
for (var i = 0; i < ds_list_size(global.logrosObtenidos); i++) {
    var logrositos = ds_list_find_value(global.logrosObtenidos, i);

    if (logrositos == "Reciclador Experto") {
        draw_set_alpha(1);
        draw_sprite(Spr_LogroReciclador, 0,-300, 200);
        draw_set_alpha(0);  // Ajusta la opacidad a 0 para ocultar el sprite en blanco y negro
        draw_sprite(Spr_LogroRecicladorBW, 0, -300, 200);
        draw_set_alpha(1);  // Restablece la opacidad a 1
    } else if (logrositos == "Maestría en Clasificación") {
        draw_set_alpha(1);
        draw_sprite(Spr_LogroMaestria, 0, -300, 800);
        draw_set_alpha(0);
        draw_sprite(Spr_LogroMaestriaBW, 0,-300, 800);
        draw_set_alpha(1);
    } else if (logrositos == "Héroe del Medio Ambiente") {
        draw_set_alpha(1);
        draw_sprite(Spr_LogroHeroe, 0,  1000, 200);
        draw_set_alpha(0);
        draw_sprite(Spr_LogroHeroeBW, 0,  1000, 200);
        draw_set_alpha(1);
    } else if (logrositos == "Aprendiz del Preproceso") {
        draw_set_alpha(1);
        draw_sprite(Spr_LogroAprendiz, 0, 1000, 800);
        draw_set_alpha(0);
        draw_sprite(Spr_LogroAprendizBW, 0,  1000, 800);
        draw_set_alpha(1);
    } else if (logrositos == "Maestro del Preproceso") {
        draw_set_alpha(1);
        draw_sprite(Spr_LogroMaestro, 0, 2200, 200);
        draw_set_alpha(0);
        draw_sprite(Spr_LogroMaestroBW, 0, 2200, 200);
        draw_set_alpha(1);
    } else if (logrositos == "Dios del Preproceso") {
        draw_set_alpha(1);
        draw_sprite(Spr_LogroDios, 0, 2200, 800);
        draw_set_alpha(0);
        draw_sprite(Spr_LogroDiosBW, 0, 2200, 800);
        draw_set_alpha(1);
    }
}

// Restablece la opacidad a 1 después de dibujar
draw_set_alpha(1);