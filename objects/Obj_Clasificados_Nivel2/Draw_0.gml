/// @description Clasificadoss en pantalla
draw_set_font(fnt_main)

draw_set_color(c_white);

//ESTO NO whatever no pude para que se muestre solo los desechos que se pueden clasificar y no los no reciclables
//show_debug_message("Clasificados: " + string(global.clasificados));
//show_debug_message("No Reciclables: " + string(global.clasificadosNoReciclables));
//show_debug_message("Resultado a mostrar: " + string(global.clasificados - global.clasificadosNoReciclables));
draw_text(x, y, string(global.clasificados));
