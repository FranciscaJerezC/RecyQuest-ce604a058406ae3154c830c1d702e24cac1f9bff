/// @description Al crear la botella

speed = 3; // Establecer la velocidad deseada del objeto Desecho (puedes ajustar este valor según tus necesidades)
direction = 0; // Establecer la dirección hacia la derecha (0 grados)
lavado = false;
material_quitado = false;
aplastado=true;

clasificado = false;

sprite_index = choose(Spr_botella1,Spr_botella2,Spr_botella3);
image_speed = 0;
image_index = 0;
PuedeMover = false;
Material = 1;
image_xscale = 0.7;
image_yscale = 0.7;


global.nuevoDeshecho = false;