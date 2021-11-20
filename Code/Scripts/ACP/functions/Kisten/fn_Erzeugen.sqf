

private["_Haus","_pos","_W","_Kiste","_Kiste_klein","_Kiste_gross","_Kiste_panzerf","_Kiste_mini","_HausPosList","_mag","_K001",
        "_AllePistolen","_AlleSturmgewehr","_Alle_Hand_Granaten","_Alle_Minen","_Alle_Rucksacke","_Alle_Panzerfauste","_Alle_Waffen_Civilian","_Alle_Special_Waffen","_Alle_items_2","_Alle_items_3",
        "_Alle_Waffen_optik","_Alle_items","_Alle_items_1","_Pistole1","_Pistole2","_Pistole3","_Pistole4","_Sturmgewehr1","_Sturmgewehr2","_Sturmgewehr3","_Special_W001","_Civilian_W01","_Panzerfau001",
        "_Panzerfau002","_Granaten_001","_Granaten_002","_Granaten_003","_Granaten_004","_Minen_001","_Minen_002","_Minen_003","_Minen_004",		
		"_P_mag1","_P_mag2","_P_mag3","_P_mag4",
		"_S_mag1","_S_mag2","_S_mag3","_S_mag4",
		"_S_mag1A","_S_mag2A","_S_mag3A","_S_mag4A",
		"_Sp_mag1","_Sp_mag2A","_C_mag1","_C_mag2A",
		"_Pa_mag1","_Pa_mag2","_Alle_mag",
		"_Civilian_W01","_T"];

_param1 = ["ACP_Param_Kisten", -1] call BIS_fnc_getParamValue;

 if (_param1 == 1) then {  _T = ([0,1,2] call BIS_fnc_selectRandom);};
 if (_param1 == 2) then {  _T = ([0,1,2,3] call BIS_fnc_selectRandom);};
 if (_param1 == 3) then {  _T = ([0,1,2,3,4] call BIS_fnc_selectRandom);};

if (_T != 0) exitWith {}; 

_Haus = _this;
_W = getdir _Haus;
//----test
//_Name = "Marker" + str(Random 10000);_001 = createMarker [_Name,(getpos _Haus)];_Name setMarkerType "mil_box";_Name setMarkerColor "ColorOrange";
//-------
_HausPosList  = _Haus call BIS_fnc_buildingPositions;

_pos = _HausPosList call BIS_fnc_selectRandom;
_pos001 = [_pos select 0,_pos select 1,(_pos select 2) + 0.7];


//----------------------------------------------------------------Kisten--------------------------------------------------------------------
 _Kiste_klein      =    ["Land_MetalCase_01_medium_F",
                         "Land_PlasticCase_01_medium_F",
						 "Land_PlasticCase_01_medium_gray_F",
                         "Land_PlasticCase_01_medium_black_F",
                         "Land_PortableCabinet_01_closed_sand_F",
                         "Box_Syndicate_Ammo_F",
                         "Box_T_NATO_Wps_F"
				        ];
				  
_Kiste_gross       =    ["Land_PlasticCase_01_large_F",
                         "Land_PlasticCase_01_large_gray_F",
                         "Land_PlasticCase_01_large_black_F",
						 
						 "Land_WoodenCrate_01_F",
                         "Land_Sack_F"
                        ];
					
					
_Kiste_panzerf     =    ["Box_Syndicate_WpsLaunch_F"					
					    ];
						
_Kiste_mini        =    ["Land_PlasticCase_01_small_F",
                         "Land_PlasticCase_01_small_black_F",
                         "Land_PlasticCase_01_small_gray_F",
                         "Land_MetalCase_01_small_F"
                        ];						 
					
//----------Alle Waffen-----------------------------------------------------------------------------------------------------------------					
_AllePistolen         = a3e_arr_PrisonBackpackWeapons;

_AlleSturmgewehr      = a3e_arr_AmmoDepotBasicWeapons;

_Alle_Hand_Granaten   = a3e_arr_AmmoDepotVehicle;

