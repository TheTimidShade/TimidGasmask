class RscPicture
{
	access = 0;
	idc = -1;
	type = 0;
	style = 48;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = 1;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
};

class mask_overlay {
	idd = -1;
	movingEnable = 0;
	duration = 1000000;
	fadein = 0;
	fadeout = 0;	
	name = "mask_overlay";
	controls[] = {"Picture"};
	class Picture: RscPicture
	{
		x=safeZoneX; y=safeZoneY; w=safeZoneW; h=safeZoneH;
		idc = 1200;
		text = "scripts\gasmask\gas_overlay.paa";
	};
};

