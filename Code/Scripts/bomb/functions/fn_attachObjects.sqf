params ["_object"];
diag_log format ["fn_attachObjects | _object: %1", _object];

if !(typeOf _object in ["Land_MetalBarrel_F"]) exitWith 
{
    diag_log format ["fn_attachObjects | _object: %1 is not a barrel", _object];
};

_light = createVehicle ["PortableHelipadLight_01_red_F", [0,0,0], [], 0, "CAN_COLLIDE"];
_light attachTo [_object,[0,0,0.45]];

{
    _x params["_offset", "_dirAndUp"];
    _c4 = createSimpleObject ["a3\weapons_f\explosives\c4_charge_small.p3d", [0,0,0]];
    _c4 attachTo [_object, _offset];
    _c4 setVectorDirAndUp _dirAndUp;
}
forEach 
[
    [[0,0.3,0], [[1, 0, 0], [0,1,0]]],
    [[0,-0.3,0], [[-1,0,0],[0,-1,0]]],
    [[0.3,0,0], [[0,-1,0],[1,0,0]]],
    [[-0.3,0,0], [[0,1,0],[-1,0,0]]]
];
