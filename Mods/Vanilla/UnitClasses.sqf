/*
 * Description: This file contains vheicle types and unit types for most units spawned in the mission.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 *
 * Except for the classes specified in this file, classes are specified in the following files: CreateSearchChopper.sqf, EscapeSurprises (RUSSIANSEARCHCHOPPER) 
 * and RunExtraction.sqf, all in folder Scripts\Escape\.
 */


private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

// Random array. Start position guard types around the prison
a3e_arr_Escape_StartPositionGuardTypes = ["I_Soldier_AR_F", "I_Soldier_GL_F", "I_Soldier_F", "I_Soldier_lite_F"];

// Weapons inside the backpack (and corresponding magazine type).
a3e_arr_PrisonBackpackWeapons = [];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["hgun_ACPC2_F","9Rnd_45ACP_Mag"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["hgun_Rook40_F","16Rnd_9x21_Mag"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["hgun_PDW2000_F","30Rnd_9x21_Mag"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["hgun_P07_F","16Rnd_9x21_Mag"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["hgun_P07_snds_F","30Rnd_9x21_Mag"]];
a3e_arr_PrisonBackpackWeapons set [count(a3e_arr_PrisonBackpackWeapons),["hgun_Rook40_snds_F","30Rnd_9x21_Mag"]];

// Random array. Civilian vehicle classes for ambient traffic. (Can also be set to a faction name).
a3e_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];

// Random arrays. Enemy vehicle classes for ambient traffic. (Can also be set to a faction name).
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_hmg_F", "O_MRAP_02_hmg_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_cannon_F", "O_MBT_02_arty_F", "O_MBT_02_cannon_F","O_Truck_03_device_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_repair_F"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["I_G_Offroad_01_repair_F","I_MRAP_03_F", "I_MRAP_03_F_hmg_F", "I_MRAP_03_F", "I_MRAP_03_F_hmg_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F","I_G_Offroad_01_F","I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F"];
    };
    case 2: {
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_F", "O_MRAP_02_hmg_F", "O_MRAP_02_hmg_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_cannon_F", "O_MBT_02_arty_F", "O_MBT_02_cannon_F","O_Truck_03_device_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_repair_F"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["I_G_Offroad_01_repair_F","I_MRAP_03_F", "I_MRAP_03_F_hmg_F", "I_MRAP_03_F", "I_MRAP_03_F_hmg_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F","I_G_Offroad_01_F","I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F"];
    };
    default {
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = ["O_MRAP_02_F", "O_MRAP_02_hmg_F", "O_MRAP_02_F", "O_MRAP_02_hmg_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Truck_02_covered_F", "O_Truck_02_transport_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_cannon_F", "O_MBT_02_arty_F", "O_MBT_02_cannon_F","O_Truck_03_device_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_repair_F"];
        a3e_arr_Escape_MilitaryTraffic_EnemyVehicleClasses_IND = ["I_G_Offroad_01_repair_F","I_MRAP_03_F", "I_MRAP_03_F_hmg_F", "I_MRAP_03_F", "I_MRAP_03_F_hmg_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_armed_F","I_G_Offroad_01_F","I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_tracked_03_cannon_F"];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, etc. (for ammo depot guards and communication center guards see further down in this file at fn_InitGuardedLocations)
a3e_arr_Escape_InfantryTypes =      ["O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AA_F", "O_Soldier_AR_F", "O_Soldier_AT_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_LAT_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F", "O_officer_F", "O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AR_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_LAT_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F", "O_officer_F", "O_engineer_F", "O_medic_F", "O_Soldier_A_F", "O_Soldier_AR_F", "O_Soldier_exp_F", "O_soldier_F", "O_Soldier_GL_F", "O_Soldier_lite_F", "O_Soldier_M_F", "O_Soldier_repair_F","O_soldier_UAV_F","O_soldier_UAV_F","O_Soldier_AAR_F", "O_support_AMG_F", "O_support_AMort_F", "O_Soldier_AAA_F", "O_Soldier_AAT_F", "O_support_GMG_F", "O_support_MG_F", "O_support_Mort_F"];
a3e_arr_Escape_InfantryTypes_Ind =  ["I_engineer_F", "I_medic_F", "I_medic_F", "I_medic_F", "I_Soldier_A_F", "I_Soldier_AA_F", "I_Soldier_AR_F", "I_Soldier_AT_F", "I_Soldier_exp_F", "I_soldier_F", "I_Soldier_GL_F", "I_Soldier_LAT_F", "I_Soldier_lite_F", "I_Soldier_M_F", "I_Soldier_repair_F", "I_officer_F", "I_engineer_F", "I_medic_F", "I_Soldier_A_F", "I_Soldier_AR_F", "I_Soldier_exp_F", "I_soldier_F", "I_Soldier_GL_F", "I_Soldier_LAT_F", "I_Soldier_lite_F", "I_Soldier_M_F", "I_Soldier_repair_F", "I_officer_F", "I_engineer_F", "I_medic_F", "I_Soldier_A_F", "I_Soldier_AR_F", "I_Soldier_exp_F", "I_soldier_F", "I_Soldier_GL_F", "I_Soldier_lite_F", "I_Soldier_M_F", "I_Soldier_repair_F","I_soldier_UAV_F","I_soldier_UAV_F","I_Soldier_AAR_F", "I_support_AMG_F", "I_support_AMort_F", "I_Soldier_AAA_F", "I_Soldier_AAT_F", "I_support_GMG_F", "I_support_MG_F", "I_support_Mort_F"];
a3e_arr_recon_InfantryTypes = ["O_recon_exp_F", "O_recon_JTAC_F", "O_recon_M_F", "O_recon_medic_F", "O_recon_F", "O_recon_LAT_F", "O_recon_TL_F"];
a3e_arr_recon_I_InfantryTypes = ["O_recon_exp_F", "O_recon_JTAC_F", "O_recon_M_F", "O_recon_medic_F", "O_recon_F", "O_recon_LAT_F", "O_recon_TL_F"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
a3e_arr_Escape_RoadBlock_MannedVehicleTypes = ["O_MRAP_02_hmg_F", "O_HMG_01_high_F", "O_static_AT_F"];
a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind = ["I_G_Offroad_01_armed_F", "I_MRAP_03_F_hmg_F", "I_HMG_01_hight_f", "I_static_AT_F","I_G_Offroad_01_F"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
a3e_arr_Escape_ReinforcementTruck_vehicleClasses = ["O_Truck_02_covered_F", "O_Truck_02_transport_F","O_Truck_03_transport_F","O_Truck_03_covered_F"];
a3e_arr_Escape_ReinforcementTruck_vehicleClasses_Ind = ["I_Truck_02_transport_F", "I_Truck_02_covered"];
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array a3e_arr_Escape_ReinforcementTruck_vehicleClasses above.
a3e_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo = [16, 16, 16, 16];


// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses = ["O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_F"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array a3e_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
a3e_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [8, 8, 8];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_lightArmorClasses = ["O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_APC_Wheeled_02_rcws_F", "O_APC_Tracked_02_AA_F","O_Truck_03_device_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_repair_F"];
// Random array. Heavy armored vehicles guarding the communication centers.
a3e_arr_ComCenDefence_heavyArmorClasses = ["O_MBT_02_cannon_F", "O_APC_Tracked_02_cannon_F"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
a3e_arr_ComCenStaticWeapons = ["O_HMG_01_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
a3e_arr_ComCenParkedVehicles = ["I_G_Offroad_01_repair_F","O_Truck_02_fuel_F", "O_Truck_02_medical_F","O_Truck_02_covered_F", "O_Truck_02_transport_F","O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F", "O_MRAP_02_F", "I_G_Offroad_01_armed_F", "I_MRAP_03_F_hmg_F", "I_MRAP_03_F_gmg_F", "I_G_Offroad_01_F"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
a3e_arr_Escape_EnemyCivilianCarTypes = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Quadbike_01_F", "C_SUV_01_F", "C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
a3e_arr_Escape_AmmoDepot_StaticWeaponClasses = ["O_HMG_01_high_F", "O_GMG_01_high_F", "O_HMG_01_high_F", "O_static_AT_F", "O_static_AA_F"];
// An ammo depot have one parked and empty vehicle of the following possible types.
a3e_arr_Escape_AmmoDepot_ParkedVehicleClasses = ["I_G_Offroad_01_repair_F","O_MRAP_02_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F", "O_Truck_02_covered_F", "O_Truck_02_ammo_F", "O_Truck_02_box_F", "I_G_Offroad_01_armed_F", "I_MRAP_03_F_hmg_F", "I_MRAP_03_F_gmg_F", "I_G_Offroad_01_F","O_Truck_03_device_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_repair_F"];

//Random array. Types of helicopters to spawn
a3e_arr_O_attack_heli = ["O_Heli_Attack_02_F","O_Heli_Attack_02_black_F","O_Heli_Light_02_F"];
a3e_arr_O_transport_heli = ["O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_covered_F"];
a3e_arr_O_pilots = ["O_Pilot_F","O_helicrew_F"];
a3e_arr_I_transport_heli = ["I_Heli_Transport_02_F","I_Heli_light_03_F","I_Heli_light_03_unarmed_F"];
a3e_arr_I_pilots = ["I_helipilot_F","I_helicrew_F"];


// The following arrays define weapons and ammo contained at the ammo depots
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

// Weapons and ammo in the basic weapons box
a3e_arr_AmmoDepotBasicWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["hgun_Rook40_F", 50, 4, 8, ["16Rnd_9x21_Mag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["SMG_02_F", 50, 4, 8, ["30Rnd_9x21_Mag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_Katiba_F", 100, 2, 4, ["30Rnd_65x39_caseless_green"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_Katiba_C_F", 50, 2, 4, ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_Katiba_GL_F", 75, 2, 4, ["30Rnd_65x39_caseless_green", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_Mk20_F", 50, 2, 4, ["30Rnd_556x45_Stanag", "", "", ""], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_Mk20_GL_F", 50, 2, 4, ["30Rnd_556x45_Stanag", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 4]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_Mk20C_F", 50, 2, 4, ["30Rnd_556x45_Stanag"], 6]];
// non-CSAT weapons
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["hgun_P07_F", 10, 4, 8, ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["hgun_PDW2000_F", 20, 4, 8, ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["hgun_Pistol_heavy_02_F", 10, 4, 8, ["6Rnd_45ACP_Cylinder"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["hgun_ACPC2_F", 20, 4, 8, ["9Rnd_45ACP_Mag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["SMG_01_F", 10, 4, 8, ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green"], 6]];
//a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_MX_F", 100, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
//a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_MX_GL_F", 100, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "3Rnd_HE_Grenade_shell", "3Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F", "3Rnd_UGL_FlareWhite_F"], 6]];
//a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_MX_SW_F", 100, 2, 4, ["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
//a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_MXC_F", 100, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
//a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_MXM_F", 100, 2, 4, ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_SDAR_F", 10, 2, 4, ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_TRG20_F", 10, 2, 4, ["30Rnd_556x45_Stanag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_TRG21_F", 10, 2, 4, ["30Rnd_556x45_Stanag"], 6]];
a3e_arr_AmmoDepotBasicWeapons set [count a3e_arr_AmmoDepotBasicWeapons, ["arifle_TRG21_GL_F", 10, 2, 4, ["30Rnd_556x45_Stanag", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], 6]];


// Weapons and ammo in the special weapons box
a3e_arr_AmmoDepotSpecialWeapons = [];
// CSAT weapons
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["srifle_DMR_01_F", 10, 2, 4, ["10Rnd_762x51_Mag"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["srifle_EBR_F", 10, 2, 4, ["20Rnd_762x51_Mag"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["srifle_GM6_F", 10, 2, 4, ["5Rnd_127x108_Mag"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["LMG_Zafir_F", 50, 2, 4, ["150Rnd_762x51_Box", "150Rnd_762x51_Box_Tracer"], 6]];
// non-CAST weapons
//a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["srifle_LRR_F", 100, 2, 4, ["7Rnd_408_Mag"], 9]];
a3e_arr_AmmoDepotSpecialWeapons set [count a3e_arr_AmmoDepotSpecialWeapons, ["LMG_Mk200_F", 20, 2, 4, ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], 6]];


// Weapons and ammo in the launchers box
a3e_arr_AmmoDepotLaunchers = [];
// CSAT weapons
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_RPG32_F", 50, 3, 5, ["RPG32_F", "RPG32_HE_F"], 6]];
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_O_Titan_F", 50, 1, 1, ["Titan_AA"], 3]];
a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_O_Titan_short_F", 50, 1, 1, ["Titan_AP", "Titan_AT"], 3]];
// non-CSAT weapons
//a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_NLAW_F", 100, 3, 5, ["NLAW_F"], 6]];
//a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_I_Titan_F", 100, 1, 1, ["Titan_AA"], 3]];
//a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_I_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3]];
//a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_B_Titan_F", 100, 1, 1, ["Titan_AA"], 3]];
//a3e_arr_AmmoDepotLaunchers set [count a3e_arr_AmmoDepotLaunchers, ["launch_B_Titan_short_F", 100, 1, 1, ["Titan_AP", "Titan_AT"], 3]];


// Weapons and ammo in the ordnance box
a3e_arr_AmmoDepotOrdnance = [];
// General weapons
a3e_arr_AmmoDepotOrdnance set [count a3e_arr_AmmoDepotOrdnance, [objNull, 30, 1, 1, ["DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag", "ClaymoreDirectionalMine_Remote_Mag", "APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "ATMine_Range_Mag", "APERSTripMine_Wire_Mag", "SLAMDirectionalMine_Wire_Mag", "Laserbatteries"], 5]];


// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
a3e_arr_AmmoDepotVehicle = [];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["HandGrenade", "MiniGrenade", "HandGrenade_Stone"], 50]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["SmokeShell", "SmokeShellYellow", "SmokeShellRed", "SmokeShellGreen", "SmokeShellPurple", "SmokeShellBlue", "SmokeShellOrange"], 50]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["Chemlight_blue", "Chemlight_green", "Chemlight_red", "Chemlight_yellow"], 50]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["1Rnd_Smoke_Grenade_shell", "1Rnd_SmokeBlue_Grenade_shell", "1Rnd_SmokeGreen_Grenade_shell", "1Rnd_SmokeOrange_Grenade_shell", "1Rnd_SmokePurple_Grenade_shell", "1Rnd_SmokeRed_Grenade_shell", "1Rnd_SmokeYellow_Grenade_shell"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["3Rnd_Smoke_Grenade_shell", "3Rnd_SmokeBlue_Grenade_shell", "3Rnd_SmokeGreen_Grenade_shell", "3Rnd_SmokeOrange_Grenade_shell", "3Rnd_SmokePurple_Grenade_shell", "3Rnd_SmokeRed_Grenade_shell", "3Rnd_SmokeYellow_Grenade_shell"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["FlareWhite_F", "FlareGreen_F", "FlareRed_F", "FlareYellow_F"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["UGL_FlareWhite_F", "UGL_FlareGreen_F", "UGL_FlareRed_F", "UGL_FlareYellow_F", "UGL_FlareCIR_F"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["3Rnd_UGL_FlareWhite_F", "3Rnd_UGL_FlareGreen_F", "3Rnd_UGL_FlareRed_F", "3Rnd_UGL_FlareYellow_F", "3Rnd_UGL_FlareCIR_F"], 25]];
a3e_arr_AmmoDepotVehicle set [count a3e_arr_AmmoDepotVehicle, [objNull, 50, 1, 1, ["1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell"], 25]];
a3e_arr_AmmoDepotVehicleItems = [];
a3e_arr_AmmoDepotVehicleItems set [count a3e_arr_AmmoDepotVehicleItems, ["ToolKit", 20, 1, 1, [], 0]];
a3e_arr_AmmoDepotVehicleItems set [count a3e_arr_AmmoDepotVehicleItems, ["Medikit", 20, 1, 1, [], 0]];
a3e_arr_AmmoDepotVehicleItems set [count a3e_arr_AmmoDepotVehicleItems, ["FirstAidKit", 100, 10, 50, [], 0]];
a3e_arr_AmmoDepotVehicleBackpacks = ["O_UAV_01_backpack_F"];
// Items

// Index 0: Item classname.
// Index 1: Item's probability of presence (in percent, 0-100)..
// Index 2: Minimum amount.
// Index 3: Maximum amount.

a3e_arr_AmmoDepotItems = [];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["Laserdesignator", 10, 1, 2]];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["NVGoggles", 10, 1, 3]];
};
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["Binocular", 50, 2, 3, [], 0]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["Rangefinder", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemCompass", 50, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemGPS", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemMap", 50, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemRadio", 50, 1, 10]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["ItemWatch", 50, 1, 10]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["acc_flashlight", 50, 1, 5]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["acc_pointer_IR", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["muzzle_snds_acp", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["muzzle_snds_B", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["muzzle_snds_H", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["muzzle_snds_H_MG", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["muzzle_snds_L", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["muzzle_snds_M", 10, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Aco", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Aco_smg", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_ACO_grn", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_ACO_grn_smg", 20, 1, 3]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Arco", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Hamr", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Holosight", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Holosight_smg", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_MRCO", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_NVS", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_SOS", 10, 1, 2]];
if(Param_NoNightvision==0) then {
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_tws", 10, 1, 1]];
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_tws_mg", 10, 1, 1]];
	a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Nightstalker", 10, 1, 1]];
};
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["O_UavTerminal", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_DMS", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_Yorris", 10, 1, 2]];
a3e_arr_AmmoDepotItems set [count a3e_arr_AmmoDepotItems, ["optic_LRPS", 10, 1, 2]];

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.

a3e_arr_CivilianCarWeapons = [];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["hgun_P07_F", "16Rnd_9x21_Mag", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["hgun_P07_snds_F", "30Rnd_9x21_Mag", 11]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["hgun_Rook40_snds_F", "30Rnd_9x21_Mag", 9]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["hgun_ACPC2_F", "9Rnd_45ACP_Mag", 12]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["arifle_MXM_Hamr_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 8]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["arifle_MX_Hamr_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 6]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["arifle_MXM_SOS_pointer_F", "30Rnd_65x39_caseless_mag_Tracer", 7]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["arifle_Katiba_C_F", "30Rnd_65x39_caseless_green", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["arifle_Mk20_GL_ACO_F", "UGL_FlareWhite_F", 8]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["SMG_01_Holo_F", "30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["SMG_02_ACO_F", "30Rnd_9x21_Mag", 12]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["launch_RPG32_F", "RPG32_F", 2]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["MineDetector", objNull, 0]];
//a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["Medikit", objNull, 0]];
//a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["Toolkit", objNull, 0]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, ["Binocular", objNull, 0]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, [objNull, "SatchelCharge_Remote_Mag", 2]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, [objNull, "HandGrenade", 5]];
a3e_arr_CivilianCarWeapons set [count a3e_arr_CivilianCarWeapons, [objNull, "SmokeShell", 5]];


// Here is a list of scopes, might get randomly added to enemy patrols:
a3e_arr_Scopes = ["optic_Aco","optic_ACO_grn","optic_Arco","optic_Hamr","optic_MRCO","optic_Holosight"];
a3e_arr_Scopes_SMG = ["optic_Aco_smg","optic_Holosight_smg"];
a3e_arr_NightScopes = ["optic_NVS"];
a3e_arr_TWSScopes = ["optic_Nightstalker","optic_tws","optic_tws_mg"];


//format ["name", [ammunition], [suppressors], [optics]]
//[optics] doesn't contain everything that be attatched to the weapon, just the one's I thought sort of made sense given who might carry them.
//weapon arrays
//not used?
a3e_arr_CSAT_Primary_Weapons = [];
a3e_arr_CSAT_Primary_Weapons set [0, ["arifle_Katiba_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["muzzle_snds_H"], ["optic_Aco", "optic_Hamr"]]];
a3e_arr_CSAT_Primary_Weapons set [1, ["arifle_Katiba_C_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["muzzle_snds_H"], ["optic_Aco", "optic_Hamr"]]];
a3e_arr_CSAT_Primary_Weapons set [2, ["arifle_Katiba_GL_F", ["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"], ["muzzle_snds_H"], ["optic_Aco", "optic_Hamr"]]];
a3e_arr_CSAT_Primary_Weapons set [3, ["LMG_Zafir_F", ["150Rnd_762x51_Box", "150Rnd_762x51_Box_Tracer"], [], ["optic_Hamr"]]];
a3e_arr_CSAT_Primary_Weapons set [4, ["SMG_01_F", ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_tracer_green"], ["muzzle_snds_acp"], ["optic_Aco_smg"]]];
a3e_arr_CSAT_Primary_Weapons set [5, ["srifle_EBR_F", ["20Rnd_762x51_Mag"], ["muzzle_snds_B"], ["optic_Hamr", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3e_arr_CSAT_Primary_Weapons set [6, ["srifle_GM6_F", ["5Rnd_127x108_Mag"], [], ["optic_Hamr", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3e_arr_CSAT_Secondary_Weapons = [];
a3e_arr_CSAT_Secondary_Weapons set [0, ["hgun_Rook40_F", ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], ["muzzle_snds_L"], []]];
a3e_arr_CSAT_Launchers = [];
a3e_arr_CSAT_Launchers set [0, ["launch_O_Titan_F", ["Titan_AA"]]];
a3e_arr_CSAT_Launchers set [1, ["launch_O_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3e_arr_CSAT_Launchers set [2, ["launch_RPG32_F", ["RPG32_F", "RPG32_HE_F"]]];
a3e_arr_AAF_Primary_Weapons = [];
a3e_arr_AAF_Primary_Weapons set [0, ["arifle_Mk20_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3e_arr_AAF_Primary_Weapons set [1, ["arifle_Mk20C_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3e_arr_AAF_Primary_Weapons set [2, ["arifle_Mk20_GL_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3e_arr_AAF_Primary_Weapons set [3, ["arifle_SDAR_F", ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3e_arr_AAF_Primary_Weapons set [4, ["LMG_Mk200_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], ["muzzle_snds_H_MG"], ["optic_Arco"]]];
a3e_arr_AAF_Primary_Weapons set [5, ["srifle_EBR_F", ["20Rnd_762x51_Mag"], ["muzzle_snds_B"], ["optic_Hamr", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3e_arr_AAF_Secondary_Weapons = [];
a3e_arr_AAF_Secondary_Weapons set [0, ["hgun_ACPC2_F", ["9Rnd_45ACP_Mag"], ["muzzle_snds_acp"], []]];
a3e_arr_AAF_Secondary_Weapons set [1, ["hgun_PDW2000_F", ["30Rnd_9x21_Mag", "16Rnd_9x21_Mag"], ["muzzle_snds_L"], []]];
a3e_arr_AAF_Launchers = [];
a3e_arr_AAF_Launchers set [0, ["launch_I_Titan_F", ["Titan_AA"]]];
a3e_arr_AAF_Launchers set [1, ["launch_I_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3e_arr_AAF_Launchers set [2, ["launch_NLAW_F", ["NLAW_F"]]];
a3e_arr_NATO_Primary_Weapons = [];
a3e_arr_NATO_Primary_Weapons set [0, ["arifle_MX_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight"]]];
a3e_arr_NATO_Primary_Weapons set [1, ["arifle_MX_GL_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight"]]];
a3e_arr_NATO_Primary_Weapons set [2, ["arifle_MX_SW_F", ["100Rnd_65x39_caseless_mag_Tracer", "100Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Arco"]]];
a3e_arr_NATO_Primary_Weapons set [3, ["arifle_MXC_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight"]]];
a3e_arr_NATO_Primary_Weapons set [4, ["SMG_01_F", ["30Rnd_45ACP_Mag_SMG_01", "30Rnd_45ACP_Mag_SMG_01_tracer_green"], ["muzzle_snds_acp"],["optic_Holosight_smg"]]];
a3e_arr_NATO_Primary_Weapons set [5, ["arifle_MXM_F", ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"], ["muzzle_snds_H"], ["optic_Holosight", "optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3e_arr_NATO_Primary_Weapons set [6, ["srifle_LRR_F", ["7Rnd_408_Mag"], [], ["optic_Arco", "optic_MRCO", "optic_SOS"]]];
a3e_arr_NATO_Secondary_Weapons = [];
a3e_arr_NATO_Secondary_Weapons set [0, ["hgun_P07_F", ["16Rnd_9x21_Mag", "30Rnd_9x21_Mag"], ["muzzle_snds_L"], []]];
a3e_arr_NATO_Launchers = [];
a3e_arr_NATO_Launchers set [0, ["launch_B_Titan_F", ["Titan_AA"]]];
a3e_arr_NATO_Launchers set [1, ["launch_B_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3e_arr_NATO_Launchers set [2, ["launch_NLAW_F", ["NLAW_F"]]];
a3e_arr_FIA_Primary_Weapons = [];
a3e_arr_FIA_Primary_Weapons set [0, ["arifle_TRG20_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3e_arr_FIA_Primary_Weapons set [1, ["arifle_Mk20_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn"], "optic_Holosight"]];
a3e_arr_FIA_Primary_Weapons set [2, ["arifle_TRG21_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3e_arr_FIA_Primary_Weapons set [3, ["arifle_SDAR_F", ["20Rnd_556x45_UW_mag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3e_arr_FIA_Primary_Weapons set [4, ["arifle_TRG21_GL_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3e_arr_FIA_Primary_Weapons set [5, ["arifle_Mk20_GL_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Red", "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["muzzle_snds_M"], ["optic_ACO_grn", "optic_Holosight"]]];
a3e_arr_FIA_Primary_Weapons set [6, ["LMG_Mk200_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], ["muzzle_snds_H_MG", "optic_Hamr", "optic_Arco"]]];
a3e_arr_FIA_Secondary_Weapons = [];
a3e_arr_FIA_Secondary_Weapons set [0, ["hgun_ACPC2_F", ["9Rnd_45ACP_Mag"], ["muzzle_snds_acp"], []]];
a3e_arr_FIA_Launchers = [];
a3e_arr_FIA_Launchers set [0, ["launch_B_Titan_F", ["Titan_AA"]]];
a3e_arr_FIA_Launchers set [1, ["launch_B_Titan_short_F", ["Titan_AT", "Titan_AP"]]];
a3e_arr_FIA_Launchers set [2, ["launch_NLAW_F", ["NLAW_F"]]];


//////////////////////////////////////////////////////////////////
// RunExtraction.sqf
// Helicopters that come to pick you up
//////////////////////////////////////////////////////////////////
a3e_arr_extraction_chopper = ["B_Heli_Transport_01_F"];
a3e_arr_extraction_chopper_escort = ["B_Heli_Attack_01_F"];

//////////////////////////////////////////////////////////////////
// EscapeSurprises.sqf and CreateSearchDrone.sqf
// Classnames of drones
//////////////////////////////////////////////////////////////////
a3e_arr_searchdrone = ["I_UAV_02_F"];

//////////////////////////////////////////////////////////////////
// CreateSearchChopper.sqf
// first chopper that's called when you escape
// only chopper used right now
//////////////////////////////////////////////////////////////////
a3e_arr_searchChopper = ["I_Heli_light_03_F","O_Heli_Light_02_F"];
a3e_arr_searchChopper_pilot = ["I_helipilot_F"];
a3e_arr_searchChopper_crew = ["I_helicrew_F"];

//////////////////////////////////////////////////////////////////
// fn_AmbientInfantry
// only INS is used
//is this even used?
//////////////////////////////////////////////////////////////////
a3e_arr_AmbientInfantry_Inf_INS = a3e_arr_Escape_InfantryTypes;
a3e_arr_AmbientInfantry_Inf_GUE = a3e_arr_Escape_InfantryTypes_Ind;

//////////////////////////////////////////////////////////////////
// fn_InitGuardedLocations
// Units spawned to guard ammo camps and com centers
// Only INS used
//////////////////////////////////////////////////////////////////
a3e_arr_InitGuardedLocations_Inf_INS = a3e_arr_Escape_InfantryTypes;
a3e_arr_InitGuardedLocations_Inf_GUE = a3e_arr_Escape_InfantryTypes_Ind;

//////////////////////////////////////////////////////////////////
// fn_roadblocks
// units spawned on roadblocks
// Only INS used
// vehicle arrays not used, uses a3e_arr_Escape_RoadBlock_MannedVehicleTypes and a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind instead
//////////////////////////////////////////////////////////////////
a3e_arr_roadblocks_Inf_INS = a3e_arr_Escape_InfantryTypes;
a3e_arr_roadblocks_Inf_GUE = a3e_arr_Escape_InfantryTypes_Ind;

a3e_arr_roadblocks_Veh_INS = a3e_arr_Escape_RoadBlock_MannedVehicleTypes;
a3e_arr_roadblocks_Veh_GUE = a3e_arr_Escape_RoadBlock_MannedVehicleTypes_Ind;

//////////////////////////////////////////////////////////////////
// fn_PopulateAquaticPatrol
// boats that are spawned
//////////////////////////////////////////////////////////////////
a3e_arr_AquaticPatrols = ["O_Boat_Armed_01_hmg_F"];

//////////////////////////////////////////////////////////////////
// fn_AmmoDepot
// What kind of weapon boxes are spawned when the parameter "additional weapons" is activated
// use to add boxes from mods to the ammo depots
//////////////////////////////////////////////////////////////////
a3e_additional_weapon_box_1 = "Box_NATO_Wps_F";
a3e_additional_weapon_box_2 = "Box_NATO_WpsSpecial_F";

//////////////////////////////////////////////////////////////////
// fn_CrashSite
// Random crashsite of west heli with west weapons
//////////////////////////////////////////////////////////////////
// The following arrays define weapons and ammo contained at crash sites
// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.
a3e_arr_CrashSiteWrecks = ["Land_UWreck_MV22_F","Land_Wreck_Plane_Transport_01_F","Land_Wreck_Heli_Attack_01_F"];
a3e_arr_CrashSiteCrew = ["B_Pilot_F","B_helicrew_F"];
// Weapons and ammo in crash site box
a3e_arr_CrashSiteWeapons = [];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["launch_NLAW_F", 10, 1, 2, ["NLAW_F"], 3]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["srifle_EBR_F", 10, 1, 2, ["20Rnd_762x51_Mag"], 8]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["srifle_LRR_F", 10, 1, 2, ["7Rnd_408_Mag"], 8]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["arifle_MX_F", 75, 2, 4, ["30Rnd_65x39_caseless_mag"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["arifle_MX_GL_F", 50, 2, 4, ["30Rnd_65x39_caseless_mag", "1Rnd_HE_Grenade_shell", "UGL_FlareGreen_F"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["arifle_MX_SW_F", 20, 1, 2, ["100Rnd_65x39_caseless_mag_Tracer"], 6]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["arifle_MXM_F", 10, 1, 2, ["30Rnd_65x39_caseless_mag"], 8]];
a3e_arr_CrashSiteWeapons set [count a3e_arr_CrashSiteWeapons, ["SMG_01_Holo_pointer_snds_F", 10, 1, 2, ["30Rnd_45ACP_Mag_SMG_01"], 8]];
// Attachments and other items in crash site box
a3e_arr_CrashSiteItems = [];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["optic_Hamr", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["optic_Aco", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["optic_Aco_smg", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["optic_Holosight", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["optic_SOS", 10, 1, 3]];
a3e_arr_CrashSiteItems set [count a3e_arr_CrashSiteItems, ["muzzle_snds_H", 10, 1, 3]];