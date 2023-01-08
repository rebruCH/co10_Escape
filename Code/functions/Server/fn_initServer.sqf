//waituntil{!isNil("BIS_fnc_init")};
["Server started."] spawn a3e_fnc_debugmsg;

//ACE Revive
AT_Revive_Camera = A3E_Param_ReviveView; //Needs to be stored on server now
ACE_MedicalServer = false;
if (isClass(configFile >> "CfgPatches" >> "ACE_Medical")) then {
	ACE_MedicalServer = true;
	["ace_unconscious", {params["_unit", "_isDown"]; [_unit,_isDown] spawn ACE_fnc_HandleUnconscious;}] call CBA_fnc_addEventHandler;
};
publicVariable "ACE_MedicalServer";

//Load Statistics
[] spawn A3E_fnc_LoadStatistics;



// Add crashsite here
//##############


private ["_EnemyCount","_enemyMinSkill", "_enemyMaxSkill", "_searchChopperSearchTimeMin", "_searchChopperRefuelTimeMin", "_enemySpawnDistance", "_playerGroup", "_enemyFrequency"];

_enemyFrequency = (A3E_Param_EnemyFrequency);
_enemySpawnDistance = (A3E_Param_EnemySpawnDistance);

// prison is created locally, clients need flag texture path
publicVariable "A3E_VAR_Flag_Ind";

// Developer Variables



createCenter A3E_VAR_Side_Opfor;
createCenter A3E_VAR_Side_Ind;

if(isNil("A3E_Param_War_Torn")) then {
	A3E_Param_War_Torn = 0;
};
A3E_VAR_Side_Blufor setFriend [A3E_VAR_Side_Ind, 0];
A3E_VAR_Side_Ind setFriend [A3E_VAR_Side_Blufor, 0];

A3E_VAR_Side_Blufor setFriend [A3E_VAR_Side_Opfor, 0];
A3E_VAR_Side_Opfor setFriend [A3E_VAR_Side_Blufor, 0];

if(A3E_Param_War_Torn == 0) then {
	A3E_VAR_Side_Opfor Setfriend [A3E_VAR_Side_Ind, 1];
	A3E_VAR_Side_Ind setFriend [A3E_VAR_Side_Opfor, 1];
} else {
	A3E_VAR_Side_Opfor Setfriend [A3E_VAR_Side_Ind, 0];
	A3E_VAR_Side_Ind setFriend [A3E_VAR_Side_Opfor, 0];
};



[] spawn A3E_fnc_weather;

private ["_hour","_date"];
_hour = A3E_Param_TimeOfDay;
switch (A3E_Param_TimeOfDay) do {
    case 24: {
		_hour = round(random(24));
	};
    case 25: {
		_hour = 6+round(random(10));  //Between 0600 and 1600
	};
	case 26: {
		_hour = 17 + round(random(11)); //Between 1700 and 0400
		_hour = _hour % 24;
	};
    default { _hour = A3E_Param_TimeOfDay };
};
_month = A3E_Param_MonthOfYear;

_date = date;
_date set [1,_month];
_date set [3,_hour];
_date set [4,0];

a3e_var_Escape_hoursSkipped = _hour - (date select 3);
publicVariable "a3e_var_Escape_hoursSkipped";

[_date] call bis_fnc_setDate;


setTimeMultiplier A3E_Param_TimeMultiplier;

// Game Control Variables, do not edit!

a3e_var_Escape_AllPlayersDead = false;
a3e_var_Escape_MissionComplete = false;
publicVariable "a3e_var_Escape_AllPlayersDead";
publicVariable "a3e_var_Escape_MissionComplete";

a3e_var_GrpNumber = 0;

if(isNil("A3E_Param_EnemySkill")) then {
	A3E_Param_EnemySkill = 1;
};

_enemyMinSkill = 0.40;
_enemyMaxSkill = 0.60;

//Kudos to Semiconductor