_Alle_Minen           = a3e_arr_AmmoDepotOrdnance;

_Alle_Rucksacke       = a3e_arr_AmmoDepotVehicleBackpacks + ["B_Carryall_taiga_F","B_FieldPack_oli","B_TacticalPack_rgr"];

_Alle_Panzerfauste    = a3e_arr_AmmoDepotLaunchers;

_Alle_Waffen_Civilian = [] ; {_Alle_Waffen_Civilian = _Alle_Waffen_Civilian + [(_x select 0)];} forEach a3e_arr_CivilianCarWeapons;_Alle_Waffen_Civilian = _Alle_Waffen_Civilian - [objNull];



_Alle_Special_Waffen  = a3e_arr_AmmoDepotSpecialWeapons;

_Alle_items_2         = a3e_arr_AmmoDepotItems;        //           items fur CargoGlobal
_Alle_items_3         = a3e_arr_AmmoDepotVehicleItems; // wie _Alle_items fur CargoGlobal

_Alle_Waffen_optik    = (a3e_arr_Scopes + a3e_arr_Scopes_SMG + a3e_arr_Scopes_Sniper + a3e_arr_NightScopes + a3e_arr_TWSScopes);

_Alle_Waffen_zubehor  = a3e_arr_Bipods;

//-------items--fur--CargoGlobal------------------------------------------------------------------
_Alle_items = ["itemmap"       ,
               "ToolKit"       ,
               "Medikit"       ,
			   "FirstAidKit"   ,
               "FileTopSecret"
              ];

//-------items--fur--createVehicle-----------------------------------------------------------------------
_Alle_items_1 = [
                 "Item_Files"           ,
                 "Item_Wallet_traitor"  ,
                 "Item_FileTopSecret"   ,
                 "Item_SecretDocuments" ,
                 "Item_Binocular"       ,
                 "Land_File_research_F" ,
                 "Item_Wallet_traitor"  ,
				 "Item_ToolKit"         ,
				 "Item_Medikit"         ,
				 "Item_FirstAidKit"     ,
				 "Item_NVGoggles"
               ];
//-------------------------------------------------------------------------------------------------------

_Pistole1      = (_AllePistolen    call BIS_fnc_selectRandom)select 0; _P_mag1 = (([_Pistole1] call BIS_fnc_compatibleMagazines)select 0);
_Pistole2      = (_AllePistolen    call BIS_fnc_selectRandom)select 0; _P_mag2 = (([_Pistole2] call BIS_fnc_compatibleMagazines)select 0);
_Pistole3      = (_AllePistolen    call BIS_fnc_selectRandom)select 0; _P_mag3 = (([_Pistole3] call BIS_fnc_compatibleMagazines)select 0);
_Pistole4      = (_AllePistolen    call BIS_fnc_selectRandom)select 0; _P_mag4 = (([_Pistole4] call BIS_fnc_compatibleMagazines)select 0);

_Sturmgewehr1  = (_AlleSturmgewehr call BIS_fnc_selectRandom)select 0; _Alle_mag = ([_Sturmgewehr1] call BIS_fnc_compatibleMagazines); _S_mag1 = _Alle_mag select 0; _S_mag1A = _Alle_mag call BIS_fnc_selectRandom;
_Sturmgewehr2  = (_AlleSturmgewehr call BIS_fnc_selectRandom)select 0; _Alle_mag = ([_Sturmgewehr2] call BIS_fnc_compatibleMagazines); _S_mag2 = _Alle_mag select 0; _S_mag2A = _Alle_mag call BIS_fnc_selectRandom;
_Sturmgewehr3  = (_AlleSturmgewehr call BIS_fnc_selectRandom)select 0; _Alle_mag = ([_Sturmgewehr3] call BIS_fnc_compatibleMagazines); _S_mag3 = _Alle_mag select 0; _S_mag3A = _Alle_mag call BIS_fnc_selectRandom;

