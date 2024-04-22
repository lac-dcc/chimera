LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.GAME_TYPES.ALL;

ENTITY GAME_VIEW IS
PORT
	(
		-- INPUTs
		clk			: IN STD_LOGIC;	
				
		-- MODEL STATUS
		box_values	: IN GAME_GRID;
		score 		: IN INTEGER RANGE 0 to 9999;
		
		bootstrap,
		won,
		lost		: IN STD_LOGIC;
		
		-- OUTPUTs
		hsync,
		vsync		: OUT STD_LOGIC;
		red, 
		green,
		blue		: OUT STD_LOGIC_VECTOR(3 downto 0)
	); 
end GAME_VIEW;

ARCHITECTURE behavior of GAME_VIEW IS

	-- Sync Counters
	shared variable h_cnt	: integer range 0 to 1000;
	shared variable v_cnt  	: integer range 0 to 500;

	-- Segnali per il disegno della griglia e del colore dei box
	signal drawGrid		: STD_LOGIC;
	signal colorGrid	: STD_LOGIC_VECTOR(11 downto 0);

	-- Segnali per il disegno dei caratteri su schermo : autori
	signal drawCharC 	: STD_LOGIC;
	signal drawCharO 	: STD_LOGIC;
	signal drawCharL 	: STD_LOGIC;
	signal drawCharA 	: STD_LOGIC;
	signal drawCharC1	: STD_LOGIC;
	signal drawCharE 	: STD_LOGIC;
	signal drawCharSep	: STD_LOGIC;
	signal drawCharG 	: STD_LOGIC;
	signal drawCharE1 	: STD_LOGIC;
	signal drawCharZ 	: STD_LOGIC;
	signal drawCharZ1 	: STD_LOGIC;
	signal drawCharI 	: STD_LOGIC;

	-- game over
	signal drawGoG : STD_LOGIC;
	signal drawGoA : STD_LOGIC;
	signal drawGoM : STD_LOGIC;
	signal drawGoE : STD_LOGIC;
	signal drawGoO : STD_LOGIC;
	signal drawGoV : STD_LOGIC;
	signal drawGoE1: STD_LOGIC;
	signal drawGoR : STD_LOGIC;

	-- you win
	signal drawYwY : STD_LOGIC;
	signal drawYwO : STD_LOGIC;
	signal drawYwU : STD_LOGIC;
	signal drawYwW : STD_LOGIC;
	signal drawYwI : STD_LOGIC;
	signal drawYwN : STD_LOGIC;

BEGIN

--Disegno caratteri : autori
CHC: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 16,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'C',
		drawChar => drawCharC
	);
CHO: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 26,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'o',
		drawChar => drawCharO
	);
CHL: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 36,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'l',
		drawChar => drawCharL
	);
CHA: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 46,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'a',
		drawChar => drawCharA
	);
CHC1: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 56,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'c',
		drawChar => drawCharC1
	);
CHE: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 66,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'e',
		drawChar => drawCharE
	);

CHSEP: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 76,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => '-',
		drawChar => drawCharSep
	);
CHG: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 86,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'G',
		drawChar => drawCharG
	);
CHE1: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 96,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'e',
		drawChar => drawCharE1
	);
CHZ: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 106,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'z',
		drawChar => drawCharZ
	);
CHZ1: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 116,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'z',
		drawChar => drawCharZ1
	);
CHI: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 126,
		YPOS => 12
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'i',
		drawChar => drawCharI
	);

-- disegno caratteri : game over
CHGOG: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 280,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'G',
		drawChar => drawGoG
	);
	
CHGOA: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 290,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'A',
		drawChar => drawGoA
	);

CHGOM: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 300,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'M',
		drawChar => drawGoM
	);

CHGOE: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 310,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'E',
		drawChar => drawGoE
	);
--over

CHGOO: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 330,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'O',
		drawChar => drawGoO
	);

CHGOV: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 340,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'V',
		drawChar => drawGoV
	);

CHGOE1: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 350,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'E',
		drawChar => drawGoE1
	);

CHGOR: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 360,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'R',
		drawChar => drawGoR
	);

CHYWY: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 280,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'Y',
		drawChar => drawYwY
	);

CHYWO: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 290,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'O',
		drawChar => drawYwO
	);

CHYWU: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 300,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'U',
		drawChar => drawYwU
	);

CHYWW: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 320,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'W',
		drawChar => drawYwW
	);

CHYWI: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 330,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'I',
		drawChar => drawYwI
	);

CHYWN: entity work.GAME_CHDISPLAY
	generic map
	(
		XPOS => 340,
		YPOS => 232
	)
	port map
	(
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		char_code => 'N',
		drawChar => drawYwN
	);
	
GRID: entity work.GAME_GRID_VIEW
	port map
	(
		clk	=> clk,		
		pixel_x => h_cnt,
		pixel_y	=> v_cnt,
		box_values => box_values,
		drawGrid => drawGrid,
		color => colorGrid
	);

