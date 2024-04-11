draw_set_halign(fa_left);
draw_set_font(Puntaje);
draw_set_color(#000000)
roomname = room_get_name(room)

var player_name = gmda_getPlayername();
var id_player = gmda_getPlayerid();
var status = gmda_status();

var pos = gmda_getPlayerpos(1);
var best_score = gmda_getBestscore(1);

if (roomname == "MenuInicial"){
	//draw_text(400, 680, "ID: "+id_player);
	draw_text(400, 680+30, "Nombre: "+player_name );
	//draw_text(400, 680+60, "Status: "+string(status));
			
			
	//draw_text(400, 680, "Posición: "+pos);
	//draw_text(400, 680, "Mejor Puntaje: "+string(best_score));
	
} else if(roomname == "GameOver"){
	draw_set_font(Puntaje);
	draw_set_halign(fa_left);
	draw_text_transformed(1500, 550, "Puntaje: "+string(global.dineroFinal),2,2,0);
	
	draw_text(1500,750, "Nombre: ");
	draw_text(1500+500,750, "Puntaje: ");
	
	 var globalscores= gmda_getTabledata(gmda_globaltable,1);
	
	if (globalscores>0) {
		var tablesize = ds_map_size(globalscores);
		var rowinfo;
		for (var i=1; i<= tablesize;i++){
			rowinfo = ds_map_find_value(globalscores, string(i));
			var name = ds_map_find_value(rowinfo,"name");
			var xscore = ds_map_find_value(rowinfo,"score");
			draw_text(1500,750+80*i,string(i)+". "+string(name)+ "\n");
			draw_text(1500+500,750+80*i,string(xscore)+ "\n");
		} 
	} 
} 