_Special_W001  = (_Alle_Special_Waffen call BIS_fnc_selectRandom)select 0; _Alle_mag = ([_Special_W001] call BIS_fnc_compatibleMagazines); _Sp_mag1 = _Alle_mag select 0; _Sp_mag1A = _Alle_mag call BIS_fnc_selectRandom;

_Civilian_W01   = (_Alle_Waffen_Civilian call BIS_fnc_selectRandom); _Alle_mag = ([_Civilian_W01] call BIS_fnc_compatibleMagazines);_C_mag1 = "HandGrenade"; _C_mag1A = ["HandGrenade","MiniGrenade"] call BIS_fnc_selectRandom; 
                   if (count _Alle_mag > 0) then {_C_mag1 = _Alle_mag select 0; _C_mag1A = _Alle_mag call BIS_fnc_selectRandom;};
  
_Panzerfau001 =  (_Alle_Panzerfauste    call BIS_fnc_selectRandom)select 0; _Pa_mag1 =[_Panzerfau001] call BIS_fnc_compatibleMagazines;
_Panzerfau002 =  (_Alle_Panzerfauste    call BIS_fnc_selectRandom)select 0; _Pa_mag2 =[_Panzerfau002] call BIS_fnc_compatibleMagazines;


_Granaten_001  = ((_Alle_Hand_Granaten   call BIS_fnc_selectRandom)select 4)call BIS_fnc_selectRandom;
_Granaten_002  = ((_Alle_Hand_Granaten   call BIS_fnc_selectRandom)select 4)call BIS_fnc_selectRandom;
_Granaten_003  = ((_Alle_Hand_Granaten   call BIS_fnc_selectRandom)select 4)call BIS_fnc_selectRandom;
_Granaten_004  = ((_Alle_Hand_Granaten   call BIS_fnc_selectRandom)select 4)call BIS_fnc_selectRandom;

_Minen_001     = ((_Alle_Minen  call BIS_fnc_selectRandom)select 4)call BIS_fnc_selectRandom;
_Minen_002     = ((_Alle_Minen  call BIS_fnc_selectRandom)select 4)call BIS_fnc_selectRandom;
_Minen_003     = ((_Alle_Minen  call BIS_fnc_selectRandom)select 4)call BIS_fnc_selectRandom;
_Minen_004     = ((_Alle_Minen  call BIS_fnc_selectRandom)select 4)call BIS_fnc_selectRandom;



//-----------Zufall------------------------------------------------------------------------------------------------------------

_Zufall = ["WeaponHolder","Item","Klein","Gross","Mini","Panzerfaust"] call BIS_fnc_selectRandom;


//_Zufall = "Gross";

