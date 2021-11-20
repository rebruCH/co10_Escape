params [["_placesToKeep", ["NameCityCapital","NameCity","NameVillage"], [[]]]];

_placesCfg = configFile >> "CfgWorlds" >> worldName >> "Names";
_places = [];

for "_i" from 0 to (count _placesCfg)-1 do
{	
	private _place = _placesCfg select _i;
	private _name = (_place >> "name") call  BIS_fnc_returnConfigEntry;
	private _position = (_place >> "position") call BIS_fnc_returnConfigEntry;
	_type = (_place >> "type") call BIS_fnc_returnConfigEntry;
	if(_name != "") then { 
		if(_type in _placesToKeep) then { _places append [[_name, _position]]; };
	};
};

_places;