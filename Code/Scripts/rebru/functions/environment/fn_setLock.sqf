params [["_status",false],["_objectType", "Land_PortableCabinet_01_medical_F"],["_pos", getPos player]];

private _object = nearestObject [_pos, _objectType];

[[_object, _status], {(_this select 0) lockInventory (_this select 1);}] remoteExec ["BIS_fnc_call"];