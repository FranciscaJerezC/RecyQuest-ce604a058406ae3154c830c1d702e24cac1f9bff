#define gmda_setNewname
var gmd_res=0;
var gmd_new_name=string(argument0);
if instance_exists(global.gmd_controllerid){

var gmd_dat_http = "&act=setname&usu="+global.gmd_user_id+"&newname="+string(gmd_new_name);
with(global.gmd_controllerid){
if gmd_tokact{
	var gmd_pass=md5_string_utf8(global.gmd_user_id+gmd_Game_key+gmd_tokey);
	var gmd_dat_http_sen = "gam_id="+gmd_Game_id+"&pass="+gmd_pass+gmd_dat_http;
	gmd_setnewname = http_request(gmd_site, "POST", gmd_post_headers, gmd_dat_http_sen);
	gmd_res = 1;
	gmd_tokact = 0;
}
}

}

return 1;


#define gmda_start_inic
global.gmd_controllerid=noone;
return 0;


#define gmda_getSession
var gmd_res=0;
var gmd_xrecovercode =string(argument0);
if instance_exists(global.gmd_controllerid){
with(global.gmd_controllerid){
if gmd_tokact{
	var gmd_pass=md5_string_utf8(gmd_Game_key);
	gmd_recoversession = http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+gmd_Game_id+"&pass="+gmd_pass+"&act=recoversession&recovercode="+gmd_xrecovercode);
	gmd_res=1;
	gmd_tokact=0;
}
}}

return 1;

#define gmda_getRecoverycode
var gmd_res=0;
if instance_exists(global.gmd_controllerid){
with(global.gmd_controllerid){
if gmd_tokact{
	var gmd_pass=md5_string_utf8(global.gmd_user_id+gmd_Game_key+gmd_tokey);
	gmd_getrecoverycode = http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+gmd_Game_id+"&pass="+gmd_pass+"&act=createrecovercode&usu="+global.gmd_user_id);
	gmd_res=1;
	gmd_tokact=0;
}
}}

return 1;

#define gmda_status
var gmd_res=0;
if instance_exists(global.gmd_controllerid){
gmd_res=global.gmd_controllerid.gmd_tokact;
}
if not(os_is_network_connected()){gmd_res=0;}
return gmd_res;



#define gmda_refreshDate
	if os_is_network_connected(){
	if instance_exists(global.gmd_controllerid){
	with(global.gmd_controllerid){

	gmd_getdate = http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+gmd_Game_id+"&pass="+md5_string_utf8(gmd_Game_key)+"&ses="+string(gmd_ses)+"&act=getdate");
	gmd_tokact=0;
}}}
return 1;

#define gmda_getDate
gmd_res="";
if instance_exists(global.gmd_controllerid){
gmd_res=global.gmd_datetime
}
return gmd_res;


#define gmda_getPlayerid
var gmd_res="";
if instance_exists(global.gmd_controllerid){
with(global.gmd_controllerid){

if not(global.gmd_user_id==""){
gmd_res=sha1_string_unicode(global.gmd_user_id);
}}}
return gmd_res;

#define gmda_getPlayername
var gmd_res="";
if instance_exists(global.gmd_controllerid){
gmd_res=global.gmd_name;
}
return gmd_res;


#define gmda_getPlayerpos
var gmd_res="";
if instance_exists(global.gmd_controllerid){
gmd_res=string(global.gmd_playerpos[argument0]);
}
return gmd_res;


#define gmda_getExtrainfo
var gmd_res= "";
if instance_exists(global.gmd_controllerid){
switch(argument0){
case 1:
	gmd_res=string(global.gmd_dat1[argument1]);
break;
case 2:
	gmd_res=string(global.gmd_dat2[argument1]);
break;
case 3:
	gmd_res=string(global.gmd_dat3[argument1]);
break;
default:

break;
}}
return gmd_res;





#define gmda_reloadinfo
if instance_exists(global.gmd_controllerid){
global.gmd_globaltablerows[0][1] = -1;
global.gmd_globaltablerows[0][2] = -1;
global.gmd_controllerid.gmd_timer_trig=100;
}
return 1;



#define x_gmda_post

var gmd_req = http_post_string(argument0,argument1);

return 123;


