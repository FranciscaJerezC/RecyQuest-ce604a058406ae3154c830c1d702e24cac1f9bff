// Evento "Left Global Released" (Izquierdo global soltado)
PuedeMover = false;
moving = false;

// Establecer la nueva posición en el eje Y después de soltar el objeto
if (roomname == "Nvl2_Clasificacion" || roomname == "Nvl1_Clasificacion" || roomname == "Nvl3_Clasificacion") {
    // Establecer la nueva posición en el eje Y (ajusta el valor "nueva_Y" según tus necesidades)
    var nueva_Y = 820; // Cambia este valor según tu diseño de nivel
    y = nueva_Y;
}