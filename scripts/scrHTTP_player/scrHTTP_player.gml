//  Responses from the server related to player

function scrHTTP_player(response,valueref){
	
	switch(response){
		
///////////////////// CHANGING NAME //////////////////
    case gmd_resp_nameupdated: //Name updated
    show_message_async("Se ha cambiado el nombre correctamente: "+string(valueref));
    break;
    case gmd_resp_namenotavailable: //Name has already been taken
    show_message_async("The name "+string(valueref)+" has already been taken");
    break;
    case gmd_resp_invalidformat_name: //Invalid format(name)
    show_message_async("Name: Invalid format");
    break;

///////////////// SUBMITTING SCORE ////////////////
	case gmd_resp_scoresubmitted: //Score submitted for the first time
	show_message_async("Puntaje enviado!");
	break;
	case gmd_resp_scoreupdated: //Score updated
	show_message_async("Puntaje actualizado!");
	break;
	case gmd_resp_nothigherscore: //Score is not higher than the current one
	show_message_async("El nuevo puntaje no es mayor que el actual...");
	break;
	case gmd_resp_invalidformat_score: //Invalid format(score or extra fields)
    show_message_async("Score: Invalid format");
	break;


//////////// EXTRA //////////////
    case gmd_resp_newplayer: //Player generated
    show_message_async("Player generated!");           
    break;

    default: //Unknown Error
    show_message_async("An error has occurred");           
    break;
    }
}