#define x_gmda_savelog
if instance_exists(global.gmd_controllerid){
var gmd_logname="log.dat";

var gmd_nuevolog=ds_map_create();

	ds_map_add(gmd_nuevolog,x_gmda_chna("id"),string(global.gmd_user_id))
	ds_map_add(gmd_nuevolog,x_gmda_chna("alias"),string(global.gmd_name))
	ds_map_add(gmd_nuevolog,x_gmda_chna("logros"),string(global.gmd_logros))

for(var gmd_i=1;gmd_i<=3;gmd_i++){
	ds_map_add(gmd_nuevolog,x_gmda_chna("globpos_"+string(gmd_i)),string(global.gmd_playerpos[gmd_i]))
	ds_map_add(gmd_nuevolog,x_gmda_chna("bestscore_"+string(gmd_i)),string(global.gmd_bestscore[gmd_i]))
	ds_map_add(gmd_nuevolog,x_gmda_chna("dat1_"+string(gmd_i)),string(global.gmd_dat1[gmd_i]))
	ds_map_add(gmd_nuevolog,x_gmda_chna("dat2_"+string(gmd_i)),string(global.gmd_dat2[gmd_i]))
	ds_map_add(gmd_nuevolog,x_gmda_chna("dat3_"+string(gmd_i)),string(global.gmd_dat3[gmd_i]))
}

ds_map_secure_save(gmd_nuevolog,gmd_logname);
ds_map_destroy(gmd_nuevolog);


	global.gmd_userdat=ds_map_secure_load(gmd_logname);
}
return 1;







#define x_gmda_explode

gmd_num=argument1;
gmd_sepa=argument2;
gmd_strin=argument0+string(gmd_sepa);

var gmd_res;
var gmd_ns;
var gmd_numsep = string_count(gmd_sepa,gmd_strin)+1;

for (var gmd_i=0; gmd_i<gmd_numsep; gmd_i+=1) {
	if (gmd_i < gmd_numsep)
	    gmd_ns[gmd_i] = string_copy(gmd_strin,1,string_pos(gmd_sepa,gmd_strin)-1);
	    gmd_strin = string_delete(gmd_strin,1,string_length(string(gmd_ns[gmd_i])+string(gmd_sepa)));
	}

	if gmd_num=-1{
	gmd_res= gmd_ns;
	}else{
	gmd_res= gmd_ns[gmd_num];
	}

return gmd_res;


#define gmda_personalized
var gmd_res=0;

if instance_exists(global.gmd_controllerid){
with(global.gmd_controllerid){
if gmd_tokact{

var gmd_type_per= argument[0];
var gmd_numdat = argument_count-1;

var gmd_dat;
gmd_dat[1]="";
gmd_dat[2]="";
gmd_dat[3]="";

for(var gmd_i=1;gmd_i<=gmd_numdat;gmd_i++){
    gmd_dat[gmd_i]=string(argument[gmd_i]);
}

var gmd_pass=md5_string_utf8(string("p"+global.gmd_user_id+gmd_tokey));
gmd_personalize_func=http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+string(gmd_Game_id)+"&pass="+gmd_pass+"&act=personalized&type="+gmd_type_per+"&usu="+string(global.gmd_user_id)+"&dat1="+gmd_dat[1]+"&dat2="+gmd_dat[2]+"&dat3="+gmd_dat[3]);

gmd_res=1;
gmd_tokact=0;
}}}

return gmd_res;


#define gmda_submit
var gmd_res=0;
var gmd_tab=argument[0];
if instance_exists(global.gmd_controllerid){

with(global.gmd_controllerid){
if gmd_tokact{

var gmd_new_score = argument[1];
var gmd_numdat = argument_count-2;

var gmd_dat;
gmd_dat[1]="";
gmd_dat[2]="";
gmd_dat[3]="";

for(var gmd_i=1;gmd_i<=gmd_numdat;gmd_i++){
    gmd_dat[gmd_i]=string(argument[gmd_i+1]);
}

var gmd_pass=md5_string_utf8(string(global.gmd_user_id+gmd_Table_id[gmd_tab]+string(gmd_new_score)+gmd_tokey));
gmd_submitresponse=http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+string(gmd_Game_id)+"&tab_id="+gmd_Table_id[gmd_tab]+"&pass="+gmd_pass+"&act=submit&usu="+string(global.gmd_user_id)+"&sco="+string(gmd_new_score)+"&dat1="+gmd_dat[1]+"&dat2="+gmd_dat[2]+"&dat3="+gmd_dat[3]);
gmd_res=1;
gmd_tokact=0;
}}}

return gmd_res;



