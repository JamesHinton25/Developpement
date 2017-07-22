#include "..\..\script_macros.hpp"
/*
	@fichier : fn_removeContainer.sqf
	@credits : par JamesHinton.
	@serveur : Malden (ArmaNation)
*/
private["_house","_action","_container","_containerType","_containers"];
_container = param [0,ObjNull,[ObjNull]];
_containerType = typeOf _container;
_house = nearestObject [player, "House"];
if (!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};
if (isNull _container) exitWith {};
_containers = _house getVariable ["containers",[]];
closeDialog 0;

_action = [
    format[localize "STR_House_DeleteContainerMSG"],localize "STR_pInAct_RemoveContainer",localize "STR_Global_Remove",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
    private ["_box","_diff"];
    _box = switch (_containerType) do {
        case ("B_supplyCrate_F"): {"storagebig"};
        case ("Box_IND_Grenades_F"): {"storagesmall"};
        default {"None"};
    };
    if (_box == "None") exitWith {};

    _diff = [_box,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
    if (_diff isEqualTo 0) exitWith {hint localize "STR_NOTF_InvFull"};

    [_container] remoteExecCall ["TON_fnc_deleteDBContainer",RSERV];

    {
        if (_x == _container) then {
            _containers deleteAt _forEachIndex;
        };
    } forEach _containers;
    _house setVariable ["containers",_containers,true];

    [true,_box,1] call life_fnc_handleInv;
};
