params ["_protectedVehicle", "_caller", "_actionId", "_arguments"];
_arguments params ["_source", "_timer", "_kit", "_debug"];

// Ursprungs Action löschen
_protectedVehicle remoteExec ["removeAllActions", 0, true];
//_protectedVehicle removeAction _actionId;

// Fahrzeug mit Bombe ausstatten
[_arguments,"Scripts\bomb\bomb.sqf"] remoteExec ["execVM"];

// Warten bis Bombe entschärft ist
while { _protectedVehicle getVariable ["a3f_bomb_active", true] } do { sleep 1; };

// Fahrzeug aufschliessen, wenn Bombe entschärft
_protectedVehicle remoteExec ["removeAllActions",0,true];
[_protectedVehicle, "UNLOCKED"] remoteExec ["setVehicleLock",0,true];
//removeAllActions _protectedVehicle;
//_protectedVehicle setVehicleLock "UNLOCKED";