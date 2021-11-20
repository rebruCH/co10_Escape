/**
[getPos player, "west", "CUP_B_USMC", "Infantry", "CUP_B_USMC_FireTeam", 2, 330, 70, 100, 1000, "CUP_B_CH47F_USA"] spawn rebru_fnc_callReinforcement;
*/
params ["_destPos", "_side", "_category", "_subcategory" ,"_infantrygroup", ["_infantrygroupamount",2,[0]], ["_direction",180,[0]], ["_speed", 70, [0]], ["_height",100,[0]], ["_range", 2000,[0]], ["_cargoVehicle","CUP_B_CH47F_USA", [""]]];

// Create PoleFlag for DropPos
private _dropObject = "Land_HelipadEmpty_F" createVehicle _destPos;
hideObject _dropObject;
_dropObject enableSimulation false;

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
private _vehGroup = [_spawnPos, 45, _cargoVehicle, west] call BIS_fnc_spawnVehicle;
private _vehicle = _vehGroup select 0;
_vehicle setDir _direction;

// Send Chopper to Destination
//systemChat str [_vX,_vY,0];
_vehicle setVelocity [_vX,_vY,0];
//_vehicle doMove (_destPos);

// Create Groups
for "_i" from 1 to _infantrygroupamount do
{
	private _reinforcementgroup = [];
	switch (_side) do {
		case "West": {
			// Spawn Reinforcmentgroup
			_reinforcementgroup = [
				[_spawnPos select 0, _spawnPos select 1, 0],
				WEST,
				(configfile >> "CfgGroups" >> _side >> _category >> _subcategory >> _infantrygroup)
			] call BIS_fnc_spawnGroup;
		};
		case "East": {
			// Spawn Reinforcmentgroup
			_reinforcementgroup = [
				[_spawnPos select 0, _spawnPos select 1, 0],
				EAST,
				(configfile >> "CfgGroups" >> _side >> _category >> _subcategory >> _infantrygroup)
			] call BIS_fnc_spawnGroup;
		};
	};


	// Move Group into Helicopter
	{ _x moveInCargo _vehicle; } forEach (units _reinforcementgroup);
	sleep 0.30;
};


//_vehicle doMove (_destPos);
//waitUntil { sleep 1; getPos _vehicle inArea [_destPos, 200, 200, 45, false]; };
//[_vehicle,25,_destPos] call AR_Rappel_All_Cargo;

// Rappel Units
[_vehicle,30, _destPos] call AR_Rappel_All_Cargo;
sleep 10;

//systemChat format["variable is %1", _vehicle getVariable "AR_Units_Rappelling"];
// Wait until the rappeling is finished
waitUntil { sleep 1;  isNil { _vehicle getVariable "AR_Units_Rappelling"; } };
//systemChat format["variable is %1", _vehicle getVariable "AR_Units_Rappelling"];

// Move Chopper to despawn Position
_vehicle doMove (_despawnPosition);

// Warten bis in der Despawn Zone
waitUntil { sleep 1; getPos _vehicle inArea [_despawnPosition, 100, 100, 45, false]; };

// Delete Vehicle
{ deleteVehicle _x } forEach (crew _vehicle); deleteVehicle _vehicle;

// Pole entfernen
deleteVehicle _dropObject;
