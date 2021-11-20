params ["_buildings"];
diag_log _buildings;
_pos = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");   
_blds=nearestobjects [_pos,_buildings, 20000];

_objects = [];
{
	private _building = _x;
	private _buildingsSelected = _blds select { typeOf _x == _building };
	_objects append _buildingsSelected;
	diag_log format ["Anzahl: %1", count _buildingsSelected];
} forEach _buildings;

_objects;