-- Peter Tu

-- Determine object location on image frame by locating
-- object region's top-, bottom-, left-, right-most valid pixel
-- to create a box surrounding target region

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY OBJECT_TRACK IS
	GENERIC (	RES_WIDTH : INTEGER := 320;
					RES_HEIGHT : INTEGER := 240);
	
	PORT	(	CLK : IN STD_LOGIC;
				RST : IN STD_LOGIC;
				EN	: IN STD_LOGIC;
				PIXEL_IN : IN STD_LOGIC;
				
				PIXEL_OUT : OUT STD_LOGIC;
				X_LEFT : OUT INTEGER;
				X_RIGHT : OUT INTEGER;
				Y_TOP : OUT INTEGER;
				Y_BOT : OUT INTEGER;
				X_CENTER : OUT INTEGER;
				Y_CENTER : OUT INTEGER);
	
END OBJECT_TRACK;

ARCHITECTURE RTL OF OBJECT_TRACK IS

	COMPONENT SPATIAL_FILTER IS 
		GENERIC (	RES_WIDTH : INTEGER := 320;
						RES_HEIGHT : INTEGER := 240);			
		PORT (	CLK : IN STD_LOGIC; 
					RST : IN STD_LOGIC;
					EN	: IN STD_LOGIC;
					PIXEL_IN : IN STD_LOGIC;
					X_POS : OUT INTEGER;
					Y_POS : OUT INTEGER; 	-- Send out its coordinates	
					PIXEL_OUT : OUT STD_LOGIC);   	-- Send out processed pixel value					
	END COMPONENT;
	
	SIGNAL X_L : INTEGER := 0;
	SIGNAL X_R : INTEGER := 0;
	SIGNAL Y_T : INTEGER := 0;
	SIGNAL Y_B : INTEGER := 0;
	SIGNAL X_C : INTEGER := 0;
	SIGNAL Y_C : INTEGER := 0;
	SIGNAL X_COORD : INTEGER := 0;
	SIGNAL Y_COORD : INTEGER := 0;
	SIGNAL PIX_OUT : STD_LOGIC;

BEGIN

	SF: SPATIAL_FILTER  
	GENERIC MAP (	RES_WIDTH => 320,
						RES_HEIGHT => 240)			
	PORT MAP (	CLK => CLK,
					RST => RST,
					EN	=> EN,
					PIXEL_IN => PIXEL_IN,
					X_POS => X_COORD,
					Y_POS => Y_COORD,	
					PIXEL_OUT => PIX_OUT);

	PROCESS(CLK, RST)
	BEGIN
	
		IF (RST ='0') THEN
			X_L <= 0;
			X_R <= 0;
			Y_T <= 0;
			Y_B <= 0;
			X_C <= 0;
			Y_C <= 0;
			X_COORD <= 0;
			Y_COORD <= 0;
		END IF;
		
		-- Update coordinates of top, bottom, left, right most pixels each clock cycle
		IF (RISING_EDGE(CLK)) THEN
			IF (EN = '1') THEN
				IF ((PIX_OUT = '1') AND ((Y_T = 0) OR (Y_COORD < Y_T))) THEN -- If Y_TOP has no value yet, top pixel not found
					Y_T <= Y_COORD;
				END IF;
				
				IF ((PIX_OUT = '1') AND ((Y_B = 0) OR (Y_COORD > Y_B))) THEN 
					Y_B <= Y_COORD;
				END IF;
				
				IF ((PIX_OUT = '1') AND ((X_L = 0) OR (X_COORD < X_L))) THEN
					X_L <= X_COORD;
				END IF;
				
				IF ((PIX_OUT = '1') AND ((X_R = 0) OR (X_COORD > X_R))) THEN
					X_R <= X_COORD;
				END IF;
				
				X_C <= (X_R-X_L)/2;
				Y_C <= (Y_B-Y_T)/2;
				
			END IF;		
		END IF;
		
		X_LEFT <= X_L;
		X_RIGHT <= X_R;
		Y_TOP <= Y_T;
		Y_BOT <= Y_B;
		X_CENTER <= X_C;
		Y_CENTER <= Y_C;
		PIXEL_OUT <= PIX_OUT;
		
	END PROCESS;
END RTL;