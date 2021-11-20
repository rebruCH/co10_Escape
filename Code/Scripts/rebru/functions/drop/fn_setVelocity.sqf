params ["_speed", "_direction"];
//systemChat format["speed is %1, direction is %2", _speed, _direction];

private _velocity = [ _speed * (sin _direction), _speed * (cos _direction), 1 ];

_velocity;