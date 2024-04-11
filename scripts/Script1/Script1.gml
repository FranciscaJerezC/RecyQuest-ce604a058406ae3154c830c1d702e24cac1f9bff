function clasificarDesecho(Material, container, roomname) {
    // Verificar el contenedor proporcionado como argumento
    switch (container) {
        case Obj_Bas_carton:
            objetoMaterial = 4;
            break;
        case Obj_Bas_metal:
            objetoMaterial = 2;
            break;
        case Obj_Bas_organico:
            objetoMaterial = 5;
            break;
        case Obj_Bas_plastico:
            objetoMaterial = 3;
            break;
        case Obj_Bas_vidrio:
            objetoMaterial = 1;
            break;
    }


switch (roomname){
	case "Nvl1_Clasificacion":
		if (Material == objetoMaterial) {
			// Clasificación correcta
			instance_destroy();
			global.nuevoDeshecho = true;
			global.dineroNvl1 += 3;
			global.dineroFinal += 3;
			global.clasificados -= 1;
			audio_play_sound(Snd_Right, 1, false);
		} else {
			// Clasificación incorrecta
			audio_play_sound(Snd_Error, 1, false);
		}
		break;
	case "Nvl2_Clasificacion":
		if (Material == objetoMaterial) {
			// Clasificación correcta
			instance_destroy();
			global.nuevoDeshecho = true;
			global.dineroNvl2 += 3;
			global.dineroFinal += 3;
			global.clasificados -= 1;
			audio_play_sound(Snd_Right, 1, false);
		} else {
			// Clasificación incorrecta
			audio_play_sound(Snd_Error, 1, false);
		}
		break;
	case "Nvl3_Clasificacion":
			if (Material == objetoMaterial) {
				// Clasificación correcta
				instance_destroy();
				global.nuevoDeshecho = true;
				global.dineroNvl3 += 3;
				global.dineroFinal += 3;
				global.clasificados -= 1;
				audio_play_sound(Snd_Right, 1, false);
			} else {
				// Clasificación incorrecta
				audio_play_sound(Snd_Error, 1, false);
				global.dineroNvl3 += 1;
				global.dineroFinal += 1;
				global.nuevoDeshecho = true;
				instance_destroy();
			}
			break;
	}
}