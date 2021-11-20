
private["_Objects","_Object_Lager","_VN_Hauser","_can_List","_Test_List"];

_Objects = [];
_Object_Lager = [];
sleep 15;
{_test = (nearestObject [(getpos _x),"house"]);if !(_test in _Object_Lager) then {_Object_Lager = _Object_Lager + [_test]};}forEach playableUnits + [player];

_Alle_VN_Hauser = [
                   "Land_vn_cave_01",
                   "Land_vn_cave_01_01",
                   "Land_vn_cave_02",
                   "Land_vn_cave_02_01",
                   "Land_vn_cave_03",
                   "Land_vn_cave_03_01",
                   "Land_vn_cave_04",
                   "Land_vn_cave_04_01",
                   "Land_vn_cave_05",
                   "Land_vn_cave_06",
                   "Land_vn_cave_07",
                   "Land_vn_hut_03",
                   "Land_vn_hut_village_02",
                   "Land_vn_hut_village_01",
                   "Land_vn_hut_04",
                   "Land_vn_hut_08",
                   "Land_vn_hut_07",
                   "Land_vn_hut_02",
                   "Land_vn_hut_06",
                   "Land_vn_hut_05",
                   "Land_vn_hut_tower_03",
                   "Land_vn_hut_river_02",
                   "Land_vn_hut_river_01",
                   "Land_vn_hut_river_03",
                   "Land_vn_hootch_02_03",
                   "Land_vn_hootch_02_02",
                   "Land_vn_hootch_02_01",
                   "Land_vn_hootch_02_11",
                   "Land_vn_hootch_01_01",
                   "Land_vn_hootch_01_11",
                   "Land_vn_hootch_01_12",
                   "Land_vn_hootch_01_02",
                   "Land_vn_hootch_01_03",
                   "Land_vn_hootch_01_13",
                   "Land_vn_hootch_02",
                   "Land_vn_barracks_04_02",
                   "Land_vn_barracks_04_01",
                   "Land_vn_barracks_03_01",
                   "Land_vn_barracks_03_02",
                   "Land_vn_barracks_03_03",
                   "Land_vn_barracks_03_04",
                   "Land_vn_barracks_02_01",
                   "Land_vn_guardhouse_01",
                   "Land_vn_hut_mont_05",
                   "Land_vn_hut_mont_02",
                   "Land_vn_hut_mont_03",
                   "Land_vn_hut_mont_04",
                   "Land_vn_hut_mont_01",
                   "Land_vn_hut_old02",
                   "Land_vn_house_small_02_f",
                   "Land_vn_slum_house03_f",
                   "Land_vn_slum_house01_f",
                   "Land_vn_shed_03_f",
                   "Land_vn_shed_05_f",
                   "Land_vn_shed_02_f",
                   "Land_vn_shed_07_f",
                   "Land_vn_slum_03_f",
                   "Land_vn_slum_01_f",
                   "Land_vn_slum_02_f",
                   "Land_vn_b_trench_bunker_05_01",
                   "Land_vn_b_trench_bunker_06_01",
                   "Land_vn_b_trench_bunker_04_01",
                   "Land_vn_b_trench_firing_01",
                   "Land_vn_bagbunker_large_f",
                   "Land_vn_bagbunker_01_large_green_f",
                   "Land_vn_pillboxbunker_01_big_f",
                   "Land_vn_bagbunker_small_f",
                   "Land_vn_bagbunker_01_small_green_f",
                   "Land_vn_pillboxbunker_01_hex_f",
                   "Land_vn_b_trench_bunker_01_01",
                   "Land_vn_b_trench_bunker_02_01",
                   "Land_vn_b_trench_bunker_02_02",
                   "Land_vn_b_trench_bunker_02_03",
                   "Land_vn_b_trench_bunker_02_04",
                   "Land_vn_b_trench_bunker_01_02",
                   "Land_vn_b_trench_bunker_03_01",
                   "Land_vn_b_trench_bunker_03_02",
                   "Land_vn_b_trench_bunker_03_03",
                   "Land_vn_b_trench_bunker_03_04",
                   "Land_vn_b_trench_bunker_01_03",
                   "Land_vn_tent_mash_01_01",
                   "Land_vn_tent_mash_01_02",
                   "Land_vn_tent_mash_01_03",
                   "Land_vn_tent_mash_01_04",
                   "Land_vn_tent_mash_02_01",
                   "Land_vn_tent_mash_02_02",
                   "Land_vn_tent_mash_02_03",
                   "Land_vn_tent_mash_02_04",
                   "Land_vn_wf_field_hospital_east"
				  ];

sleep 5;


while {true} do { 
	
	_can_List    = [];
	_Objects     = [];
	_VN_Hauser   = [];
	_Test_List   = [];
	_Objectstest = [];			 
	//---------------Alle Hauser------------------------------------------------------------------------------------------------------
	{
		if ((getpos _x select 2) < 10) then  { 
			_can_List =  nearestObjects [(getpos _x), ["house" ],100];
		};
		
		{
			if !(_x in _Objects) then {
				_Objects = _Objects + [_x]
			}
		}forEach _can_List;  
							
	}forEach allPlayers;
	
	_validObjects = ["Airport","Barn","Barrack","Benzina","Bouda","Budova","Building","Bunker","CarService","Cargo","Castle","CementWorks","Chapel","Church","Cihlovej","Dum","Factory","Fortress",
                     "Garage","Hangar","Health","Hospital","Hotel","House","Hut","Ind","MBG","Mosque","Office","Panelak","Pub","Radar","Sara","Shop","Slum","Station","Stodola","Store","Supermarket",
                     "Villa","WIP_F","ZalChata","barracks","bunker","cave","cwa","factory","firing","fortified","hootch","hospital","house","hut","istan","kiosk","office","pub","shed"
					];
					
	_Objects = _Objects - _Object_Lager;
	_Object_Lager = _Object_Lager + _Objects;
	
	{
		_object = _x;
		{
		
			if(typeOf _object find _x > 0) then { _Objectstest pushBack _object };
			
		} foreach _validObjects;
		
	} foreach _Objects;
	
    	
	//---------------Alle VN Hauser---------------------------------------------------------------------------------------------------
	{
	    if (typeOF _x in _Alle_VN_Hauser) then {
	        _VN_Hauser =  _VN_Hauser + [_x]};
	
	}forEach _Objectstest;

	 _Objectstest = _Objectstest - _VN_Hauser;
	//--------------Alle Hauser mit pos-----------------------------------------------------------------------------------------------
	{
	    if (((_x buildingPos 0)select 0)> 0) then { 
		   _Test_List =  _Test_List + [_x] };
	
	}forEach  _Objectstest; 

	{
	    _x spawn  ACP_fnc_Erzeugen;
		
	}foreach  _Test_List;
	
	{
	    _x spawn  ACP_fnc_Holen;
		
	}foreach _VN_Hauser;
				
				

     sleep 10;

 }; 

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------




