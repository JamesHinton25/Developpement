#define ST_CENTER         0x02

class playerHUD
{
    idd = -1;
    duration = 10e10;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "playerHUD";
    onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
    objects[] = {};
    controls[] =
    {
        Life_RscBackground_HUD,
        Life_RscProgress_HUDFood,
        Life_RscProgress_HUDHealth,
        Life_RscProgress_HUDWater,
        Life_RscText_HUDFood,
        Life_RscText_HUDHealth,
        Life_RscText_HUDWater,
        Life_RscPicture_HUDFood,
        Life_RscPicture_HUDWater,
        Life_RscPicture_HUDHealth,
        Life_RscPicture_HUDLogo
    };
    //background
    class Life_RscBackground_HUD : Life_RscBackground
    {
        colorBackground[] = {0,0,0,0.5};
        x = 0.907656 * safezoneW + safezoneX;
        y = 0.819 * safezoneH + safezoneY;
        w = 0.086 * safezoneW;
        h = 0.11 * safezoneH;
    };
    //progress bars
    class LIFE_RscProgress_HUDCommon : Life_RscProgress
    {
        colorFrame[] = {0, 0, 0, 0.8};
        x = 0.92 * safezoneW + safezoneX;
        w = 0.0694446 * safezoneW;
        h = 0.0222222 * safezoneH;
    };
    class Life_RscProgress_HUDFood : Life_RscProgress
    {
        idc = 2200;
        colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        x = 0.928281 * safezoneW + safezoneX;
        y = 0.83 * safezoneH + safezoneY;
        w = 0.061875 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class Life_RscProgress_HUDHealth : Life_RscProgress
    {
        idc = 2201;
        colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        x = 0.928281 * safezoneW + safezoneX;
        y = 0.896 * safezoneH + safezoneY;
        w = 0.061875 * safezoneW;
        h = 0.022 * safezoneH;
    };
    class Life_RscProgress_HUDWater : Life_RscProgress
    {
        idc = 2202;
        colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        x = 0.928281 * safezoneW + safezoneX;
        y = 0.863 * safezoneH + safezoneY;
        w = 0.061875 * safezoneW;
        h = 0.022 * safezoneH;
    };
    //textes
    class Life_RscText_HUDFood : Life_RscText
    {
        idc = 1200;
        text = "";
        x = 0.948906 * safezoneW + safezoneX;
        y = 0.8344 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.011 * safezoneH;
    };
    class Life_RscText_HUDHealth : Life_RscText
    {
        idc = 1201;
        text = "";
        x = 0.948906 * safezoneW + safezoneX;
        y = 0.9004 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.011 * safezoneH;
    };
    class Life_RscText_HUDWater : Life_RscText
    {
        idc = 1202;
        text = "";
        x = 0.948905 * safezoneW + safezoneX;
        y = 0.8674 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.011 * safezoneH;
    };
    //icon
    class Life_RscPicture_HUDFood: life_RscPicture
    {
        idc = 1200;
        text = "icons\hud\food.paa";
        x = 0.912813 * safezoneW + safezoneX;
        y = 0.83 * safezoneH + safezoneY;
        w = 0.03;
        h = 0.04;
    };
    class Life_RscPicture_HUDWater: life_RscPicture
    {
        idc = 1201;
        text = "icons\hud\water.paa";
        x = 0.912813 * safezoneW + safezoneX;
        y = 0.863 * safezoneH + safezoneY;
        w = 0.03;
        h = 0.04;
    };
    class Life_RscPicture_HUDHealth: life_RscPicture
    {
        idc = 1202;
        text = "icons\hud\health.paa";
        x = 0.912813 * safezoneW + safezoneX;
        y = 0.896 * safezoneH + safezoneY;
        w = 0.03;
        h = 0.04;
    };
    class Life_RscPicture_HUDLogo: Life_RscPicture
    {
        idc = 1203;
        text = "icons\hud\ipls.paa";
        x = 0.89 * safezoneW + safezoneX;
        y = 0.855 * safezoneH + safezoneY;
        w = 0.10 * safezoneW;
        h = 0.173 * safezoneH;
    };
};