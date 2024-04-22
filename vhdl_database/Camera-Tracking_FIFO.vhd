-- Peter Tu

-- Simple Dual-Port Configuration of FIFO Buffer

-- This configuration has two ports to allow simultaneous
-- read and write operations and supports two different 
-- clock frequencies to 

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY FIFO IS
	GENERIC (	DATA_WIDTH : INTEGER:=8;
					FIFO_DEPTH : INTEGER:=256;
					RES_WIDTH :	INTEGER:=320;
					RES_HEIGHT : INTEGER:=240);
						
	PORT (	WR_CLK : IN STD_LOGIC;
				WR_EN : IN STD_LOGIC;
				WR_FULL : OUT STD_LOGIC;
				
				RST :	IN STD_LOGIC;
				
				RD_CLK : IN STD_LOGIC;
				RD_EN : IN STD_LOGIC;
				RD_EMPTY : OUT STD_LOGIC;
				
				WR_DATA : IN STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
				RD_DATA : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0));
END FIFO;

ARCHITECTURE BEHAVIOR OF FIFO IS

-- DECLARE SIGNALS

BEGIN
	PROCESS(WR_CLK, RST) -- Separate into 3 processes? -> (RST, WR_CLK, RD_CLK)
	
	TYPE FIFO_MEM IS ARRAY(0 TO FIFO_DEPTH-1) OF STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
	
	VARIABLE MEM : FIFO_MEM;
	VARIABLE WR_PTR : NATURAL RANGE 0 TO FIFO_DEPTH-1;
	VARIABLE RD_PTR : NATURAL RANGE 0 TO FIFO_DEPTH-1;
	
	BEGIN
		IF (RST = '0') THEN
			WR_PTR := 0;
			RD_PTR := 0;
			WR_FULL <= '0';
			RD_EMPTY <= '1';
		END IF;	
		
		IF (RISING_EDGE(WR_CLK)) THEN
			IF (WR_EN = '1' OR RD_EMPTY = '1') THEN -- RD_EMPTY of mode out gives error.
				IF (WR_FULL = '0') THEN					 -- Declare and assign to signals
					MEM(WR_PTR) <= WR_DATA;
					WR_PTR := WR_PTR + 1;
					IF (WR_PTR = FIFO_DEPTH-1) THEN
						WR_FULL <= '1';
					END IF;
				ELSIF (WR_FULL = '1') THEN
					WR_EN <= '0';
					WR_PTR := WR_PTR;
				END IF;
			END IF;
		END IF;		
			
		IF (RISING_EDGE(RD_CLK)) THEN
			IF (RD_EN = '1' OR WR_FULL = '1') THEN -- WR_FULL will give error too.
				IF (RD_EMPTY = '0') THEN
					RD_DATA <= MEM(RD_PTR);
					RD_PTR := RD_PTR + 1;
					IF (RD_PTR = FIFO_DEPTH-1) THEN
						RD_EMPTY <= '1';
					END IF;
				ELSIF (RD_EMPTY = '1') THEN
					RD_EN <= '0';
					RD_PTR := RD_PTR;
				END IF;
			END IF;			
		END IF;
	END PROCESS;
END BEHAVIOR;