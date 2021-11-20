/*
	Generiert ein Passwort mit _count Anzahl Zeichen
*/
params [["_count", 6, [0]]];

private _chars = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];

private _password = "";

//for ("_i" from 0 to 6) do { _password = _password + (selectRandom _chars); };
diag_log format["Count: %1",_count];
for "_i" from 1 to _count do { diag_log (_i); _password = _password + ( (selectRandom _chars )); };

_password;
