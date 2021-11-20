params ["_direction"];

private _opposite = _direction + 180;

if ( _opposite >= 360 ) then { _opposite = _opposite - 360; };
//systemChat format ["opposite dir is %1", _opposite];

_opposite;