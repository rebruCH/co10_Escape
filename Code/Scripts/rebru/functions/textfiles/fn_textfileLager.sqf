/*
Liest alle Lager aus
*/

private _text = "";

_text = _text + format["LagerID || LagerTyp || Koordinaten || Versteckt || Unbekannt || GRID \n"];

{
	_x params ["_markerName", "_markerType", "_markerColor", "_markerPosition", "_hidden", "_unknown", "_accuracy"];
	_text = _text + format["%1 || %2 || %3 || %4 || %5 || %6 \n", _markerName, _markerType, _markerPosition, _hidden, _unknown, (_markerPosition call BIS_fnc_posToGrid)];
	

} forEach ([] call rebru_fnc_getPOIS);

_text;
