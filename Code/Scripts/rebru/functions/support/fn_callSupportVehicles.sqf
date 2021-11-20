params ["_target","_caller","_actionId", "_arguments"];

_arguments params ["_dropPosition_markerName"];

// CargoPlane
_cargoPlane = "";
if(str side player == "WEST") then { _cargoPlane = "B_T_VTOL_01_vehicle_F"; } else { _cargoPlane = "O_T_VTOL_02_vehicle_dynamicLoadout_F"; };

// Unterstützte Fahrzeuge
private _supportUnits = [
	"vn_b_armor_m41_01_01",
	"vn_b_wheeled_m54_mg_01",
	"vn_b_wheeled_m54_mg_02",
	"vn_b_wheeled_m54_mg_03",
	"vn_b_wheeled_m151_mg_04",
	"vn_o_wheeled_btr40_mg_03_nva65",
	"vn_o_wheeled_z157_mg_02_nva65",
	"vn_o_wheeled_z157_02",
	"vn_o_armor_type63_01"
];

private _dropUnit = selectRandom _supportUnits;
  systemChat format ["Unterstützung %1 ist auf dem Weg, ETA 60 Sekunden", _dropUnit];

[getMarkerPos _dropPosition_markerName, [(side player), _cargoPlane, 2500, 90, 150, 150], [ [_dropUnit, selectRandom [1,2,3], true, 0.5] ] ] spawn rebru_fnc_callDrop;

_target setVariable ["stopCoolDown", FALSE, true];
sleep 300;
_target setVariable ["stopCoolDown", TRUE, true];
