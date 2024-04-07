// Manage responses from server related to cloud storage data
//& code generation to recovery the session

function scrHTTP_cloud(response,valueref){
	
switch(response){
////////////////////////////// LOADING CLOUD DATA /////////////////
case gmd_resp_datareceived: /*      DATA RECEIVED  */
var gmd_load =json_decode(valueref);
if not(gmd_load="-1"){

	show_message_async("Data loaded successfully");
	
	/* Here you can do whatever you want with the data recived(gmd_load - ds_map) */
	if variable_global_exists("save_version"){
	if (ds_map_exists(gmd_load,"version")){
	var get_save_version=(ds_map_find_value(gmd_load,"version"));
	if not(get_save_version=global.save_version){
	show_message_async("Warning: The current version and the version saved are different")
	}}
	if (ds_map_exists(gmd_load,"money")){global.money=real(ds_map_find_value(gmd_load,"money"))}
	if (ds_map_exists(gmd_load,"Map-id")){global.mapid=real(ds_map_find_value(gmd_load,"Map-id"))}
	if (ds_map_exists(gmd_load,"x")){obj_playertest.x=real(ds_map_find_value(gmd_load,"x"))}
	if (ds_map_exists(gmd_load,"y")){obj_playertest.y=real(ds_map_find_value(gmd_load,"y"))}
	}

ds_map_destroy(gmd_load);
}
break;

case gmd_resp_nodata: // No data received
show_message_async("No data received");
break;

////////////////////////////// SAVING CLOUD DATA /////////////////
case gmd_resp_datasaved: //Data saved successfully
show_message_async("Data saved successfully");
break;
case gmd_resp_error_savingdata: //Error when connecting to server
show_message_async("Error to establish connection to server(Saving data)");
break;
case gmd_resp_invalidformat_saving: //Invalid format when saving data
show_message_async("Invalid format(Saving data)");
break;	

////////////////////////////// GET RECOVERY CODE /////////////////
case gmd_resp_getcode: //Get recovery code
show_message_async("Your recovery code is: "+string(valueref)); //The code expires in 10min
show_message_async("The code expires in 10min");
break;

case gmd_resp_error_code: //Error when getting a code
show_message_async("An error has occurred(recovery code)");           
break;
	
////////////////////////////// RECOVERING SESSION /////////////////
case gmd_resp_sessionloaded: //Session loaded(USING A RECOVERY CODE)
show_message_async("Session loaded!"); //Session recovered
show_message_async("Player name: "+string(valueref));
/*ADVICE: RESTART THE GAME TO PREVENT INFORMATION ERRORS WITH THE PREVIOUS SESSION  */
break;
case gmd_resp_invalidcode: //Wrong code
show_message_async("Wrong code..."); //The code is wrong or it expired
break;


/////////////// EXTRA ///////
default: // Unknown error
show_message_async("An error has occurred");
break;

}





}





