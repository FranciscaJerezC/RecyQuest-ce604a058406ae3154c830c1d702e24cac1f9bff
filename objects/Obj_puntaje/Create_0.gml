
/// @description obj_score Create

max_score = 20; // Variable para almacenar el puntaje máximo posible
var percentage = global.dinero / max_score;
if (percentage >= 1)
{
    instance_create_layer(x, y, "Instances", Obj_medalla_oro);  // Mostrar medalla de oro
}
else if (percentage >= 0.7)
{
   instance_create_layer(x, y, "Instances", Obj_medalla_plata); // Mostrar medalla de plata
}
else
{
  instance_create_layer(x, y, "Instances", Obj_medalla_bronce); // Mostrar medalla de bronce
}
