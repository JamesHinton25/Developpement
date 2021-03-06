#include "..\..\script_macros.hpp"

private ["_cop", "_licenses", "_licensesConfigs"];

_cop = param [0,ObjNull,[ObjNull]];

if (isNull _cop) exitWith {};

_licenses = "";

_licensesConfigs = "getText(_x >> 'side') == 'civ'" configClasses (missionConfigFile >> "Licenses");

{
    if (LICENSE_VALUE(configName _x,"civ")) then
    {
        _licenses = _licenses + localize getText(_x >> "displayName") + "<br/>";
    };
}
forEach _licensesConfigs;

if (_licenses == "") then { _licenses = (localize "STR_Cop_NoLicensesFound"); };

[profileName,_licenses] remoteExecCall ["life_fnc_licensesRead",_cop];