PROCESS
	
	-- HSYNC e VSYNC
	variable h_sync			: STD_LOGIC;
	variable v_sync			: STD_LOGIC;

	-- Enable del video
	variable horizontal_en	: STD_LOGIC;
	variable vertical_en	: STD_LOGIC;
	variable video_en		: STD_LOGIC; 

	-- Segnale colore RGB a 12 bit
	variable colorRGB		: STD_LOGIC_VECTOR(11 downto 0); 

	-- Bordi Schermo
	constant leftBorder		: INTEGER RANGE 0 to 1000 := 15;
	constant rightBorder	: INTEGER RANGE 0 to 1000 := 625;
	constant upBorder		: INTEGER RANGE 0 to 500 := 30;
	constant downBorder		: INTEGER RANGE 0 to 500 := 460;

BEGIN

	WAIT UNTIL(clk'EVENT) AND (clk = '1');
	
	-- Reset Horizontal Counter	
	-- (al valore 799, anzich� 640, per rispettare i tempi di Front Porch)
	IF (h_cnt = 799) 
	THEN
		h_cnt := 0;
	ELSE
		h_cnt := h_cnt + 1;
	END IF;

	-- Disegno Bordi
	IF 
	(
		h_cnt <= leftBorder OR 	-- BORDO LEFT
		h_cnt >= rightBorder OR -- BORDO RIGHT
		v_cnt <= upBorder OR 	-- BORDO UP
		v_cnt >= downBorder 	-- BORDO DOWN
	)
	THEN
		colorRGB := COLOR_BORDER;
	-- SE NON � BORDO, � SFONDO
	ELSE 
		colorRGB := COLOR_BG;
	END IF;

	-- Disegno griglia di gioco
	IF (drawGrid = '1')
	THEN
		colorRGB := colorGrid; 		
	END IF;

	-- Disegno "Colace-Gezzi"
	IF
	(	
		drawCharC='1' OR drawCharO='1' OR drawCharL='1' OR 
		drawCharA='1' OR drawCharC1='1' OR drawCharE='1' OR 
		drawCharSep='1' OR drawCharG='1' OR drawCharE1='1' OR
		drawCharZ='1' OR drawCharZ1='1' OR drawCharI='1'
	)
	THEN
		colorRGB := COLOR_TEAL;  
	END IF;

	-- Disegno "GAME OVER"
	IF
	(
		(drawGoG='1' OR drawGoA='1' OR drawGoM='1' OR drawGoE='1' OR 
		drawGoO='1' OR drawGoV='1' OR drawGoE1='1' OR drawGoR='1') AND 
		lost = '1'
	)
	THEN
		colorRGB := COLOR_TEAL; 
	END IF;

	-- Disegno "YOU WIN"
	IF
	(
		(drawYwY='1' OR drawYwO='1' OR drawYwU='1' OR
		drawYwW='1' OR drawYwI='1' OR drawYwN='1' ) AND
		won = '1'
	)
	THEN
		colorRGB := COLOR_VICTORY; 
	END IF;

	-- H_SYNC
	IF (h_cnt <= 755 AND h_cnt >= 659) 
	THEN
		h_sync := '0';
	ELSE
		h_sync := '1';
	END IF;
	
	-- V_SYNC
	IF (v_cnt >= 524 AND h_cnt >= 699) 
	THEN
		v_cnt := 0;
	ELSIF (h_cnt = 699) 
	THEN
		v_cnt := v_cnt + 1;
	END IF;
	
	IF (v_cnt = 490 OR v_cnt = 491) 
	THEN
		v_sync := '0';	
	ELSE
		v_sync := '1';
	END IF;
	
	-- Horizontal Data Enable
	-- (dati di riga validi, ossia nel range orizzontale 0-639)
	IF (h_cnt <= 639) 
	THEN
		horizontal_en := '1';
	ELSE
		horizontal_en := '0';
	END IF;
	
	-- Vertical Data Enable 
	-- (dati di riga validi, ossia nel range verticale 0-479)
	IF (v_cnt <= 479) 
	THEN
		vertical_en := '1';
	ELSE
		vertical_en := '0';
	END IF;
	
	-- Video Enable � AND tra i due data enable
	video_en := horizontal_en AND vertical_en;

	-- Assegnamento segnali fisici a VGA
	red(3)		<= colorRGB(11) AND video_en;
	red(2)		<= colorRGB(10) AND video_en;
	red(1)		<= colorRGB(9) AND video_en;
	red(0)		<= colorRGB(8) AND video_en;
	green(3) 	<= colorRGB(7) AND video_en;
	green(2) 	<= colorRGB(6) AND video_en;
	green(1) 	<= colorRGB(5) AND video_en;
	green(0) 	<= colorRGB(4) AND video_en;
	blue(3)		<= colorRGB(3) AND video_en;
	blue(2)		<= colorRGB(2) AND video_en;
	blue(1)		<= colorRGB(1) AND video_en;
	blue(0)		<= colorRGB(0) AND video_en;
	
	hsync		<= h_sync;
	vsync		<= v_sync;
	
END PROCESS;
END behavior;