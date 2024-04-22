-------------------------------------------------------
-- Author: Hugues CREUSY
--February 2004
-- VHDL model
-- project: M25P16 50 MHz,
-- release: 1.2
-----------------------------------------------------
-- Unit   : M25P16 driver
-----------------------------------------------------

-------------------------------------------------------------
-- These VHDL models are provided "as is" without warranty
-- of any kind, included but not limited to, implied warranty
-- of merchantability and fitness for a particular purpose.
-------------------------------------------------------------

-------------------------------------------------------------
--				M25P16 DRIVER
-------------------------------------------------------------

LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
LIBRARY WORK;
	USE WORK.stimuli_spi.ALL;

-------------------------------------------------------------
--				ENTITY
-------------------------------------------------------------
ENTITY M25P16_driver IS

 PORT(	VCC: OUT REAL;
	clk: OUT std_logic;
	din: OUT std_logic;
	cs_valid: OUT std_logic;
	hard_protect: OUT std_logic;
	hold: OUT std_logic
	);

END M25P16_driver;

architecture BENCH of M25P16_driver is 

begin
driver: process

	CONSTANT thigh : TIME := 10 ns;
	CONSTANT tlow  : TIME := 10 ns;

	begin

clk<='0';
din<='1';
cs_valid<='1';
hold<='1';
hard_protect<='1';

ALIM(1 ns ,5 ns, 100 ms,300 ms,0.0,2.5,2.7,3.5,3.3,Vcc);
WAIT FOR 15 ms;
		
-- hold condition test during a WREN
hold_WREN (tLOW,tLOW,clk,din,cs_valid,hold);
	  WAIT FOR 5*tLOW;
