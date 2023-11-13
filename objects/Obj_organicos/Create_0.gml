/// @description Al crear la botella

speed = 3; // Establecer la velocidad deseada del objeto Desecho (puedes ajustar este valor según tus necesidades)
direction = 0; // Establecer la dirección hacia la derecha (0 grados)
lavado = true;
material_quitado = true;
aplastado=true;
moving = false;
clasificado = false;
error = 0;

sprite_index = Spr_organicos
image_speed = 0;
PuedeMover = false;
// 1->vidrio, 2->Metal, 3->Plastico, 4->Carton, 5->Organico
Material = 5;
image_xscale = 0.7;
image_yscale = 0.7;

roomname = room_get_name(room)
if (roomname == "Nvl2_Clasificacion" || roomname == "Nvl1_Clasificacion" || roomname == "Nvl3_Clasificacion")
	{
		image_index = global.listaIndex[|0];
		ds_list_delete(global.listaIndex, 0);
	}else{
		image_index = choose(0,1,2,3);
	}

global.nuevoDeshecho = false;