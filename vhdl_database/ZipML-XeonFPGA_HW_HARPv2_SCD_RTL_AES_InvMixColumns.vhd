-------------------------------------------------------------------------
--  Copyright (C) 2018 Kaan Kara - Systems Group, ETH Zurich

--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU Affero General Public License as published
--  by the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.

--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU Affero General Public License for more details.

--  You should have received a copy of the GNU Affero General Public License
--  along with this program. If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity InvMixColumns is
port (
	clk : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(127 downto 0);
	out_valid : out std_logic;
	out_data : out std_logic_vector(127 downto 0));
end InvMixColumns;

architecture structural of InvMixColumns is

type mult_typ is array(0 to 3) of integer;
constant column0_mult : mult_typ := (14, 9, 13, 11);
constant column1_mult : mult_typ := (11, 14, 9, 13);
constant column2_mult : mult_typ := (13, 11, 14, 9);
constant column3_mult : mult_typ := (9, 13, 11, 14);

signal in_valid_1d : std_logic;

type intermediate_result_type is array(15 downto 0) of std_logic_vector(31 downto 0);
signal intermediate_result : intermediate_result_type;

component GF256Mult
generic (
	SELECTION : integer := 9);
port (
	clk : in std_logic;

	in_data : in std_logic_vector(7 downto 0);
	out_data : out std_logic_vector(7 downto 0));
end component;

begin

GenGF256Mult_j: for j in 0 to 3 generate
	GenGF256Mult_i: for i in 0 to 3 generate
		GF256Mult_inst0: GF256Mult
		generic map (
			SELECTION => column0_mult(i))
		port map (
			clk => clk,
			in_data => in_data(j*32+7 downto j*32),
			out_data => intermediate_result(j*4+i)(7 downto 0));

		GF256Mult_inst1: GF256Mult
		generic map (
			SELECTION => column1_mult(i))
		port map (
			clk => clk,
			in_data => in_data(j*32+15 downto j*32+8),
			out_data => intermediate_result(j*4+i)(15 downto 8));

		GF256Mult_inst2: GF256Mult
		generic map (
			SELECTION => column2_mult(i))
		port map (
			clk => clk,
			in_data => in_data(j*32+23 downto j*32+16),
			out_data => intermediate_result(j*4+i)(23 downto 16));

		GF256Mult_inst3: GF256Mult
		generic map (
			SELECTION => column3_mult(i))
		port map (
			clk => clk,
			in_data => in_data(j*32+31 downto j*32+24),
			out_data => intermediate_result(j*4+i)(31 downto 24));
	end generate GenGF256Mult_i;
end generate GenGF256Mult_j;


process(clk)
begin
if clk'event and clk = '1' then
	for i in 0 to 15 loop
		out_data(8*i+7 downto 8*i) <= intermediate_result(i)(31 downto 24) xor intermediate_result(i)(23 downto 16) xor intermediate_result(i)(15 downto 8) xor intermediate_result(i)(7 downto 0);
	end loop;

	in_valid_1d <= in_valid;
	out_valid <= in_valid_1d;
end if;
end process;

end architecture;