#define gmda_Updatefunction
	if (global.gmd_controllerid==id){
	
	global.gmd_controllerid.gmd_timer_trig+=0.5;
	if (global.gmd_controllerid.gmd_timer_trig>10){
	global.gmd_controllerid.gmd_timer_trig=-80;

	if not(global.gmd_user_id==""){
		if (gmd_tokact<=0){
		
		if os_is_network_connected(){
		
		var gmd_pass=md5_string_utf8(global.gmd_user_id+gmd_Game_key);
		gmd_Gettokey = http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+gmd_Game_id+"&pass="+gmd_pass+"&act=tok&usu="+global.gmd_user_id);
		}}
		
	}else{
	
		if file_exists("log.dat"){
		global.gmd_userdat=ds_map_secure_load("log.dat");
	   	if ds_exists(global.gmd_userdat, ds_type_map)&&(not(is_undefined(ds_map_find_value(global.gmd_userdat,x_gmda_chna("id"))))){
	
		global.gmd_user_id= ds_map_find_value(global.gmd_userdat,x_gmda_chna("id"));
		if not(is_undefined(ds_map_find_value(global.gmd_userdat,x_gmda_chna("alias")))){global.gmd_name=ds_map_find_value(global.gmd_userdat,x_gmda_chna("alias")); }
		if not(is_undefined(ds_map_find_value(global.gmd_userdat,x_gmda_chna("logros")))){global.gmd_logros=ds_map_find_value(global.gmd_userdat,x_gmda_chna("logros"))}
		
		for(var gmd_i=1;gmd_i<=3;gmd_i++){
		var gmd_noupd=0;
		if not(is_undefined(ds_map_find_value(global.gmd_userdat,x_gmda_chna("globpos_"+string(gmd_i))))){ global.gmd_playerpos[gmd_i]=ds_map_find_value(global.gmd_userdat,x_gmda_chna("globpos_"+string(gmd_i))) gmd_noupd+=1;}
		if not(is_undefined(ds_map_find_value(global.gmd_userdat,x_gmda_chna("bestscore_"+string(gmd_i))))){global.gmd_bestscore[gmd_i]=ds_map_find_value(global.gmd_userdat,x_gmda_chna("bestscore_"+string(gmd_i))) gmd_noupd+=1;}
		if not(is_undefined(ds_map_find_value(global.gmd_userdat,x_gmda_chna("dat1_"+string(gmd_i))))){global.gmd_dat1[gmd_i]=ds_map_find_value(global.gmd_userdat,x_gmda_chna("dat1_"+string(gmd_i))) gmd_noupd+=1;}
		if not(is_undefined(ds_map_find_value(global.gmd_userdat,x_gmda_chna("dat2_"+string(gmd_i))))){global.gmd_dat2[gmd_i]=ds_map_find_value(global.gmd_userdat,x_gmda_chna("dat2_"+string(gmd_i))) gmd_noupd+=1;}
		if not(is_undefined(ds_map_find_value(global.gmd_userdat,x_gmda_chna("dat3_"+string(gmd_i))))){global.gmd_dat3[gmd_i]=ds_map_find_value(global.gmd_userdat,x_gmda_chna("dat3_"+string(gmd_i))) gmd_noupd+=1;}
		ds_map_clear(global.gmd_userdat);
			if (gmd_noupd==5){
						global.gmd_globaltablerows[gmd_i][2]=1;
		
						var gmd_playertab=gmda_getTabledata(2,gmd_i);
						var gmd_playerinfo=ds_map_create();
						var gmd_nom=global.gmd_name;
						var gmd_sco=global.gmd_bestscore[gmd_i];
						var gmd_d1=global.gmd_dat1[gmd_i];
						var gmd_d2=global.gmd_dat2[gmd_i];
						var gmd_d3=global.gmd_dat3[gmd_i];
	
						ds_map_add(gmd_playerinfo,"name",gmd_nom);
						ds_map_add(gmd_playerinfo,"score",gmd_sco);
						ds_map_add(gmd_playerinfo,"d1",gmd_d1);
						ds_map_add(gmd_playerinfo,"d2",gmd_d2);
						ds_map_add(gmd_playerinfo,"d3",gmd_d3);
						ds_map_add(gmd_playerinfo,"img","");
						ds_map_replace_map(gmd_playertab,string(1),gmd_playerinfo);
						global.gmd_controllerid.gmd_timer_trig=100;


			}
		}


		}else{
		file_delete("log.dat");
	        gmd_createplayer=http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+gmd_Game_id+"&pass="+md5_string_utf8(gmd_Game_key)+"&ses="+string(gmd_ses)+"&act=newuser");
	        gmd_tokact=0;
	    }
		}else{
		gmd_createplayer=http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+gmd_Game_id+"&pass="+md5_string_utf8(gmd_Game_key)+"&ses="+string(gmd_ses)+"&act=newuser");
	        gmd_tokact=0;
		}
		
	}


if os_is_network_connected(){

if global.gmd_datetime=""{
gmda_refreshDate();
}



	var gmd_datatablestr="";
	for(gmd_i=1;gmd_i<=global.gmd_numberld;gmd_i++){
	gmd_datatablestr+="&tab"+string(gmd_i)+"="+string(gmd_Table_id[gmd_i]);
	}


if (global.gmd_globaltablerows[0][1]== -1){
	var gmd_pass=md5_string_utf8(gmd_Table_id[1]+gmd_Table_id[2]+gmd_Table_id[3]+gmd_Game_key+"gamdat66");
	gmd_Get_leaderboardinfo=http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+string(gmd_Game_id)+gmd_datatablestr+"&pass="+gmd_pass+"&act=getdata");
}

