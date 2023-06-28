for (var i = options.main_volume; i <= options.back; ++i) 
{
    var value = "";
	draw_set_font (Font3) 
    draw_set_color(options_default_color);
    if (i == options_index)
        draw_set_color(options_highlight_color);
    switch (i)
    {
        case options.main_volume:
            value += string(main_volume_value) + "%";
            break;
    }
         
    draw_text(room_width / 2, room_height / 2 + i * 150, options_text[i] + " " + value);
}