private["_Objects","_Object_Liste_Jorg"];
if !(isServer) exitWith{};

_Object_Liste_Jorg = [];

while {true} do {
                    {if ((getpos _x select 2) < 10) then { _Objects = nearestObjects [(getpos _x), ["Land_vn_cave_base",
                                                                                                    "Land_vn_hut_01",
                                                                                                    "Land_vn_building_b_base",
                                                                                                    "Land_vn_building_urban_base",
                                                                                                    "Land_vn_fort_base"
                                                                                                   ],100];
                    };
                }forEach units group player ;                                       

                          _Objects = _Objects - _Object_Liste_Jorg;
                _Object_Liste_Jorg = _Object_Liste_Jorg + _Objects;

                {_x call ACP_fnc_holen;}foreach _Objects;
 
       sleep 5;
 }; 
 
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
                                  