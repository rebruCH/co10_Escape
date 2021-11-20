/*
	Holt alle POI's aus dem missionNamespace, die dem Typ _typ entsprechen
*/

params [["_type","all"]];


private _filteredPois = [];

private _pois = (missionnamespace getVariable ["rebru_A3E_POIs",[]] select {_x # 4 || _x # 5});

{
	_x params ["_markerName", "_markerType", "_markerColor", "_markerPosition", "_hidden", "_unknown", "_accuracy"];
	if(_type == "all") then { _filteredPois append [_x]; } 
	else {
		if( _markerType == _type) then {
			_filteredPois append [_x];
		};
	};

	
} foreach _pois;

_filteredPois;
