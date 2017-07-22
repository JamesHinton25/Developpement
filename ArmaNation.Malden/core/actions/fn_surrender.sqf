#include "..\..\script_macros.hpp"
/*
	@fichier : fn_surrender.sqf
	@credits : par JamesHinton.
	@serveur : Malden (ArmaNation)
*/
if (player getVariable ["restrained", false]) exitWith { };
if (player getVariable ["Escorting", false]) exitWith { };
if (vehicle player != player) exitWith { };
if (speed player > 1) exitWith { };

if (player getVariable ["playerSurrender",false]) then {
    player setVariable ["playerSurrender",false,true];
} else {
    player setVariable ["playerSurrender",true,true];
};

while {player getVariable ["playerSurrender",false]} do {
    player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
    if (!alive player || (vehicle player) != player) then { player setVariable ["playerSurrender",false,true]; };
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
