/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (!music_played)
{
    // Reproducir la música de fondo aquí
    audio_play_sound(Snd_BackMusic, 1, true);
    music_played = true; // Marcar que la música ya se reprodujo
}
