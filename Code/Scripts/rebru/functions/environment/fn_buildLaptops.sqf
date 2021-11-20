/**
_buildings Array of buildings classnames
_range from the nearest terminal
*/
params ["_buildings", ["_range", 1000, [0]]];
private _blds = [_buildings] call rebru_fnc_getObjects;
_blds = _blds call BIS_fnc_arrayShuffle;

diag_log format["Buildings: %1", count _blds];

private _selectedPositions = [];

{
	private _building = _x;
	if (!isNil "_building") then {
		if(count _selectedPositions == 0) then {
			[_building, _forEachIndex] call rebru_fnc_buildCabinet;
		} else {
			if ( count(_selectedPositions inAreaArray [getPos _building, _range, _range]) == 0 ) then {
				_cabinet = [_building, _forEachIndex] call rebru_fnc_buildCabinet;
			};
		};
		_selectedPositions append [(getPos _building)];
	};
	sleep 2;

} forEach _blds;