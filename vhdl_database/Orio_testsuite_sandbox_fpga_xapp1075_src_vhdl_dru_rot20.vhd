-------------------------------------------------------------------------------
-- Copyright (c) 2005 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor: Xilinx
-- \   \   \/    Version: 1.0
--  \   \        Filename: prbsgen_ser.vhd
--  /   /        Date Last Modified:  May 1 2007
-- /___/   /\    Date Created: May 1 2007
-- \   \  /  \
--  \___\/\___\
-- 
--Device: Virtex-5
--Purpose: Rotator for the barrel shifter.
--Reference:
--    
--Revision History:
--    Rev 1.0 - First created, Giovanni Guasti and Paolo Novellini, May 1 2007.
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- to Elisa
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY rot20 IS
    Port ( 
	    	CLK			: in	STD_LOGIC;
	    	RST			: in	STD_LOGIC;
			HIN			: in	STD_LOGIC_VECTOR(19 downto 0);
			HOUT		: out	STD_LOGIC_VECTOR(19 downto 0);
	    	P			: in	STD_LOGIC_VECTOR(4 downto 0)
		);
END rot20;

ARCHITECTURE behavior OF rot20 IS 

SIGNAL a				: STD_LOGIC_VECTOR(19 downto 0);
SIGNAL b				: STD_LOGIC_VECTOR(19 downto 0);
SIGNAL c				: STD_LOGIC_VECTOR(19 downto 0);
SIGNAL d				: STD_LOGIC_VECTOR(19 downto 0);
SIGNAL e				: STD_LOGIC_VECTOR(19 downto 0);

BEGIN

a 		<= HIN(19 downto 0) when P(0)='0' else HIN(18 downto 0) &  HIN(19);           -- 1
b 		<= a(19 downto 0)   when P(1)='0' else   a(17 downto 0)    & a(19 downto 18); -- 2
c 		<= b(19 downto 0)   when P(2)='0' else   b(15 downto 0)    & b(19 downto 16); -- 4
d 		<= c(19 downto 0)   when P(3)='0' else   c(11 downto 0)    & c(19 downto 12); -- 8
e 		<= d(19 downto 0)   when P(4)='0' else   d(3 downto  0)    & d(19 downto 4);  -- 16

	PROCESS (CLK,RST)
	begin
		if RST='0' then
			HOUT 	<= (others=>'0');
		elsif rising_edge(CLK) then
			HOUT <= e;
		end if;
	end process;


END;
