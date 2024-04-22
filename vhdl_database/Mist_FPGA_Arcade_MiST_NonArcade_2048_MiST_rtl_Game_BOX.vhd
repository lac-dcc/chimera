LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.GAME_TYPES.ALL;

entity GAME_BOX is
	generic
	(
		XPOS 	: IN NATURAL;
		YPOS 	: IN NATURAL
	);
	port
	(
		-- INPUT
		clk		: IN STD_LOGIC;
		pixel_x : IN INTEGER RANGE 0 to 1000;
		pixel_y : IN INTEGER RANGE 0 to 500;
		number	: IN INTEGER RANGE 0 to 2500; 		
		
		-- OUTPUT
		color	: OUT STD_LOGIC_VECTOR(11 downto 0); -- colore attuale del box
		drawBox : OUT STD_LOGIC := '0' 	-- disegna il box quando drawBox = 1
	);
end GAME_BOX;

architecture box_arch of GAME_BOX is
	-- Dimensioni fisse di tutti i box
	constant larghezza 	: integer range 0 to 300 := 150; 	
	constant altezza 	: integer range 0 to 200 := 105;
	-- Coordinate finali del cubo sullo schermo
	constant MAX_X 		: integer range 0 to 1000 := XPOS + larghezza; -- larghezza
	constant MAX_Y 		: integer range 0 to 500 := YPOS + altezza; -- altezza
	-- Coordinate delle cifre sullo schermo
	constant X_CHAR		: integer range 0 to 1000 := XPOS + larghezza/2;
	constant Y_CHAR		: integer range 0 to 500:= YPOS + altezza/2;
	 
	-- Segnali per la scrittura dei numeri a video
	signal numberToDraw1: character;
	signal numberToDraw2: character;
	signal numberToDraw3: character;
	signal numberToDraw4: character;
	signal drawNum1		: std_logic;
	signal drawNum2		: std_logic;
	signal drawNum3		: std_logic;
	signal drawNum4		: std_logic;

begin
	CH1: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => X_CHAR-20,
		YPOS => Y_CHAR
	)
	port map
	(
		pixel_x 	=> pixel_x,
		pixel_y		=> pixel_y,
		char_code 	=> numberToDraw1,
		drawChar 	=> drawNum1
	);
	CH2: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => X_CHAR-10,
		YPOS => Y_CHAR
	)
	port map
	(
		pixel_x		=> pixel_x,
		pixel_y		=> pixel_y,
		char_code 	=> numberToDraw2,
		drawChar 	=> drawNum2
	);
	CH3: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => X_CHAR,
		YPOS => Y_CHAR
	)
	port map
	(
		pixel_x 	=> pixel_x,
		pixel_y		=> pixel_y,
		char_code 	=> numberToDraw3,
		drawChar 	=> drawNum3
	);
	CH4: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => X_CHAR+10,
		YPOS => Y_CHAR
	)
	port map
	(
		pixel_x 	=> pixel_x,
		pixel_y		=> pixel_y,
		char_code 	=> numberToDraw4,
		drawChar 	=> drawNum4
	);
	
	valueChange : process(number, drawNum1, drawNum2, drawNum3, drawNum4, clk)
	begin
		if(clk'event and clk = '1')
		then
			if not(drawNum1 = '1' or drawNum2 = '1' or drawNum3 = '1' or drawNum4 = '1')
			then
				case number is
					when 0 =>
						numberToDraw1 <= NUL;
						numberToDraw2 <= NUL;
						numberToDraw3 <= NUL;
						numbertoDraw4 <= NUL;
						color <= COLOR_0;
					when 2 => 
						numberToDraw1 <= NUL;
						numberToDraw2 <= NUL;
						numberToDraw3 <= '2';
						numbertoDraw4 <= NUL;
						color <= COLOR_2;
					when 4 => 
						numberToDraw1 <= NUL;
						numberToDraw2 <= NUL;
						numberToDraw3 <= '4';
						numbertoDraw4 <= NUL;
						color <= COLOR_4;
					when 8 => 
						numberToDraw1 <= NUL;
						numberToDraw2 <= NUL;
						numberToDraw3 <= '8';
						numbertoDraw4 <= NUL;
						color <= COLOR_8;
					when 16 => 
						numberToDraw1 <= NUL;
						numberToDraw2 <= '1';
						numberToDraw3 <= '6';
						numbertoDraw4 <= NUL;
						color <= COLOR_16;
					when 32 => 
						numberToDraw1 <= NUL;
						numberToDraw2 <= '3';
						numberToDraw3 <= '2';
						numbertoDraw4 <= NUL;
						color <= COLOR_32;
					when 64 => 
						numberToDraw1 <= NUL;
						numberToDraw2 <= '6';
						numberToDraw3 <= '4';
						numbertoDraw4 <= NUL;
						color <= COLOR_64;
					when 128 =>
						numberToDraw1 <= NUL;
						numberToDraw2 <= '1';
						numberToDraw3 <= '2';
						numbertoDraw4 <= '8';
						color <= COLOR_128;
					when 256 =>
						numberToDraw1 <= NUL;
						numberToDraw2 <= '2';
						numberToDraw3 <= '5';
						numbertoDraw4 <= '6';
						color <= COLOR_256;
					when 512 =>
						numberToDraw1 <= NUL;
						numberToDraw2 <= '5';
						numberToDraw3 <= '1';
						numbertoDraw4 <= '2';
						color <= COLOR_512;
					when 1024 =>
						numberToDraw1 <= '1';
						numberToDraw2 <= '0';
						numberToDraw3 <= '2';
						numbertoDraw4 <= '4';
						color <= COLOR_1024;
					when 2048 =>
						numberToDraw1 <= '2';
						numberToDraw2 <= '0';
						numberToDraw3 <= '4';
						numbertoDraw4 <= '8';
						color <= COLOR_2048;
					when others => 
						numberToDraw4 <= NUL;
						numberToDraw3 <= NUL;
						numberToDraw2 <= NUL;
						numbertoDraw1 <= NUL;
						color <= COLOR_BLACK;
				end case;
			else
				color <= COLOR_BLACK;
			end if;
		end if;
	end process valueChange;
	
	drawBox <= '1' 
	when 
		(pixel_x >= XPOS and pixel_x <= MAX_X and pixel_y >= YPOS and pixel_y <= MAX_Y)
	else
		'0';	
	
end box_arch;
