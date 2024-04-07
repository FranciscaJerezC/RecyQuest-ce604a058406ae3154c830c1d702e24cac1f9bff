/* Draw Leaderboard */

function gmda_draw_table(xc,yc,table,identifyplayer){

/*
xc - x position
yc - y position
table - table information(ds_map)
identifyplayer - Identify player?, it will color player´s row(Leave it empty if you dont want)
*/

/* Titles */
var titles;
titles[1]="Name: " //Name
titles[2]="Score: " //Score
titles[3]="Level: " //Extra information 1(example)
titles[4]="Kills: " //Extra information 2(example)
titles[5]="Country: " //Extra information 3(example)

var size=ds_map_size(table);
var rowspace=32; //space between rows
var horsize=632; //horizontal lenght
var colortoidentify=c_green; //Color to identify player

draw_set_colour(c_dkgray);
draw_roundrect(xc,yc,xc+horsize,yc+rowspace*11,0);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

if size>0{
for(var i=1;i<=size;i++){
    var infoplayer=ds_map_find_value(table,string(i)); //Get individual player information
    var name=ds_map_find_value(infoplayer,"name");
    var xscore=ds_map_find_value(infoplayer,"score");
    var d1=ds_map_find_value(infoplayer,"d1");
    var d2=ds_map_find_value(infoplayer,"d2");
    var d3=ds_map_find_value(infoplayer,"d3");

      if (name==identifyplayer){
    //Change color if it's the player's row
      draw_set_colour(colortoidentify);
      }else{
      draw_set_colour(c_gray);}
      draw_roundrect(xc+4,yc+rowspace*i,xc+horsize-4,yc+rowspace*i+rowspace-4,0) //Draw Rows
      draw_set_colour(c_white);
      draw_text(xc+10,yc+rowspace*i+16,string(i)+". "+name);
      draw_text(xc+200,yc+rowspace*i+16,xscore);
      draw_text(xc+300,yc+rowspace*i+16,d1);
      draw_text(xc+400,yc+rowspace*i+16,d2);
      draw_text(xc+500,yc+rowspace*i+16,d3);

}}

// Draw titles of leaderboard information
draw_set_colour(c_white);
var inc;
  for(var s=0;s<5;s++){
  if (s==0){inc=10}else{inc=100;}
  draw_text(xc+inc+s*100,yc+22,titles[s+1])
  }
}