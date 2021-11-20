class HackEX {
  tag = "HKX";

  class Terminal {
    file = "Scripts\HackEX\terminal";

    class getTerminal {};
    class addActionTerminal {};
    class bootTerminal {};
    class openTerminal {};
    class closeTerminal {};
    class saveTerminal {};
    class shutdownTerminal {};
  };

  class CommandLine {
    file = "Scripts\HackEX\command_line";

    class print {};
    class printf {};
    class initCLSession {};
    class processCLUserInput {};
    class updateCLDisplay {};
    class processCLCommand {};
  };

  class CommandLineCommand {
    file = "Scripts\HackEX\command_line\commands";

    class clCmdHelp {};
    class clCmdRun {};
  };

  class Input {
    file = "Scripts\HackEX\input";

    class dikToChar {};
  };

  class File {
    file = "Scripts\HackEX\file";

    class openFile {};
    class existsFile {};
  };

  class AppPowerPlant {
    file = "Scripts\HackEX\apps\powerplant";

    class appPowerPlant{};
  };

  class AppTextViewer {
    file = "Scripts\HackEX\apps\textviewer";

    class appFileViewer{};
  }
};
