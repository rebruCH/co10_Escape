params ["_unit", "_killer", "_instigator", "_useEffects"];

if ( (_killer getVariable "is_player" ) && (_unit getVariable "is_player") ) then {
	[_killer, "friendlyfire"] remoteExec ["say3D"];
	_message = format ["Unit %1 wurde durch %2 getötet", name _unit, name _killer];
	[_message] remoteExec ["systemChat", 0, true];
};
