
	                    
private["_Objeckt","_House","_pos","_W","_Kiste_klein","_Kiste_Gewehr","_Kiste_Gross","_Kiste_Granaten","_Kiste_sehr_Gross","_sichtbarkeit","_AllePistolen","_Alle_Hand_Granaten",
        "_Alle_Minen","_type56_mag","_M16_mag","_M63_mag","_M14_mag","_M40_mag","_M38_mag","_sks_mag","_sks__22mm","_M1_mag","_M1_22mm","_M4956_mag","_M4956_22mm","_XM_148_40mm1",
        "_XM_148_40mm2","_XM_148_40mm3","_AlleSturmgewehr","_Alle_Leichten_MG","_Alle_Panzerfauste","_Alle_Leuchtracketen","_M79_mag1","_M79_mag2","_M79_mag3","_M79_mag4",
        "_Alle_Granatwerfer","_Alle_items","_Alle_Rucksacke","_item","_Kiste","_T","_mag","_Waffenart","_Kiste_zivil_klein","_Kiste_zivil_Gross","_K001","_pos001","_Alle_items_1",
        "_Alle_Medizin","_Alle_Medizin_1","_T"]; 


_param1 = ["ACP_Param_Kisten", -1] call BIS_fnc_getParamValue;

 if (_param1 == 1) then {  _T = ([0,1,2] call BIS_fnc_selectRandom);};
 if (_param1 == 2) then {  _T = ([0,1,2,3] call BIS_fnc_selectRandom);};
 if (_param1 == 3) then {  _T = ([0,1,2,3,4] call BIS_fnc_selectRandom);};

 if ((_T != 0 ) and (_this select 0 != "zelt")) exitWith {}; 


params ["_Objeckt","_sichtbarkeit","_House","_pos","_W"];
_pos001 = [_pos select 0,_pos select 1,(_pos select 2) + 1];

//----test
//_Name = "Marker" + str(Random 10000);_001 = createMarker [_Name,(getpos _House)];_Name setMarkerType "mil_box";_Name setMarkerColor "ColorOrange";
//-------

//-----Kisten-auswahl-------------------------------------------------------------------------------------------------

switch (_sichtbarkeit) do{
	                    case "sichtbar"  : {_Kiste_klein      = ["vn_o_ammobox_01","vn_o_ammobox_04","vn_o_ammobox_02","vn_b_ammobox_04","vn_b_ammobox_02"];
                                              _Kiste_Gewehr     = ["vn_o_ammobox_03","vn_b_ammobox_03"];
                                              _Kiste_Gross      = ["vn_o_ammobox_07","vn_o_ammobox_06","vn_b_ammobox_07","vn_b_ammobox_01","vn_b_ammobox_06"];
                                              _Kiste_Granaten   = ["vn_b_ammobox_10","vn_b_ammobox_12"];
                                             };
	                    case "unsichtbar": {_Kiste_klein      = ["ContainerSupply"];
                                              _Kiste_Gewehr     = ["ContainerSupply"];
                                              _Kiste_Gross      = ["ContainerSupply"];
                                              _Kiste_Granaten   = ["ContainerSupply"];
                                             };
                          case "zivil":      {_Kiste_zivil_klein = ["Land_vn_sack_f","Land_vn_wicker_basket_ep1","Land_vn_woodencrate_01_f"];
                                              _Kiste_zivil_Gross = ["Land_vn_sacks_goods_f","Land_vn_sacks_heap_f","Land_vn_woodencrate_01_stack_x3_f"];
                                             };
		              default {};
                          };

//-----Pistole--------------------------------------------------------------------------------------------------
_AllePistolen = [
                 "vn_m1911"   ,
                 "vn_m1911_sd",
                 "vn_hp"      ,
                 "vn_mk22"    ,
                 "vn_mk22_sd" ,
                 "vn_hd"      ,
                 "vn_welrod"  ,
                 "vn_pm"      ,
                 "vn_pm_sd"   ,
                 "vn_tt33"    ,
                 "vn_m1895"   ,
                 "vn_m1895_sd",
                 "vn_m712"    ,
                 "vn_m10"     ,
                 "vn_m10_sd"  ,
                 "vn_p38s"    
                ];
//-----Granaten--------------------------------------------------------------------------------------------------
_Alle_Hand_Granaten = [
                       "vn_rdg2_mag",
                       "vn_molotov_grenade_mag",
                       "vn_f1_grenade_mag",
                       "vn_rg42_grenade_mag",
                       "vn_rgd5_grenade_mag",
                       "vn_rgd33_grenade_mag",
                       "vn_rkg3_grenade_mag",
                       "vn_t67_grenade_mag",
                       "vn_chicom_grenade_mag",
                       "vn_m18_red_mag",
                       "vn_m18_white_mag",
                       "vn_m18_green_mag",
                       "vn_m34_grenade_mag",
                       "vn_m14_grenade_mag",
                       "vn_m14_early_grenade_mag",
                       "vn_m7_grenade_mag",
                       "vn_m61_grenade_mag",
                       "vn_v40_grenade_mag",
                       "vn_m67_grenade_mag"
                      ];
