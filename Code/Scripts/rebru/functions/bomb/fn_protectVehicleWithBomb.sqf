params ["_source","_timer","_kit","_debug"];

_source setVehicleLock "LOCKED";
_source addAction ["Fahrzeug knacken", rebru_fnc_addBombToVehicle, [_source, _timer, _kit, _debug], 1, true, false, "", "", 10];

