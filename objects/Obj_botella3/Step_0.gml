/// @description preproceso

if(global.lavando){
	lavado = true
	global.acciones-=1;
	global.lavando = false;
}
if (global.quitando){
	material_quitado = true;
	global.acciones-=1;
	global.quitando = false;
}
if (global.aplastando){
	aplastado = true;
	global.acciones-=1;
	global.aplastando = false;
}
if(global.clasificando){
	if(lavado and material_quitado and aplastado){
		clasificado=true;
		global.clasificados+=1;
		global.clasificando = false;
		instance_destroy();
		
	}
	global.clasificando = false;
}
