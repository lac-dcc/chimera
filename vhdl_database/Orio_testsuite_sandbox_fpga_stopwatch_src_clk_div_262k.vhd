--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 
--  \   \         Application : 
--  /   /         Filename : 
-- /___/   /\     Timestamp : 
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wtut
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity clk_div_262k is
   port (clk_in     : in    std_logic; 
         div_262144 : out   std_logic);
end clk_div_262k;

architecture divide of clk_div_262k is
signal cnt : integer := 0;
signal div_temp : std_logic := '0';

begin
process (clk_in) begin
	if (clk_in'event and clk_in = '1') then
		if cnt >= 131072 then
			div_temp <= not(div_temp);
			cnt <= 0;
		else	
			div_temp <= div_temp;
			cnt <= cnt + 1;
		end if;
		div_262144 <= div_temp;
	end if;
	end process;
end divide;