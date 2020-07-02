params [
	["_requireUniform", false, [true]],
	["_requireBag", false, [true]]
];

player setVariable ["gasEffectActive", true];
			
// keep coughing/effects going until they put on mask/uniform or leave the area
// radBlur
_radBlur = ppEffectCreate ["RadialBlur", 100];
_radBlur ppEffectEnable true;
_radBlur ppEffectAdjust [0.12, 0.12, 0.1, 0.1];
_radBlur ppEffectCommit 0.5;
	
_grain = ppEffectCreate ["FilmGrain", 2000];
_grain ppEffectEnable true;
_grain ppEffectAdjust [0.1, 1.25, 2.01, 0.75, 1.0, 0];
_grain ppEffectCommit 0.5;
	
waitUntil {ppEffectCommitted _radBlur};
waitUntil {ppEffectCommitted _grain};
	
// wait until they leave the area/put mask on
waitUntil {!([] call gasmask_fnc_playerInZone) || [_requireUniform, _requireBag] call gasmask_fnc_playerHasPPE};

// clear ppeffects
_radBlur ppEffectAdjust [0,0,0,0];
_radBlur ppEffectCommit 5;
		
_grain ppEffectAdjust [0, 1.25, 2.01, 0.75, 1.0, 0];
_grain ppEffectCommit 10;
			
uisleep 5;
			
_radBlur ppEffectEnable false;
ppEffectDestroy _radBlur;
			
_grain ppEffectEnable false;
ppEffectDestroy _grain;
			
player setVariable ["gasEffectActive", false];