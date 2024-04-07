//  Responses from the server related to game features management

function scrHTTP_game(response,valueref){
switch(response){
/////////////////////////// ACHIEVEMENTS /////////////////////
case gmd_resp_achunlocked: //Achievement got successfully
	show_message_async("Achievement got successfully");
	var object_effect=instance_create_depth(room_width-450,room_height-60,depth,achievement_got_effect);
	object_effect.ach_id=valueref;
break;
case gmd_resp_achalreadygot: //Achievement is already unlocked
show_message_async("Achievement is already unlocked...");
break;
case gmd_resp_invalidach: //Achievement not found
show_message_async("Achievement not found");
break;
case gmd_resp_invalidformat_ach: //Invalid format
show_message_async("Achievement: Invalid format");
break;

/////////////////////////// DAILY REWARDS/INFO /////////////////////
case gmd_resp_rewardgot: //Get reward
show_message_async("You just got: "+valueref+"!");

break;
case gmd_resp_rewardalreadygot: //Achievement is already unlocked
show_message_async("Reward is already got");
break;
case gmd_resp_invalidreward: //Reward not found/not available
show_message_async("Reward not found");
break;
case gmd_resp_invalidformat_rewards: //Invalid format
show_message_async("Reward: Invalid format");
break;

/////////// PERSONALIZED SERVICES //////////////
//You can request personalized functions
//Visit: https://www.gamdato.com/personalize

case gmd_resp_personalize: //Get information(variable)
//HERE PLACE THE APPROPRIATE CODE TO MANAGE THE "PERSONALIZATION SERVICE" INFORMATION
show_message_async("You got some intersting information");
//valueref <- ds_map(DATA)
	
break;
case gmd_resp_servicenotavailable:  //Service is not available
show_message_async("You don't have access to this service...");
break;

/////////// EXTRA //////////
default: //Unknown error
show_message_async("An error has occurred");        
break;
}

}


