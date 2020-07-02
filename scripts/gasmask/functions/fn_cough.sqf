params [
	["_playBreaths", true, [true]]
];

if (_playBreaths && !(player getVariable ["gas_sound", false])) then {
	
	_coughOrBreath = selectRandom [true,false];
	if (_coughOrBreath) then {
		player setVariable ["gas_sound", true];
		
		// breath sound effect
		_breathIn = selectRandom ["breath_1", "breath_3", "breath_4"];
		[player, _breathIn] remoteExec ["say3d", 0, false];
		
		sleep 1.5;
		
		_coughs = ["cough_1", "cough_2"];
		_cough = selectRandom _coughs;
		[player, _cough] remoteExec ["say3d", 0, false];
		
		sleep 2;
		
		player setVariable ["gas_sound", false];	
	}
	else {
		player setVariable ["gas_sound", true];

		// breath sound effect
		_breathIn = selectRandom ["breath_1", "breath_3", "breath_4"];
		[player, _breathIn] remoteExec ["say3d", 0, false];
			
		sleep 1.5;
			
		[player, "breath_2"] remoteExec ["say3d", 0, false];
			
		sleep 1;
			
		player setVariable ["gas_sound", false];
	};
};