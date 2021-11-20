params ["_needKit", ["_isAce3Enabled", false]];
diag_log format ["fn_getCondition | _needKit: %1 | _isAce3Enabled: %2", _needKit, _isAce3Enabled];

_condition = "true";
if (_isAce3Enabled) then 
{
    _condition = { true };
};

if (_needKit) then 
{
    _condition = "'ToolKit' in (items _this)";
    if (_isAce3Enabled) then 
    {
        _condition = { "ACE_DefusalKit" in (items (_this select 1)) };
    };
};

_condition