if (global.gmd_globaltablerows[0][2]== -1){
if not(global.gmd_user_id=""){
if gmd_tokact{
	var gmd_pass=md5_string_utf8(gmd_Table_id[1]+gmd_Table_id[2]+gmd_Table_id[3]+gmd_Game_key+"gamdat66"+string(gmd_tokey));
	
gmd_getuserld=http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+string(gmd_Game_id)+"&usu="+global.gmd_user_id+gmd_datatablestr+"&pass="+gmd_pass+"&act=getdata");


}}}

}

}}


return 1;





#define gmda_getBestscore
var gmd_res="";
if instance_exists(global.gmd_controllerid){
gmd_res=global.gmd_bestscore[argument0];
}
return gmd_res;


#define gmda_getTabledata
	var gmd_type=argument0;
	var gmd_getdatatable=-1;
if instance_exists(global.gmd_controllerid){

switch(gmd_type){
		case 1:
		gmd_getdatatable=ds_map_find_value(global.gmd_globaltable,string(argument1));
		break;
		case 2:
		gmd_getdatatable=ds_map_find_value(global.gmd_playertable,string(argument1));
		break;
		default:
		
		break;

	}
}

return gmd_getdatatable;

#define gmda_HTTPfunction

if (global.gmd_controllerid==id){

var gmd_ide = ds_map_find_value(async_load, "id");
if gmd_ide{
var gmd_value="";
if (ds_map_find_value(async_load, "status") == 0){
gmd_value = ds_map_find_value(async_load, "result");



	
if not(gmd_value=""){

var gmd_resp=json_decode(gmd_value);

if gmd_resp{
if ds_map_exists(gmd_resp,"data") && ds_map_exists(gmd_resp,"status"){
var gmd_resultMap=ds_map_find_value(gmd_resp,"data");
var gmd_status=ds_map_find_value(gmd_resp,"status");

if (gmd_status=="1"){
	

switch(gmd_ide){

case gmd_Gettokey:
if not(is_undefined(ds_map_find_value(gmd_resultMap,"tok"))){
	if (ds_map_find_value(gmd_resultMap,"tok")=="-1"){
	if file_exists("log.dat"){
	file_delete("log.dat");
	global.gmd_user_id="";

	
	}
	}else{
	gmd_tokact=1
    gmd_tokey=ds_map_find_value(gmd_resultMap,"tok");
    //global.gmd_name=ds_map_find_value(gmd_resultMap,"name");
	}}
    
break;

case gmd_Get_leaderboardinfo:
var gmd_data_tab1=ds_map_find_value(gmd_resultMap,"t1");
var gmd_data_tab2=ds_map_find_value(gmd_resultMap,"t2");
var gmd_data_tab3=ds_map_find_value(gmd_resultMap,"t3");


if not(is_undefined(gmd_data_tab1)){q_gmda_leadboardreciv_map(1,gmd_data_tab1,1);}
if not(is_undefined(gmd_data_tab2)){q_gmda_leadboardreciv_map(2,gmd_data_tab2,1);}
if not(is_undefined(gmd_data_tab3)){q_gmda_leadboardreciv_map(3,gmd_data_tab3,1);}

break;

case gmd_getuserld:


var gmd_data_tab1=ds_map_find_value(gmd_resultMap,"t1");
var gmd_data_tab2=ds_map_find_value(gmd_resultMap,"t2");
var gmd_data_tab3=ds_map_find_value(gmd_resultMap,"t3");
var gmd_data_logros=ds_map_find_value(gmd_resultMap,"ach");



if not(is_undefined(gmd_data_tab1)){q_gmda_leadboardreciv_map(1,gmd_data_tab1,2);}
if not(is_undefined(gmd_data_tab2)){q_gmda_leadboardreciv_map(2,gmd_data_tab2,2);}
if not(is_undefined(gmd_data_tab3)){q_gmda_leadboardreciv_map(3,gmd_data_tab3,2);}
if not(is_undefined(gmd_data_logros)){global.gmd_logros=gmd_data_logros;}


x_gmda_savelog();

break;

case gmd_createplayer:

if not(is_undefined(ds_map_find_value(gmd_resultMap,"idgen"))){
if not(is_undefined(ds_map_find_value(gmd_resultMap,"nomgen"))){
   global.gmd_user_id=ds_map_find_value(gmd_resultMap,"idgen");
   global.gmd_name=ds_map_find_value(gmd_resultMap,"nomgen");

var gmd_get_scr=asset_get_index("scrHTTP_player");
if (gmd_get_scr>-1){
   scrHTTP_player("4","");
}
	
   for(var gmd_i=1;gmd_i<=3;gmd_i++){
   global.gmd_playerpos[gmd_i]="";
   global.gmd_bestscore[gmd_i]=0;
   global.gmd_dat1[gmd_i]="";
   global.gmd_dat2[gmd_i]="";
   global.gmd_dat3[gmd_i]="";
}
   x_gmda_savelog();
}}
   if instance_exists(global.gmd_controllerid){
gmd_tokact=-1;
global.gmd_globaltablerows[0][1] = -1;
global.gmd_globaltablerows[0][2] = -1;
global.gmd_controllerid.gmd_timer_trig=100;
}

break;


case gmd_recoversession:
if not(is_undefined(ds_map_find_value(gmd_resultMap,"type"))){
if not(is_undefined(ds_map_find_value(gmd_resultMap,"idgen"))){
if not(is_undefined(ds_map_find_value(gmd_resultMap,"nomgen"))){
   var gmd_nam=ds_map_find_value(gmd_resultMap,"nomgen");
   var gmd_r=ds_map_find_value(gmd_resultMap,"type");
   
	
if (gmd_r=="1"){
   global.gmd_user_id=ds_map_find_value(gmd_resultMap,"idgen");
   global.gmd_name=gmd_nam;
   gmd_tokact=-1;
   for(var gmd_i=1;gmd_i<=3;gmd_i++){
   global.gmd_playerpos[gmd_i]="";
   global.gmd_bestscore[gmd_i]=0;
   global.gmd_dat1[gmd_i]="";
   global.gmd_dat2[gmd_i]="";
   global.gmd_dat3[gmd_i]="";
}
   x_gmda_savelog();
}


if instance_exists(global.gmd_controllerid){
global.gmd_globaltablerows[0][1] = -1;
global.gmd_globaltablerows[0][2] = -1;
global.gmd_controllerid.gmd_timer_trig=100;
}

var gmd_get_scr=asset_get_index("scrHTTP_cloud");
if (gmd_get_scr>-1){

if (gmd_r=="1"){gmd_r="4";}else if(gmd_r=="0"){gmd_r="-4";}
scrHTTP_cloud(gmd_r,global.gmd_name);
	
}



}}}




break;

case gmd_setnewname:
if not(is_undefined(ds_map_find_value(gmd_resultMap,"type"))){
if not(is_undefined(ds_map_find_value(gmd_resultMap,"name"))){
var gmd_r=ds_map_find_value(gmd_resultMap,"type");
var gmd_nam=ds_map_find_value(gmd_resultMap,"name");

var gmd_get_scr=asset_get_index("scrHTTP_player");
if (gmd_get_scr>-1){
scrHTTP_player(gmd_r,gmd_nam);
}

if (floor(real(gmd_r))==1){
	
global.gmd_name=gmd_nam;
x_gmda_savelog();

}}}
break;

case gmd_getrecoverycode:
if not(is_undefined(ds_map_find_value(gmd_resultMap,"type"))){
if not(is_undefined(ds_map_find_value(gmd_resultMap,"codegen"))){


var gmd_r=ds_map_find_value(gmd_resultMap,"type");
var gmd_code=ds_map_find_value(gmd_resultMap,"codegen");


var gmd_get_scr=asset_get_index("scrHTTP_cloud");
if (gmd_get_scr>-1){
if (gmd_r=="1"){gmd_r="3";}else{gmd_r="-3";}
scrHTTP_cloud(gmd_r,gmd_code);
}

}}
break;


case gmd_submitresponse:
if not(is_undefined(ds_map_find_value(gmd_resultMap,"type"))){
var gmd_r=ds_map_find_value(gmd_resultMap,"type");


var gmd_get_scr=asset_get_index("scrHTTP_player");
if (gmd_r=="1"){gmd_r="3";}else
if (gmd_r=="-2"){gmd_r="-3";}
if (gmd_get_scr>-1){
scrHTTP_player(gmd_r,"");
}

gmda_reloadinfo();
}

break;

case gmd_getsubmitgamesave:
if (gmd_resultMap!="-1"){
var gmd_r=ds_map_find_value(gmd_resultMap,"type");

var gmd_get_scr=asset_get_index("scrHTTP_cloud");
if (gmd_get_scr>-1){
if (gmd_r=="1"){gmd_r="2";}else
if (gmd_r=="0"){gmd_r="-1";}
scrHTTP_cloud(gmd_r);
}

}


break;
case gmd_personalize_func:
if (gmd_resultMap!="-1"){
var gmd_r=ds_map_find_value(gmd_resultMap,"type");


if not(is_undefined(gmd_r)){
var gmd_getdata = ds_map_find_value(gmd_resultMap,"get_data");
var gmd_get_scr=asset_get_index("scrHTTP_game");
if (gmd_get_scr>-1){
scrHTTP_game(gmd_r,gmd_getdata);
}

}}


break;

case gmd_setachievement:

if (gmd_resultMap!="-1"){
var gmd_r=ds_map_find_value(gmd_resultMap,"type");

var gmd_idach="";
if not(is_undefined(ds_map_find_value(gmd_resultMap,"id_ach"))){
gmd_idach=ds_map_find_value(gmd_resultMap,"id_ach");
}


if not(is_undefined(gmd_r)){


var gmd_get_scr=asset_get_index("scrHTTP_game");
if (gmd_get_scr>-1){
scrHTTP_game(gmd_r,gmd_idach)
}

}}
gmda_reloadinfo();
break;

case gmd_getdate:
var gmd_getdatestr = ds_map_find_value(gmd_resultMap,"date");
if not(is_undefined(gmd_getdatestr )){
var gmd_dtar=x_gmda_explode(gmd_getdatestr,-1,"-");
global.gmd_datetime=date_create_datetime(real(gmd_dtar[0]),real(gmd_dtar[1]),real(gmd_dtar[2]),real(gmd_dtar[3]),real(gmd_dtar[4]),real(gmd_dtar[5]));
}

break;


case gmd_getloadgamesave:
if (gmd_resultMap!="-1"){
ds_map_exists(gmd_resultMap,"gamesave"){
var gmd_getdata = ds_map_find_value(gmd_resultMap,"gamesave");
if not(is_undefined(gmd_getdata)){

var gmd_get_scr=asset_get_index("scrHTTP_cloud");
if (gmd_get_scr>-1){
scrHTTP_cloud("1",gmd_getdata);
}


}else{
var gmd_r=ds_map_find_value(gmd_resultMap,"type");

var gmd_get_scr=asset_get_index("scrHTTP_cloud");
if (gmd_get_scr>-1){
scrHTTP_cloud(gmd_r,"");
}


}
}}

break;



}}}
ds_map_destroy(gmd_resp);
}

}}}
}
return 1;


