class rebru
{
	class InitClass
	{
		tag = "rebru";
		file = "Scripts\rebru\functions";

		class initServer {};
		class initLocalPlayer {};
	};

	class CommonClass {
		tag = "rebru";
		file = "Scripts\rebru\functions\common";

		class generatePassword {};
		class spawnVehicles {};
	};

    class BombClass
    {
        tag = "rebru";
        file = "Scripts\rebru\functions\bomb";

        class protectVehicleWithBomb {};
		class addBombToVehicle {};
    };

	class SupportClass
	{
		tag = "rebru";
		file = "Scripts\rebru\functions\support";

		class addSupportTerminal {};
		class callSupportVehicles {};
	};

	class EnvironmentClass {
		tag = "rebru";

		file = "Scripts\rebru\functions\environment";

		class switchLights {};
		class buildLaptops {};
		class buildLaptop {};
		class buildCabinet {};
		class getLocations {};
		class getObjects {};
		class setLock {};
		class earPlugs {};
	};

	class HackingClass {
		tag = "rebru";
		file = "Scripts\rebru\functions\hacking";

		class hackingCustomCommands {};
		class hackingFiles {};
		class hackingUsers {};
	};


	class EventHandlersClass {
		tag = "rebru";
		file = "Scripts\rebru\events";

		class eventFiredMan {};
		class eventKilled {};
		class eventEntityKilled {};
	};

	class TextClass {
		tag = "rebru";
		file = "Scripts\rebru\functions\textfiles";

		class textfileLocations {};
		class textfilePasswd {};
		class textfileLager {};
	};

	class EscapeClass {
		tag = "rebru";
		file = "Scripts\rebru\functions\escape";

		class getPOIS {};
		class hackPOIS {};
	};

	class DropClass {
		tag = "rebru";
		file = "Scripts\rebru\functions\drop";

		class callDrop {};
		class dropCargo {};
		class getOppositeDirection {};
		class getPosition {};
		class paraCargo {};
		class setVelocity {};
	};

	class ReinforcementClass {
		tag = "rebru";
		file = "Scripts\rebru\functions\reinforcement";

		class callReinforcement {};
		class callEscapeReinforcements {};
	};

	class vDogClass {
		tag ="rebru";
		file = "Scripts\rebru\functions\vdog";

		class spawnDogs {};
	};
	
	class GUI {
		tag = "rebru";
		file = "Scripts\rebru\gui";
		
		class openDialog {};
		class doAction {};
	};
	class GUICommands {
		tag = "rebru";
		file = "Scripts\rebru\gui\commands";
		
		class guiCupMarksman {};
		class guiHeal {};
		class guiFuel {};
		class guiRearm {};
		class guiKill {};
		class guiNavigations {};
		class guiNoFatStam {};
		class guiRevive {};
		class guiTeleportHim {};
		class guiVNMarksman {};
		class guiVNSniper {};
	};
};
