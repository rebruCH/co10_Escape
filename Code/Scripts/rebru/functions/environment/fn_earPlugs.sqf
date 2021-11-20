rebru_earplugs = player addAction ["<t color=""#ffffff"">" + "Insert Earplugs" + "</t>", {
	if (soundVolume > 0.04) then {
		0.1 fadeSound 0.04; 
		player setUserActionText [rebru_earplugs, "<t color=""#ffffff"">" + "Remove Earplugs" + "</t>"]
	} 
	else {
		0.1 fadeSound 1; 
		player setUserActionText [rebru_earplugs, "<t color=""#ffffff"">" + "Insert Earplugs" + "</t>"]
	}
}, [], 0, false, true]; 
if (soundVolume <= 0.04) then {
	player setUserActionText [rebru_earplugs, "<t color=""#ffffff"">" + "Remove Earplugs" + "</t>"]
};