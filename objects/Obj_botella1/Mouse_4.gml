/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
var roomname = room_get_name(room);

if (roomname == "Nvl2_Clasificacion" || roomname == "Nvl1_Clasificacion" || roomname == "Nvl3_Clasificacion")
{
	
	PuedeMover = true;
    startX = x;
    startY = y;
	if (mouse_check_button_pressed(mb_left)) {
		         seleccionando = true;

}
}