switch (_Zufall) do {

//----------------------------------------------------------------------------------------------------------------------------------------------
    case "Klein"           : {_T = ([1,2,3] call BIS_fnc_selectRandom);
	                            
								     _Kiste = ((_Kiste_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                             
									 _Kiste setdir _W; _Kiste setpos _pos;
									 
									 clearItemCargoGlobal     _Kiste;
                                     clearMagazineCargoGlobal _Kiste;
	                                 clearWeaponCargoGlobal   _Kiste;
	                                 clearBackpackCargoGlobal _Kiste;
							     	//---Alle-Klein--------------------------------------------------------------------
								        _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["Medikit",      (round(Random 3))];};
								        _A =(floor(Random 2));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["FileTopSecret",(round(Random 3))];};
     							        _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["Binocular",    (round(Random 3))];};
					                    _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["FirstAidKit",  (round(Random 3))];};
									    _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["itemmap",      (round(Random 3))];};
									
									_Waffe = _Alle_Rucksacke call BIS_fnc_selectRandom;_Kiste addBackpackCargoGlobal [_Waffe,(round(Random 2))];
							        _Waffe = _Alle_items_2 call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal      [_Waffe,1];
							        _Waffe = _Alle_items_2 call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal      [_Waffe,1];
							        _Kiste addMagazineCargoGlobal  [_Granaten_001,(round(Random 4))];
									_Kiste addMagazineCargoGlobal  [_Minen_001,(round(Random 4))];
							  
							  if (_T == 1) then {
 	     					                     _Kiste addWeaponCargoGlobal    [_Sturmgewehr1,1];_Kiste addMagazineCargoGlobal[_S_mag1,3];_Kiste addMagazineCargoGlobal[_S_mag1A,(round(Random 4))];
												 
												 _Kiste addWeaponCargoGlobal    [_Pistole1,1]    ;_Kiste addMagazineCargoGlobal[_P_mag1,4];    
                                                 												 												 
												};
							  if (_T == 2) then {											     
												 _Kiste addWeaponCargoGlobal   [_Civilian_W01,1];_Kiste addMagazineCargoGlobal[_C_mag1,3];_Kiste addMagazineCargoGlobal[_C_mag1A,(round(Random 4))];
							  
												 _Kiste addWeaponCargoGlobal   [_Panzerfau001,1];{_Kiste addMagazineCargoGlobal[_x,1];} forEach _Pa_mag1;
                                                 												 
												};
							  if (_T == 3) then {											     
												 _Kiste addWeaponCargoGlobal    [_Special_W001,1];_Kiste addMagazineCargoGlobal[_Sp_mag1,3];_Kiste addMagazineCargoGlobal[_Sp_mag1A,(round(Random 4))];
												 
												 _Kiste addWeaponCargoGlobal    [_Pistole1,1]    ;_Kiste addMagazineCargoGlobal[_P_mag1,4];    
                                                																								 
												};
                             };