switch (A3E_Param_EnemySkill) do {
    // Convert value from params.hpp into acceptable range
    case 0: { _enemyMinSkill = 0.10; _enemyMaxSkill = 0.30; };
    case 1: { _enemyMinSkill = 0.30; _enemyMaxSkill = 0.50; };
    case 2: { _enemyMinSkill = 0.40; _enemyMaxSkill = 0.60; };
    case 3: { _enemyMinSkill = 0.60; _enemyMaxSkill = 0.80; };
    case 4: { _enemyMinSkill = 0.80; _enemyMaxSkill = 0.95; };
    default { _enemyMinSkill = 0.40; _enemyMaxSkill = 0.60; };
};

a3e_var_Escape_enemyMinSkill = _enemyMinSkill;
a3e_var_Escape_enemyMaxSkill = _enemyMaxSkill;
a3e_var_Escape_enemyMinSkill = _enemyMinSkill;
a3e_var_Escape_enemyMaxSkill = _enemyMaxSkill;

_searchChopperSearchTimeMin = (5 + random 10);
_searchChopperRefuelTimeMin = (5 + random 10);


//Getting exclusion zones
if(isNil("A3E_ExclusionZones")) then {
  A3E_ExclusionZones = [];
  {
    if("A3E_ExclusionZone" in _x && _x != "A3E_ExclusionZone_") then {
      A3E_ExclusionZones pushback _x;
	  if(!A3E_Debug) then {_x setMarkerAlpha 0;};
    };
  } foreach allMapMarkers;
};

// Choose a start position
if(isNil("A3E_ClearedPositionDistance")) then {
	A3E_ClearedPositionDistance = 500;
};

A3E_StartPos = [] call a3e_fnc_findFlatArea;
while {{A3E_StartPos inArea _x} count A3E_ExclusionZones > 0} do {
	A3E_StartPos = [] call a3e_fnc_findFlatArea;
};
publicVariable "A3E_StartPos";


A3E_Var_ClearedPositions = [];
A3E_Var_ClearedPositions pushBack A3E_StartPos;
A3E_Var_ClearedPositions pushBack (getMarkerPos "drn_insurgentAirfieldMarker");

private _backpack = [] call A3E_fnc_createStartpos;

//### The following is a mission function now

//Wait for players to actually arrive ingame. This may be a long time if server is set to persistent
waituntil{uisleep 1; count([] call A3E_FNC_GetPlayers)>0};

_playerGroup = [] call A3E_fnc_GetPlayerGroup;

a3e_searchTargets = [2];

private _hasHC = !(a3e_hcArray isEqualTo []);
if (_hasHC) then {
	"waiting for HC ready" call a3e_fnc_rptLog;
	waitUntil {a3e_hcReady isEqualTo []};
	"all HC ready" call a3e_fnc_rptLog;
	a3e_nextHC = 0;
	a3e_searchTargets append a3e_hcArray;
};
private _getExecTarget = if (!_hasHC) then {
	{2} // server
} else {
	{
		private _next = a3e_nextHC;
		a3e_nextHC = a3e_nextHC + 1;
		if (a3e_nextHC >= count a3e_hcArray) then {
			a3e_nextHC = 0;
		};
		a3e_hcArray select _next
	}
};

[[_enemyMinSkill, _enemyMaxSkill, _enemyFrequency, A3E_Debug], "Scripts\Escape\EscapeSurprises.sqf"] remoteExec ["execVM", call _getExecTarget];


// Initialize communication centers

call compile preprocessFileLineNumbers ("Island\CommunicationCenterMarkers.sqf");
[] call A3E_fnc_createComCenters;

_EnemyCount = [3] call A3E_fnc_GetEnemyCount;

[_playerGroup, "drn_CommunicationCenterPatrolMarker", A3E_VAR_Side_Opfor, "INS", 4, _EnemyCount select 0, _EnemyCount select 1, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, A3E_Debug] call drn_fnc_InitGuardedLocations;
[_playerGroup, a3e_var_Escape_communicationCenterPositions, _enemySpawnDistance, _enemyFrequency] call drn_fnc_Escape_InitializeComCenArmor;

