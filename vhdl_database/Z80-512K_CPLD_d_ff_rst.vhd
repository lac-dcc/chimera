--------------------------------------------------------------------------
-- d_ff_rst.vhd - D flip-flop with reset
--------------------------------------------------------------------------
-- Compiles with Quartus II 13.0sp1
--
-- Copyright (C) 2020 - 2021 Sergey Kiselev.
-- Provided for hobbyist use on the Z80-512K and Tiny Z80 modules.
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity d_ff_rst is
   port(
      clk 	: in std_logic;							-- Clock / write enable
      rst_n	: in std_logic;							-- Reset (active low)
      d 		: in std_logic;							-- Flip-flop input
		q		: out std_logic							-- Flop-flop output
   );
end entity d_ff_rst;
 
architecture behavioral of d_ff_rst is
begin
   process (clk, rst_n) is
   begin
		if rst_n = '0' then
			q <= '0';										-- Reset if rst_n is active
		elsif rising_edge(clk) then  
         q <= d;											-- Write data on the rising edge of clk
		end if;
	end process;
end architecture behavioral;