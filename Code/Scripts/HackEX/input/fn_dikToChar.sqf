params["_dikCode","_shift","_control"];

private _char = "";
//hint format["Shift: %1 | _dikCode: %2",_shift, _dikCode];

switch(_dikCode) do {

	case 1: {  if (_shift) then { _char = "@ESC"; } else { _char = "@ESC";  }; };
	case 2: {  if (_shift) then { _char = "+"; } else { _char = "1";  }; };
	case 3: {  if (_shift) then { _char = """"; } else { _char = "2";  }; };
	case 4: {  if (_shift) then { _char = "*"; } else { _char = "3";  }; };
	case 5: {  if (_shift) then { _char = "ç"; } else { _char = "4";  }; };
	case 6: {  if (_shift) then { _char = "%"; } else { _char = "5";  }; };
	case 7: {  if (_shift) then { _char = "&"; } else { _char = "6";  }; };
	case 8: {  if (_shift) then { _char = "/"; } else { _char = "7";  }; };
	case 9: {  if (_shift) then { _char = "("; } else { _char = "8";  }; };
	case 10: {  if (_shift) then { _char = ")"; } else { _char = "9";  }; };
	case 11: {  if (_shift) then { _char = "="; } else { _char = "0";  }; };
	case 12: {  if (_shift) then { _char = "?"; } else { _char = "";  }; };
	case 13: {  if (_shift) then { _char = "`"; } else { _char = "^";  }; };
	case 14: {  if (_shift) then { _char = "@BACKSPACE"; } else { _char = "@BACKSPACE";  }; };
	case 15: {  if (_shift) then { _char = "@TAB"; } else { _char = "@TAB";  }; };
	case 16: {  if (_shift) then { _char = "Q"; } else { _char = "q";  }; };
	case 17: {  if (_shift) then { _char = "W"; } else { _char = "w";  }; };
	case 18: {  if (_shift) then { _char = "E"; } else { _char = "e";  }; };
	case 19: {  if (_shift) then { _char = "R"; } else { _char = "r";  }; };
	case 20: {  if (_shift) then { _char = "T"; } else { _char = "t";  }; };
	case 21: {  if (_shift) then { _char = "Z"; } else { _char = "z";  }; };
	case 22: {  if (_shift) then { _char = "U"; } else { _char = "u";  }; };
	case 23: {  if (_shift) then { _char = "I"; } else { _char = "i";  }; };
	case 24: {  if (_shift) then { _char = "O"; } else { _char = "o";  }; };
	case 25: {  if (_shift) then { _char = "P"; } else { _char = "p";  }; };
	case 26: {  if (_shift) then { _char = "è"; } else { _char = "ü";  }; };
	case 27: {  if (_shift) then { _char = "!"; } else { _char = "¨";  }; };
	case 28: {  if (_shift) then { _char = "@ENTER"; } else { _char = "@ENTER";  }; };
	case 30: {  if (_shift) then { _char = "A"; } else { _char = "a";  }; };
	case 31: {  if (_shift) then { _char = "S"; } else { _char = "s";  }; };
	case 32: {  if (_shift) then { _char = "D"; } else { _char = "d";  }; };
	case 33: {  if (_shift) then { _char = "F"; } else { _char = "f";  }; };
	case 34: {  if (_shift) then { _char = "G"; } else { _char = "g";  }; };
	case 35: {  if (_shift) then { _char = "H"; } else { _char = "h";  }; };
	case 36: {  if (_shift) then { _char = "J"; } else { _char = "j";  }; };
	case 37: {  if (_shift) then { _char = "K"; } else { _char = "k";  }; };
	case 38: {  if (_shift) then { _char = "L"; } else { _char = "l";  }; };
	case 39: {  if (_shift) then { _char = "é"; } else { _char = "ö";  }; };
	case 40: {  if (_shift) then { _char = "à"; } else { _char = "ä";  }; };
	case 41: {  if (_shift) then { _char = "£"; } else { _char = "$";  }; };
	case 43: {  if (_shift) then { _char = ">"; } else { _char = "<";  }; };
	case 44: {  if (_shift) then { _char = "Y"; } else { _char = "y";  }; };
	case 45: {  if (_shift) then { _char = "X"; } else { _char = "x";  }; };
	case 46: {  if (_shift) then { _char = "C"; } else { _char = "c";  }; };
	case 47: {  if (_shift) then { _char = "V"; } else { _char = "v";  }; };
	case 48: {  if (_shift) then { _char = "B"; } else { _char = "b";  }; };
	case 49: {  if (_shift) then { _char = "N"; } else { _char = "n";  }; };
	case 50: {  if (_shift) then { _char = "M"; } else { _char = "m";  }; };
	case 51: {  if (_shift) then { _char = ";"; } else { _char = ",";  }; };
	case 52: {  if (_shift) then { _char = ":"; } else { _char = ".";  }; };
	case 53: {  if (_shift) then { _char = "_"; } else { _char = "-";  }; };
	case 55: {  if (_shift) then { _char = "*"; } else { _char = "*";  }; };
	case 57: {  if (_shift) then { _char = " "; } else { _char = " ";  }; };
	case 71: {  if (_shift) then { _char = "7"; } else { _char = "7";  }; };
	case 72: {  if (_shift) then { _char = "8"; } else { _char = "8";  }; };
	case 73: {  if (_shift) then { _char = "9"; } else { _char = "9";  }; };
	case 74: {  if (_shift) then { _char = "-"; } else { _char = "-";  }; };
	case 75: {  if (_shift) then { _char = "4"; } else { _char = "4";  }; };
	case 76: {  if (_shift) then { _char = "5"; } else { _char = "5";  }; };
	case 77: {  if (_shift) then { _char = "6"; } else { _char = "6";  }; };
	case 78: {  if (_shift) then { _char = "+"; } else { _char = "+";  }; };
	case 79: {  if (_shift) then { _char = "1"; } else { _char = "1";  }; };
	case 80: {  if (_shift) then { _char = "2"; } else { _char = "2";  }; };
	case 81: {  if (_shift) then { _char = "3"; } else { _char = "3";  }; };
	case 82: {  if (_shift) then { _char = "0"; } else { _char = "0";  }; };
	case 83: {  if (_shift) then { _char = "."; } else { _char = ".";  }; };
	case 86: {  if (_shift) then { _char = ">"; } else { _char = "<";  }; };
	case 156: {  if (_shift) then { _char = "@ENTER"; } else { _char = "@ENTER";  }; };
	case 181: {  if (_shift) then { _char = "/"; } else { _char = "/";  }; };
	case 200: {  if (_shift) then { _char = "@ARROW_UP"; } else { _char = "@ARROW_UP";  }; };
	case 208: {  if (_shift) then { _char = "@ARROW_DOWN"; } else { _char = "@ARROW_DOWN";  }; };


  default {_char = "";};
};

if (_shift and _dikCode >= 16 and _dikCode <= 49) then {
  _char = toUpper _char;
};

_char;
