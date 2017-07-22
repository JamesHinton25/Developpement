#include "..\..\script_macros.hpp"

if (FETCH_CONST(life_adminlevel) < 1) exitWith { closeDialog 0; hint localize "STR_ANOTF_ErrorLevel"; };

[] spawn {
	while { dialog } do {
		closeDialog 0;
		sleep 0.1;
	};
};

if (player getVariable ["restrained", false]) then {
	player setVariable ["restrained", false, true];
	detach player;
	hint "Vous êtes libre.";
} else {
	hint "Vous n'êtes pas menotté !";
};