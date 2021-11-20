		params [ "_modulePos", "_cargoVehicle", "_cargoItems"];
		_modulePos params ["_modulePosX","_modulePosY","_modulePosZ"];
		_cargoVehicle params ["_faction","_cargoPlane", "_range" ,"_flightDirection", "_height", "_speed"];

		// Create PoleFlag for DropPos
		private _dropObject = "Land_HelipadEmpty_F" createVehicle _modulePos;
		[_dropObject, true] remoteExec ["hideOjbect", 0];
		//hideObjectGlobal _dropObject;
		_dropObject enableSimulation false;
		_dropObject setDir _flightDirection;

		private _direction = _flightDirection;
		private _spawnPosRel = _dropObject getRelPos [_range, 180];
		_spawnPosRel params ["_spawnX","_spawnY","_spawnZ"];
		private _spawnPosition = [_spawnX, _spawnY, _height];
		private _despawnPosRel = _dropObject getRelPos [_range, 0];
		_despawnPosRel params ["_despawnX","_despawnY","_despawnZ"];
		private _despawnPosition = [_despawnX, _despawnY, _despawnZ];
		private _dropPos = [ _modulePos select 0, _modulePos select 1, _height  ];
		private  _velocity = [_speed, _direction] call rebru_fnc_setVelocity;
		_velocity params ["_vX","_vY"];

		// Spawn Cargo Plane
		private _veh = [_spawnPosition, _direction, _cargoPlane, _faction] call BIS_fnc_spawnVehicle;
		private _vehicle = _veh select 0;

		_vehicle setVehicleAmmo 0;
		_vehicle setUnitCombatMode "BLUE";
		_vehicle setCombatMode "BLUE";
		_vehicle setBehaviour "CARELESS";
		_vehicle flyInHeight _height;
		_vehicle setVelocity [_vX,_vY, 0 ];

		// Move to Position
		_vehicle doMove (_dropPos);

		// Warten bis da
		_dropMarker = createMarker ["DropMarker", _dropPos];
		_dropMarker setMarkerShape "RECTANGLE";
		_dropMarker setMarkerSize [500,50];
		_dropMarker setMarkerDir _direction;
		waitUntil { getPos _vehicle inArea [_dropPos, 500, 50, _direction, false]; };

		// Abwurf
		private _cargoVelocity = [(_speed*0.33), _direction] call rebru_fnc_setVelocity;
		private _spawndistance = 25;

		{
			private _cargos = _x;
			_cargos params ["_cargoItem", "_cargoAmount", "_useChute", "_delay"];
			for "_i" from 1 to _cargoAmount do
			{
				//private _cargoSpawn = _vehicle getRelPos [_spawndistance, _direction call rebru_fnc_getOppositeDirection];
				//private _cargoSpawn = _vehicle getRelPos [_spawndistance, _direction call rebru_fnc_getOppositeDirection];
				[_vehicle, _cargos ] spawn rebru_fnc_dropCargo;

				sleep _delay;
			};
		} forEach _cargoItems;



		// Move CargoPlane back to Spawn
		_vehicle doMove (_despawnPosition);
		// Flugzeug nach 15 Sekunden löschen
		sleep 30;

		// Delete Vehicle
		{ deleteVehicle _x } forEach (crew _vehicle); deleteVehicle _vehicle;

		// Pole entfernen
		deleteVehicle _dropObject;

		// Marker entfernen
		deleteMarker "DropMarker";