// Initialize Motor Pools
[] call A3E_fnc_createMotorPools;


// Initialize ammo depots

[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _playerGroup, _enemyFrequency] spawn {
	params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_playerGroup", "_enemyFrequency"];
	private ["_playerGroup", "_minEnemies", "_maxEnemies", "_bannedPositions"];

	private _EnemyCount = [2] call A3E_fnc_GetEnemyCount;
	_EnemyCount params ["_minEnemies", "_maxEnemies"];

	_bannedPositions = + a3e_var_Escape_communicationCenterPositions + [A3E_StartPos, getMarkerPos "drn_insurgentAirfieldMarker"];
	a3e_var_Escape_ammoDepotPositions = _bannedPositions call drn_fnc_Escape_FindAmmoDepotPositions;

	[] call A3E_fnc_createAmmoDepots;

	[_playerGroup, "drn_AmmoDepotPatrolMarker", A3E_VAR_Side_Opfor , "INS", 3, _minEnemies, _maxEnemies, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, A3E_Debug] call drn_fnc_InitGuardedLocations;
};


// Initialize search leader
//[drn_searchAreaMarkerName, A3E_Debug] execVM "Scripts\Escape\SearchLeader.sqf"; //depreciated
[] call A3E_fnc_SearchleaderInit;

//Start the player detection script
[] call A3E_fnc_PlayerDetection;

// Start garbage collector
[_playerGroup, 750, A3E_Debug] spawn drn_fnc_CL_RunGarbageCollector;

// Ivory Cars
// Cars Array erweitern
a3e_arr_ivory_cars = ["ivory_190e", "ivory_190e", "ivory_190e_taxi", "ivory_911", "ivory_911", "ivory_c", "ivory_c", "ivory_c_president", "ivory_ccx", "ivory_ccx", "ivory_challenger", "ivory_challenger", "ivory_challenger_marked", "ivory_challenger_marked", "ivory_challenger_marked_classic", "ivory_challenger_unmarked", "ivory_challenger_unmarked", "ivory_challenger_slicktop", "ivory_challenger_slicktop", "ivory_challenger_slicktop_classic", "ivory_charger", "ivory_charger", "ivory_charger_marked", "ivory_charger_marked", "ivory_charger_marked_classic", "ivory_charger_unmarked", "ivory_charger_unmarked", "ivory_charger_slicktop", "ivory_charger_slicktop", "ivory_charger_slicktop_classic", "ivory_cv", "ivory_cv", "ivory_cv_marked", "ivory_cv_marked", "ivory_cv_marked_classic", "ivory_cv_unmarked", "ivory_cv_unmarked", "ivory_cv_slicktop", "ivory_cv_slicktop", "ivory_cv_slicktop_classic", "ivory_cv_taxi", "ivory_cv_unmarked_taxi", "ivory_e36", "ivory_e36", "ivory_elise", "ivory_elise", "ivory_evox", "ivory_evox", "ivory_evox_marked", "ivory_evox_marked", "ivory_evox_marked_classic", "ivory_evox_unmarked", "ivory_evox_unmarked", "ivory_evox_slicktop", "ivory_evox_slicktop", "ivory_evox_slicktop_classic", "ivory_f1", "ivory_f1", "ivory_gt500", "ivory_gt500", "ivory_gti", "ivory_gti", "ivory_isf", "ivory_isf", "ivory_isf_marked", "ivory_isf_marked", "ivory_isf_marked_classic", "ivory_isf_unmarked", "ivory_isf_unmarked", "ivory_isf_slicktop", "ivory_isf_slicktop", "ivory_isf_slicktop_classic", "ivory_lfa", "ivory_lfa", "ivory_lp560", "ivory_lp560", "ivory_m3", "ivory_m3", "ivory_m3_marked", "ivory_m3_marked", "ivory_m3_marked_classic", "ivory_m3_unmarked", "ivory_m3_unmarked", "ivory_m3_slicktop", "ivory_m3_slicktop", "ivory_m3_slicktop_classic", "ivory_mp4", "ivory_mp4", "ivory_prius", "ivory_prius", "ivory_prius_marked", "ivory_prius_marked", "ivory_prius_marked_classic", "ivory_prius_unmarked", "ivory_prius_unmarked", "ivory_prius_slicktop", "ivory_prius_slicktop", "ivory_prius_slicktop_classic", "ivory_prius_taxi", "ivory_r34", "ivory_r34", "ivory_r8", "ivory_r8", "ivory_r8_spyder", "ivory_rev", "ivory_rev", "ivory_rev_marked", "ivory_rev_marked", "ivory_rev_marked_classic", "ivory_rev_unmarked", "ivory_rev_unmarked", "ivory_rev_slicktop", "ivory_rev_slicktop", "ivory_rev_slicktop_classic", "ivory_rs4", "ivory_rs4", "ivory_rs4_taxi", "ivory_rs4_marked", "ivory_rs4_marked", "ivory_rs4_marked_classic", "ivory_rs4_unmarked", "ivory_rs4_unmarked", "ivory_rs4_slicktop", "ivory_rs4_slicktop", "ivory_rs4_slicktop_classic", "ivory_suburban", "ivory_suburban", "ivory_suburban_marked", "ivory_suburban_marked", "ivory_suburban_marked_classic", "ivory_suburban_unmarked", "ivory_suburban_unmarked", "ivory_suburban_slicktop", "ivory_suburban_slicktop", "ivory_suburban_slicktop_classic", "ivory_suburban_ems", "ivory_suburban_ems_slicktop", "ivory_supra", "ivory_supra", "ivory_supra_topsecret", "ivory_taurus", "ivory_taurus", "ivory_taurus_marked", "ivory_taurus_marked", "ivory_taurus_marked_classic", "ivory_taurus_unmarked", "ivory_taurus_unmarked", "ivory_taurus_slicktop", "ivory_taurus_slicktop", "ivory_taurus_slicktop_classic", "ivory_veyron", "ivory_veyron", "ivory_wrx", "ivory_wrx", "ivory_wrx_marked", "ivory_wrx_marked", "ivory_wrx_marked_classic", "ivory_wrx_unmarked", "ivory_wrx_unmarked", "ivory_wrx_slicktop", "ivory_wrx_slicktop", "ivory_wrx_slicktop_classic"];
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses append a3e_arr_ivory_cars;


