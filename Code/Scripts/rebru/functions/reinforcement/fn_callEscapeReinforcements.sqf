params [ 
	["_destPos", getPos player, [[]]],
	["_patrolDistance", 100, [0]],
	["_choppers",1,[0]], 
	["_sideId", selectRandom [0,1], [0]],
	["_range", 2500, [0]], 
	["_direction",180,[0]], 
	["_height",100,[0]], 
	["_speed",70,[0]] 
];



// SideConfig
_sides = [A3E_VAR_Side_Opfor,A3E_VAR_Side_Ind];
_side = _sides select _sideId;
_enemyConfig = [
	[ a3e_arr_O_transport_heli, a3e_arr_Escape_InfantryTypes + a3e_arr_recon_InfantryTypes ],
	[ a3e_arr_I_transport_heli, a3e_arr_Escape_InfantryTypes_Ind + a3e_arr_recon_I_InfantryTypes ]
];

// Get Side
_sideConfig = _enemyConfig select _sideId;
_chopperArray = _sideConfig select 0;
_chopperBlacklisted = ["CUP_B_MV22_USMC", "CUP_B_MV22_USMC_RAMPGUN"];
// Remove MV22 out of array 
{
	if( _chopperArray find _x >= 0 ) then {
		_chopperArray deleteAt (_chopperArray find _x);
	};
} foreach _chopperBlacklisted;

_unitsArray = _sideConfig select 1;


// Get Chopper
_cargoVehicle = selectRandom _chopperArray;
_cargoVehiclePax = getNumber (configFile >> "CfgVehicles" >> _cargoVehicle >> "transportSoldier");

// Create PoleFlag for DropPos
private _dropObject = "Land_HelipadEmpty_F" createVehicle _destPos;
hideObject _dropObject;
_dropObject enableSimulation false;

// DropPosition for rappeling
_rappelingPos = _dropObject getRelPos [300, random 360];
private _rappelingObject = "Land_HelipadEmpty_F" createVehicle _rappelingPos;


private _spawnPosRel = _dropObject getRelPos [_range, _direction call rebru_fnc_getOppositeDirection];
_spawnPosRel params ["_spawnX","_spawnY","_spawnZ"];
private _spawnPos = [_spawnX, _spawnY, _height];
private _despawnPosRel = _dropObject getRelPos [_range, _direction];
_despawnPosRel params ["_despawnX","_despawnY","_despawnZ"];
private _despawnPosition = [_despawnX, _despawnY, _despawnZ];
private _dropPos = [ _destPos select 0, _destPos select 1, _height  ];
private  _velocity = [_speed, _direction] call rebru_fnc_setVelocity;
_velocity params ["_vX","_vY"];


// Spawn Chopper
private _vehGroup = [_spawnPos, 45, _cargoVehicle, _side] call BIS_fnc_spawnVehicle;
private _vehicle = _vehGroup select 0;
_vehicle setDir _direction;


// Add Soldiers to Cargo
private _infantrygroup = createGroup [_side, true];
private _vehiclePos = getPos _vehicle;
_vehiclePos params ["_vpX","_vpY","_vpZ"];
for "_i" from 1 to _cargoVehiclePax do
{
	private _unitClass = selectRandom _unitsArray;
	_unit = _infantrygroup createUnit [_unitClass, [_vpX, _vpY, 0], [], 0, "NONE"];
	if(_i == 1) then {
		_unit setRank "CAPTAIN";
	} else {
		_unit setRank "CORPORAL";
	};
	
	_unit moveInCargo _vehicle;
	sleep 0.15;
};

// Rappel Units
diag_log format["RappelingPos: %1", getPosASL _rappelingObject];
[_vehicle, 30, getPosASL _rappelingObject] call AR_Rappel_All_Cargo;
sleep 10;

//systemChat format["variable is %1", _vehicle getVariable "AR_Units_Rappelling"];
// Wait until the rappeling is finished
waitUntil { sleep 1;  isNil { _vehicle getVariable "AR_Units_Rappelling"; } };
//systemChat format["variable is %1", _vehicle getVariable "AR_Units_Rappelling"];


// Move Chopper to despawn Position
_vehicle doMove (_despawnPosition);

sleep 60;

// Delete Vehicle
{ deleteVehicle _x } forEach (crew _vehicle); deleteVehicle _vehicle;

// Pole entfernen
deleteVehicle _dropObject;

_infantrygroup move _destPos;

waitUntil { sleep 1; getPos leader _infantrygroup inArea [_destPos, 25, 25, 45, false]; };


[_infantrygroup, _destPos, _patrolDistance] call BIS_fnc_taskPatrol


/*
[_infantrygroup, _destPos, _patrolDistance] spawn {
	params ["_infantrygroup", "_destPos", "_patrolDistance"];
	while {{alive _x} count units _infantrygroup > 0} do {
		waitUntil {
			sleep (5 + random 20); 
			unitReady leader _infantrygroup AND combatMode leader _infantrygroup != "COMBAT"
		};
		[_infantrygroup, _destPos, _patrolDistance] call BIS_fnc_taskPatrol
		
	};
};
*/
