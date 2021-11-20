params ["_unit"];
diag_log format ["fn_isExpert | _unit: %1", _unit];

_search = ["_engineer_", "_exp_", "_repair_", "_para_8_", "_bandit_8_", "_bandit_7_"];
_isExpert = false;
{
    if ([toLower(_x), toLower(typeOf _unit)] call BIS_fnc_inString) exitWith 
    {
        _isExpert = true;
    };
} forEach _search;

if (isClass (configFile >> "CfgPatches" >> "ace_common")) then 
{
    _isEOD = [_unit] call ace_common_fnc_isEOD;
    _isEngineer = [_unit] call ace_common_fnc_isEngineer;

    if( _isEOD || _isEngineer ) then 
    {
        _isExpert = true;
    };
};

_isExpert