LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.GAME_TYPES.ALL;

entity GAME_GRID_VIEW is
	port
	(
		-- INPUT
		clk			: IN STD_LOGIC;
		pixel_x 	: IN INTEGER RANGE 0 to 1000;
		pixel_y 	: IN INTEGER RANGE 0 to 500;	
		box_values	: IN GAME_GRID;
		
		-- OUTPUT
		color		: OUT STD_LOGIC_VECTOR(11 downto 0); -- colore da mandare in VGA
		drawGrid 	: OUT STD_LOGIC := '0' 	-- disegna la Grid quando = 1
	);
end GAME_GRID_VIEW;

ARCHITECTURE grid_arch of GAME_GRID_VIEW IS

	-- Posizioni fisse di tutti i box
	constant XfirstColumn	: integer range 0 to 1000 := 16;
	constant YfirstRow 		: integer range 0 to 500 := 32;
 
	constant XsecondColumn 	: integer range 0 to 1000 := 168;
	constant YsecondRow 	: integer range 0 to 500 := 139;
	 
	constant XthirdColumn 	: integer range 0 to 1000 := 320;
	constant YthirdRow 		: integer range 0 to 500 := 246;
	 
	constant XfourthColumn 	: integer range 0 to 1000 := 472;
	constant YfourthRow 	: integer range 0 to 500 := 353;

	-- Segnali per il disegno dei box e il relativo colore
	signal drawbox1	: STD_LOGIC;
	signal color1	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox2	: STD_LOGIC;
	signal color2	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox3	: STD_LOGIC;
	signal color3	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox4	: STD_LOGIC;
	signal color4	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox5	: STD_LOGIC;
	signal color5	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox6	: STD_LOGIC;
	signal color6	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox7	: STD_LOGIC;
	signal color7	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox8	: STD_LOGIC;
	signal color8	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox9	: STD_LOGIC;
	signal color9	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox10: STD_LOGIC;
	signal color10	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox11: STD_LOGIC;
	signal color11	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox12: STD_LOGIC;
	signal color12	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox13: STD_LOGIC;
	signal color13	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox14: STD_LOGIC;
	signal color14	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox15: STD_LOGIC;
	signal color15	: STD_LOGIC_VECTOR(11 downto 0);
	signal drawbox16: STD_LOGIC;
	signal color16	: STD_LOGIC_VECTOR(11 downto 0);

BEGIN

BOX1: entity work.GAME_BOX
	generic map
	(
		XPOS => XfirstColumn,
		YPOS => YfirstRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(0,0),
		drawbox => drawbox1,
		color => color1
	);

BOX2: entity work.GAME_BOX
	generic map
	(
		XPOS => XsecondColumn,
		YPOS => YfirstRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(0,1),
		drawbox => drawbox2,
		color => color2
	);
	
BOX3: entity work.GAME_BOX
	generic map
	(
		XPOS => XthirdColumn,
		YPOS => YfirstRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(0,2),
		drawbox => drawbox3,
		color => color3
	);

BOX4: entity work.GAME_BOX
	generic map
	(
		XPOS => XfourthColumn,
		YPOS => YfirstRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(0,3),
		drawbox => drawbox4,
		color => color4
	);

BOX5: entity work.GAME_BOX
	generic map
	(
		XPOS =>	XfirstColumn,
		YPOS => YsecondRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(1,0),
		drawbox => drawbox5,
		color => color5
	);

BOX6: entity work.GAME_BOX
	generic map
	(
		XPOS => XsecondColumn,
		YPOS => YsecondRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(1,1),
		drawbox => drawbox6,
		color => color6
	);
	
BOX7: entity work.GAME_BOX
	generic map
	(
		XPOS => XthirdColumn,
		YPOS => YsecondRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(1,2),
		drawbox => drawbox7,
		color => color7
	);

BOX8: entity work.GAME_BOX
	generic map
	(
		XPOS => XfourthColumn,
		YPOS => YsecondRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(1,3),
		drawbox => drawbox8,
		color => color8
	);
	
BOX9: entity work.GAME_BOX
	generic map
	(
		XPOS => XfirstColumn,
		YPOS => YthirdRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(2,0),
		drawbox => drawbox9,
		color => color9
	);
	