RDSR(thigh,tlow,1,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
WRDI(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 
RDSR(thigh,tlow,1,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;

-- WREN/WRDI test

WREN(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;  
RDSR(thigh,tlow,1,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
WRDI(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 
RDSR(thigh,tlow,1,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;


-- WRSR
WREN(thigh,tlow,clk,din,cs_valid);	 
	  WAIT FOR 5*tLOW; 
WRSR (thigh,tlow,"11111111",clk,din,cs_valid); 
	  WAIT FOR 14965 us; 

-- RDSR at the end of the prog cycle
RDSR(thigh,tlow,120,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;

-- WRSR canceled by HPM
  WREN(thigh,tlow,clk,din,cs_valid);	 
	  WAIT FOR 5*tLOW; 
PIN_W (13 us,hard_protect);
	  WAIT FOR 5*tLOW; 
WRSR (thigh,tlow,"00000000",clk,din,cs_valid); 
	  WAIT FOR 13 us; 
RDSR(thigh,tlow,1,clk,din,cs_valid); 
	  WAIT FOR 5*tLOW;	  

-- op_codes sent during Deep Power Down Mode
DP(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 3 us;
WREN(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 
RDSR(thigh,tlow,1,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
PP (thigh,tlow,  "000011111100001111000011","10101010", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 
READ (2*thigh,2*tlow,"000011111100001111000011", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
READ (2*thigh,2*tlow,"000011111100001111000011", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
BE (thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
SE (thigh, tlow,"000000000000000000000000",clk,din, cs_valid);	
	  WAIT FOR 5*tLOW;
WRDI(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 	
RES(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 3 us;
RDSR(thigh,tlow,1,clk,din,cs_valid); 
	  WAIT FOR 5*tLOW;

-- Page prog on a protected sector
PP (thigh,tlow,  "000011111100001111000011","10101010", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 

-- WRSR to reset BP(i) bits
WREN(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
WRSR (thigh,tlow,"00000000",clk,din,cs_valid); 
	  WAIT FOR 14965 us; 
RDSR(thigh,tlow,120,clk,din,cs_valid); 
	  WAIT FOR 5*tLOW;

-- page prog on a not protected sector
WREN(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;  
PP (thigh,tlow,  "000011111100001111000011","10101010", 15, clk,din,cs_valid);
	  WAIT FOR 4965 us; 

-- RDSR at the end of the prog cycle
RDSR(thigh,tlow,120,clk,din,cs_valid); 
	  WAIT FOR 5*tLOW;

-- deep power down mode AND release from deep power down + read electronic signature
DP(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 3 us;
Read_ES(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 1.8 us;

-- READ programmed bytes preceded and followed by one non programmed byte
WREN(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW;  
READ (2*thigh,2*tlow,"000011111100001111000010", 17, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;

-- Program 55h on AAh
PP (thigh,tlow,  "000011111100001111000011","01010101", 15, clk,din,cs_valid);
	  WAIT FOR 4965 us; 
RDSR(thigh,tlow,120,clk,din,cs_valid); 
	  WAIT FOR 5*tLOW;
-- READ: AAh+55h=>00h
READ (2*thigh,2*tlow,"000011111100001111000010", 17, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;

-- prog  of the first 15 bytes of sector 0 and read them.
 WREN(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 
PP (thigh,tlow,  "000000000000000000000000","00000000", 15, clk,din,cs_valid);
		  WAIT FOR 5010 us;
READ (2*thigh,2*tlow,"000000000000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 

-- Prog of the end of the last page of the memory (with rollover)
WREN(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 
PP (thigh,tlow,  "000000111111111111111111","01010101", 15, clk,din,cs_valid);
		  WAIT FOR 5010 us;

-- READ last byte of memory and rollover to the beginning of the memory array
READ (2*thigh,2*tlow,"000111111111111111111111", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 

-- READ first bytes of the last page of the memory (to check rollover in page prog mode)
READ (2*thigh,2*tlow,"000111110000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 

-- Page prog of more than 256 bytes in the sectors 1 and 2.
-- Note: the PP stimulus sends automatically 00h when byte number is higher than 256
WREN(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 
PP (thigh,tlow,  "000000010000000000000000","01010101", 280, clk,din,cs_valid);
		  WAIT FOR 5010 us;
READ (2*thigh,2*tlow,"000000010000000000000000", 256, clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 
WREN(thigh,tlow,clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 
PP (thigh,tlow,  "000000100000000000000000","01010101", 280, clk,din,cs_valid);
		  WAIT FOR 5010 us;
READ (2*thigh,2*tlow,"000000100000000000000000", 256, clk,din,cs_valid);
	  WAIT FOR 5*tLOW; 


-- Protected Area Check Test
WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
WRSR (thigh,tlow,"00000000",clk,din,cs_valid); 
	WAIT FOR 15001 us;
RDSR(thigh,tlow,1,clk,din,cs_valid); 
	WAIT FOR 5*tLOW;
WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
BE (thigh,tlow,clk,din,cs_valid);
	WAIT FOR 40001 ms;
WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
PP (thigh,tlow,"000111110000000000000000","01010101", 1, clk,din,cs_valid);
	WAIT FOR 5010 us;
WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
PP (thigh,tlow,"000111111111111111111111","10101010", 1, clk,din,cs_valid);
	WAIT FOR 5010 us;
fast_READ (thigh,tlow,"000011101111111111111111", 2, clk,din,cs_valid); -- Read last byte of Sector 30, and then first byte of Sector 31
	WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000111111111111111111111", 2, clk,din,cs_valid); -- Read the last byte of the memory , and then the first one
	WAIT FOR 5*tLOW;
WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
BE (thigh,tlow,clk,din,cs_valid);
	WAIT FOR 40001 ms;
WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
WRSR (thigh,tlow,"00000100",clk,din,cs_valid); 
	WAIT FOR 15001 us;
RDSR(thigh,tlow,1,clk,din,cs_valid); 
	WAIT FOR 5*tLOW;
WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
PP (thigh,tlow,"000111110000000000000000","01010101", 1, clk,din,cs_valid);
	WAIT FOR 5010 us;
WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
PP (thigh,tlow,"000111111111111111111111","10101010", 1, clk,din,cs_valid);
	WAIT FOR 5010 us;
fast_READ (thigh,tlow,"000011101111111111111111", 2, clk,din,cs_valid); -- Read last byte of Sector 30, and then first byte of Sector 31
	WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000111111111111111111111", 2, clk,din,cs_valid); -- Read the last byte of the memory , and then the first one
	WAIT FOR 5*tLOW;

-- Bulk erase, but one sector protected
WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
BE (thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;

-- Bulk erase

WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
WRSR (thigh,tlow,"00000100",clk,din,cs_valid);
	WAIT FOR 15001 us;
RDSR(thigh,tlow,1,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
WREN(thigh,tlow,clk,din,cs_valid);
	WAIT FOR 5*tLOW;
BE (thigh,tlow,clk,din,cs_valid);
	WAIT FOR 40001 ms;

-- fast_READ again to check BE
fast_READ (thigh,tlow,"000000000000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000000010000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000000100000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000000110000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000001000000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000001010000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000001100000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000001110000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000010000000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000010010000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000010100000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000010110000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000011000000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000011010000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000011100000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000011110000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000100000000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000100010000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000100100000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000100110000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000101000000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000101010000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000101100000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000101110000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000110000000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000110010000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000110100000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000110110000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000111000000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000111010000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000111100000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;
fast_READ (thigh,tlow,"000111110000000000000000", 15, clk,din,cs_valid);
	  WAIT FOR 5*tLOW;

ALIM(25 ns ,100 ns, 1 ms,3 ms,3.2,2.7,2.5,0.2,0.05,Vcc);

WAIT;
end process;
	
end BENCH;