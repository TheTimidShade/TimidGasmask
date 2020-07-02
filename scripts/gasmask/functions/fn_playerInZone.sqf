_inZone = false;
{
	if (player inArea _x) then {
		_inZone = true;
	}
} forEach GASMASK_ZONES;
_inZone