//----Minen---------------------------------------------------------------------------------------------------
_Alle_Minen =         [
                        "democharge_remote_mag",
                        "satchelcharge_remote_mag",
                        "vn_mine_satchel_remote_02_mag",
                        "vn_mine_m112_remote_mag",
                        "atmine_range_mag",
                        "vn_mine_ammobox_range_mag",
                        "vn_mine_tm57_mag",
                        "vn_mine_m15_mag",
                        "claymoredirectionalmine_remote_mag",
                        "apersmine_range_mag",
                        "vn_mine_m14_mag",
                        "vn_mine_m16_mag",
                        "slamdirectionalmine_wire_mag",
                        "vn_mine_tripwire_m16_02_mag",
                        "vn_mine_tripwire_m16_04_mag",
                        "vn_mine_tripwire_m49_02_mag",
                        "vn_mine_tripwire_m49_04_mag",
                        "vn_mine_tripwire_arty_mag",
                        "vn_mine_tripwire_f1_02_mag",
                        "vn_mine_tripwire_f1_04_mag",
                        "vn_mine_m18_mag",
                        "vn_mine_m18_range_mag",
                        "vn_mine_m18_x3_mag",
                        "vn_mine_m18_x3_range_mag",
                        "vn_mine_punji_01_mag",
                        "vn_mine_punji_02_mag",
                        "vn_mine_punji_03_mag",
                        "apersminedispenser_mag"
                       ];
 //-----Sturmgewehr--------------------------------------------------------------------------------------------------
_type56_mag   = [ "vn_type56_mag", "vn_type56_t_mag"];
_M16_mag      = [ "vn_m16_20_mag", "vn_m16_20_t_mag", "vn_m16_30_mag", "vn_m16_30_t_mag", "vn_m16_40_mag", "vn_m16_40_t_mag"];
_M63_mag      = [ "vn_m63a_30_mag", "vn_m63a_30_t_mag"];
_M14_mag      = [ "vn_m14_mag", "vn_m14_t_mag", "vn_m14_10_mag", "vn_m14_10_t_mag"];
_M40_mag      = [ "vn_m40a1_mag", "vn_m40a1_t_mag"];
_M38_mag      = [ "vn_m38_mag", "vn_m38_t_mag"];
_sks_mag      = [ "vn_sks_mag","vn_sks_t_mag"];
_sks__22mm    = [ "vn_22mm_m60_frag_mag","vn_22mm_m60_heat_mag","vn_22mm_lume_mag","vn_22mm_m22_smoke_mag","vn_22mm_m19_wp_mag","vn_22mm_cs_mag"];
_M1_mag       = [ "vn_carbine_15_mag","vn_carbine_15_t_mag","vn_carbine_30_mag","vn_carbine_30_t_mag"];
_M1_22mm      = [ "vn_22mm_m1a2_frag_mag","vn_22mm_m17_frag_mag","vn_22mm_m9_heat_mag","vn_22mm_lume_mag","vn_22mm_m22_smoke_mag","vn_22mm_m19_wp_mag","vn_22mm_cs_mag"]; 
_M4956_mag    = [ "vn_m4956_10_mag","vn_m4956_10_t_mag"];
_M4956_22mm   = [ "vn_22mm_he_mag","vn_22mm_m9_heat_mag","vn_22mm_lume_mag","vn_22mm_m22_smoke_mag","vn_22mm_m19_wp_mag","vn_22mm_cs_mag"];
_XM_148_40mm1 = [ "vn_40mm_m381_he_mag", "vn_40mm_m406_he_mag", "vn_40mm_m397_ab_mag", "vn_40mm_m433_hedp_mag","vn_40mm_m651_cs_mag"];
_XM_148_40mm2 = [ "vn_40mm_m583_flare_w_mag","vn_40mm_m661_flare_g_mag", "vn_40mm_m662_flare_r_mag", "vn_40mm_m695_flare_y_mag"];
_XM_148_40mm3 = [ "vn_40mm_m680_smoke_w_mag","vn_40mm_m682_smoke_r_mag", "vn_40mm_m715_smoke_g_mag", "vn_40mm_m716_smoke_y_mag", "vn_40mm_m717_smoke_p_mag"]; 

