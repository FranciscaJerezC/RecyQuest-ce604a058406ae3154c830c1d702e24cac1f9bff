/* Draw Achievements */
function gmda_draw_achievements(xc,yc){
/*
xc - x position
yc - y position
*/
//Get Achievements ds_map
var table=gmda_get_achievement_list();
//Sprite of the achievements image
var spr_achievements=spr_achievements_images; //Achievements sprite
var rowspace=48; //Row space
var horsize=300; //horizontal lenght

if not(is_undefined(table)){
var size=ds_map_size(table);

//Draw table
draw_set_colour(c_dkgray);
draw_roundrect(xc,yc-4,xc+horsize,yc+rowspace*size,0);

if size>0{

for(var i=0;i < size;i++){
var infoachievement=ds_map_find_value(table,string(i+1));
	//Get achievement information
	var name=ds_map_find_value(infoachievement,"name");
	var descrip=ds_map_find_value(infoachievement,"descrip")
	var img_num=real(ds_map_find_value(infoachievement,"value"));
	var id_ach=ds_map_find_value(infoachievement,"ide");
	var achieved=gmda_check_achievement(id_ach);
	
	//Change row color if the achievement was got
	if (achieved){draw_set_color(c_green)}else{draw_set_color(c_gray)}
	 draw_roundrect(xc+4,yc+rowspace*i,xc+horsize-4,yc+rowspace*i+rowspace-4,0); //Draw Rows
	//Draw information
  	draw_sprite(spr_achievements,img_num,xc+24,yc+rowspace*i+10)
	draw_set_colour(c_yellow);
	draw_text(xc+8+60,yc+16+rowspace*i,name)
	draw_set_colour(c_white);
	draw_text(xc+8,yc+rowspace*i+16,string(i+1)+". ");
	draw_text(xc+8+60,yc+36+rowspace*i,descrip)

}}}}