//----------------------------------------------------------------------------------------------------------------------------------------------
	case "Gross"           : {_T = ([1,2,3] call BIS_fnc_selectRandom);
	
	                                _Test_K = (_Kiste_gross call BIS_fnc_selectRandom);
                                    
    								if ((_Test_K == "Land_WoodenCrate_01_F") or (_Test_K == "Land_Sack_F"))
									
									then {_Kiste = "ContainerSupply" createVehicle [0,0,0];_Kiste setdir _W; _Kiste setpos _pos001;_K001 = _Test_K createVehicle [0,0,0];_K001 setdir _W; _K001 setpos _pos;}
									
									else {_Kiste = _Test_K createVehicle [0,0,0];_Kiste setdir _W; _Kiste setpos _pos;};
									
									 
									 clearItemCargoGlobal     _Kiste;
                                     clearMagazineCargoGlobal _Kiste;
	                                 clearWeaponCargoGlobal   _Kiste;
	                                 clearBackpackCargoGlobal _Kiste;
							     	//---Alle-Klein--------------------------------------------------------------------
								        _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["Medikit",      (round(Random 3))];};
								        _A =(floor(Random 2));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["FileTopSecret",(round(Random 3))];};
     							        _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["Binocular",    (round(Random 3))];};
					                    _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["FirstAidKit",  (round(Random 3))];};
									    _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["itemmap",      (round(Random 3))];};
									
									_Waffe = _Alle_Rucksacke call BIS_fnc_selectRandom;_Kiste addBackpackCargoGlobal [_Waffe,(round(Random 2))];
							        _Waffe = _Alle_Rucksacke call BIS_fnc_selectRandom;_Kiste addBackpackCargoGlobal [_Waffe,(round(Random 2))];
									
									_Waffe = _Alle_items_2 call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal      [_Waffe,2];
							        _Waffe = _Alle_items_2 call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal      [_Waffe,2];
							        _Waffe = _Alle_items_2 call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal      [_Waffe,2];
							        _Waffe = _Alle_items_2 call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal      [_Waffe,2];
							        
									_Kiste addMagazineCargoGlobal  [_Granaten_001,(round(Random 8))];
									_Kiste addMagazineCargoGlobal  [_Minen_001,(round(Random 8))];
							        _Alle_Waffen_zubehor          call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_Waffe,2];
									_Waffe = _Alle_Waffen_optik   call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_Waffe,2];
									
									
							  if (_T == 1) then {
 	     					                     _Kiste addWeaponCargoGlobal    [_Sturmgewehr1,(round(Random 4))];_Kiste addMagazineCargoGlobal[_S_mag1,(round(Random 10))];_Kiste addMagazineCargoGlobal[_S_mag1A,(round(Random 14))];
												 _Kiste addWeaponCargoGlobal    [_Sturmgewehr2,(round(Random 4))];_Kiste addMagazineCargoGlobal[_S_mag2,(round(Random 10))];_Kiste addMagazineCargoGlobal[_S_mag2A,(round(Random 14))];
												 _Kiste addWeaponCargoGlobal   [_Panzerfau001,1];{_Kiste addMagazineCargoGlobal[_x,1];} forEach _Pa_mag1;
												 _Kiste addWeaponCargoGlobal    [_Pistole1,1]    ;_Kiste addMagazineCargoGlobal[_P_mag1,4]; 
												 _Kiste addWeaponCargoGlobal    [_Pistole2,1]    ;_Kiste addMagazineCargoGlobal[_P_mag2,4];
                                                 												 												 
												};
							  if (_T == 2) then {											     
												 _Kiste addWeaponCargoGlobal   [_Civilian_W01,1];_Kiste addMagazineCargoGlobal[_C_mag1,3];_Kiste addMagazineCargoGlobal[_C_mag1A,(round(Random 10))];
							                     _Kiste addWeaponCargoGlobal    [_Special_W001,1];_Kiste addMagazineCargoGlobal[_Sp_mag1,3];_Kiste addMagazineCargoGlobal[_Sp_mag1A,(round(Random 10))];
												 _Kiste addWeaponCargoGlobal   [_Panzerfau001,1];{_Kiste addMagazineCargoGlobal[_x,1];} forEach _Pa_mag1;
                                                 												 
												};
							  if (_T == 3) then {											     
												 _Kiste addWeaponCargoGlobal    [_Special_W001,1];_Kiste addMagazineCargoGlobal[_Sp_mag1,3];_Kiste addMagazineCargoGlobal[_Sp_mag1A,(round(Random 4))];
												 _Kiste addWeaponCargoGlobal    [_Sturmgewehr1,(round(Random 4))];_Kiste addMagazineCargoGlobal[_S_mag1,(round(Random 10))];_Kiste addMagazineCargoGlobal[_S_mag1A,(round(Random 14))];
												 _Kiste addWeaponCargoGlobal    [_Sturmgewehr2,(round(Random 4))];_Kiste addMagazineCargoGlobal[_S_mag2,(round(Random 10))];_Kiste addMagazineCargoGlobal[_S_mag2A,(round(Random 14))];
												 _Kiste addWeaponCargoGlobal    [_Pistole1,1]    ;_Kiste addMagazineCargoGlobal[_P_mag1,4];    
                                                																								 
												};
                             };