remoteExec ["A3E_fnc_initVillages", call _getExecTarget];
[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _enemyFrequency] remoteExec ["A3E_fnc_prepareAquaticPatrols", call _getExecTarget];
[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _enemyFrequency] remoteExec ["A3E_fnc_initAmbientInfantry", call _getExecTarget];
[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _enemyFrequency] remoteExec ["A3E_fnc_initMilitaryTraffic", call _getExecTarget];
[_enemySpawnDistance, _enemyFrequency] remoteExec ["A3E_fnc_initCivilianTraffic", call _getExecTarget];
[_enemySpawnDistance, _enemyFrequency] remoteExec ["A3E_fnc_initRoadBlocks", call _getExecTarget];

[_enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, _playerGroup] spawn {
	params ["_enemyMinSkill", "_enemyMaxSkill", "_enemySpawnDistance", "_playerGroup"];

	//Spawn crashsites

	private _crashSiteCount = ceil(random(missionNamespace getvariable["CrashSiteCountMax",3]));
	for "_i" from 1 to _crashSiteCount step 1 do {
		private _pos = [] call A3E_fnc_findFlatArea;
		[_pos] call A3E_fnc_crashSite;
	};

	private _EnemyCount = [2] call A3E_fnc_GetEnemyCount;

	//Spawn mortar sites
	[] call A3E_fnc_createMortarSites;
	[_playergroup, "A3E_MortarSitePatrolMarker", A3E_VAR_Side_Opfor, "INS", 2, _EnemyCount select 0, _EnemyCount select 1, _enemyMinSkill, _enemyMaxSkill, _enemySpawnDistance, A3E_Debug] call drn_fnc_InitGuardedLocations;
};

