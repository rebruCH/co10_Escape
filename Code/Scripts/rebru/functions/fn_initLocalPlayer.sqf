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
if(_playerId == "76561198143409169") then {
	_player addAction ["Open SimpleMenu", { call rebru_fnc_openDialog; } ];
};

_player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	
	_vehicleSide = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "side");
	
	if(_vehicleSide == 3) then {
		_unit setCaptive true;
		
		[_unit] spawn {
			params ["_unit"];
			private _enemySide = "";
			if( (side group _unit) isEqualTo west ) then { _enemySide = east } else { _enemySide = west };
			systemChat format["EnemySide %1", _enemySide];
			while {true} do {
				scopeName "incognito";
				if(allplayers findIf {count (_x nearentities 50 select {side _x isEqualTo _enemySide}) > 0} >= 0) then {
					diag_log "Unit wurde gesichtet";
					sleep (random 5);
					if(allplayers findIf {count (_x nearentities 25 select {side _x isEqualTo _enemySide}) > 0} >= 0) then {
						diag_log "Unit wurde enttarnt";
						player setCaptive false;
						breakOut "incognito";
					};
				};
				systemChat "loop";
				sleep 1;
			};
		};
		
	};
	
	//hint format["side: %1", getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "side")];
}];

_player addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	_unit setCaptive false;
	breakOut "incognito";
}];

/* Settings für Stamina und Fatigue */
/*
if(A3E_Param_FatigueDisabled) then {
	_player enableFatigue false;
};

if(A3E_Param_StaminaDisabled) then {
	_player enableStamina false;
};
*/