#define gmda_setController



gmd_Game_id = argument0;
gmd_Game_key = argument1;

gmd_site= "https://gamdato.com/gamdat.php";
global.gmd_controllerid=id;
gmd_timer_trig=100;

gmd_tokey="";
gmd_tokact=0;
global.gmd_numberld=0;
global.gmd_user_id= "";
global.gmd_name="";
global.gmd_datetime="";



global.gmd_globalachrows=0;
gmd_setachievement =-1;
global.gmd_achievements_list=ds_map_create();
global.gmd_totalachievements=0;
global.gmd_logros="";


for(var gmd_xx=0;gmd_xx<=3;gmd_xx++){
for(var gmd_typ=0;gmd_typ<=3;gmd_typ++){
global.gmd_globaltablerows[gmd_xx][gmd_typ] = -1;
}

global.gmd_playerpos[gmd_xx]="";
global.gmd_bestscore[gmd_xx]=0;
global.gmd_dat1[gmd_xx]=0;
global.gmd_dat2[gmd_xx]=0;
global.gmd_dat3[gmd_xx]=0;
gmd_Table_id[gmd_xx] = "";
}

gmd_post_headers = ds_map_create();
ds_map_add(gmd_post_headers, "Content-Type", "application/x-www-form-urlencoded");

gmd_personalize_func=-1;
gmd_getsubmitgamesave=-1;
gmd_getloadgamesave=-1;
gmd_getdate=-1;
gmd_Get_leaderboardinfo=-1;
gmd_getuserld=-1;
gmd_createplayer=-1;
gmd_submitresponse=-1;
gmd_setnewname=-1;
gmd_getrecoverycode=-1;
gmd_recoversession=-1;
gmd_Gettokey=-1;




