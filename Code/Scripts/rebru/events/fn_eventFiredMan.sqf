/**
	FiredMan EventHandler
*/
params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

if(str _unit != "p1") exitWith {};
private _playerDir = getDir _unit;

private _info = [_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _playerDir];

_info spawn {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_playerDir"];
	private _bomb = "bomb_03_f";
	private _bombcount = 3;
	private _bombdelay = 0.5;
	private _range = 2500;
	private _securityRange = [15,180];
	private _bombName = "550 lb";
	private _plane = "O_Plane_CAS_02_dynamicLoadout_F";
	//if( str side _unit == "WEST") then { _plane = "vn_b_air_f4c_hcas"; } else { _plane = "O_Plane_CAS_02_dynamicLoadout_F"; };
	if(
		_magazine in [
			"B_IR_Grenade",
			"O_IR_Grenade",
			"I_IR_Grenade",
			"vn_m18_red_mag",
			"vn_m18_white_mag",
			"vn_m18_purple_mag",
			"vn_m18_yellow_mag"
		]
	) then {

		switch(_magazine) do
		{
			case "vn_m18_red_mag": {
				_bomb = "vn_bomb_750_blu1b_fb_ammo";
				_bombcount = 1;
				_bombdelay = 1;
				_securityRange = [75,180];
				_bombName = "Napalm";
				_range = 2500;
			};
			case "vn_m18_white_mag": {
				_bomb = "vn_bomb_100_m47_wp_ammo";
				_bombcount = 1;
				_bombdelay = 0.75;
				_securityRange = [150,180];
				_bombName = "Phosphor";
				_range = 2500;
			};
/* 			case "vn_m18_purple_mag": {
				_bomb = "vn_bomb_15000_blu82_dc_ammo";
				_bombcount = 3;
				_bombdelay = 2;
				_securityRange = [25,0];
				_bombName = "7.5t DaisyCutter";
				_range = 8000;
			}; */
			case "vn_m18_yellow_mag": {
				_bomb = "vn_bomb_500_mk82_se_ammo"; 
				_bombcount = 1;
				_bombdelay = 1;
				_securityRange = [300,180];
				_bombName = "MK82 DaisyCutter";
				_range = 2500;
			};
		};

		sleep 5;
		_projectile setDir _playerDir;
		//systemChat format ["Direction %1", _playerDir];
		private _projectilePos = _projectile getRelPos _securityRange;
		_message = format ["8-TUNG: CAS %1 | AUS => %2° | AZIMUT => %3°", _bombName, round (_playerDir call rebru_fnc_getOppositeDirection), round _playerDir ];
		
		[_message] remoteExec ["systemChat", 0, true];

		[_projectilePos, [east, _plane, _range, _playerDir, 250, 85], [ [_bomb, _bombcount, false, _bombdelay] ]] spawn rebru_fnc_callDrop;

		// DEBUG
		//_markerPlayer = createMarker ["MarkerPlayer", position player];
		//_markerPlayer setMarkerType "hd_dot";
		//_markerProjectile = createMarker ["MarkerProjectile", getPos _projectile];
		//_markerProjectile setMarkerType "hd_dot";
		//_markerProjectileRelative = createMarker ["MarkerProjectileRelative", _projectilePos];
		//_markerProjectileRelative setMarkerType "hd_dot";

		//sleep 10;

		//deleteMarker "MarkerPlayer";
		//deleteMarker "MarkerProjectile";
		//deleteMarker "MarkerProjectileRelative";

	};
};