//----------------------------------------------------------------------------------------------------------------------------------------------
	case "Mini"            : {_T = ([1,2,3,4,5] call BIS_fnc_selectRandom);
	                                 
									 
									 _Kiste = ((_Kiste_mini call BIS_fnc_selectRandom) createVehicle [0,0,0]);
									 
									 _Kiste setdir _W; _Kiste setpos _pos;
									 
									//---Alle-Mini--------------------------------------------------------------------
								        _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["Medikit",      (round(Random 2))];};
								        _A =(floor(Random 2));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["FileTopSecret",(round(Random 2))];};
     							        _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["Binocular",    (round(Random 2))];};
					                    _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["FirstAidKit",  (round(Random 2))];};
									    _A =(floor(Random 3));   
                                    if (_A > 1) then {_Kiste addItemCargoGlobal ["itemmap",      (round(Random 2))];};
									
									_Waffe = _Alle_Rucksacke call BIS_fnc_selectRandom;_Kiste addBackpackCargoGlobal [_Waffe,(round(Random 2))];
									_Waffe = _Alle_items_2 call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal      [_Waffe,1];
							        _Waffe = _Alle_items_2 call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal      [_Waffe,1];
							        _Kiste addMagazineCargoGlobal  [_Granaten_001,(round(Random 4))];
									_Kiste addMagazineCargoGlobal  [_Minen_001,(round(Random 4))];
									
	              if (_T == 1) then {
 	     					         _Kiste addWeaponCargoGlobal    [_Pistole1,1]    ;_Kiste addMagazineCargoGlobal[_P_mag1,4]; 
									 _Kiste addWeaponCargoGlobal    [_Pistole1,2]    ;_Kiste addMagazineCargoGlobal[_P_mag2,4]; 
									 _Kiste addWeaponCargoGlobal    [_Pistole1,3]    ;_Kiste addMagazineCargoGlobal[_P_mag3,4]; 
									 _Kiste addWeaponCargoGlobal    [_Pistole1,4]    ;_Kiste addMagazineCargoGlobal[_P_mag4,4]; 
									};
                  if (_T == 2) then {                           
                                     _Waffe = _AlleSturmgewehr      call BIS_fnc_selectRandom;
									                                                          _mag = ([_Waffe select 0] call BIS_fnc_compatibleMagazines);
											                                         	      _Kiste addMagazineCargoGlobal[(_mag select 0),3];
												                  if ((count _mag) > 1) then {_Kiste addMagazineCargoGlobal[(_mag select 1),1];};
	                                                              if ((count _mag) > 2) then {_Kiste addMagazineCargoGlobal[(_mag select 2),1];};
												                  if ((count _mag) > 3) then {_Kiste addMagazineCargoGlobal[(_mag select 3),(floor(Random 4))];};
																  _Kiste addWeaponCargoGlobal [_Waffe select 0,1];
									};
				  if (_T == 3) then {                           
                                     _Waffe = _Alle_Special_Waffen call BIS_fnc_selectRandom;
									                                                         _mag = ([_Waffe select 0] call BIS_fnc_compatibleMagazines);
																							 _Kiste addMagazineCargoGlobal[(_mag select 0),3];
												                 if ((count _mag) > 1) then {_Kiste addMagazineCargoGlobal[(_mag select 1),1];};
	                                                             if ((count _mag) > 2) then {_Kiste addMagazineCargoGlobal[(_mag select 2),1];};
												                 if ((count _mag) > 3) then {_Kiste addMagazineCargoGlobal[(_mag select 3),(floor(Random 4))];};
												                 _Kiste addWeaponCargoGlobal [_Waffe select 0,1];
                                    };
	              if (_T == 4) then {                           
                                     _Kiste addWeaponCargoGlobal   [_Civilian_W01,1];_Kiste addMagazineCargoGlobal[_C_mag1,3];_Kiste addMagazineCargoGlobal[_C_mag1A,(round(Random 4))];
                                    };
	              if (_T == 5) then {                           
                                     {_Kiste addItemCargoGlobal [_x,2];} forEach _Alle_Waffen_optik;
                                    };
	

                            
					    };
