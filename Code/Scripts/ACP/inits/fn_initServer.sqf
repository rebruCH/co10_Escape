
_param1 = ["ACP_Param_Kisten", -1] call BIS_fnc_getParamValue;
sleep 5;

if (_param1 > 0) then {[] spawn  ACP_fnc_Scanner;};
exit; 