BOX10: entity work.GAME_BOX
	generic map
	(
		XPOS => XsecondColumn,
		YPOS => YthirdRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(2,1),
		drawbox => drawbox10,
		color => color10
	);

BOX11: entity work.GAME_BOX
	generic map
	(
		XPOS => XthirdColumn,
		YPOS => YthirdRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(2,2),
		drawbox => drawbox11,
		color => color11
	);

BOX12: entity work.GAME_BOX
	generic map
	(
		XPOS => XfourthColumn,
		YPOS => YthirdRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(2,3),
		drawbox => drawbox12,
		color => color12
	);

BOX13: entity work.GAME_BOX
	generic map
	(
		XPOS => XfirstColumn,
		YPOS => YfourthRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(3,0),
		drawbox => drawbox13,
		color => color13
	);
	
BOX14: entity work.GAME_BOX
	generic map
	(
		XPOS => XsecondColumn,
		YPOS => YfourthRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(3,1),
		drawbox => drawbox14,
		color => color14
	);

BOX15: entity work.GAME_BOX
	generic map
	(
		XPOS => XthirdColumn,
		YPOS => YfourthRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(3,2),
		drawbox => drawbox15,
		color => color15
	);
	
BOX16: entity work.GAME_BOX
	generic map
	(
		XPOS => XfourthColumn,
		YPOS => YfourthRow
	)
	port map
	(
		clk => clk,
		pixel_x => pixel_x,
		pixel_y => pixel_y,
		number => box_values(3,3),
		drawbox => drawbox16,
		color => color16
	);
	
	drawBoxes : process
		(
			drawbox1, drawbox2, drawbox3, drawbox4, drawbox5, drawbox6, drawbox7, drawbox8,
			drawbox9, drawbox10, drawbox11, drawbox12, drawbox13, drawbox14, drawbox15, drawbox16,
			color1, color2, color3, color4, color5, color6, color7, color8, 
			color9, color10, color11, color12, color13, color14, color15, color16
		)
	begin
		-- non ha bisogno di essere sincrono in quanto la lettura viene fatta dalla view ad ogni
		-- fronte positivo del clock (da ricordare!)
		--- DISEGNO DI OGNI BOX
		color <= (others => '0');
		IF(drawbox1 = '1')
		THEN
			color <= color1;
		END IF;	
		IF(drawbox2 = '1')
		THEN
			color <= color2; 
		END IF;	
		IF(drawbox3 = '1')
		THEN
			color <= color3; 
		END IF;	
		IF(drawbox4 = '1')
		THEN
			color <= color4;
		END IF;	
		IF(drawbox5 = '1')
		THEN
			color <= color5;
		END IF;
		IF(drawbox6 = '1')
		THEN
			color <= color6;
		END IF;
		IF(drawbox7 = '1')
		THEN
			color <= color7;
		END IF;
		IF(drawbox8 = '1')
		THEN
			color <= color8;
		END IF;	
		IF(drawbox9 = '1')
		THEN
			color <= color9;
		END IF;
		IF(drawbox10 = '1')
		THEN
			color <= color10;
		END IF;
		IF(drawbox11 = '1')
		THEN
			color <= color11;
		END IF;	
		IF(drawbox12 = '1')
		THEN
			color <= color12; 
		END IF;	
		IF(drawbox13 = '1')
		THEN
			color <= color13;
		END IF;
		IF(drawbox14 = '1')
		THEN
			color <= color14;
		END IF;
		IF(drawbox15 = '1')
		THEN
			color <= color15;
		END IF;
		IF(drawbox16 = '1')
		THEN
			color <= color16;
		END IF;
	end process drawBoxes;
	
	drawGrid <= '1' 
	when 
		(
			drawbox1 = '1' 	or drawbox2 = '1' 	or drawbox3='1' 	or drawbox4 = '1' 	or
			drawbox5 = '1' 	or drawbox6 = '1' 	or drawbox7='1' 	or drawbox8 = '1' 	or
			drawbox9 = '1' 	or drawbox10 = '1' 	or drawbox11='1' 	or drawbox12 = '1' 	or
			drawbox13 = '1' or drawbox14 = '1' 	or drawbox15='1' 	or drawbox16 = '1'
		)
	else
		'0';

END grid_arch;