var x_gmd_res="";
randomize();
var x_gmd_texvar="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
repeat(20){
x_gmd_res+=string_char_at(x_gmd_texvar,irandom_range(1,string_length(x_gmd_texvar)));
}

var gmd_found_sestok=0;

if file_exists("tokses.dat"){
		var gmd_tokses_temp=ds_map_secure_load("tokses.dat");
	   	if ds_exists(gmd_tokses_temp, ds_type_map){
		if not(is_undefined(ds_map_find_value(gmd_tokses_temp,x_gmda_chna("sestok")))){
		x_gmd_res= ds_map_find_value(gmd_tokses_temp,x_gmda_chna("sestok"));
		gmd_found_sestok=1;
		ds_map_destroy(gmd_tokses_temp);	
		}}


if not(gmd_found_sestok){file_delete("tokses.dat");}
	
}

if not(gmd_found_sestok){
var gmd_nuevolog_ses=ds_map_create();
	ds_map_add(gmd_nuevolog_ses,x_gmda_chna("sestok"),string(x_gmd_res));
	ds_map_secure_save(gmd_nuevolog_ses,"tokses.dat");
ds_map_destroy(gmd_nuevolog_ses);
}


gmd_ses=x_gmd_res;




global.gmd_userdat=ds_map_create();
global.gmd_playertable=ds_map_create();
var gmd_table1;
gmd_table1[1]=ds_map_create();
gmd_table1[2]=ds_map_create();
gmd_table1[3]=ds_map_create();
ds_map_add_map(global.gmd_playertable,"1",gmd_table1[1]);
ds_map_add_map(global.gmd_playertable,"2",gmd_table1[2]);
ds_map_add_map(global.gmd_playertable,"3",gmd_table1[3]);

