/* 
Remote Funktion um die POIS zu hacken
*/
//params ["_command", "_subcommand"];

_pois = [];

switch (_this select 0) do {
	case "mx2020": { _pois = ["o_hq"] call rebru_fnc_getPOIS; };
	case "munition": { _pois = ["o_installation"] call rebru_fnc_getPOIS; };
	case "fahrzeug": { _pois = ["o_service"] call rebru_fnc_getPOIS; };
	default {
		diag_log format["_command: %1", (_this select 0)];
	};
};


switch (_this select 1) do {
	case "show": {
		_poi = selectRandom _pois;
		[_poi # 0, true] call A3E_fnc_updateLocationMarker;
	};
	default {
		diag_log format["_subcommand: %1", (_this select 1)];
	};
};