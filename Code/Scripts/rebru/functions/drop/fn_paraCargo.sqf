params ["_cargoItem", "_height"];

private _sleep = (_height/75) toFixed 1;

sleep parseNumber _sleep;

private _cargoPos = getPos _cargoItem;
_cargoPos params ["_cpX","_cpY","_cpZ"];
private _cargoSpeed = velocity _cargoItem;
private _cargoDir = getDir _cargoItem;



//private _chute = createvehicle ["B_Parachute_02_F", _cargoPos, [], _cargoDir, "can_collide"];
private _chute = "B_Parachute_02_F" createVehicle _cargoPos;
_chute setDir _cargoDir;
_chute setPos [_cpX, _cpY, _cpZ];
_chute setVelocity _cargoSpeed;
//_chute setVelocity [0,0,-20];
_cargoItem attachTo [_chute,[0,0,0]];

if (surfaceIsWater (getPos _cargoItem)) then {
	waitUntil 
	{
		((getPosASL _cargoItem) select 2) < 3
	};
	detach _cargoItem;
	sleep 2;
	_cargoItem setVectorUp [0,0,1];
	deleteVehicle _chute;
} else {
	waitUntil 
	{
		((getPos _cargoItem) select 2) < 3
	};
	detach _cargoItem;
	waitUntil {isTouchingGround _cargoItem};
	sleep 2;
	_cargoItem setVectorUp [0,0,1];
	deleteVehicle _chute;
	
};