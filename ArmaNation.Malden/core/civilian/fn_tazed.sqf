#include "..\..\script_macros.hpp"

private["_curWep","_curMags","_attach"];

params [
    ["_unit",objNull,[objNull]],
    ["_shooter",objNull,[objNull]]
];

if (isNull _unit || isNull _shooter) exitWith { player allowDamage true; life_istazed = false; };

if (_shooter isKindOf "Man"
&& alive player) then
{
    if (!life_istazed) then {
        life_istazed = true;
        _curWep = currentWeapon player;
        _curMags = magazines player;
        _attach = if (!(primaryWeapon player == "")) then {primaryWeaponItems player} else {[]};

        {
            player removeMagazine _x
        }
        forEach _curMags;

        player removeWeapon _curWep;
        player addWeapon _curWep;

        if (!(count _attach == 0)
        && !(primaryWeapon player == "")) then
        {
            {
                _unit addPrimaryWeaponItem _x;
            }
            forEach _attach;
        };

        if (!(count _curMags == 0)) then
        {
            {
                player addMagazine _x;
            }
            forEach _curMags;
        };

        [_unit] remoteExecCall ["life_fnc_tazeSound",RCLIENT];

        _obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
        _obj setPosATL ASLTOATL(visiblePositionASL player);

        [player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["life_fnc_animSync",RCLIENT];
        [0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable ["realname",name _shooter]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];

        _unit attachTo [_obj,[0,0,0]];
        disableUserInput true;
        sleep 15;

        [player,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["life_fnc_animSync",RCLIENT];

        if (!(player getVariable ["Escorting",false])) then
        {
            detach player;
        };

        life_istazed = false;
        player allowDamage true;
        disableUserInput false;
    };
}
else
{
    _unit allowDamage true;
    life_iztazed = false;
};