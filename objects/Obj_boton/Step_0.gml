/// @description cambio animacion
// si el boton del mouse esta clickeado
// si el mouse esta poscisionado sobre el boton
if(position_meeting(mouse_x, mouse_y, self) and mouse_check_button(mb_left) ){
	image_index = 1;
}else{

	image_index = 0;
}