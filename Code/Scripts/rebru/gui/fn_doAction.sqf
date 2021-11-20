_playerIndex = lbCurSel 1500;
_actionIndex = lbCurSel 1501;

_player = playerListArray select _playerIndex;
_action = actionListArray select _actionIndex;


// Switch
switch(_action) do 
{	
	case "kill":
	{
		//[[_player], "rebru_fnc_guiKill"] remoteExec ["call", _player];
		[vehicle _player, 1] remoteExec ["setDamage", _player];
	};

	case "heal":
	{
		//[[_player], "rebru_fnc_guiHeal"] remoteExec ["call", _player];
		[vehicle _player, 0] remoteExec ["setDamage", _player];
	};
	
	case "fuel":
	{
		//[[_player], "rebru_fnc_guiFuel"] remoteExec ["call", _player];
		[vehicle _player, 1] remoteExec ["setFuel", _player];
	};
	
	case "rearm":
	{
		//[[_player], "rebru_fnc_guiRearm"] remoteExec ["call", _player];
		[vehicle _player, 1] remoteExec ["setAmmo", _player];
	};
	
	case "revive":
	{
		//[[_player], "rebru_fnc_guiRevive"] remoteExec ["call", _player];
		_target = _player;
		_target enableSimulation true;
		_target allowDamage true;
		_target setDammage 0;
		_target setFatigue 0;
		_target setCaptive false;
		[_target,false] remoteExec ["hideObject", 0, false];
		_target setVariable ["AT_Revive_isUnconscious", false, true];
		_target setVariable ["AT_Revive_isDragged", objNull, true];
		_target setVariable ["AT_Revive_isDragging",objNull,true];
		[_target,""] remoteExec ["switchMove", 0, false];
		[] remoteExec ["athsc_fnc_exit", _player];
	};
	
	case "teleportHim":
	{
		_pos = getPosATL player;
		//[[_pos], "rebru_fnc_TeleportHim"] remoteExec ["call", _player];
		_player setPosATL _pos;
	};
	
	case "teleportMe":
	{
		_pos = getPosATL _player;
		player setPosATL _pos;
	};
	
	case "noFatStam":
	{
		//[[_player], "rebru_fnc_guiNotFatStam"] remoteExec ["call", _player];
		[_player, false] remoteExec ["enableStamina", _player];
		[_player, false] remoteExec ["enableFatigue", _player];
	};
	
	case "punish":
	{
		[_player,"AmovPercMstpSnonWnonDnon_exercisePushup"] remoteExec ["playMove", _player];
	};
	
	case "navigations":
	{
		//[[_player], "rebru_fnc_guiNotFatStam"] remoteExec ["call", _player];
		[_player, "ItemMap"] remoteExec ["addItem",_player];
		[_player, "ItemMap"] remoteExec ["assignItem",_player];
		[_player, "ItemCompass"] remoteExec ["addItem",_player];
		[_player, "ItemCompass"] remoteExec ["assignItem",_player];
		[_player, "NvGoggles"] remoteExec ["addItem",_player];
		[_player, "NvGoggles"] remoteExec ["assignItem",_player];
	};
	
	case "vn_ammo_m16":
	{
		[_player,["vn_m16_40_t_mag", 8]] remoteExec ["addMagazines", _player];
	};
	
	case "vn_ammo_m21":
	{
		[_player,["vn_m14_mag", 8]] remoteExec ["addMagazines", _player];
	};
	
	case "cup_ammo_stanag":
	{
		[_player,["CUP_30Rnd_556x45_Stanag", 8]] remoteExec ["addMagazines", _player];
	};
	
	case "vn_gear_sniper":
	{
		//[[_player], "rebru_fnc_guiVNSniper"] remoteExec ["call", _player];
		[_player, "vn_b_helmet_m1_01_01"] remoteExec ["addHeadgear", _player];
		[_player, "vn_b_vest_sog_05"] remoteExec ["addVest", _player];
		[_player, "vn_b_pack_01_medic_mat49_pl"] remoteExec ["addBackpack", _player];
		[_player] remoteExec ["clearAllItemsFromBackpack", _player];
		[_player,["vn_m14_mag", 8]] remoteExec ["addMagazines", _player];
		[_player, "vn_m21_sd"] remoteExec ["addWeapon", _player];
	};
	
	case "vn_gear_soldier":
	{
		//[[_player], "rebru_fnc_guiVNMarksman"] remoteExec ["call", _player];
		[_player, "vn_b_helmet_m1_01_01"] remoteExec ["addHeadgear", _player];
		[_player, "vn_b_vest_sog_05"] remoteExec ["addVest", _player];
		[_player, "vn_b_pack_01_medic_mat49_pl"] remoteExec ["addBackpack", _player];
		[_player] remoteExec ["clearAllItemsFromBackpack", _player];
		[_player,["vn_m16_40_t_mag", 8]] remoteExec ["addMagazines", _player];
		[_player, "vn_m16_mrk_sd"] remoteExec ["addWeapon", _player];
	};
	
	case "cup_gear_soldier":
	{
		//[[_player], "rebru_fnc_guiCupMarksman"] remoteExec ["call", _player];
		[_player, "CUP_H_USArmy_HelmetMICH_ESS"] remoteExec ["addHeadgear", _player];
		[_player, "CUP_V_I_RACS_Carrier_Vest"] remoteExec ["addVest", _player];
		[_player, "CUP_B_USMC_MOLLE"] remoteExec ["addBackpack", _player];
		[_player] remoteExec ["clearAllItemsFromBackpack", _player];
		[_player,["CUP_30Rnd_556x45_Stanag", 8]] remoteExec ["addMagazines", _player];
		[_player, "CUP_arifle_M4A1"] remoteExec ["addWeapon", _player];
		[_player, "CUP_optic_Elcan_reflex_OD_3D"] remoteExec ["addPrimaryWeaponItem", _player];
		[_player, "CUP_muzzle_snds_M16_camo"] remoteExec ["addPrimaryWeaponItem", _player];
		[_player, "CUP_acc_ANPEQ_2_camo"] remoteExec ["addPrimaryWeaponItem", _player];
	};
	
	
}