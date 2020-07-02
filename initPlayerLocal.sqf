PPE_UNIFORMS = ["U_B_CBRN_Suit_01_Wdl_F"]; // uniforms that need to be worn to protect
PPE_MASKS = ["G_AirPurifyingRespirator_01_F"]; // masks that need to be worn to protect
PPE_BAGS = ["B_CombinationUnitRespirator_01_F"]; // bags that need to be worn to protect
GASMASK_ZONES = [zone1, "marker1"]; // array of trigger varnames OR string marker names to be used as toxic areas
// [_playBreaths, _usePPeffects, _requireUniform, _requireBag] spawn gasmask_fnc_initMask;
[true, true, false, false] spawn gasmask_fnc_initMask;