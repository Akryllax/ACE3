/*
 * Author: Commy2 and CAA-Picard
 * Handle weapon fire
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 3: Muzzle <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "\z\ace\addons\overheating\script_component.hpp"

private ["_unit", "_weapon", "_ammo", "_projectile"];
_unit = _this select 0;

// Exit if the unit isn't a player
if !([_unit] call EFUNC(common,isPlayer)) exitWith {};

_weapon = _this select 1;

// Compute new temperature if the unit is the local player
if (_unit == ACE_player) then {
    _this call FUNC(overheat);
};

// Get current temperature from the unit variable
_variableName = format [QGVAR(%1), _weapon];
_scaledTemperature = (((_unit getVariable [_variableName, [0,0]]) select 0) / 1000) min 1 max 0;

//////////////////////////////// FIX
systemChat format ["%1", _scaledTemperature];
_scaledTemperature = random 1;
//////////////////////////////// FIX

// Smoke SFX, beginning at TEMP 0.15
private "_intensity";

_intensity = (_scaledTemperature - 0.2) * 1.25;
if (_intensity > 0) then {
    private ["_position", "_direction"];

    _position = position _projectile;
    _direction = (_unit weaponDirection _weapon) vectorMultiply 0.25;

    drop [
        "\A3\data_f\ParticleEffects\Universal\Refract",
        "",
        "Billboard",
        1.1,
        2,
        _position,
        _direction,
        1,
        1.2,
        1.0,
        0.1,
        [0.1,0.15],
        [[0.06,0.06,0.06,0.32*_scaledTemperature], [0.3,0.3,0.3,0.28*_scaledTemperature], [0.3,0.3,0.3,0.25*_scaledTemperature], [0.3,0.3,0.3,0.22*_scaledTemperature], [0.3,0.3,0.3,0.1*_scaledTemperature]],
        [1,0],
        0.1,
        0.05,
        "",
        "",
        ""
    ];

    _intensity = (_scaledTemperature - 0.5) * 2;
    if (_intensity > 0) then {
        drop [
            ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 1, 16],
            "",
            "Billboard",
            1,
            1.2,
            _position,
            [0,0,0.25],
            0,
            1.275,
            1,
            0.025,
            [0.28,0.33,0.37],
            [[0.6,0.6,0.6,0.3*_intensity]],
            [0.2],
            1,
            0.04,
            "",
            "",
            ""
        ];
    };
};


// Dispersion and bullet slow down
private ["_dispersion", "_slowdownFactor", "_count"];

_dispersion = getNumber (configFile >> "CfgWeapons" >> _weapon >> "ACE_Dispersion");

_dispersion = ([[0*_dispersion,1*_dispersion,2*_dispersion,4*_dispersion], 3 * _scaledTemperature] call EFUNC(common,interpolateFromArray)) max 0;

_slowdownFactor = getNumber (configFile >> "CfgWeapons" >> _weapon >> "ACE_SlowdownFactor");

if (_slowdownFactor == 0) then {_slowdownFactor = 1};

_slowdownFactor = ([[1*_slowdownFactor,1*_slowdownFactor,1*_slowdownFactor,0.9*_slowdownFactor], 3 * _scaledTemperature] call EFUNC(common,interpolateFromArray)) max 0;


// Exit if GVAR(pseudoRandomList) isn't synced yet
if (count GVAR(pseudoRandomList) == 0) exitWith {};

// Get the pseudo random values for dispersion from the remaining ammo count
private "_pseudoRandomPair";
_pseudoRandomPair = GVAR(pseudoRandomList) select ((_unit ammo _weapon) mod count GVAR(pseudoRandomList));

[_projectile, (_pseudoRandomPair select 0) * _dispersion, (_pseudoRandomPair select 1) * _dispersion, (_slowdownFactor - 1) * vectorMagnitude _velocity] call EFUNC(common,changeProjectileDirection);



// Only compute jamming for the local player
if (_unit != ACE_player) exitWith {};

private "_jamChance";
_jamChance = 1 / getNumber (configFile >> "CfgWeapons" >> _weapon >> "ACE_MRBS"); // arma handles division by 0

_jamChance = [[0.5*_jamChance,1.5*_jamChance,7.5*_jamChance,37.5*_jamChance], 3 * _scaledTemperature] call EFUNC(common,interpolateFromArray);

// increase jam chance on dusty grounds if prone
if (stance _unit == "PRONE") then {
    private "_surface";
    _surface = toArray (surfaceType getPosASL _unit);
    _surface deleteAt 0;

    _surface = configFile >> "CfgSurfaces" >> toString _surface;
    if (isClass _surface) then {
        _jamChance = _jamChance + (getNumber (_surface >> "dust")) * _jamChance;
    };
};

//_jamChance = 0.5;

systemChat format ["Temperature: %1 - JamChance: %2", _scaledTemperature, _jamChance];

if (random 1 < _jamChance) then {
    [_unit, _weapon] call FUNC(jamWeapon);
};
