/**
 * Turn lights off or on in a given radius from an object/trigger, or
 * within the area of the trigger (if it has an area), or just on the entire
 * map.
 *
 * _turnLightsOn	Boolean			(Optional) Turn them on or off?
 * _trigger			Object			(Optional) The trigger or object that is
 * 									the center of search area or whose area we
 * 									use for object search
 * _objects			Number|Array	(Optional) If array of objects, check
 * 									they're within trigger area. If number,
 * 									search using that as the radius (in meters)
 * _groupSize		Number			The amount of lights per 2 seconds to turn
 * 									off
 */
params [["_turnLightsOn", "OFF", [""]], ["_trigger", objNull, [objNull]], ["_objects", [], [0, []]], ["_groupSize", 2, [0]]];

private _lightClassnames = [
	"Land_FloodLight_F",
	"Land_PowerPoleWooden_L_F",
	"PowerLines_Wires_base_F",
	"Land_PowerPoleWooden_F",
	"PowerLines_base_F",
	"PowerLines_Small_base_F",
	"StreetLamp",
	"Land_LightHouse_F",
	"Land_Lighthouse_small_F",
	"Land_PortableLight_single_F",
	"Land_PortableLight_double_F",
	"Land_PortableHelipadLight_01_F",
	"PortableHelipadLight_01_blue_F",
	"PortableHelipadLight_01_red_F",
	"PortableHelipadLight_01_white_F",
	"PortableHelipadLight_01_green_F",
	"PortableHelipadLight_01_yellow_F",
	"Land_runway_edgelight",
	"Land_NavigLight",
	"Land_NavigLight_3_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_red_F",
	"Land_Flush_Light_yellow_F",
	"Land_runway_edgelight_blue_F",
	"Land_LampAirport_F",
	"Land_LampDecor_F",
	"Land_NavigLight_3_short_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_PowerPoleWooden_small_F",
	"Land_LampHalogen_F",
	"Land_LampSolar_F",
	"Land_LampStreet_small_F",
	"Land_LampStreet_F",
	"Land_LampAirport_F﻿",
	"Land_LampIndustrial_01_F",
	"Land_LampIndustrial_02_F",
	"Land_vn_lampshabby_f",
	"Land_LampHarbour_F",
	"Land_LampSolar_F"
];

private _mapSize = worldName call BIS_fnc_mapSize;
if (_mapSize == -1) then { _mapSize = 25000; };
private _worldCenter = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");
private _worldObjects = nearestObjects [_worldCenter, _lightClassnames, (_mapSize / 2), true];


if (typeName _trigger != "OBJECT") then { _trigger = _worldCenter; };
if (typeName _trigger == "OBJECT") then {
	if (typeName _objects == "SCALAR") then {
		if (_objects > 0) then {
			_objects = nearestObjects [_trigger, _lightClassnames, _objects, true];
		} else {
			_objects = nearestObjects [_trigger, _lightClassnames, _mapSize / 2, true];
		};
	} else {
		if (typeName _objects == "ARRAY" && (count _objects) > 0) then {
			_trigger params ["_px","_py","_pz"];
			_objects = _worldObjects inAreaArray [ [_px,_py,_pz], 500, 500];
		} else {
			_objects = _worldObjects;
		};
	};
};



private _objectCount = (count _objects)-1;
for "_i" from 0 to _objectCount do {
	_object = _objects select _i;
	[[_object, _turnLightsOn], {(_this select 0) switchLight (_this select 1);}] remoteExec ["BIS_fnc_call"];
	if(_i % _groupSize == 0) then { sleep 3; };
};