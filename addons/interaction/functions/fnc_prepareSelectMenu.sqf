/*
    Author: Garth de Wet (LH)

    Description:
        Prepares the select menu for use.

    Parameters:
        0: TEXT - Header text
        1: TEXT - Approve button text

    Returns:
        ARRAY/NUMBER - container object for use with AddSelectableItem.

    Example:
        ["Select Explosive", "Place"] call FUNC(prepareSelectMenu);
*/
#include "script_component.hpp"

private ["_buttonAction", "_header", "_buttonText", "_cancelButton"];
closeDialog 0;
_header = _this select 0;
_buttonText = _this select 1;
if (isNil "_buttonText" or {_buttonText == ""}) then {
    _buttonText = localize "STR_ACE_Interaction_MakeSelection";
};
createDialog "RscACE_SelectAnItem";
ctrlSetText [8860, _buttonText];
ctrlSetText [8870, _header];

lbClear 8866;

8866
