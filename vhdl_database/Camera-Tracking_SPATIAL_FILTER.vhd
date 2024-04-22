-- Peter Tu

-- Takes in a "binary" image and performs 
-- applies spatial filter to remove background noise

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

LIBRARY MYPACK;
USE MYPACK.MY_PACKAGE.ALL;

ENTITY SPATIAL_FILTER IS 
	GENERIC (	RES_WIDTH : INTEGER := 320;
					RES_HEIGHT : INTEGER := 240);			
	PORT (	CLK : IN STD_LOGIC; 
				RST : IN STD_LOGIC;
				EN	: IN STD_LOGIC;
				PIXEL_IN : IN STD_LOGIC;
				X_POS : OUT INTEGER; 
				Y_POS : OUT INTEGER; 	-- Send out its coordinates	
				PIXEL_OUT : OUT STD_LOGIC);   	-- Send out processed pixel value
				
				
END SPATIAL_FILTER;

ARCHITECTURE RTL OF SPATIAL_FILTER IS

	COMPONENT COUNTER IS 
		GENERIC (	RES_WIDTH : INTEGER;
						RES_HEIGHT : INTEGER);
		PORT (	CLK : IN STD_LOGIC;
					RST : IN STD_LOGIC;
					EN : IN STD_LOGIC;
					X_LOC : OUT INTEGER;
					Y_LOC : OUT INTEGER);	
	END COMPONENT;

	COMPONENT SHIFT_REGISTER IS 
		GENERIC (	DATA_WIDTH : INTEGER;	-- Width of Data in bits
						RES_WIDTH : INTEGER; 	-- Width of image frame in pixels
						RES_HEIGHT : INTEGER); 	-- Height of image frame in pixels	
		PORT (	CLK : IN STD_LOGIC;
					SHIFT_EN : IN STD_LOGIC;
					SHIFT_IN : IN STD_LOGIC;
					SHIFT_OUT : OUT STD_LOGIC;
					SR_DATA : OUT STD_LOGIC_VECTOR(RES_WIDTH-1 DOWNTO 0));	
	END COMPONENT;
	
	SIGNAL X, Y : INTEGER := 0;
	
	SIGNAL SR1, SR2, SR3, SR4, SR5, SR6, SR7, SR8, SR9, SR10 : STD_LOGIC_VECTOR(RES_WIDTH-1 DOWNTO 0);
	SIGNAL SR_IN : STD_LOGIC;
	SIGNAL SR_OUT : STD_LOGIC;
	
BEGIN
	
	COUNT : COUNTER 
	GENERIC MAP (	RES_WIDTH => 320,
						RES_HEIGHT => 240)				
	PORT MAP	(	CLK => CLK,
					RST => RST,
					EN => EN,
					X_LOC => X,
					Y_LOC => Y);				
			
	SHIFT_REG : SHIFT_REGISTER
	GENERIC MAP (	DATA_WIDTH => 1,
						RES_WIDTH => 320,
						RES_HEIGHT => 240)
	PORT MAP (	CLK => CLK,
					SHIFT_EN => EN,
					SHIFT_IN => SR_IN,
					SHIFT_OUT => SR_OUT,
					SR_DATA => SR1);
	
	PROCESS(CLK, RST)
	BEGIN
		IF (RST = '0') THEN
			SR1 <= (OTHERS => '0');
			SR2 <= (OTHERS => '0');
			SR3 <= (OTHERS => '0');
			SR4 <= (OTHERS => '0');
			SR5 <= (OTHERS => '0');
			SR6 <= (OTHERS => '0');
			SR7 <= (OTHERS => '0');
			SR8 <= (OTHERS => '0');
			SR9 <= (OTHERS => '0');
			SR10 <= (OTHERS => '0');
		END IF;
		
		IF (RISING_EDGE(CLK)) THEN
			IF (EN = '1') THEN		
				IF ((X < RES_WIDTH-1) AND (Y < RES_HEIGHT-1)) THEN -- if pixels still within image frame	
					SR_IN <= PIXEL_IN;
				END IF;
				
				IF (X = 0) THEN
					SR2 <= SR1;
					SR3 <= SR2;
					SR4 <= SR3;
					SR5 <= SR4;
					SR6 <= SR5;
					SR7 <= SR6;
					SR8 <= SR7;
					SR9 <= SR8;
					SR10 <= SR9;
				END IF;
			END IF;
		END IF;
		
		IF (RISING_EDGE(CLK)) THEN
		
			-- Need to find way to add all '1's between X-4 and X+4
			-- in SR2 through SR10 to give us sum of all '1's in a 9x9
			-- neighborhood surrounding the pixel at X
			IF (CountOnesFunc(SR2(X-4 DOWNTO X+4))+
				 CountOnesFunc(SR3(X-4 DOWNTO X+4))+
				 CountOnesFunc(SR4(X-4 DOWNTO X+4))+
				 CountOnesFunc(SR5(X-4 DOWNTO X+4))+
				 CountOnesFunc(SR6(X-4 DOWNTO X+4))+
				 CountOnesFunc(SR7(X-4 DOWNTO X+4))+
				 CountOnesFunc(SR8(X-4 DOWNTO X+4))+
				 CountOnesFunc(SR9(X-4 DOWNTO X+4))+
				 CountOnesFunc(SR10(X-4 DOWNTO X+4)) > 75) THEN
				SR6(X) <= '1';
			ELSE
				SR6(X) <= '0';
			END IF;
			SR_OUT <= SR6(X);
		END IF;
		
		X_POS <= X;
		Y_POS <= Y;
		
	END PROCESS;
END RTL;