global.gmd_globaltable=ds_map_create();
var gmd_table2;
gmd_table2[1]=ds_map_create();
gmd_table2[2]=ds_map_create();
gmd_table2[3]=ds_map_create();
ds_map_add_map(global.gmd_globaltable,"1",gmd_table2[1]);
ds_map_add_map(global.gmd_globaltable,"2",gmd_table2[2]);
ds_map_add_map(global.gmd_globaltable,"3",gmd_table2[3]);
return 1;

#define x_gmda_chna
gmd_actnm=argument0;
gmd_nm="";
if instance_exists(global.gmd_controllerid){
gmd_nm=md5_string_utf8(gmd_actnm+string(gmd_Game_key));
}
return gmd_nm;

#define gmda_setLeaderboard
var gmd_numdat = argument_count;
if instance_exists(global.gmd_controllerid){
for(var gmd_i=0;gmd_i<gmd_numdat;gmd_i++){
if global.gmd_numberld<3{
global.gmd_numberld+=1;
gmd_Table_id[global.gmd_numberld] = string(argument[gmd_i]);
}}
}
return 1;

#define q_gmda_leadboardreciv_map
		var gmd_table_ind=argument0;
		var gmd_value=argument1;
		var gmd_type=argument2;
		var gmd_size=0;

	    if gmd_value>0{
	    var gmd_size=ds_map_size(gmd_value);
	    for(var gmd_i=1;gmd_i<=gmd_size;gmd_i++){
	    if is_undefined(ds_map_find_value(gmd_value,string(gmd_i))){gmd_size=0;}
            }}


	

	    if (gmd_size<=0){
	    global.gmd_globaltablerows[gmd_table_ind][gmd_type]=0;
		global.gmd_globaltablerows[0][gmd_type]=0
	    }else{
		global.gmd_globaltablerows[0][gmd_type]=1
	        global.gmd_globaltablerows[gmd_table_ind][gmd_type]=gmd_size;
		
		var gmd_gettable="";
		switch(gmd_type){
			case 1:
			gmd_gettable=ds_map_find_value(global.gmd_globaltable,string(gmd_table_ind));
			break;
			case 2:
			gmd_gettable=ds_map_find_value(global.gmd_playertable,string(gmd_table_ind));
			break;			
			default:
			
			break;
		}
	
		if not(gmd_gettable==""){
		
		ds_map_clear(gmd_gettable);

		
		for(var gmd_i=1;gmd_i<=gmd_size;gmd_i++){
		
	        var gmd_singleuserinformation=ds_map_find_value(gmd_value,string(gmd_i))

				var gmd_playerinfo=ds_map_create();
				var gmd_pos=ds_map_find_value(gmd_singleuserinformation,"globpos")
				var gmd_nom=ds_map_find_value(gmd_singleuserinformation,"name")
				var gmd_sco=ds_map_find_value(gmd_singleuserinformation,"score")
				var gmd_d1=ds_map_find_value(gmd_singleuserinformation,"d1")
				var gmd_d2=ds_map_find_value(gmd_singleuserinformation,"d2")
				var gmd_d3=ds_map_find_value(gmd_singleuserinformation,"d3")
				var gmd_img=ds_map_find_value(gmd_singleuserinformation,"img")
				
				
				ds_map_add(gmd_playerinfo,"name",gmd_nom)
				ds_map_add(gmd_playerinfo,"score",gmd_sco)
				ds_map_add(gmd_playerinfo,"d1",gmd_d1)
				ds_map_add(gmd_playerinfo,"d2",gmd_d2)
				ds_map_add(gmd_playerinfo,"d3",gmd_d3)
		                ds_map_add(gmd_playerinfo,"img",gmd_img)
				ds_map_replace_map(gmd_gettable,string(gmd_i),gmd_playerinfo)
		}
			
		if (gmd_type==2){
		if gmd_size>0{
		global.gmd_playerpos[gmd_table_ind]=gmd_pos;
		global.gmd_bestscore[gmd_table_ind] =gmd_sco;
   		global.gmd_dat1[gmd_table_ind]= gmd_d1;
   		global.gmd_dat2[gmd_table_ind]= gmd_d2;
   		global.gmd_dat3[gmd_table_ind]= gmd_d3;
		
		}else{
		//global.gmd_playerpos[0]=gmd_pos;
		global.gmd_bestscore[gmd_table_ind] ="";
   		global.gmd_dat1[gmd_table_ind]= "";
   		global.gmd_dat2[gmd_table_ind]= "";
   		global.gmd_dat3[gmd_table_ind]= "";			
		}
		}
			
			
		}
			}

