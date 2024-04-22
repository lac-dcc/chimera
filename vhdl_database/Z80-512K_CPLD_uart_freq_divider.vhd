--------------------------------------------------------------------------
-- uart_freq_divider.vhd - Frequency divider
--		Divides input freqency by 3^m*2^n, where m is [0, 1] and n = [0, 15]
--		The 5-bit divisor value is encoded as |m0|n3|n2|n1|n0|
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

entity uart_freq_divider is
   port
   (
		divisor	: in std_logic_vector(4 downto 0);	-- Divisor value
      clk_in	: in std_logic;							-- Clock input
		clk_out	: out std_logic							-- Clock output
   );
end entity uart_freq_divider;

architecture behavioral of uart_freq_divider is
	signal clk_divide_by_3_out : std_logic;
	signal prescale_in : std_logic;
	signal clk_divide_by_2_in : std_logic;
	signal clk_divide_by_2_out : std_logic;
	signal clk_divide_by_4_in : std_logic;
	signal clk_divide_by_4_1_out : std_logic;
	signal clk_divide_by_4_out : std_logic;
	signal clk_divide_by_16_in : std_logic;
	signal clk_divide_by_16_1_out : std_logic;
	signal clk_divide_by_16_2_out : std_logic;
	signal clk_divide_by_16_3_out : std_logic;
	signal clk_divide_by_16_out : std_logic;
	signal clk_divide_by_256_in : std_logic;
	signal clk_divide_by_256_1_out : std_logic;
	signal clk_divide_by_256_2_out : std_logic;
	signal clk_divide_by_256_3_out : std_logic;
	signal clk_divide_by_256_4_out : std_logic;
	signal clk_divide_by_256_5_out : std_logic;
	signal clk_divide_by_256_6_out : std_logic;
	signal clk_divide_by_256_7_out : std_logic;
	signal clk_divide_by_256_out : std_logic;
	signal clk_buffer_in : std_logic;
	signal clk_buffer_out : std_logic;
	component divide_by_2
		port(
			carry_in		: in std_logic;
			clk			: in std_logic;
			carry_out	: out std_logic;
			q				: out std_logic
		);	
	end component;
	component divide_by_3
		port(
		clk				: in std_logic;
		q					: out std_logic
		);	
	end component;
	-- D flip-flop with reset
	component d_ff_rst
		port(
			d			: in std_logic;
			clk		: in std_logic;
			rst_n		: in std_logic;
			q			: out std_logic
		);
	end component;
begin
	-- UART frequency divider logic

	-- Divide by 3
	clk_divide_by_3 : divide_by_3 port
		map(
			clk => clk_in,
			q => clk_divide_by_3_out
		);

	prescale_in <= clk_divide_by_3_out when divisor(4) = '1' else '1';

	-- Prescale - divide input clock by 2
--	clk_divide_prescale : divide_by_2 port
--		map(
--			carry_in => prescale_in,
--			clk => clk_in,
--			carry_out => clk_divide_by_2_in
--		);

	-- No prescale
	clk_divide_by_2_in <= prescale_in;

		-- Divide by 2
	clk_divide_by_2 : divide_by_2 port
		map(
			carry_in => clk_divide_by_2_in,
			clk => clk_in,
			carry_out => clk_divide_by_2_out
		);

	clk_divide_by_4_in <= clk_divide_by_2_out when divisor(0) = '1' else clk_divide_by_2_in;

	-- Divide by 4
	clk_divide_by_4_1 : divide_by_2 port
		map(
			carry_in => clk_divide_by_4_in,
			clk => clk_in,
			carry_out => clk_divide_by_4_1_out
		);
	clk_divide_by_4_2 : divide_by_2 port
		map(
			carry_in => clk_divide_by_4_1_out,
			clk => clk_in,
			carry_out => clk_divide_by_4_out

		);
	
	clk_divide_by_16_in <= clk_divide_by_4_out when divisor(1) = '1' else clk_divide_by_4_in;

	-- Divide by 16
	clk_divide_by_16_1 : divide_by_2 port
		map(
			carry_in => clk_divide_by_16_in,
			clk => clk_in,
			carry_out => clk_divide_by_16_1_out
		);
	clk_divide_by_16_2 : divide_by_2 port
		map(
			carry_in => clk_divide_by_16_1_out,
			clk => clk_in,
			carry_out => clk_divide_by_16_2_out
		);
	clk_divide_by_16_3 : divide_by_2 port
		map(
			carry_in => clk_divide_by_16_2_out,
			clk => clk_in,
			carry_out => clk_divide_by_16_3_out
		);
	clk_divide_by_16_4 : divide_by_2 port
		map(
			carry_in => clk_divide_by_16_3_out,
			clk => clk_in,
			carry_out => clk_divide_by_16_out
		);

	clk_divide_by_256_in <= clk_divide_by_16_out when divisor(2) = '1' else clk_divide_by_16_in;

	-- Divide by 256
	clk_divide_by_256_1 : divide_by_2 port
		map(
			carry_in => clk_divide_by_256_in,
			clk => clk_in,
			carry_out => clk_divide_by_256_1_out
		);
	clk_divide_by_256_2 : divide_by_2 port
		map(
			carry_in => clk_divide_by_256_1_out,
			clk => clk_in,
			carry_out => clk_divide_by_256_2_out
		);
	clk_divide_by_256_3 : divide_by_2 port
		map(
			carry_in => clk_divide_by_256_2_out,
			clk => clk_in,
			carry_out => clk_divide_by_256_3_out
		);
	clk_divide_by_256_4 : divide_by_2 port
		map(
			carry_in => clk_divide_by_256_3_out,
			clk => clk_in,
			carry_out => clk_divide_by_256_4_out
		);
	clk_divide_by_256_5 : divide_by_2 port
		map(
			carry_in => clk_divide_by_256_4_out,
			clk => clk_in,
			carry_out => clk_divide_by_256_5_out
		);
	clk_divide_by_256_6 : divide_by_2 port
		map(
			carry_in => clk_divide_by_256_5_out,
			clk => clk_in,
			carry_out => clk_divide_by_256_6_out
		);
	clk_divide_by_256_7 : divide_by_2 port
		map(
			carry_in => clk_divide_by_256_6_out,
			clk => clk_in,
			carry_out => clk_divide_by_256_7_out
		);
	clk_divide_by_256_8 : divide_by_2 port
		map(
			carry_in => clk_divide_by_256_7_out,
			clk => clk_in,
			carry_out => clk_divide_by_256_out
		);

	clk_buffer_in <= clk_divide_by_256_out when divisor(3) = '1' else clk_divide_by_256_in;

	-- Buffer flip-flop for elimitating glitches in carry out
	buffer_ff : d_ff_rst port
		map(
			d => clk_buffer_in,
			clk => clk_in,
			rst_n => '1',
			q => clk_buffer_out
		);

	-- Short path without division
	clk_out <= clk_in when divisor(4) = '0' and divisor(3) = '0' and divisor(2) = '0' and
								  divisor(1) = '0' and divisor(0) = '0'
							else clk_buffer_out;
	
end architecture behavioral;
