/*
  COMMANDS
  Defines custom commands that are available in the terminal.
  Players will be able to see these commands in the HELP and to use them, provided that the clearance level of the account they are logged into is high enough.

  FORMAT:
    [name, aliases, parameters, requiredClearanceLevel, description, code]
    - name (String): the name of the command
    - aliases (Array of Strings): the aliases of the command, i.e. alternative command names.
    - parameters (Array of Parameters):
      [name, isMandatory]
      - name (String): the name of the parameter
      - isMandatory (Boolean): /!\ Not implemented yet
    - requiredClearanceLevel (Integer): the minimum clearance level required in order to see and use the command.
    - description (String): the description of the command (shown in the HELP).
    - code (Code): the code to execute when the command is entered.
      Passed arguments are the following:
      [terminal, params]
        - terminal (Terminal): array containing the terminal's data.
        - params (Array of Strings): array containing the parameters provided by the player.

    NOTE: 'name' and 'aliases' must not contain characters that require using the 'Alt Gr' key.
          Those characters cannot be typed into the terminal interface, therefore preventing players from entering the command.
*/
private _customCommands = [
	[ 
		"secretbox", 
		[], 
		[], 
		3, 
		"Manages the secretbox functionality | status can be lock/unlock", 
		{ 
			params["_terminal", "_params"]; 
			_params params ["_status"];
			if(_status=="lock") then {
				[true] spawn rebru_fnc_setLock;
				[_terminal, "Secretbox is locked"] call HKX_fnc_printf;
			};
			if(_status=="unlock") then {
				[false] spawn rebru_fnc_setLock;
				[_terminal, "Secretbox is unlocked"] call HKX_fnc_printf; 
				[] spawn rebru_fnc_callEscapeReinforcements;
			};		
		} 
	],
	[ 
		"powergrid", 
		[], 
		[["status", true]], 
		7, 
		"Manages the powergrid functionality | status can be ON/OFF", 
		{ 
			params["_terminal", "_params"]; 
			_params params ["_status"];
			[_status, player,2000,150] spawn rebru_fnc_switchLights;
			if(_status == "ON"||_status=="on") then {
				[_terminal, "The power grid is starting"] call HKX_fnc_printf; 
			};
			if(_status=="OFF"||_status=="off") then {
				[_terminal, "The power grid is shutting down"] call HKX_fnc_printf; 
			};
		} 
	],
	[
		"intel", 
		[], 
		[["command", true], ["subcommand"]], 
		7, 
		"Intel search | Syntax intel mx2020|munition|fahrzeug show", 
		{ 
			params["_terminal", "_params"];
			_params params ["_command","_subcommand"];
			(_this select 1) remoteExec ["rebru_fnc_hackPOIS", 2];
			[_terminal, format["Intel %1 has been revealed", _command ]] call HKX_fnc_printf; 
			[] spawn rebru_fnc_callEscapeReinforcements; 
			
		} 	
	]
	// Hack Evac
];

_customCommands;