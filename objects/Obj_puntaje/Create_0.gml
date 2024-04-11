
/// @description obj_score Create

max_score = global.acciones / 4 ; // Variable para almacenar el puntaje máximo posible
var percentage = (global.dineroNvl1/3) / max_score;
if (percentage >= 0.9)
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