_AlleSturmgewehr = [
                    ["vn_type56"           ,_type56_mag],
                    ["vn_type56_bayo"      ,_type56_mag],
                    ["vn_m16"              ,_M16_mag   ], 
                    ["vn_m16_bayo"         ,_M16_mag   ],
                    ["vn_m16_sd"           ,_M16_mag   ], 
                    ["vn_m16_mrk"          ,_M16_mag   ],
                    ["vn_m16_mrk_sd"       ,_M16_mag   ],
                    ["vn_m16_sniper"       ,_M16_mag   ],
                    ["vn_m16_sniper_sd"    ,_M16_mag   ],
                    ["vn_m16_nvg"          ,_M16_mag   ],
                    ["vn_m16_nvg_sd"       ,_M16_mag   ],
                    ["vn_m16_muzzle"       ,_M16_mag   ],
                    ["vn_m16_xm148"        ,_M16_mag    , _XM_148_40mm1, _XM_148_40mm3, _XM_148_40mm3],
                    ["vn_xm177"            ,_M16_mag   ],
                    ["vn_xm177_camo"       ,_M16_mag   ],
                    ["vn_xm177_mrk"        ,_M16_mag   ],
                    ["vn_xm177_sniper"     ,_M16_mag   ],
                    ["vn_xm177_muzzle"     ,_M16_mag   ],
                    ["vn_xm177_xm148"      ,_M16_mag    , _XM_148_40mm1, _XM_148_40mm3, _XM_148_40mm3],
                    ["vn_xm177_xm148_camo" ,_M16_mag    , _XM_148_40mm1, _XM_148_40mm3, _XM_148_40mm3],
                    ["vn_xm177_fg"         ,_M16_mag   ],
                    ["vn_xm177_short"      ,_M16_mag   ],
                    ["vn_xm177_stock"      ,_M16_mag   ],
                    ["vn_xm177_stock_camo" ,_M16_mag   ],
                    ["vn_m63a"             ,_M63_mag   ],
                    ["vn_m14"              ,_M14_mag   ],
                    ["vn_m14_camo"         ,_M14_mag   ],
                    ["vn_m14_sd"           ,_M14_mag   ],
                    ["vn_m14_bayo"         ,_M14_mag   ],
                    ["vn_m21"              ,_M14_mag   ],
                    ["vn_m21_sd"           ,_M14_mag   ],
                    ["vn_m21_nvg"          ,_M14_mag   ],
                    ["vn_m21_nvg_sd"       ,_M14_mag   ],
                    ["vn_m40a1"            ,_M40_mag   ],
                    ["vn_m40a1_sniper"     ,_M40_mag   ],
                    ["vn_m40a1_sniper_sd"  ,_M40_mag   ],
                    ["vn_m40a1_nvg"        ,_M40_mag   ],
                    ["vn_m40a1_nvg_sd"     ,_M38_mag   ],
                    ["vn_m38"              ,_M38_mag   ],
                    ["vn_m38_bayo"         ,_M38_mag   ],
                    ["vn_m1891"            ,_M38_mag   ], 
                    ["vn_m1891_bayo"       ,_M38_mag   ],
                    ["vn_m9130"            ,_M38_mag   ],
                    ["vn_m9130_bayo"       ,_M38_mag   ], 
                    ["vn_m9130_sniper"     ,_M38_mag   ],
                    ["vn_sks"              ,_sks_mag   ],
                    ["vn_sks_bayo"         ,_sks_mag   ], 
                    ["vn_sks_gl"           ,_sks_mag    , _sks__22mm],
                    ["vn_sks_sniper"       ,_sks_mag   ],  
                    ["vn_m1carbine"        ,_M1_mag    ], 
                    ["vn_m2carbine"        ,_M1_mag    ],
                    ["vn_m3carbine"        ,_M1_mag    ],
                    ["vn_m1carbine_gl"     ,_M1_mag     ,_M1_22mm],
                    ["vn_m2carbine_gl"     ,_M1_mag     ,_M1_22mm],
                    ["vn_m1carbine_sniper" ,_M1_mag    ],
                    ["vn_m2carbine_sniper" ,_M1_mag    ],
                    ["vn_m1carbine_bayo"   ,_M1_mag    ],
                    ["vn_m2carbine_bayo"   ,_M1_mag    ],
                    ["vn_m4956"            ,_M4956_mag ],
                    ["vn_m4956_bayo"       ,_M4956_mag ], 
                    ["vn_m4956_sniper"     ,_M4956_mag ],
                    ["vn_m4956_gl"         ,_M4956_mag  ,_M4956_22mm]
                   ];                       
//-----MG-------------------------------------------------------------------------------------------------

_Alle_Leichten_MG = [
                     "vn_rpd"            ,
                     "vn_rpd_shorty"     ,
                     "vn_dp28"           ,
                     "vn_pk"             ,
                     "vn_m60"            ,
                     "vn_m60_shorty"     ,
                     "vn_m60_shorty_camo"
                    ];
//----Panzerfaust---------------------------------------------------------------------------------------------------                    
_Alle_Panzerfauste = [
                      "vn_rpg2",
                      "vn_rpg7",
                      "vn_m72"
                     ];
//----Leuchtracketen---------------------------------------------------------------------------------------------------                      
_Alle_Leuchtracketen = ["vn_m127"];
                       

