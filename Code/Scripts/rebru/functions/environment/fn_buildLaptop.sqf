params ["_building", "_object"];

private _terminal = "Land_Laptop_device_F" createVehicle [0,0,0];
//_terminal setVehicleVarName "terminal";
_terminal enableSimulation false;
_terminal attachTo [_object, [-0.02,0.3,0.57]];
sleep 0.05;
_terminal setDir 180;

[_terminal] execVM "Scripts\HackEX\hackex.sqf";