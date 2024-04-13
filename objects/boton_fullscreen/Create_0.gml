/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
global.fullscreen = false;

// Establecer el modo de pantalla inicial
if global.fullscreen {
    window_set_fullscreen(true);
} else {
    window_set_fullscreen(false);
}