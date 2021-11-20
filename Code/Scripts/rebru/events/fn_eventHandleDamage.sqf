params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

if(!isPlayer _unit) exitWith {};

_delay = 3;
_start = diag_tickTime;
_lastHandle = _unit getVariable ["lastPlayerDamageHandle", _delay];

if ( _start > _lastHandle ) then {
  if( (isPlayer _unit) && (isPlayer _source)) then {
    [_unit, "friendlyfire"] remoteExec ["say3D"];
    _message = format ["Unit %1 wurde von %2 getroffen", name _unit, name _source];
    [_message] remoteExec ["systemChat", 0, true];
  };
  _unit setVariable ["lastPlayerDamageHandle", (_start + _delay)];
};
