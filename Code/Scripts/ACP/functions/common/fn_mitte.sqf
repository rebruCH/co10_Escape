private["_Objekte","_Z","_Ax","_Ay"];

_Objekte = _this;
_Z = (Count _Objekte) ;
_Ax = 0;
_Ay = 0;

{_Ax = _Ax + (getpos _x select 0);_Ay = _Ay + (getpos _x select 1)}forEach _Objekte;


_Ax = _Ax / _Z;
_Ay = _Ay / _Z;

[_Ax,_Ay,0]


























