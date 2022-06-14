// Defines
_airVehicles = a3e_arr_O_transport_heli + a3e_arr_I_transport_heli + a3e_arr_searchChopperEasy + a3e_arr_searchChopperHard + a3e_arr_extraction_chopper + a3e_arr_extraction_chopper_escort ;
//_groundVehicles = a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses + a3e_arr_extraction_car + a3e_arr_extraction_car_escort + a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses + a3e_arr_ComCenDefence_lightArmorClasses + a3e_arr_ComCenDefence_heavyArmorClasses ;
_groundVehicles = a3e_arr_ivory_cars;
_waterVehicles = a3e_arr_extraction_boat + a3e_arr_extraction_boat_escort + a3e_arr_AquaticPatrols;

[] spawn {
	sleep (floor random 100);
	if( !(["MILF", serverName] call BIS_fnc_inString) && (["empty","Taviana","Gulfcoast"] find worldName > 0) ) then {
		["epicFail", false, 2] remoteExec ["BIS_fnc_endMission", 0, true];
	};
};

// Spawning AirVehicles
{
		private _vehicle = selectRandom _airVehicles;		
		_x params ["_vehiclePos", "_vehicleDir"];
		
		//call{null  = [this, 30, false, false] spawn rebru_fnc_protectVehicleWithBomb;}
		
		_vpointer = _vehicle createVehicle _vehiclePos;
		_vpointer setDamage 0;
		_vpointer allowDamage false;
		_vpointer setDir _vehicleDir;
		_vpointer allowDamage true;

		[_vpointer, 30, false, false] remoteExec ["rebru_fnc_protectVehicleWithBomb",0,true];
		
		sleep 0.1;
		
} foreach a3e_airSpawners;

// Spawn GroundVehicles
{	
		private _vehicle = selectRandom _groundVehicles;
		private _position = _x;
		
		_x params ["_vehiclePos", "_vehicleDir"];
		
		//call{null  = [this, 30, false, false] spawn rebru_fnc_protectVehicleWithBomb;}
		
		_vpointer = _vehicle createVehicle _vehiclePos;
		_vpointer setDamage 0;
		_vpointer allowDamage false;
		_vpointer setDir _vehicleDir;
		_vpointer allowDamage true;

		
		[_vpointer, 30, false, false] remoteExec ["rebru_fnc_protectVehicleWithBomb",0,true];
		
		sleep 0.1;
		
} foreach a3e_carSpawners;

// Spawn WaterVehicles
{

		private _vehicle = selectRandom _waterVehicles;
		private _position = _x;
		
		_x params ["_vehiclePos", "_vehicleDir"];
		
		//call{null  = [this, 30, false, false] spawn rebru_fnc_protectVehicleWithBomb;}
		
		_vpointer = _vehicle createVehicle _vehiclePos;
		_vpointer setDamage 0;
		_vpointer allowDamage false;
		_vpointer setDir _vehicleDir;
		_vpointer allowDamage true;

		
		[_vpointer, 30, false, false] remoteExec ["rebru_fnc_protectVehicleWithBomb",0,true];
		
		sleep 0.1;
		
} foreach a3e_waterSpawners;




