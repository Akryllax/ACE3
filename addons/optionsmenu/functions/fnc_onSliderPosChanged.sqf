/*
 * Author: PabstMirror
 * Called when one of the color sliders is moved.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_onSliderPosChanged
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_newColor", "_settingIndex"];

_settingIndex =  lbCurSel 200;

switch (GVAR(optionMenu_openTab)) do {
    case (MENU_TAB_COLORS): {

        _newColor = [];
        {
            _newColor pushBack ((sliderPosition _x) / 255);
        } forEach [410, 411, 412, 413];

        if ((_settingIndex >= 0) && (_settingIndex < (count GVAR(clientSideColors)))) then {
            _settingIndex = (GVAR(clientSideColors) select _settingIndex) select 0;
            [MENU_TAB_COLORS, _settingIndex, _newColor] call FUNC(updateSetting);
        };
        [false] call FUNC(settingsMenuUpdateList);
    };
    case (MENU_TAB_SERVER_COLORS): {

        _newColor = [];
        {
            _newColor pushBack ((sliderPosition _x) / 255);
        } forEach [410, 411, 412, 413];

        if ((_settingIndex >= 0) && (_settingIndex < (count GVAR(clientSideColors)))) then {
            _settingIndex = (GVAR(clientSideColors) select _settingIndex) select 0;
            [MENU_TAB_SERVER_COLORS, _settingIndex, _newColor] call FUNC(updateSetting);
        };
        [false] call FUNC(serverSettingsMenuUpdateList);
    };
    default {};
};
