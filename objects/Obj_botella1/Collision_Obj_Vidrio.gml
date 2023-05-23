/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (Material == 1 )
{
	
	global.botellasClasificadas++;
	instance_destroy();
	global.nuevoDeshecho = true;
	global.dinero+=3;
	global.clasificados2+=1;
	if (global.botellasClasificadas >= global.botellasPorClasificar) {
    room_goto(MenuInicial); // Cambia esto a la acción que corresponda para cambiar al siguiente room.
}
}