//----------------------------------------------------------------------------------------------------------------------------------------------
	case "WeaponHolder"    : {_T = ([1,2,3,4,5,6,7,8,9,10] call BIS_fnc_selectRandom);

                             	 _Kiste = "groundWeaponHolder" createVehicle [0,0,0];
                                 
								 _Kiste setdir _W; _Kiste setpos _pos;
									
							  if (_T == 1) then {_Kiste addWeaponCargoGlobal    [_Sturmgewehr1,1];_Kiste addMagazineCargoGlobal[_S_mag1,3];_Kiste addMagazineCargoGlobal[_S_mag1A,(round(Random 4))];
                                                };
							  if (_T == 2) then {_Kiste addWeaponCargoGlobal    [_Special_W001,1];_Kiste addMagazineCargoGlobal[_Sp_mag1,3];_Kiste addMagazineCargoGlobal[_Sp_mag1A,(round(Random 4))];
                                                };					
							  if (_T == 3) then {_Kiste addWeaponCargoGlobal   [_Panzerfau001,1];{_Kiste addMagazineCargoGlobal[_x,1];} forEach _Pa_mag1;
                                                };
                              if (_T == 4) then {_Kiste addWeaponCargoGlobal   [_Civilian_W01,1];_Kiste addMagazineCargoGlobal[_C_mag1,3];_Kiste addMagazineCargoGlobal[_C_mag1A,(round(Random 4))];
                                                };
                              if (_T == 5) then {_Waffe = _Alle_items_2 call BIS_fnc_selectRandom;
							                     _Kiste addItemCargoGlobal [_Waffe select 0,1];
                                                 _Waffe = _Alle_items_2 call BIS_fnc_selectRandom;
												 _Kiste addItemCargoGlobal [_Waffe select 0,1];
												 _Waffe = _Alle_items_2 call BIS_fnc_selectRandom;
												 _Kiste addItemCargoGlobal [_Waffe select 0,1];
                                                };
                              if (_T == 6) then {_Kiste addMagazineCargoGlobal  [_Granaten_001,(round(Random 4))];
							                     _Kiste addMagazineCargoGlobal  [_Granaten_002,(round(Random 4))];
												 _Kiste addMagazineCargoGlobal  [_Granaten_003,(round(Random 4))];
							                    };	
                              if (_T == 7) then {_Kiste addMagazineCargoGlobal  [_Minen_001,(round(Random 4))];
							                     _Kiste addMagazineCargoGlobal  [_Minen_002,(round(Random 4))];
												 _Kiste addMagazineCargoGlobal  [_Minen_003,(round(Random 4))];
                                                };
                              if (_T == 8) then {_Waffe = _Alle_items_3 call BIS_fnc_selectRandom;
							                     _Kiste addItemCargoGlobal [_Waffe select 0,1];
                                                };	
                              if (_T == 9) then {_Waffe =  _Alle_Rucksacke call BIS_fnc_selectRandom;
							                     _Kiste addBackpackCargoGlobal [_Waffe,1];
                                                };
                             if (_T == 10) then {_Waffe = _Alle_items call BIS_fnc_selectRandom;
							                     _Kiste addItemCargoGlobal [_Waffe,1];
                                                 _Waffe = _Alle_items call BIS_fnc_selectRandom;
												 _Kiste addItemCargoGlobal [_Waffe,1];
												 _Waffe = _Alle_items call BIS_fnc_selectRandom;
											     _Kiste addItemCargoGlobal [_Waffe,1];
											    }; 
                             };
//----------------------------------------------------------------------------------------------------------------------------------------------
	case "Item"            : {_item = _Alle_items_1 call BIS_fnc_selectRandom;
                              _Kiste = createVehicle [_item,[0,0,0]];_Kiste setpos ((_Haus call BIS_fnc_buildingPositions)call BIS_fnc_selectRandom);
							  _item = _Alle_items_1 call BIS_fnc_selectRandom;
							  _Kiste = createVehicle [_item,[0,0,0]];_Kiste setpos ((_Haus call BIS_fnc_buildingPositions)call BIS_fnc_selectRandom);
							  _item = _Alle_items_1 call BIS_fnc_selectRandom;
							  _Kiste = createVehicle [_item,[0,0,0]];_Kiste setpos ((_Haus call BIS_fnc_buildingPositions)call BIS_fnc_selectRandom);

                             };
