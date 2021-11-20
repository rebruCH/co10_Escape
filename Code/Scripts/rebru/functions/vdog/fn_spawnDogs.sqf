/**
	Spawnt Hunde im Umkreis  der fortifzierten Stellungen auf der Insel
*/
params [["_dogamount",2,[0]], ["_distance",200,[0]], ["_radialIterator", 90, [0]]];
_locations = [["StrongpointArea"]] call rebru_fnc_getLocations;

{
	_x params ["_place", "_koordinaten"];
	
	// Marker auf den Mittelpunkt für RelPos Bestimmung
	private _vdogscenter = "FlagPole_F" createVehicle _koordinaten;
	hideObjectGlobal _vdogscenter;
	_vdogscenter enableSimulationGlobal false;
	
	// Trigger setzen
	for "_i" from 0 to 359 step _radialIterator do {
		diag_log format["Feral Dogs %1 : DIRECTION %2", _place, _i];
		private _triggerPos = _vdogscenter getRelPos [_distance, _i];
		private _trg = createTrigger ["EmptyDetector", _triggerPos];
		_trg setTriggerArea [ _distance, _distance, 0, true];
		_trg setTriggerActivation ["ANYPLAYER", "PRESENT", false];
		private _activeCode = format["[getPos thisTrigger, %1, ""Fin_random_F"", %2, true] execVM ""Scripts\vDog\vDogFeral.sqf""", _distance, _dogamount];
		_trg setTriggerStatements 
		[
			"this",
			_activeCode,
			""
		];
		sleep 0.75;
	};
	
	deleteVehicle _vdogscenter;
	
} forEach _locations;