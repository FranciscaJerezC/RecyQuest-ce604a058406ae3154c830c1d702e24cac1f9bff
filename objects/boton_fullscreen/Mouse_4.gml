/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
// Alternar entre pantalla completa y modo normal al hacer clic en el botón
if global.fullscreen {
    window_set_fullscreen(false);
    global.fullscreen = false;
} else {
    window_set_fullscreen(true);
    global.fullscreen = true;
}