//----------------------------------------------------------------------------------------------------------------------------------------------
	case "Panzerfaust"     : {_T = ([1,2,3,4] call BIS_fnc_selectRandom);
	                           
							      _Kiste = ((_Kiste_panzerf call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                 
								 _Kiste setdir _W; _Kiste setpos _pos;

								  clearItemCargoGlobal     _Kiste;
                                  clearMagazineCargoGlobal _Kiste;
	                              clearWeaponCargoGlobal   _Kiste;
	                              clearBackpackCargoGlobal _Kiste;
	                        
							  if (_T == 1) then {											     
												   _Kiste addWeaponCargoGlobal   [_Panzerfau001,1];{_Kiste addMagazineCargoGlobal[_x,1];} forEach _Pa_mag1;
                                                   _Kiste addWeaponCargoGlobal   [_Panzerfau002,1];{_Kiste addMagazineCargoGlobal[_x,1];} forEach _Pa_mag2;							
												};
							  if (_T == 2) then {											     
												  _Waffe = _AlleSturmgewehr      call BIS_fnc_selectRandom;
									                                                          _mag = ([_Waffe select 0] call BIS_fnc_compatibleMagazines);
											                                         	      _Kiste addMagazineCargoGlobal[(_mag select 0),3];
												                  if ((count _mag) > 1) then {_Kiste addMagazineCargoGlobal[(_mag select 1),1];};
	                                                              if ((count _mag) > 2) then {_Kiste addMagazineCargoGlobal[(_mag select 2),1];};
												                  if ((count _mag) > 3) then {_Kiste addMagazineCargoGlobal[(_mag select 3),(floor(Random 4))];};
																  _Kiste addWeaponCargoGlobal [_Waffe select 0,1];
													  
												  _Waffe = _AlleSturmgewehr      call BIS_fnc_selectRandom;
									                                                          _mag = ([_Waffe select 0] call BIS_fnc_compatibleMagazines);
											                                         	      _Kiste addMagazineCargoGlobal[(_mag select 0),3];
												                  if ((count _mag) > 1) then {_Kiste addMagazineCargoGlobal[(_mag select 1),1];};
	                                                              if ((count _mag) > 2) then {_Kiste addMagazineCargoGlobal[(_mag select 2),1];};
												                  if ((count _mag) > 3) then {_Kiste addMagazineCargoGlobal[(_mag select 3),(floor(Random 4))];};
																  _Kiste addWeaponCargoGlobal [_Waffe select 0,1];
											      
												  _Waffe = _Alle_items_2        call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_Waffe,2];
                                                  _Alle_Waffen_zubehor          call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_Waffe,2];
												  _Waffe = _Alle_Waffen_optik   call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_Waffe,2];
												};
							  if (_T == 3) then {											     
												 {_Kiste addItemCargoGlobal [_x,2];} forEach _Alle_Waffen_optik;
												};				
							  if (_T == 4) then {											     
												  _Waffe = _Alle_Special_Waffen call BIS_fnc_selectRandom;
									                                                         _mag = ([_Waffe select 0] call BIS_fnc_compatibleMagazines);
																							 _Kiste addMagazineCargoGlobal[(_mag select 0),3];
												                 if ((count _mag) > 1) then {_Kiste addMagazineCargoGlobal[(_mag select 1),1];};
	                                                             if ((count _mag) > 2) then {_Kiste addMagazineCargoGlobal[(_mag select 2),1];};
												                 if ((count _mag) > 3) then {_Kiste addMagazineCargoGlobal[(_mag select 3),(floor(Random 4))];};
												                 _Kiste addWeaponCargoGlobal [_Waffe select 0,1];
												  
												  _Waffe = _Alle_Special_Waffen call BIS_fnc_selectRandom;
									                                                         _mag = ([_Waffe select 0] call BIS_fnc_compatibleMagazines);
																							 _Kiste addMagazineCargoGlobal[(_mag select 0),3];
												                 if ((count _mag) > 1) then {_Kiste addMagazineCargoGlobal[(_mag select 1),1];};
	                                                             if ((count _mag) > 2) then {_Kiste addMagazineCargoGlobal[(_mag select 2),1];};
												                 if ((count _mag) > 3) then {_Kiste addMagazineCargoGlobal[(_mag select 3),(floor(Random 4))];};
												                 _Kiste addWeaponCargoGlobal [_Waffe select 0,1];					      
												  
												  _Waffe = _Alle_items_2        call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_Waffe,2];
                                                  _Alle_Waffen_zubehor          call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_Waffe,2];
												  _Waffe = _Alle_Waffen_optik   call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_Waffe,2];
												};

                             };
//----------------------------------------------------------------------------------------------------------------------------------------------
                    default {};
                    };