//--Granatwerfer---------------------------------------------------------------------------------------
_M79_mag1 = ["vn_40mm_m381_he_mag","vn_40mm_m406_he_mag","vn_40mm_m397_ab_mag","vn_40mm_m433_hedp_mag"];
_M79_mag2 = ["vn_40mm_m583_flare_w_mag","vn_40mm_m661_flare_g_mag","vn_40mm_m662_flare_r_mag","vn_40mm_m695_flare_y_mag"];
_M79_mag3 = ["vn_40mm_m680_smoke_w_mag","vn_40mm_m682_smoke_r_mag","vn_40mm_m715_smoke_g_mag","vn_40mm_m716_smoke_y_mag","vn_40mm_m717_smoke_p_mag"];
_M79_mag4 = ["vn_40mm_m651_cs_mag","vn_40mm_m576_buck_mag"];

_Alle_Granatwerfer = [
                      ["vn_m79",_M79_mag1,_M79_mag2,_M79_mag3,_M79_mag4],
                      ["vn_m79_p",_M79_mag1,_M79_mag2,_M79_mag3,_M79_mag4]
                     ];
//-------items--fur--CargoGlobal------------------------------------------------------------------
_Alle_items = [
               "Files"                  ,
               "FilesSecret"            ,
               "DocumentsSecret"        ,
               "Wallet_ID"              ,
               "FileNetworkStructure"   ,
               "FileTopSecret"          ,
               "Binocular"              ,
               "vn_b_item_trapkit"      ,
               "vn_o_item_radio_m252"   ,
               "vn_b_item_radio_urc10"  ,
               "vn_o_item_firstaidkit"  ,
               "vn_o_item_map"          ,
               "vn_b_item_map"          ,
               "vn_b_item_firstaidkit"  ,
               "vn_b_item_toolkit"      ,
               "vn_b_item_compass_sog"  ,
               "vn_b_item_compass"      ,
               "vn_b_item_medikit_01h"  ,
               "Item_Wallet_traitor"       
              ];
//-------items--fur--createVehicle-----------------------------------------------------------------------
_Alle_items_1 = [
                 "Item_Files"                ,
                 "Item_FilesSecret"          ,
                 "Item_Wallet_traitor"       ,
                 "Item_FileTopSecret"        ,
                 "Item_SecretDocuments"      ,
                 "Item_Binocular"            ,
                 "Land_File_research_F"      ,
                 "vn_b_item_trapkit_gh"      ,
                 "vn_o_item_radio_m252_gh"   ,
                 "vn_b_item_watch_gh"        ,
                 "vn_b_item_radio_urc10_gh"  ,
                 "vn_o_item_firstaidkit_gh"  ,
                 "vn_o_item_map_gh"          ,
                 "vn_b_item_map_gh"          ,
                 "vn_b_item_firstaidkit_gh"  ,
                 "vn_b_item_toolkit_gh"      ,
                 "vn_b_item_compass_sog_gh"  ,
                 "vn_b_item_compass_gh"      ,
                 "vn_b_item_medikit_01_gh"   ,
                 "Item_Wallet_traitor"       
               ];
//-------items--Medizin--fur--createVehicle-----------------------------------------------------------------------
_Alle_Medizin = [                                
                 "vn_o_item_firstaidkit_gh"  ,
                 "vn_b_item_firstaidkit_gh"  ,
                 "vn_b_item_medikit_01_gh" 
                ];               
//-------items--Medizin--fur--CargoGlobal-------------------------------------------------------------------------
_Alle_Medizin_1 = [                                
                   "vn_o_item_firstaidkit"  ,
                   "vn_b_item_firstaidkit"  ,
                   "vn_b_item_medikit_01" 
                  ];                               
//-- Rucksacke--------------------------------------------------------------------------------------
_Alle_Rucksacke = ["vn_b_pack_04_02",
                   "vn_b_pack_m5_01",
                   "vn_b_pack_lw_04",
                   "vn_b_pack_trp_03_02"
                  ];

//--Erzeugen----------------------------------------------------------------------------------------------- 
//---------------------------------------------------------------------------------------------------------
//-----Zelt--Medizin---------------------------------------------------------------------------------------
if (_Objeckt == "Zelt") then {_House addItemCargoGlobal ["vn_o_item_firstaidkit",(round(Random 20))];
                              _House addItemCargoGlobal ["vn_b_item_firstaidkit",(round(Random 20))];
                              _House addItemCargoGlobal ["vn_b_item_medikit_01" ,(round(Random  3))];
                              _House addItemCargoGlobal ["vn_b_pack_04_02"      ,(round(Random  3))];              
                             };

//-----item--Medizin---------------------------------------------------------------------------------------
if (_Objeckt == "Medi") then { _item = _Alle_Medizin call BIS_fnc_selectRandom;
                               _item = createVehicle [_item,[0,0,0]]; 
                              [_House,_item,_pos,_W] call BIS_fnc_relPosObject;_item enableSimulation True ;
                             };
//-----item-----------------------------------------------------------------------------------------
if (_Objeckt == "item") then { _item = _Alle_items_1 call BIS_fnc_selectRandom;
                               _item = createVehicle [_item,[0,0,0]]; 
                              [_House,_item,_pos,_W] call BIS_fnc_relPosObject;_item enableSimulation True ;
                             };
