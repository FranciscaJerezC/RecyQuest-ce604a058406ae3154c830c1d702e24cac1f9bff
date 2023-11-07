/// @description Al crear la botella

speed = 3; // Establecer la velocidad deseada del objeto Desecho (puedes ajustar este valor según tus necesidades)
direction = 0; // Establecer la dirección hacia la derecha (0 grados)
lavado = false;
material_quitado = false;
aplastado=false;
moving = false;
clasificado = false;
error = 0;

sprite_index = Spr_plastico2
image_speed = 0;
PuedeMover = false;
// 1->vidrio, 2->Metal, 3->Plastico, 4->Carton, 5->Organico
Material = 3;
image_xscale = 0.7;
image_yscale = 0.7;

roomname = room_get_name(room)
if (roomname == "Nvl2_Clasificacion" || roomname == "Nvl1_Clasificacion" || roomname == "Nvl3_Clasificacion")
	{
		image_index = global.listaIndex[|0];
		ds_list_delete(global.listaIndex, 0);
	}else{
		image_index = 0;
	}


global.nuevoDeshecho = false;