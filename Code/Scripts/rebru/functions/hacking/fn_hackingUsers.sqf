/*
    ACCOUNTS
    Defines the accounts that are available in the terminal.
    Players will be able to log into these accounts using the LOGIN command.

    FORMAT:
      [username, password, clearanceLevel]
      - username (String): the username of the account (must not start with "guest")
      - password (String): the password of the account (can be left empty)
      - clearanceLevel (Integer): the clearance level of the account

    NOTE: 'username' and 'password' must not contain characters that require using the 'Alt Gr' key.
          Those characters cannot be typed into the terminal interface, therefore preventing players from logging into the accounts involved.
*/
// Default Accounts
_accounts = [];

// Player Accounts
/*
	truth 76561198143409169
*/
private _headlessClients = entities "HeadlessClient_F";
{

	private _playerName = name _x;
	private _playerUID = getPlayerUID _x;
	private _playerId = getPlayerID _x;
	private _playerUser = format["User%1", _playerId];
	
	_accounts append [ [_playerUser, _playerUser, 1] ];
	

} forEach allPlayers - _headlessClients;

// Wachkommando
_accounts append [ ["wachkommando", (missionNamespace getVariable "rebru_pass_wachkommando"), 3] ];

// Wachkommando
_accounts append [ ["root", (missionNamespace getVariable "rebru_pass_root"), 7] ];

_accounts;