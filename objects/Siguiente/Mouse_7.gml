/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (press == true)
{
	if(global.nivelActual == 1){
		room_goto(Nvl2_Preproceso);
	}else if (global.nivelActual == 2){
		room_goto(Nvl3_Preproceso)
	}else if(global.nivelActual == 3){
		room_goto(MenuInicial)	
	}
	
}