//-----Kiste-mit-Medizin-------------------------------------------------------------------------------------
if (_Objeckt == "MediK") then {_Kiste = ((_Kiste_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                               _Kiste addItemCargoGlobal [_Alle_Medizin_1 select 0,(round(Random 20))];
                               _Kiste addItemCargoGlobal [_Alle_Medizin_1 select 1,(round(Random 20))];
                               _Kiste addItemCargoGlobal [_Alle_Medizin_1 select 2,(round(Random  3))];
                               [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                              };


//-----Kiste-mit-Gewehr-------------------------------------------------------------------------------------
if (_Objeckt == "Gewehr") then {_Kiste = ((_Kiste_Gewehr call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                _Waffenart =_AlleSturmgewehr call BIS_fnc_selectRandom;
                                _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,4];
                                _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,40];
                                if ((count _Waffenart) > 2) then {_mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,10];};
                                if ((count _Waffenart) > 3) then {_mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,10];};
                                if ((count _Waffenart) > 4) then {_mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,10];};
                               [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                              };
                                                      
                              
//-----WeaponHolder-----------------------------------------------------------------------------------------

if (_Objeckt == "waffe") then {                    _T = ([1,2,3,4,5,6,7,8] call BIS_fnc_selectRandom);
	                                             _Kiste = "groundWeaponHolder" createVehicle [0,0,0];
	                           if (_T == 1) then { _Waffe = _AllePistolen call BIS_fnc_selectRandom;
                                                     _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                     _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                     _Kiste addMagazineCargoGlobal[_mag,6];
                                                   };
                                 if (_T == 2) then {_mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,6];
                                                   };
                                 if (_T == 3) then {_mag =_Alle_Minen call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,3];
                                                   };
                                 if (_T == 4) then {_Waffenart =_AlleSturmgewehr call BIS_fnc_selectRandom;
                                                    _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                    _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,4];
                                                    if ((count _Waffenart) > 2) then {_mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(floor(Random 2))];};
                                                    if ((count _Waffenart) > 3) then {_mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(floor(Random 2))];};
                                                    if ((count _Waffenart) > 4) then {_mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(floor(Random 2))];};
                                                   };
                                 if (_T == 5) then { _Waffe = _Alle_Leichten_MG  call BIS_fnc_selectRandom;
                                                     _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                     _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                     _Kiste addMagazineCargoGlobal[_mag,4];                
                                                   };
                                 if (_T == 6) then {_Waffe = _Alle_Panzerfauste  call BIS_fnc_selectRandom;
                                                    _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                    _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                    _Kiste addMagazineCargoGlobal[_mag,2];                
                                                  };
                                if (_T == 7) then { _Waffe = "vn_m127";
                                                   _mag =(([_Waffe] call BIS_fnc_compatibleMagazines)call BIS_fnc_selectRandom);
                                                   _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                   _Kiste addMagazineCargoGlobal[_mag,6];
                                                  };                 
                                if (_T == 8) then {_Waffenart =_Alle_Granatwerfer call BIS_fnc_selectRandom;
                                                   _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                   _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(floor(Random 4))];
                                                   _mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(floor(Random 2))];
                                                   _mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(floor(Random 2))];
                                                   _mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(floor(Random 2))];                                                                  
                                                  };
                                                  [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                              };


//-----Kiste-klein-----------------------------------------------------------------------------------------

