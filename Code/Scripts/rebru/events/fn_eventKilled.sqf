/**
 Killed EventHandler
*/
params ["_unit","_killer","_instigator", "_useEffects"];

// When Teamkill
if( (isPlayer _unit) && (isPlayer _killer) ) then {
  [_unit, "friendlyfire"] remoteExec ["say3D",-2];
};
