params ["_player"];

// Variable setzen um über den Tod hinweg zu existieren
_player setVariable ["is_player", true, true];

/* Specific per Player */
switch (vehicleVarName player) do {
	case "p1": {
		player addEventHandler["FiredMan", { _this spawn rebru_fnc_eventFiredMan; }];
	};
	case "p4": {
		player setUnitTrait ["Engineer",true];
	};
	case "p11": {
		player setUnitTrait ["Engineer",true];
	};
};

// Alle Spieler
addMissionEventHandler[ "EntityKilled", { _this spawn rebru_fnc_eventEntityKilled; } ];
_player addEventHandler ["HandleDamage", { _this call rebru_fnc_eventHandleDamage; }];

/* All Players */
// Wird nicht mehr benötigt, Escape hat selbst schon Earplugs, man muss sie nur konfigurieren
//[] call rebru_fnc_earPlugs;

/* Specific Players */
_playerId = format["%1", getPlayerUID player];
if(_playerId == "76561198143409169" or _playerId == "_SP_PLAYER_") then {
	_player addAction ["Open SimpleMenu", { call rebru_fnc_openDialog; } ];
};

/* Settings für Stamina und Fatigue */
/*
if(A3E_Param_FatigueDisabled) then {
	_player enableFatigue false;
};

if(A3E_Param_StaminaDisabled) then {
	_player enableStamina false;
};
*/
