if (playerSide != west) exitWith {};

private ["_speed", "_vehicle"];

_vehicle = cursorObject;
_speed = round speed _vehicle;

if ((_vehicle isKindOf "Car") && (currentWeapon player) == "Rangefinder") then
{
    switch (true) do
    {
        case (_speed > 30 && _speed <= 80):
        {
            hint parseText format ["<t color='#ffffff'><t size='1.6'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#33CC33'><t align='center'><t size='1.1'>" +(localize "STR_Cop_VehSpeed"), round _speed];
        };
        case (_speed > 80):
        {
            hint parseText format ["<t color='#ffffff'><t size='1.6'><t align='center'>" +(localize "STR_Cop_Radar")+ "<br/><t color='#FF0000'><t align='center'><t size='1.1'>" +(localize "STR_Cop_VehSpeed"), round _speed];
        };
    };
};