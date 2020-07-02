# Gasmask Script
Gasmask script for Arma 3. Works based off triggers and markers.

Protection equipment is configured using the arrays PPE_UNIFORMS, PPE_MASKS, PPE_BAGS defined in initPlayerLocal.sqf, and trigger/marker areas are configured in the array GASMASK_ZONES.

Steps for usage:
1. Merge scripts folder with existing scripts folder in mission folder (if it exists).
2. Merge description.ext.
3. Call gasmask_fnc_initMask from initPlayerLocal.sqf with desired parameters, see below for example.

Make sure to call initMask function from initPlayerLocal.sqf.

Example call:
```sqf
[_playBreaths, _usePPeffects, _requireUniform, _requireBag] spawn gasmask_fnc_initMask;
```
Defaults:
```sqf
[true, true, false, false] spawn gasmask_fnc_initMask;
```

## Changelog
### 02/07/2020
- Initial upload.