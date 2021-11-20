/*
Liest alle players aus und eröffnet sie als Accounts
*/

private _text = "";
private _headlessClients = entities "HeadlessClient_F";

// Alle Spieler
_text = _text + format["User || PlayerName ||Password \n"];
{

	private _playerName = name _x;
	private _playerUID = getPlayerUID _x;
	private _playerId = getPlayerID _x;
	private _playerId = format["User%1", _playerId];
	
	_text = _text + format["%1 || %2 || UserName \n", _playerId, _playerName];
	

} forEach allPlayers - _headlessClients;

// Wachkommando
_text = _text + format["%1 || %2 || %3", "wachkommando", "Wachkommando Account", missionNamespace getVariable "rebru_pass_wachkommando" ];

_text;