if (_Objeckt == "klein") then {switch ([1,2,3,4,5,6,7,8,9,10] call BIS_fnc_selectRandom) do {

	 
                                               case 1: {_Kiste = ((_Kiste_Granaten call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = _AllePistolen call BIS_fnc_selectRandom;
                                                        _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,10];
                                                        _Kiste addMagazineCargoGlobal[_mag,100];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                       };       
                                               case 2: {_Kiste = ((_Kiste_Granaten call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;
                                                        _Kiste addMagazineCargoGlobal[_mag,30];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                       };        
                                               case 3: {_Kiste = ((_Kiste_Granaten call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _mag =_Alle_Minen call BIS_fnc_selectRandom;
                                                        _Kiste addMagazineCargoGlobal[_mag,6];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                       };
                                               case 4: {_Kiste = ((_Kiste_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = _AllePistolen call BIS_fnc_selectRandom; 
                                                        _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,2];
                                                        _Kiste addMagazineCargoGlobal[_mag,20];
                                                        _mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;
                                                        _Kiste addMagazineCargoGlobal[_mag,8];
                                                        _mag =_Alle_Minen call BIS_fnc_selectRandom;
                                                        _Kiste addMagazineCargoGlobal[_mag,2];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                        };       
                                               case 5: {_Kiste = ((_Kiste_Gewehr call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffenart =_AlleSturmgewehr call BIS_fnc_selectRandom;
                                                        _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,4];
                                                        _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,40];
                                                        if ((count _Waffenart) > 2) then {_mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,10];};
                                                        if ((count _Waffenart) > 3) then {_mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,10];};
                                                        if ((count _Waffenart) > 4) then {_mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,10];};
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                        };
                                               case 6: {_Kiste = ((_Kiste_Gewehr call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = _Alle_Leichten_MG  call BIS_fnc_selectRandom;
                                                        _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                        _Kiste addMagazineCargoGlobal[_mag,8];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                        };
                                               case 7: {_Kiste = ((_Kiste_Gewehr call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = _Alle_Panzerfauste  call BIS_fnc_selectRandom;
                                                        _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                        _Kiste addMagazineCargoGlobal[_mag,8];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;                                
                                                       };
                                               case 8: {_Kiste = ((_Kiste_Granaten select 0 ) createVehicle [0,0,0]);
                                                        _Waffe = "vn_m127";
                                                        _mag =(([_Waffe] call BIS_fnc_compatibleMagazines)call BIS_fnc_selectRandom);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,4];
                                                        _Kiste addMagazineCargoGlobal[_mag,40];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                       }; 
                                               case 9: {_Kiste = ((_Kiste_Gewehr call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffenart =_Alle_Granatwerfer call BIS_fnc_selectRandom;
                                                        _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,2];
                                                        _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,8];
                                                        _mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,8];
                                                        _mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,8];
                                                        _mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,4];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                        }; 
                                               case 10: {_Kiste = ((_Kiste_Granaten call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = _AllePistolen call BIS_fnc_selectRandom;
                                                        _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                        _Kiste addMagazineCargoGlobal[_mag,10];
                                                        _item = _Alle_Rucksacke call BIS_fnc_selectRandom;
                                                        _Kiste addBackpackCargoGlobal [_item,(round(Random 5))];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                       };                                                                           
       	                                    default {};
                                              };};

//--Kiste-gross---------------------------------------------------------------------------------------
if (_Objeckt == "gross") then {                                          
                               _Kiste = ((_Kiste_Gross call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                               _T =(floor(Random 3));   
                               if (_T > 1) then { _Waffe = _AllePistolen call BIS_fnc_selectRandom;
                                                  _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                  _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 10))];
                                                  _Kiste addMagazineCargoGlobal[_mag,(round(Random 100))];
                                                };
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 40))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 40))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 40))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Minen call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Minen call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Minen call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_Waffenart =_AlleSturmgewehr call BIS_fnc_selectRandom;
                                                 _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 10))];
                                                 _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 100))];
                                                if ((count _Waffenart) > 2) then {_mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                                                if ((count _Waffenart) > 3) then {_mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                                                if ((count _Waffenart) > 4) then {_mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                                                };
                                _T =(floor(Random 3));   
                               if (_T > 1) then {_Waffenart =_AlleSturmgewehr call BIS_fnc_selectRandom;
                                                 _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 10))];
                                                 _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 100))];
                                                if ((count _Waffenart) > 2) then {_mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                                                if ((count _Waffenart) > 3) then {_mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                                                if ((count _Waffenart) > 4) then {_mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                                                };                
                                _T =(floor(Random 3));   
                               if (_T > 1) then {_Waffenart =_AlleSturmgewehr call BIS_fnc_selectRandom;
                                                 _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 10))];
                                                 _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 100))];
                                                if ((count _Waffenart) > 2) then {_mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                                                if ((count _Waffenart) > 3) then {_mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                                                if ((count _Waffenart) > 4) then {_mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                                                };                
                                _T =(floor(Random 3));   
                               if (_T > 1) then { _Waffe = _Alle_Leichten_MG  call BIS_fnc_selectRandom;
                                                  _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                  _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 4))];
                                                  _Kiste addMagazineCargoGlobal[_mag,(round(Random 40))];                
                                                };
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_Waffe = _Alle_Panzerfauste  call BIS_fnc_selectRandom;
                                                 _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                 _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 4))];
                                                 _Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];                
                                                };
                               _T =(floor(Random 3));   
                               if (_T > 1) then { _Waffe = "vn_m127";
                                                  _mag =(([_Waffe] call BIS_fnc_compatibleMagazines)call BIS_fnc_selectRandom);
                                                  _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 4))];
                                                  _Kiste addMagazineCargoGlobal[_mag,(round(Random 40))];
                                                  };                 
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_Waffenart =_Alle_Granatwerfer call BIS_fnc_selectRandom;
                                                 _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,2];
                                                 _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 8))];
                                                 _mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 8))];
                                                 _mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 8))];
                                                 _mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 4))];                                                                  
                                                };
                               _T =(floor(Random 4 ));   
                               if (_T > 1) then {_item = _Alle_Rucksacke call BIS_fnc_selectRandom;
                                                 _Kiste addBackpackCargoGlobal [_item,(round(Random 5))];
                                                };
                               _T =(floor(Random 4));   
                               if (_T > 1) then {_item = _Alle_items call BIS_fnc_selectRandom;
                                                 _Kiste addItemCargoGlobal [_item,(round(Random 3))];
                                                 };
                               _T =(floor(Random 4));   
                               if (_T > 1) then {_item = _Alle_items call BIS_fnc_selectRandom;
                                                 _Kiste addItemCargoGlobal [_item,(round(Random 3))];
                                                };
                               _T =(floor(Random 4));   
                               if (_T > 1) then {_item = _Alle_items call BIS_fnc_selectRandom;
                                                 _Kiste addItemCargoGlobal [_item,(round(Random 3))];
                                                };
                                                [_House,_Kiste,_pos,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                             };                                                     
