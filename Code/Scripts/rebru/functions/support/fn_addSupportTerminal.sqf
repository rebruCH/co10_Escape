params ["_source", ["_arguments",nil]];
_source addAction ["Unterstützung anfordern", rebru_fnc_callSupportVehicles, _arguments, 1, true, false, "", "(_target getVariable ['stopCoolDown', TRUE])"];