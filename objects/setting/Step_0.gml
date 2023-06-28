var vertical = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
var horizontal = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
var select = keyboard_check_pressed(vk_enter);

if (options_timer <= 0)
{
    options_index += vertical;

    if (options_index < options.main_volume)
        options_index = options.back;
    else if (options_index > options.back)
        options_index = options.main_volume;

    switch (options_index)
    {
        case options.main_volume:
            main_volume_value += horizontal;
            main_volume_value = clamp(main_volume_value, 0, 100);
            audio_master_gain(main_volume_value / 100);
            break;
        case options.fullscreen:
            if (select)
                window_set_fullscreen(true);
            break;
		case options.back:
		    if (select)
		    {
		        // Inserta aquí el código para ir al menú inicial del juego
		        room_goto(MenuInicial); // Reemplaza "menu_inicial" con el nombre de la habitación del menú inicial
		    }
		    break;
    }

    if (vertical != 0 || horizontal != 0)
        options_timer = 0.05 * room_speed;
}
else
{
    options_timer--;
}
