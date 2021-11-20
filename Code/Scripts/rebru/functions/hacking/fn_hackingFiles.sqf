/*
    FILES
    Defines the files that are available in the terminal.
    Players will be able to read the content of these files using the CAT command, provided that the clearance level of the account they are logged into is high enough.

    FORMAT:
      [filename, requiredClearanceLevel, text]
      - filename (String): the name of the file
      - requiredClearanceLevel (Integer): the minimum clearance level required in order to see and read the file.
      - text (String): the contents of the file.

    NOTE: 'filename' must not contain characters that require using the 'Alt Gr' key.
          Those characters cannot be typed into the terminal interface, therefore preventing players from accessing the file.
*/
private _files = [
  ["wachkommando.txt", 1, "Wachkommando hat Zugriff auf \n\n - Lagerliste\n - Sicherheitsboxen\n\n "],
  ["confidential.txt", 3, format["User: root\nPassword: %1", (missionNamespace getVariable "rebru_pass_root")]],
  ["staedte.txt", 0, [] call rebru_fnc_textfileLocations],
  ["lager.txt", 3, [] call rebru_fnc_textfileLager],
  ["passwd", 0, [] call rebru_fnc_textfilePasswd]
];

_files;