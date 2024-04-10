/// @description realizar accion

if(position_meeting(mouse_x, mouse_y, self) and mouse_check_button(mb_left) ){
	next = true;
}else{
	next = false;
}


if next{
	if(image_index<=1){
		image_index=image_index+1;
	}else{
		image_index = 0;
	}
}