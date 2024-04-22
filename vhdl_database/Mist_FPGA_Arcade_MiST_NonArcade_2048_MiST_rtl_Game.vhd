LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.GAME_TYPES.ALL;

entity GAME is
    port
	(
		-- INPUT
		clk_50Mhz	: IN  STD_LOGIC;
		PS2_CLK		: IN  STD_LOGIC;
		PS2_DAT		: IN  STD_LOGIC;
		reset		   : IN  STD_LOGIC;

		-- OUTPUT	
		hsync,
		vsync	: OUT  STD_LOGIC;		
		red, 
		green,
		blue	: OUT STD_LOGIC_VECTOR(3 downto 0)
	);
end GAME;

architecture Behavioural of GAME is

	-- Output Clock Generator
	signal clock_25Mhz: STD_LOGIC;
	
	-- Output Keyboard
	signal keyCode: STD_LOGIC_VECTOR(7 downto 0);

	-- Output Controller
	signal boot	: STD_LOGIC;
	signal won 	: STD_LOGIC;
	signal lost	: STD_LOGIC;
	signal movepadDirection	: STD_LOGIC_VECTOR(3 downto 0);
	
	-- Output Datapath
	signal goingReady	: STD_LOGIC;
	signal isgameover	: STD_LOGIC;
	signal isvictory	: STD_LOGIC;
	signal box_values 	: GAME_GRID;
	signal score		: INTEGER RANGE 0 to 9999;

BEGIN

ClockDivider: entity work.GAME_CLKGENERATOR
	port map
	(
		-- INPUT
		clock			=> clk_50Mhz,
		
		-- OUTPUT
		clock_mezzi 	=> clock_25Mhz
	);

Keyboard: entity work.GAME_KEYBOARD
	port map
	(
		-- INPUT
		clk				=> clock_25Mhz,
		keyboardClock	=> PS2_CLK,
		keyboardData	=> PS2_DAT,
		
		-- OUTPUT	
		keyCode			=> keyCode		
	);

ControlUnit: entity work.GAME_CONTROL
	port map
	(
		-- INPUT
		clk				=> clock_25Mhz,
		
			-- from Keyboard
		keyboardData	=> keyCode,	
		
			-- from Datapath
		goingReady	=> goingReady, 
		isgameover	=> isgameover,
		isvictory	=> isvictory,

		-- OUTPUT	
		boot	=> boot,
		won		=> won,
		lost	=> lost,
		movepadDirection => movepadDirection
	);

Datapath: entity work.GAME_DATA
	port map
	(
		-- INPUT
		clk			=> clock_25Mhz,
		
		-- from ControlUnit
		bootstrap			=> boot or reset,
		movepadDirection 	=> movepadDirection,
		
		-- OUTPUT
		goingReady	=> goingReady,
		isgameover	=> isgameover,
		isvictory 	=> isvictory,
		box_values 	=> box_values,
		score		=> score
	);

View: entity work.GAME_VIEW
	port map
	(
		-- INPUT
		clk			=> clock_25Mhz,
		
			-- from Datapath
		box_values 	=> box_values,
		score		=> score,

			-- from ControlUnit
		bootstrap	=> boot or reset,
		lost		=> lost,
		won			=> won,
		
		-- OUTPUT
		hsync		=> hsync,		
		vsync		=> vsync,		
		red			=> red,	
		green		=> green,		
		blue		=> blue
	);
end Behavioural;