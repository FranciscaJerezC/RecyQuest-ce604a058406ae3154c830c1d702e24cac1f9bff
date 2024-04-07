draw_set_halign(fa_left);
draw_set_font(Puntaje);

roomname = room_get_name(room)

var player_name = gmda_getPlayername();
var id_player = gmda_getPlayerid();
var status = gmda_status();

var pos = gmda_getPlayerpos(1);
var best_score = gmda_getBestscore(1);

if (roomname == "MenuInicial"){
	draw_text(400, 680, "ID: "+id_player);
	draw_text(400, 680+30, "Name: "+player_name);
	draw_text(400, 680+60, "Status: "+string(status));
			
			
	draw_text(400, 680, "Posición: "+pos);
	draw_text(400, 680, "Mejor Puntaje: "+string(best_score));
	
} else if(roomname == "GameOver"){
	draw_set_font(Puntaje);
	draw_set_halign(fa_left);
	draw_text_transformed(640, 64, "Puntaje: "+string(global.dinero),2,2,0);
	
	draw_text(480,200, "Name: ");
	draw_text(480+300,200, "Score: ");
	
	 var globalscores= gmda_getTabledata(gmda_globaltable,1);
	
	if (globalscores>0) {
		var tablesize = ds_map_size(globalscores);
		var rowinfo;
		for (var i=1; i<= tablesize;i++){
			rowinfo = ds_map_find_value(globalscores, string(i));
			var name = ds_map_find_value(rowinfo,"name");
			var xscore = ds_map_find_value(rowinfo,"score");
			draw_text(480,200+32*i,string(i)+". "+string(name));
			draw_text(480+300,200+32*i,string(xscore));
		} 
	} 
} 

