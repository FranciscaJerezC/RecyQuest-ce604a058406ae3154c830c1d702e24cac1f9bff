


for (var i = 0; i < ds_list_size(global.logrosObtenidos); i++) {
    var logrositos = ds_list_find_value(global.logrosObtenidos, i);
    
    if (logrositos == "Reciclador Experto") {
        draw_sprite(Spr_LogroReciclador, 0, 200, 350 + i * 20);
    } else if (logrositos == "Maestría en Clasificación") {
        draw_sprite(Spr_LogroMaestria, 0, 200, 700 + i * 20);
    }else if (logrositos == "Héroe del Medio Ambiente") {
        draw_sprite(Spr_LogroHeroe, 0, 200, 1000 + i * 20);
		}
}
