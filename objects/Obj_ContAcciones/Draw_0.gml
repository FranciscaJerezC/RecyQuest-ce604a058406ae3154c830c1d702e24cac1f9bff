/// @description Acciones en pantalla
draw_set_font(fnt_main)

draw_set_color(c_white);

draw_text(x, y, string(global.acciones));

//show_debug_message("Al iniciar nueva room: clasificados no reciclables: " + string(global.clasificadosNoReciclables));
