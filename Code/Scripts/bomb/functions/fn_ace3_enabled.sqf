params [["_config", false]];
diag_log format ["fn_ace3_enabled | _config: %1", _config];

if ( isClass(configFile >> "CfgPatches" >> "ace_main") && !_config) exitWith { true };
false