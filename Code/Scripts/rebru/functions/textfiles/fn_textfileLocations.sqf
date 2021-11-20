/*
Renders all Locations to Text
*/

private _locations = [] call rebru_fnc_getLocations;

private _text = "";
_text = _text + "Stadt || Koord X || Koord Y || Grid \n";
{
	_x params ["_stadt", "_koordinaten"];
	_koordinaten params ["_posX","_posY"];

	_text = _text + format["%1 || %2 || %3 || %4\n", _stadt, _posX, _posY, (_koordinaten call BIS_fnc_posToGrid)];
} forEach _locations;
_text;