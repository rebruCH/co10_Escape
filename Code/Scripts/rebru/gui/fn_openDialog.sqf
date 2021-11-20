createDialog "dialogSimpleMenu";

_ctrlPlayerlist = (findDisplay 79001) displayCtrl 1500;
_ctrlActionlist = (findDisplay 79001) displayCtrl 1501;
_ctrlButtonOk = (findDisplay 79001) displayCtrl 1600;
_ctrlButtonEsc = (findDisplay 79001) displayCtrl 1601;

// Players
playerListArray = [];
{
	playerListArray pushBack _x;
	_name = name _x;
	lbAdd [1500, _name];
} foreach allPlayers;

// Actions
actionListArray = [];
	
	actionListArray pushBack "nothing";
	lbAdd [1501, "===GENERAL==="];
	
	actionListArray pushBack "heal";
	lbAdd [1501, "Heal"];
	
	actionListArray pushBack "fuel";
	lbAdd [1501, "Fuel"];
	
	actionListArray pushBack "rearm";
	lbAdd [1501, "Rearm"];
	
	actionListArray pushBack "noFatStam";
	lbAdd [1501, "No Stamina/Fatigue"];
	
	actionListArray pushBack "teleportHim";
	lbAdd [1501, "Teleport Him"];
	
	actionListArray pushBack "teleportMe";
	lbAdd [1501, "Teleport Me"];
	
	actionListArray pushBack "punish";
	lbAdd [1501, "Punish"];
	
	actionListArray pushBack "navigations";
	lbAdd [1501, "Navigation gear"];
	
	actionListArray pushBack "vn_ammo_m16";
	lbAdd [1501, "VN Ammo M16"];
	
	actionListArray pushBack "vn_ammo_m21";
	lbAdd [1501, "VN Ammo M21"];
	
	actionListArray pushBack "cup_ammo_stanag";
	lbAdd [1501, "CUP Ammo Stanag"];
	
	actionListArray pushBack "vn_gear_sniper";
	lbAdd [1501, "VN Sniper Gear"];
	
	actionListArray pushBack "vn_gear_soldier";
	lbAdd [1501, "VN Soldier Gear"];
	
	actionListArray pushBack "cup_gear_soldier";
	lbAdd [1501, "CUP Soldier Gear"];

	actionListArray pushBack "nothing";
	lbAdd [1501, "===ESCAPE==="];
	
	actionListArray pushBack "revive";
	lbAdd [1501, "Revive"];
	
	