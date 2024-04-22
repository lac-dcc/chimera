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
--Purpose: Controller for the barrel shifter.
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
USE ieee.std_logic_arith.ALL;

ENTITY control IS
    Port ( 
	    	CLK			: in	STD_LOGIC;
	    	RST			: in	STD_LOGIC;
			DV			: in	STD_LOGIC_VECTOR(3 downto 0);
			SHIFT       : out	STD_LOGIC_VECTOR(4 downto 0);
			WRFLAG      : out	STD_LOGIC;
			VALID       : out	STD_LOGIC
		);
END control;

ARCHITECTURE behavior OF control IS 


SIGNAL temp             : STD_LOGIC_VECTOR(4 downto 0);
SIGNAL pointer          : STD_LOGIC_VECTOR(4 downto 0); 
SIGNAL flag             : STD_LOGIC;
SIGNAL flag_d           : STD_LOGIC;
SIGNAL rflag            : STD_LOGIC;
SIGNAL wrflags          : STD_LOGIC;
SIGNAL valids           : STD_LOGIC;

BEGIN



-- pointer

    temp <= pointer + ('0' & DV);      -- 0->31
    -- calculating nextpointer from DV and pointer
	PROCESS (CLK,RST)
	begin
		if RST='0' then
			pointer <= (others=>'0');
		elsif rising_edge(CLK) then
		    if temp <= "10011" then
		        pointer <= temp;
		    else
		        pointer <= temp - "10100";
		    end if;
		end if;
	end process;
	
    SHIFT  <= pointer;

	flag    <= '0' when (pointer    < "01010") else '1';
	
	PROCESS (CLK,RST)
	begin
		if RST='0' then
			flag_d 	<= '0';
		elsif rising_edge(CLK) then
            flag_d  <= flag;
		end if;
	end process;
	
	PROCESS (CLK,RST)
	begin
		if RST='0' then
			wrflags 	<= '0';
		elsif rising_edge(CLK) then
            wrflags  <= flag_d;
            valids   <= flag XOR flag_d;
		end if;
	end process;

    WRFLAG <= wrflags;
    VALID  <= valids;

END;