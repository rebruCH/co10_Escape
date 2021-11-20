params ["_building", "_counter"];

// Position
private _buildingPos = getPos _building;
_buildingPos params ["_px","_py","_pz"];

// Create the cabinet
private _cabinet = createVehicle ["Land_PortableCabinet_01_medical_F", [0,0,0],[],0,"can_collide"];

// Place it in the building
diag_log format["Building: %1", typeOf _building];
switch typeOf _building do
{
	case "Land_vn_b_trench_bunker_01_01": {
		[_building, _cabinet, [-1.2,0,0.3], 225] call BIS_fnc_relPosObject;
		_cabinet enableSimulationGlobal true;
	};

	case "Land_vn_b_trench_bunker_03_04": {
		[_building, _cabinet, [-1.2,0,0.3], 225] call BIS_fnc_relPosObject;
		_cabinet enableSimulationGlobal true;
	};
};

// Add Intel to Cargo
private _intelItems = missionnamespace getvariable ["A3E_IntelItems",["Files","FileTopSecret","FilesSecret","FlashDisk","DocumentsSecret","Wallet_ID","FileNetworkStructure","MobilePhone","SmartPhone"]];
//private _chance = missionnamespace getvariable ["A3E_Param_IntelChance",100];
private _chance = 100;
if(_chance >= random 100) then {

	private _intAmount = random 10;
	for [{ _i = 0 }, { _i < _intAmount }, { _i = _i + 1 }] do {
		//[[_cabinet, [selectRandom _intelItems, 1]], {(_this select 0) addItemCargo (_this select 1);}] remoteExec ["BIS_fnc_call"];
		_cabinet addItemCargoGlobal [selectRandom _intelItems, random 3];
	};
};

// Lock the _cabinet
[[_cabinet, true], {(_this select 0) lockInventory (_this select 1);}] remoteExec ["BIS_fnc_call"];


// Attach Notebook
[_building, _cabinet, _counter] call rebru_fnc_buildLaptop;


// Debug
call {
	private _marker = createMarker [format["MarkerCabinet%1", _counter], getPos _cabinet];
	//format["MarkerCabinet%1", _counter] setMarkerColor "ColorRed";
	//format["MarkerCabinet%1", _counter] setMarkerType "mil_dot";
	format["MarkerCabinet%1", _counter] setMarkerType "group_7";
};

_cabinet;