//-----Kiste-klein-zivil----------------------------------------------------------------------------------------

if (_Objeckt == "klein_zivil") then {switch ([1,2,3,4,5,6,7,8,9,10] call BIS_fnc_selectRandom) do {

	 
                                               case 1: {_Kiste = "ContainerSupply" createVehicle [0,0,0];
                                                        _K001 = ((_Kiste_zivil_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = _AllePistolen call BIS_fnc_selectRandom;
                                                        _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,2];
                                                        _Kiste addMagazineCargoGlobal[_mag,20];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                        [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                       };       
                                               case 2: {_Kiste = "ContainerSupply" createVehicle [0,0,0];
                                                        _K001 = ((_Kiste_zivil_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;
                                                        _Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                        [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                       };        
                                               case 3: {_Kiste = "ContainerSupply" createVehicle [0,0,0];
                                                        _K001 = ((_Kiste_zivil_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _mag =_Alle_Minen call BIS_fnc_selectRandom;
                                                        _Kiste addMagazineCargoGlobal[_mag,(round(Random 8))];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                        [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                       };
                                               case 4: {_Kiste = "ContainerSupply" createVehicle [0,0,0];
                                                        _K001 = ((_Kiste_zivil_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = _AllePistolen call BIS_fnc_selectRandom; 
                                                        _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                        _Kiste addMagazineCargoGlobal[_mag,10];
                                                        _mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;
                                                        _Kiste addMagazineCargoGlobal[_mag,(round(Random 8))];
                                                        _mag =_Alle_Minen call BIS_fnc_selectRandom;
                                                        _Kiste addMagazineCargoGlobal[_mag,(round(Random 6))];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                        [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                        };       
                                               case 5: {_Kiste = "ContainerSupply" createVehicle [0,0,0];
                                                        _K001 = ((_Kiste_zivil_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffenart =_AlleSturmgewehr call BIS_fnc_selectRandom;
                                                        _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,2];
                                                        _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,20];
                                                        if ((count _Waffenart) > 2) then {_mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,5];};
                                                        if ((count _Waffenart) > 3) then {_mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,5];};
                                                        if ((count _Waffenart) > 4) then {_mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,5];};
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                        [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                        };
                                               case 6: {_Kiste = "ContainerSupply" createVehicle [0,0,0];
                                                        _K001 = ((_Kiste_zivil_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = _Alle_Leichten_MG  call BIS_fnc_selectRandom;
                                                        _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                        _Kiste addMagazineCargoGlobal[_mag,8];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                        [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                        };
                                               case 7: {_Kiste = "ContainerSupply" createVehicle [0,0,0];
                                                        _K001 = ((_Kiste_zivil_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = _Alle_Panzerfauste  call BIS_fnc_selectRandom;
                                                        _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                        _Kiste addMagazineCargoGlobal[_mag,8];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                        [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;           
                                                       };
                                               case 8: {_Kiste = "ContainerSupply" createVehicle [0,0,0];
                                                        _K001 = ((_Kiste_zivil_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = "vn_m127";
                                                        _mag =(([_Waffe] call BIS_fnc_compatibleMagazines)call BIS_fnc_selectRandom);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,2];
                                                        _Kiste addMagazineCargoGlobal[_mag,20];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                        [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                       }; 
                                               case 9: {_Kiste = "ContainerSupply" createVehicle [0,0,0];
                                                        _K001 = ((_Kiste_zivil_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffenart =_Alle_Granatwerfer call BIS_fnc_selectRandom;
                                                        _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,2];
                                                        _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,8];
                                                        _mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,8];
                                                        _mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,8];
                                                        _mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,4];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                        [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                        }; 
                                               case 10: {_Kiste = "ContainerSupply" createVehicle [0,0,0];
                                                        _K001 = ((_Kiste_zivil_klein call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                                                        _Waffe = _AllePistolen call BIS_fnc_selectRandom;
                                                        _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                        _Kiste addWeaponCargoGlobal [_Waffe,1];
                                                        _Kiste addMagazineCargoGlobal[_mag,10];
                                                        _item = _Alle_Rucksacke call BIS_fnc_selectRandom;
                                                        _Kiste addBackpackCargoGlobal [_item,(round(Random 3))];
                                                        _item = _Alle_items call BIS_fnc_selectRandom;_Kiste addItemCargoGlobal [_item,1];
                                                        [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                        [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                       };                                                                           
       	                                    default {};
                                              };};
//--Kiste-gross-zivil--------------------------------------------------------------------------------------
if (_Objeckt == "gross_zivil")  then {                                          
                               _Kiste = "ContainerSupply" createVehicle [0,0,0];
                               _K001 = (( _Kiste_zivil_Gross call BIS_fnc_selectRandom) createVehicle [0,0,0]);
                               _T =(floor(Random 3));   
                               if (_T > 1) then { _Waffe = _AllePistolen call BIS_fnc_selectRandom;
                                                  _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                  _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 3))];
                                                  _Kiste addMagazineCargoGlobal[_mag,(round(Random 30))];
                                                };
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Hand_Granaten call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Minen call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Minen call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_mag =_Alle_Minen call BIS_fnc_selectRandom;_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_Waffenart =_AlleSturmgewehr call BIS_fnc_selectRandom;
                                                 _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 4))];
                                                 _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 40))];
                                                if ((count _Waffenart) > 2) then {_mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                                                if ((count _Waffenart) > 3) then {_mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                                                if ((count _Waffenart) > 4) then {_mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                                                };
                                _T =(floor(Random 3));   
                               if (_T > 1) then {_Waffenart =_AlleSturmgewehr call BIS_fnc_selectRandom;
                                                 _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 10))];
                                                 _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 40))];
                                                if ((count _Waffenart) > 2) then {_mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                                                if ((count _Waffenart) > 3) then {_mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                                                if ((count _Waffenart) > 4) then {_mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                                                };                
                                _T =(floor(Random 3));   
                               if (_T > 1) then {_Waffenart =_AlleSturmgewehr call BIS_fnc_selectRandom;
                                                 _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 10))];
                                                 _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 40))];
                                                if ((count _Waffenart) > 2) then {_mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                                                if ((count _Waffenart) > 3) then {_mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                                                if ((count _Waffenart) > 4) then {_mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];};
                                                };                
                                _T =(floor(Random 3));   
                               if (_T > 1) then { _Waffe = _Alle_Leichten_MG  call BIS_fnc_selectRandom;
                                                  _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                  _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 2))];
                                                  _Kiste addMagazineCargoGlobal[_mag,(round(Random 20))];                
                                                };
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_Waffe = _Alle_Panzerfauste  call BIS_fnc_selectRandom;
                                                 _mag = (([_Waffe] call BIS_fnc_compatibleMagazines)select 0);
                                                 _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 2))];
                                                 _Kiste addMagazineCargoGlobal[_mag,(round(Random 10))];                
                                                };
                               _T =(floor(Random 3));   
                               if (_T > 1) then { _Waffe = "vn_m127";
                                                  _mag =(([_Waffe] call BIS_fnc_compatibleMagazines)call BIS_fnc_selectRandom);
                                                  _Kiste addWeaponCargoGlobal [_Waffe,(round(Random 4))];
                                                  _Kiste addMagazineCargoGlobal[_mag,(round(Random 40))];
                                                  };                 
                               _T =(floor(Random 3));   
                               if (_T > 1) then {_Waffenart =_Alle_Granatwerfer call BIS_fnc_selectRandom;
                                                 _Waffe =  _Waffenart select 0; _Kiste addWeaponCargoGlobal [_Waffe,2];
                                                 _mag = ((_Waffenart select 1) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 8))];
                                                 _mag = ((_Waffenart select 2) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 8))];
                                                 _mag = ((_Waffenart select 3) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 8))];
                                                 _mag = ((_Waffenart select 4) call BIS_fnc_selectRandom);_Kiste addMagazineCargoGlobal[_mag,(round(Random 4))];                                                                  
                                                };
                               _T =(floor(Random 4 ));   
                               if (_T > 1) then {_item = _Alle_Rucksacke call BIS_fnc_selectRandom;
                                                 _Kiste addBackpackCargoGlobal [_item,(round(Random 5))];
                                                };
                               _T =(floor(Random 4));   
                               if (_T > 1) then {_item = _Alle_items call BIS_fnc_selectRandom;
                                                 _Kiste addItemCargoGlobal [_item,(round(Random 3))];
                                                 };
                               _T =(floor(Random 4));   
                               if (_T > 1) then {_item = _Alle_items call BIS_fnc_selectRandom;
                                                 _Kiste addItemCargoGlobal [_item,(round(Random 3))];
                                                };
                               _T =(floor(Random 4));   
                               if (_T > 1) then {_item = _Alle_items call BIS_fnc_selectRandom;
                                                 _Kiste addItemCargoGlobal [_item,(round(Random 3))];
                                                };
                                                [_House,_K001,_pos,_W] call BIS_fnc_relPosObject;
                                                [_House,_Kiste,_pos001,_W] call BIS_fnc_relPosObject;_Kiste enableSimulation True ;
                                                };                                                                           
                                                                                                  
exit;                                               
                                               
