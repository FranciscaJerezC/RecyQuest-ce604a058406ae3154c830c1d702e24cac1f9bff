/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
enum options
{
    main_volume,
    fullscreen,
    back
};

options_text[options.main_volume] = "Main Volume";
options_text[options.fullscreen] = "Fullscreen";
options_text[options.back] = "Back";

main_volume_value = 30;
options_index = 0;
options_timer = 0;

options_default_color = c_black;
options_highlight_color = c_yellow;