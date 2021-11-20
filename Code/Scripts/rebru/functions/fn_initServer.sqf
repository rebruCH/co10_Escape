// Passwörter generieren
rebru_pass_wachkommando = [6] call rebru_fnc_generatePassword;
publicVariable "rebru_pass_wachkommando";
rebru_pass_root = [8] call rebru_fnc_generatePassword;
publicVariable "rebru_pass_root";
// Diag Log
diag_log format["Root Passwort: %1", (missionNamespace getVariable "rebru_pass_root")];
diag_log format["Wachkommando Passwort: %1", (missionNamespace getVariable "rebru_pass_wachkommando")];

// POIS public machen
[] spawn {
	sleep 120;
	rebru_A3E_POIs = (missionnamespace getVariable ["A3E_POIs",[]] select {_x # 4 || _x # 5});
	publicVariable "rebru_A3E_POIs";
};

// Spawn Hacking Devices
[["Land_vn_b_trench_bunker_01_01","Land_vn_b_trench_bunker_03_04"]] spawn rebru_fnc_buildLaptops;

_nil = [] spawn {
	call compile preprocessFileLineNumbers ("Island\vehicleMarkers.sqf");
};

[] spawn {
	sleep 10;
	[] spawn rebru_fnc_spawnVehicles;
};