//Start local and remote statistic tracking
[] spawn {
	sleep 1;
	[] call A3E_fnc_startStatistics;
};

// Create search chopper

[
	[
		getMarkerPos "drn_searchChopperStartPosMarker",
		A3E_VAR_Side_Opfor,
		drn_searchAreaMarkerName,
		_searchChopperSearchTimeMin,
		_searchChopperRefuelTimeMin,
		_enemyMinSkill,
		_enemyMaxSkill,
		[],
		A3E_Debug
	],
	"Scripts\Escape\CreateSearchChopper.sqf"
] remoteExec ["execVM", call _getExecTarget];

// Spawn creation of start position settings
[A3E_StartPos, _backPack, _enemyFrequency] spawn {
	params ["_startPos", "_backPack", "_enemyFrequency"];
    private ["_guardGroup", "_marker", "_guardCount", "_guardGroups", "_unit", "_createNewGroup"];


    // Spawn guard
	_guardCount = [-1,-1,3,8] call a3e_fnc_getDynamicSquadSize;
	private _i = 0;
	for [{_i = 0}, {_i < (_guardCount)}, {_i = _i + 1}] do {
		private _weapon = a3e_arr_PrisonBackpackWeapons select floor(random(count(a3e_arr_PrisonBackpackWeapons)));
		_backpack addWeaponCargoGlobal[(_weapon select 0),1];
		_backpack addMagazineCargoGlobal[(_weapon select 1),3];
	};

    // Spawn more guards
    _marker = createMarkerLocal ["drn_guardAreaMarker", _startPos];
    _marker setMarkerAlphaLocal 0;
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerSizeLocal [50, 50];

    //_guardCount = (2 + (_enemyFrequency)) + floor (random 2);

    _guardGroups = [];
    _createNewGroup = true;

    for [{_i = 0}, {_i < _guardCount}, {_i = _i + 1}] do {
        private ["_pos"];

        _pos = [_marker] call drn_fnc_CL_GetRandomMarkerPos;
        while {_pos distance _startPos < 10} do {
            _pos = [_marker] call drn_fnc_CL_GetRandomMarkerPos;
        };

        if (_createNewGroup) then {
            _guardGroup = createGroup A3E_VAR_Side_Ind;
            _guardGroups set [count _guardGroups, _guardGroup];
            _createNewGroup = false;
        };

        //(a3e_arr_Escape_StartPositionGuardTypes select floor (random count a3e_arr_Escape_StartPositionGuardTypes)) createUnit [_pos, _guardGroup, "", (0.5), "CAPTAIN"];
        _guardGroup createUnit [(a3e_arr_Escape_StartPositionGuardTypes select floor (random count a3e_arr_Escape_StartPositionGuardTypes)), _pos, [], 0, "FORM"];

        if (count units _guardGroup >= 2) then {
            _createNewGroup = true;
        };
    };

    {
        _guardGroup = _x;

        _guardGroup setFormDir floor (random 360);

        {
            _unit = _x; //(units _guardGroup) select 0;
            _unit setUnitRank "CAPTAIN";
			_unit unlinkItem "ItemMap";
            _unit unlinkItem "ItemCompass";
            _unit unlinkItem "ItemGPS";
			if (ACE_MedicalServer) then {_unit addItem "ACE_epinephrine"};//Add Epinephrine for each unit
			removeBackpackGlobal _unit;

			if(random 100 < 80) then {
				removeAllPrimaryWeaponItems _unit;

			};

			private _hmd = hmd _unit;
			if (_hmd isEqualTo "") then {
				private _cfgWeapons = configFile >> "CfgWeapons";
				{
					if (616 == getNumber (_cfgWeapons >> _x >> "ItemInfo" >> "type")) exitWith {
						_hmd = _x;
					};
				} forEach items _unit;
			};
			if (!(_hmd isEqualTo "") && {random 100 > 20 || {A3E_Param_NoNightvision == 1}}) then {
				_unit unlinkItem _hmd;
				_unit removeItem _hmd;
			};

            //_unit setSkill a3e_var_Escape_enemyMinSkill;
			//[_unit, a3e_var_Escape_enemyMinSkill] call EGG_EVO_skill;

			//This should remove all types of handgrenades (for example RHS)
            _unit removeMagazines "Handgrenade";

            _unit setVehicleAmmo 0.3 + random 0.7;

        } foreach units _guardGroup;

        [_guardGroup, _marker] spawn A3E_fnc_Patrol;

    } foreach _guardGroups;

	//Add an alert trigger to the prison
	A3E_fnc_revealPlayers = {
		private _guardGroup = _this;
		{
			_guardGroup reveal [_x,1.5];
		} foreach call A3E_fnc_GetPlayers;
	};
	A3E_fnc_soundAlarm = {
		params ["_guardGroups"];
		if(isNil("A3E_SoundPrisonAlarm")) then {
			A3E_SoundPrisonAlarm = true;
			publicvariable "A3E_SoundPrisonAlarm";
			{
				_x spawn A3E_fnc_revealPlayers;
			} foreach _guardGroups;
			sleep 30;
			A3E_SoundPrisonAlarm = false;
			publicvariable "A3E_SoundPrisonAlarm";
		};
	};
    // Start thread that waits for escape to start
    [_guardGroups] spawn {
        params ["_guardGroups"];

        sleep 5;

        while {isNil("A3E_EscapeHasStarted")} do {
			sleep 1;
            // If any member of the group is to far away from fence, then escape has started
            {
				if(_x getvariable ["A3E_PlayerInitializedServer",false]) then {
					if ((_x distance A3E_StartPos) > 15 && (_x distance A3E_StartPos) < 100) exitWith {
						A3E_EscapeHasStarted = true;
						publicVariable "A3E_EscapeHasStarted";
					};
					// If any player have picked up a weapon, escape has started
					if (count weapons _x > 0) exitWith {
						A3E_EscapeHasStarted = true;
						publicVariable "A3E_EscapeHasStarted";
					};
				};
            } foreach call A3E_FNC_GetPlayers;
        };

        // ESCAPE HAS STARTED
        //{
		//	[[[_x], {(_this select 0) setCaptive false;}], "BIS_fnc_spawn", _x, false] call BIS_fnc_MP;
		//} foreach call A3E_fnc_GetPlayers;
	   diag_log "Server: Escape has started.";
    };
	//Spawn alarm watchdog
	[_guardGroups] spawn {
		params ["_guardGroups"];
		while{isNil("A3E_SoundPrisonAlarm")} do {
			if(!isNil("A3E_EscapeHasStarted")) then {
				{
					private ["_guardGroup"];
					_guardGroup = _x;
					{
						if((_guardGroup knowsAbout _x)>2.5) exitwith {
							[_guardGroups] call A3E_fnc_soundAlarm;
						};
					} foreach call A3E_fnc_GetPlayers;
				} foreach _guardGroups;
			};
			if(!isNil("A3E_PrisonGateObject")) then {
				if((A3E_PrisonGateObject animationPhase "Door_1_rot") > 0.5 ||
				(A3E_PrisonGateObject animationPhase "Door_2_rot") > 0.5) then {
					if(isNil("A3E_EscapeHasStarted")) then {
						A3E_EscapeHasStarted = true;
						publicVariable "A3E_EscapeHasStarted";
					};
					[_guardGroups] call A3E_fnc_soundAlarm;
				};
			};
			sleep 0.5;
		};
	};

	//Watch for captive state
	[] spawn {
		while{isNil("A3E_EscapeHasStarted")} do {
			{
				if(isNil("A3E_EscapeHasStarted") && !(captive _x)) then {
					[_x, true] remoteExec ["setCaptive", _x, false];
				};
			} foreach call A3E_fnc_GetPlayers;
			sleep 0.5;
		};
		{
			[_x, false] remoteExec ["setCaptive", _x, false];
		} foreach call A3E_fnc_GetPlayers;
	};
};

// Eigene Funktionen
[] call rebru_fnc_initServer;
[] call ACP_fnc_initServer;
