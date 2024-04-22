LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
 
ENTITY main IS
    PORT ( ce1 : IN  STD_LOGIC;
           ce2 : IN  STD_LOGIC;
           reg : IN  STD_LOGIC;
           a0 : IN  STD_LOGIC;
           oe_even : OUT  STD_LOGIC;		-- OE for even byte (active low)
           oe_odd : OUT  STD_LOGIC;		-- OE for odd byte (active low)
           oe_oddlow : OUT  STD_LOGIC;		-- OE odd byte on d0-d7 (active low)
           ce_attr_external : OUT  STD_LOGIC;	-- external CE for attribute memory
           ce_upp : OUT  STD_LOGIC;		-- CE for upper SRAM
           ce_low : OUT  STD_LOGIC;		-- CE for lower SRAM

	   sw_rom : IN STD_LOGIC;		-- RAM/disk switch

	   oe_rom : IN STD_LOGIC;		-- ROM OE (active low)
	   addr : IN STD_LOGIC_VECTOR(4 downto 0); -- addr lines (for ROM)
	   data : OUT STD_LOGIC_VECTOR(7 downto 0)); -- data output lines (for ROM)
		   
END main;

ARCHITECTURE behavioral OF main IS

TYPE cis_rom IS ARRAY (0 to 31) OF STD_LOGIC_VECTOR(7 downto 0);
CONSTANT cis_rom_ram : cis_rom := (
	0 => "00000001",	-- tuple: CIS device
	1 => "00000011",	-- tuple: link to next
	2 => "01100100",	-- SRAM 100 ns
	3 => "00001110",	-- 4MB
	4 => "11111111",	-- tuple: end
	5 => "00010101",	-- tuple: version 1
	6 => "00001110",	-- tuple: link to next
	7 => "00000100",	-- PCMCIA 1.x
	8 => "00000001",	-- PCMCIA 1.1
	9 => "01010011",	-- S
	10 => "01000001",	-- A
	11 => "01001011",	-- K
	12 => "01010101",	-- U
	13 => "01010010",	-- R
	14 => "01000001",	-- A
	15 => "00000000",	-- NULL delimeter
	16 => "00110001",	-- 1
	17 => "00000000",	-- NULL delimeter
	18 => "00000000",	-- NULL delimeter
	19 => "11111111",	-- tuple: end
	20 => "11111111",	-- tuple: end of chain
	21 => "11111111",
	22 => "11111111",
	23 => "11111111",
	24 => "11111111",
	25 => "11111111",
	26 => "11111111",
	27 => "11111111",
	28 => "11111111",
	29 => "11111111",
	30 => "11111111",
	31 => "11111111");

CONSTANT cis_rom_disk : cis_rom := (
	0 => "00000000",
	1 => "00000000",
	2 => "00000000",
	3 => "00000000",
	4 => "00000000",
	5 => "00000000",
	6 => "00000000",
	7 => "00000000",
	8 => "00000000",
	9 => "00000000",
	10 => "00000000",
	11 => "00000000",
	12 => "00000000",
	13 => "00000000",
	14 => "00000000",
	15 => "00000000",
	16 => "00000000",
	17 => "00000000",
	18 => "00000000",
	19 => "00000000",
	20 => "00000000",
	21 => "11111111",
	22 => "11111111",
	23 => "11111111",
	24 => "11111111",
	25 => "11111111",
	26 => "11111111",
	27 => "11111111",
	28 => "11111111",
	29 => "11111111",
	30 => "11111111",
	31 => "11111111");

signal ce_attr_internal : STD_LOGIC;		-- CE for internal ROM (active low)

BEGIN

	-- chip select for SRAM chips
	ce_low <= '0' WHEN reg='1' AND ce1='0' ELSE '1';
	ce_upp <= '0' WHEN reg='1' AND ce2='0' ELSE '1';

	-- chip select for attribute memory
	ce_attr_external <= 'Z'; -- no external ROM connected in the final revision

	ce_attr_internal <= '0' WHEN reg='0' AND ce1='0' AND ce2='0' AND oe_rom='0' ELSE
			    '0' WHEN reg='0' AND ce1='0' AND ce2='1' AND oe_rom='0' AND a0='0' ELSE
			    '1';
				
	-- output enable signals for SRAM
	oe_even <= '0' WHEN reg='1' AND ce1='0' AND ce2='0' ELSE -- x16
		   '0' WHEN reg='1' AND ce1='0' AND ce2='1' AND a0='0' ELSE -- x8
		   '1';
	oe_odd <= '0' WHEN reg='1' AND ce1='0' AND ce2='0' ELSE -- x16
		  '0' WHEN reg='1' AND ce1='1' AND ce2='0' ELSE -- x8 
		  '1';				  
	-- separate output enable for odd byte on d7-d0
	oe_oddlow <= '0' WHEN reg='1' AND ce1='0' AND ce2='1' AND a0='1' ELSE -- x8
		     '1';

	data <= cis_rom_ram(TO_INTEGER(UNSIGNED(addr))) WHEN ce_attr_internal='0' AND sw_rom='1' ELSE
		cis_rom_disk(TO_INTEGER(UNSIGNED(addr))) WHEN ce_attr_internal='0' AND sw_rom='0' ELSE
		-- "00000000" WHEN ce_internal_rom='0' ELSE
		"ZZZZZZZZ";

END behavioral;

