#include "..\..\script_macros.hpp"
/*
	@fichier : fn_repairTruck.sqf
	@credits : par JamesHinton.
	@serveur : Malden (ArmaNation)
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test","_sideRepairArray"];
_veh = cursorObject;
life_interrupted = false;
if (isNull _veh) exitWith {};
if ((_veh isKindOf "Car") || (_veh isKindOf "Ship") || (_veh isKindOf "Air")) then {
    if (life_inv_toolkit > 0) then {
        life_action_inUse = true;
        _displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _veh),"displayName");
        _upp = format[localize "STR_NOTF_Repairing",_displayName];

        //Setup our progress bar.
        disableSerialization;
        5 cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progress = _ui displayCtrl 38201;
        _pgText = _ui displayCtrl 38202;
        _pgText ctrlSetText format["%2 (1%1)...","%",_upp];
        _progress progressSetPosition 0.01;
        _cP = 0.01;

        for "_i" from 0 to 1 step 0 do {
            if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
                [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
                player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
                player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
            };

            sleep 0.27;
            _cP = _cP + 0.01;
            _progress progressSetPosition _cP;
            _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
            if (_cP >= 1) exitWith {};
            if (!alive player) exitWith {};
            if (player != vehicle player) exitWith {};
            if (life_interrupted) exitWith {};
        };

        life_action_inUse = false;
        5 cutText ["","PLAIN"];
        player playActionNow "stop";
        if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
        if (player != vehicle player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};

        _sideRepairArray = LIFE_SETTINGS(getArray,"vehicle_infiniteRepair");

        //Check if playerSide has infinite repair enabled
        if (playerSide == civilian && (_sideRepairArray select 0) == 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };
        if (playerSide == west && (_sideRepairArray select 1) == 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };
        if (playerSide == independent && (_sideRepairArray select 2) == 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };
        if (playerSide == east && (_sideRepairArray select 3) == 0) then {
            [false,"toolkit",1] call life_fnc_handleInv;
        };

        _veh setDamage 0;
        titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
    };
};
