--------------------------------------------------------------------------
-- page_reg_4x6.vhd - 4x6 bit page register with output enable
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

entity page_reg_4x6 is
   port
   (
		data			: in std_logic_vector (5 downto 0);	-- Input (write) data
		rdaddress	: in std_logic_vector (1 downto 0);	-- Output (read) address
		wraddress	: in std_logic_vector (1 downto 0); -- Input (write) address
		wren			: in std_logic;							-- Write enable
		rden			: in std_logic;							-- Read enable (register outputs "000000" when rden is inactive)
		q				: out std_logic_vector (5 downto 0)	-- Data (read) output
   );
end entity page_reg_4x6;

architecture behavioral of page_reg_4x6 is
	signal page0	: std_logic_vector(5 downto 0);		-- Page register 0 output
	signal page1	: std_logic_vector(5 downto 0);		-- Page register 1 output
	signal page2	: std_logic_vector(5 downto 0);		-- Page register 2 output
	signal page3	: std_logic_vector(5 downto 0);		-- Page register 3 output
	signal t			: std_logic_vector(5 downto 0);		-- Multiplexed page register output before read enable
	component register_6
		port(
			d			: in std_logic_vector (5 downto 0);
			clk		: in std_logic;
			rst_n		: in std_logic;
			q			: out std_logic_vector (5 downto 0)
		);
	end component;
begin
	-- Page registers
	page0_reg : register_6 port
		map(
			d => data,
			clk => wren and not wraddress(1) and not wraddress(0),	-- Write enable on wraddress = "00"
			rst_n => '1',
			q => page0
		);
	page1_reg : register_6 port
		map(
			d => data,
			clk => wren and not wraddress(1) and wraddress(0),	-- Write enable on wraddress = "01"
			rst_n => '1',
			q => page1
		);
	page2_reg : register_6 port
		map(
			d => data,
			clk => wren and wraddress(1) and not wraddress(0),	-- Write enable on wraddress = "10"
			rst_n => '1',
			q => page2
		);
	page3_reg : register_6 port
		map(
			d => data,
			clk => wren and wraddress(1) and wraddress(0),		-- Write enable on wraddress = "11"
			rst_n => '1',
			q => page3);

	-- Output select multiplexer
	with rdaddress select
		t <=	page0 when "00",
				page1 when "01",
				page2 when "10",
				page3 when "11";

	-- Read (output) enable
	q <= t when rden = '1' else "000000";
end architecture behavioral;