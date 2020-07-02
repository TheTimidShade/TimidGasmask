params [
	["_playBreaths", true, [true]]
];

// test whether or not the player is wearing mask and update variable
[] spawn {
	while {!isNull player} do 
	{
		waitUntil {alive player};
		if (goggles player in PPE_MASKS) then {
			player setVariable ["maskOn", true];
		} else {
			player setVariable ["maskOn", false];
		};
		sleep 0.2;
	};
};

// do mask effects if player has it on
while {!isNull player} do 
{
	waitUntil {alive player};
	//wait until player has mask on
	waitUntil {player getVariable ["maskOn", false]};
	// spawn overlay
	1234 cutRsc ["mask_overlay", "PLAIN", 1, false];
	
	// breathing sound effects
	if (_playBreaths) then {
		[] spawn {
			while {player getVariable ["maskOn", false]} do {
				if (!(player getVariable ["gas_sound", false])) then {
					player setVariable ["gas_sound", true];
					_breaths = ["gas_mask_1", "gas_mask_2", "gas_mask_3"];
					_breath = selectRandom _breaths;
					playSound _breath;
					sleep 3;
					player setVariable ["gas_sound", false];
				};
			};
		};
	};
	
	// wait until player removes mask or dies
	waitUntil {!(player getVariable ["maskOn", false]) || !alive player};
	// clear overlay
	1234 cutText ["","PLAIN"];
	
};