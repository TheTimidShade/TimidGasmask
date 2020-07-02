params [
	["_requireUniform", false, [true]],
	["_requirePack", false, [true]]
];

_hasMask = ((goggles player) in PPE_MASKS);
_hasUniform = ((uniform player) in PPE_UNIFORMS);
_hasPack = ((backpack player) in PPE_BAGS);
_hasPPE = true; // true by default, set to false if player doesn't have ppe

if (!_hasUniform && _requireUniform) then {_hasPPE = false;};
if (!_hasPack && _requirePack) then {_hasPPE = false;};
if (!_hasMask) then {_hasPPE = false;};
_hasPPE

