class dialogSimpleMenu
{
	idd = 79001;
	
	class controls 
	{
		class baseFrame: RscFrame
		{
			idc = 1800;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.506 * safezoneH;
		};
		class playerList: RscListbox
		{
			idc = 1500;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class actionList: RscListbox
		{
			idc = 1501;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class buttonOK: RscButton
		{
			idc = 1600;
			text = "Ausführen"; //--- ToDo: Localize;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
			action = "call rebru_fnc_doAction";
		};
		class buttonEsc: RscButton
		{
			idc = 1601;
			text = "Abbrechen"; //--- ToDo: Localize;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
			action = closeDialog 1;
		};
	}
}
