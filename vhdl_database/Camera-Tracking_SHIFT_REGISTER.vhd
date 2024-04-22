-- Peter Tu

-- Shift Register to hold a row of "binary" image pixels 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY SHIFT_REGISTER IS 

	-- Generic ports allow for change throughout design
	GENERIC (	DATA_WIDTH : INTEGER := 1;	-- Width of Data in bits
					RES_WIDTH : INTEGER	:= 320; -- Width of image frame in pixels
					RES_HEIGHT : INTEGER :=	240); -- Height of image frame in pixels
					
	PORT (	CLK : IN STD_LOGIC;
				SHIFT_EN : IN STD_LOGIC;
				SHIFT_IN : IN STD_LOGIC;
				SHIFT_OUT : OUT STD_LOGIC;
				SR_DATA : OUT STD_LOGIC_VECTOR(RES_WIDTH-1 DOWNTO 0));	
				
END SHIFT_REGISTER;

ARCHITECTURE RTL OF SHIFT_REGISTER IS

	TYPE SR_LENGTH IS ARRAY (RES_WIDTH-1 DOWNTO 0) OF STD_LOGIC; 
	
	SIGNAL SHIFT_REG : SR_LENGTH; -- Create Shift Register to hold binary values of image width pixels

BEGIN
	PROCESS(CLK)
	BEGIN
		IF (RISING_EDGE(CLK)) THEN
			IF (SHIFT_EN = '1') THEN
			
				SHIFT_REG(RES_WIDTH-1 DOWNTO 1) <= SHIFT_REG(RES_WIDTH-2 DOWNTO 0); -- Shift Data by 1
				
				SHIFT_REG(0) <= SHIFT_IN; -- New data
				
			END IF;
		END IF;
	END PROCESS;
	
	SHIFT_OUT <= SHIFT_REG(RES_WIDTH-1); -- Output data from last stage
	
END RTL;