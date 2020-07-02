params [
	["_playBreaths", true, [true]],
	["_usePPeffects", true, [true]],
	["_requireUniform", false, [true]],
	["_requireBag", false, [true]]
];

// handle overlay loop and maskOn variable
[_playBreaths] spawn gasmask_fnc_handleMaskOverlay;

// handle damage/protection from gas zones
while {alive player} do {
	// check if player is in a gas trigger/marker
	_inZone = [] call gasmask_fnc_playerInZone;

	// check if player has the right equipment
	_hasPPE = [_requireUniform, _requireBag] call gasmask_fnc_playerHasPPE;

	// if player is in the area and doesn't have ppe
	if (_inZone && !_hasPPE) then {
		
		// handle ppeffects
		if (_usePPeffects && !(player getVariable ["gasEffectActive", false])) then {
			[_requireUniform, _requireBag] spawn gasmask_fnc_ppEffect;
		};
		
		// handle cough sound
		[_playBreaths] spawn gasmask_fnc_cough;

		// handle damage
		if (!(player getVariable ["gas_cooldown", false])) then {
			[_requireUniform, _requireBag] spawn {
				player setVariable ["gas_cooldown", true];
				_requireUniform = _this select 0;
				_requireBag = _this select 1;
				while {[] call gasmask_fnc_playerInZone && !([_requireUniform, _requireBag] call gasmask_fnc_playerHasPPE)} do {
					_doDamage = selectRandom [true,true,false];
					if (_doDamage) then {[player, 0.2, "body", "bullet"] call ace_medical_fnc_addDamageToUnit;};
					sleep 4;
				};
				player setVariable ["gas_cooldown", false];
			};
		};
		
	};
	sleep 1;
};

