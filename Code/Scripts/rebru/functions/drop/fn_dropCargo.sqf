params ["_vehicle","_cargoItems"];

private _spawndistance = 25;
private _direction = getDir _vehicle;
private _cargoSpawn = _vehicle getRelPos [_spawndistance, 180];
_cargoSpawn params ["_sX","_sY"];
private _vehiclePos = getPos _vehicle;
_vehiclePos params ["_vpX","_vpY","_vpZ"];
private _cargoVelocity = velocity _vehicle;
_cargoVelocity params ["_vX","_vY","_vZ"];
_cargoItems params ["_cargoItem", "_cargoAmount", "_useChute", "_delay"];
private _cargoDirection = _direction;


	
if(_useChute) then {
	private _cargo = _cargoItem createVehicle [_sX, _sY];
	_cargo setPos [_sX, _sY,_vpZ*0.95];
	_cargo setDir _cargoDirection;
	_cargo setVelocity [_vX*0.25, _vY*0.25, -9.81];
	
	[_cargo, _vpZ] spawn rebru_fnc_paraCargo;
} else {
	private _centerpos = [_sX, _sY];
	private _centerbomb = _cargoItem createVehicle _centerpos;
	_centerbomb setDir _cargoDirection;
	_centerbomb setPos [_sX, _sY, _vpZ*0.95];
	_centerbomb setVelocity [_vX*0.15, _vY*0.15, -9.81];
	
	private _leftpos = _centerbomb getRelPos [40, 270];
	_leftpos params ["_lX", "_lY"];
	private _rightpos = _centerbomb getRelPos [40, 90];
	_rightpos params ["_rX", "_rY"];
	
	private _leftbomb = _cargoItem createVehicle _leftpos;
	private _rightbomb = _cargoItem createVehicle _rightpos;
	
	_leftbomb setPos [_rX, _rY, _vpZ*0.95];
	_rightbomb setPos [_lX, _lY, _vpZ*0.95];
	
	
	_leftbomb setDir _cargoDirection;
	_rightbomb setDir _cargoDirection;
	
	_leftbomb setVelocity [_vX*0.15, _vY*0.15, -9.81];
	_rightbomb setVelocity [_vX*0.15, _vY*0.15, -9.81];
};