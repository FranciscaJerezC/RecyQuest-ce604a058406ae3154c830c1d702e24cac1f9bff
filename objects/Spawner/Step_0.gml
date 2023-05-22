/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
// Disminuir el temporizador en cada iteración del juego
spawn_timer -= 1;

// Verificar si el temporizador ha alcanzado cero o menos
if (spawn_timer <= 0) {
    // Crear una instancia del objeto Desecho en la posición inicial de la línea de producción
    // Reiniciar el temporizador para permitir la aparición del próximo desecho
    spawn_timer = 2; // Establecer el valor deseado para el tiempo de espera (en este caso, 60 frames)
}