return 1;


#define gmda_loadgamesave
	var gmd_res=0;

	if instance_exists(global.gmd_controllerid){
	with(global.gmd_controllerid){	
	if gmd_tokact{
	var gmd_pass=md5_string_utf8(global.gmd_user_id+gmd_Game_key+gmd_tokey);
	gmd_getloadgamesave = http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+gmd_Game_id+"&pass="+gmd_pass+"&act=loadgame&usu="+global.gmd_user_id)
	gmd_res=1;
	gmd_tokact=-1;
	}}}
	
return 1;


#define gmda_sendgamesave

	var gmd_savemap=argument0;
	var gmd_res=0;
	if not(is_undefined(gmd_savemap)){
    	if not(ds_map_empty(gmd_savemap)){
	if instance_exists(global.gmd_controllerid){
	with(global.gmd_controllerid){	
	if gmd_tokact{
	var gmd_str = json_encode(gmd_savemap);
	var gmd_pass=md5_string_utf8(global.gmd_user_id+gmd_Game_key+gmd_tokey);
	gmd_getsubmitgamesave = http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+gmd_Game_id+"&pass="+gmd_pass+"&act=savegame&usu="+global.gmd_user_id+"&gamsav="+string(gmd_str))

	gmd_res=1;
	gmd_tokact=-1;
	}}}}}
	

	ds_map_destroy(gmd_savemap);
return 1;


#define gmda_define_achievement
var gmd_ach_nomb=argument0;
var gmd_ach_id=argument1;
var gmd_ach_desc=argument2;
var gmd_ach_value=argument3;
	if instance_exists(global.gmd_controllerid){
	with(global.gmd_controllerid){	
	var achievement_ind=ds_map_create();
	ds_map_add(achievement_ind,"ide",string(gmd_ach_id));	
	ds_map_add(achievement_ind,"name",string(gmd_ach_nomb));
	ds_map_add(achievement_ind,"descrip",string(gmd_ach_desc));
	ds_map_add(achievement_ind,"value",string(gmd_ach_value));
	global.gmd_totalachievements+=1;
	ds_map_replace_map(global.gmd_achievements_list,string(global.gmd_totalachievements),achievement_ind)
	}}
return 1;


#define gmda_check_achievement
var gmd_res=0;
if instance_exists(global.gmd_controllerid){
with(global.gmd_controllerid){	

	var gmd_achh_id=string(argument0);
	if string_length(gmd_achh_id)>0{
	if string_count(gmd_achh_id,global.gmd_logros)>0{
	gmd_res=1;
	}else{
	
	
	}}
}}
return gmd_res;

#define gmda_get_achievement
	
var gmd_res=0;
var gmd_achiev_id=string(argument0);
if string_length(gmd_achiev_id)>0{
if instance_exists(global.gmd_controllerid){
with(global.gmd_controllerid){
if gmd_tokact{
	var gmd_pass=md5_string_utf8(global.gmd_user_id+gmd_Game_key+gmd_tokey);
	gmd_setachievement = http_request(gmd_site, "POST", gmd_post_headers,"gam_id="+gmd_Game_id+"&pass="+gmd_pass+"&act=setach&usu="+global.gmd_user_id+"&achid="+string(gmd_achiev_id));
	gmd_res=1;
	gmd_tokact=0;
}}

}}
return 1;

#define gmda_get_achievement_list
var gmd_getdatax=-1;
if instance_exists(global.gmd_controllerid){
gmd_getdatax=global.gmd_achievements_list;
}
return gmd_getdatax;


#define gmda_get_achievement_info
var gmd_achi_info=-1;
var gmd_achi_id=string(argument0);
if string_length(gmd_achi_id)>0{
if instance_exists(global.gmd_controllerid){

gmd_getdata_ach=global.gmd_achievements_list;
gmd_size= ds_map_size(gmd_getdata_ach);
	if gmd_size>0{
	for(var gmd_i=1;gmd_i<=gmd_size;gmd_i++){
	var gmd_infoachievement=ds_map_find_value(gmd_getdata_ach,string(gmd_i));
	//Get achievement information
	var gmd_value_achi=ds_map_find_value(gmd_infoachievement,"ide")
	if (gmd_value_achi=gmd_achi_id){
	gmd_achi_info=gmd_infoachievement;
	break;
	}
}}}



}
return gmd_achi_info;



