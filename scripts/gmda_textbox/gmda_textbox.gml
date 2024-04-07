// CREATE A TEXTBOX INPUT

function gmda_textbox(posx,posy,sizex,sizey,tx,typ,limitx){
/*
argument0: pos x
argument1: pos y
argument2: size x
argument3: size y
argument4: variable
argument5: type  0: alphanumeric, 1:Letters, 2:Numbers
argument6: Limit(lenght)
*/

		var frmt="";
		var txt = string(tx);
		var txtlen=string_length(txt);
		draw_set_valign(fa_center);
		draw_set_halign(fa_left);
		draw_set_colour(c_white);
		draw_roundrect_ext(posx,posy,posx+sizex,posy+sizey,10,10,0);
		draw_set_colour(c_black);
		
		
		switch(typ){
		case 0: frmt="0123456789QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm_" break;
		case 1: frmt="QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm_" break;
		case 2: frmt="0123456789" break;
		}

		if mouse_check_button_pressed(mb_left){
		if point_in_rectangle(mouse_x,mouse_y,posx,posy,posx+sizex,posy+sizey){
		selected=1;
		
		if keyboard_virtual_status() = false{
		keyboard_string =txt;
		}
		keyboard_virtual_show(kbv_type_default, kbv_returnkey_continue, kbv_autocapitalize_none, false);
		
		}else{
		selected=0;
		}}







		var til="";
		if (act && selected){til="|"}
		draw_text(posx+10,posy+sizey/2+3,txt+til);

		if selected{
		    if(keyboard_check_pressed(vk_backspace)){
		        if string_length(txt)>0{
		        txt = string_delete(txt,txtlen,1);
				if (txt="" && typ==2){txt="0";}
		        alarm[0]=10
		        act=-1;
		        }
				 keyboard_string = ""
		    }else if (keyboard_string = " " or  keyboard_string = "\n"){
			      if (typ !=2){
		          txt+="_";
				  
		        }
			
			keyboard_string = "";
			
		    }else if(keyboard_string != ""){
		        var lastch = keyboard_string;
		        if string_count(lastch,frmt)>0{
		        txt+=lastch;
		        }
				keyboard_string = ""
		    }else if(keyboard_check(vk_backspace)){
		        if act{
		            if string_length(txt)>0{
		            txt = string_delete(txt,txtlen,1);
		            }
					if (txt="" && typ==2){txt="0";}
		            alarm[0]=3
		            act=-1;
		        }
				 keyboard_string = ""
		    }
		}
		
		
		if (string_length(txt)>(limitx)){
		while(string_length(txt)>(limitx)){
		txt=string_copy(txt,1,string_length(txt)-1)
		}}
		
		
		return txt;
		
		
		}
		
		
		
		
		