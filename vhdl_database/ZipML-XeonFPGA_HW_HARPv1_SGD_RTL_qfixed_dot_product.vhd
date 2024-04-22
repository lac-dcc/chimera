----------------------------------------------------------------------------
--  Copyright (C) 2017 Kaan Kara - Systems Group, ETH Zurich

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

entity qfixed_dot_product is
generic (
	QUANTIZATION_BITS : integer := 2);
port (
	clk : in std_logic;
	resetn : in std_logic;

	normalized_to_minus1_1 : in std_logic;
	trigger : in std_logic;
	dimension : in std_logic_vector(17 downto 0);
	vector1 : in std_logic_vector(255 downto 0);
	vector2 : in std_logic_vector(8192/QUANTIZATION_BITS-1 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end qfixed_dot_product;

architecture behavioral of qfixed_dot_product is

signal remainder : integer;
signal accumulation_count : integer;

signal fp_mult_result_valid : std_logic;
signal fp_mult_result : std_logic_vector(8192/QUANTIZATION_BITS-1 downto 0);

signal adder_tree_result_valid : std_logic;
signal adder_tree_result : std_logic_vector(31 downto 0);

signal internal_accumulation_count : integer;
signal accumulation : signed(31 downto 0);

signal valid_pulse_counter : integer;

signal internal_result_valid : std_logic_vector(2 downto 0);
type internal_result_type is array (2 downto 0) of signed(31 downto 0);
signal internal_result : internal_result_type;

component fixed_adder_tree
generic (VECTOR_SIZE_BITS : integer := 4);
port (
	clk : in std_logic;
	trigger : in std_logic;
	vector : in std_logic_vector(32*2**VECTOR_SIZE_BITS-1 downto 0);
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end component;

component flopoco_adder_tree_256
port (
	clk : in std_logic;
	rst : in std_logic;
	trigger : in std_logic;
	vector : in std_logic_vector(8191 downto 0);
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end component;

begin

GEN_adder_tree_Q1: if QUANTIZATION_BITS = 1 generate
	remainder <= 1 when unsigned(dimension(7 downto 0)) > 0 else 0;
	accumulation_count <= to_integer(shift_right(unsigned(dimension), 8)) + remainder;

	adder_tree: fixed_adder_tree
	generic map (
		VECTOR_SIZE_BITS => 8)
	port map (
		clk => clk,
		trigger => fp_mult_result_valid,
		vector => fp_mult_result,
		result_valid => adder_tree_result_valid,
		result => adder_tree_result);
	--adder_tree: flopoco_adder_tree_256
	--port map (
	--	clk => clk,
	--	rst => resetn,
	--	trigger => fp_mult_result_valid,
	--	vector => fp_mult_result,
	--	result_valid => adder_tree_result_valid,
	--	result => adder_tree_result);

	process(clk)
	begin
	if clk'event and clk = '1' then
		for k in 0 to 255 loop
			if vector1(k) = '0' then
				fp_mult_result(32*k+31 downto 32*k) <= (others => '0');
			else
				fp_mult_result(32*k+31 downto 32*k) <= std_logic_vector( signed(vector2(32*k+31 downto 32*k)) );
			end if;
		end loop;
	end if;
	end process;
end generate GEN_adder_tree_Q1;

GEN_adder_tree_Q2: if QUANTIZATION_BITS = 2 generate
	remainder <= 1 when unsigned(dimension(6 downto 0)) > 0 else 0;
	accumulation_count <= to_integer(shift_right(unsigned(dimension), 7)) + remainder;

	adder_tree: fixed_adder_tree
	generic map (
		VECTOR_SIZE_BITS => 7)
	port map (
		clk => clk,
		trigger => fp_mult_result_valid,
		vector => fp_mult_result,
		result_valid => adder_tree_result_valid,
		result => adder_tree_result);

	process(clk)
	begin
	if clk'event and clk = '1' then
		for k in 0 to 127 loop
			if normalized_to_minus1_1 = '0' then
				if vector1(2*k+1 downto 2*k) = B"00" then
					fp_mult_result(32*k+31 downto 32*k) <= (others => '0');
				elsif vector1(2*k+1 downto 2*k) = B"01" then
					fp_mult_result(32*k+31 downto 32*k) <= std_logic_vector( shift_right(signed(vector2(32*k+31 downto 32*k)), 1) );
				else
					fp_mult_result(32*k+31 downto 32*k) <= vector2(32*k+31 downto 32*k);
				end if;
			else
				if vector1(2*k+1 downto 2*k) = B"01" then
					fp_mult_result(32*k+31 downto 32*k) <= vector2(32*k+31 downto 32*k);
				elsif vector1(2*k+1 downto 2*k) = B"11" then
					fp_mult_result(32*k+31 downto 32*k) <= std_logic_vector( -signed(vector2(32*k+31 downto 32*k)) );
				else
					fp_mult_result(32*k+31 downto 32*k) <= (others => '0');
				end if;
			end if;
		end loop;
	end if;
	end process;
end generate GEN_adder_tree_Q2;

GEN_adder_tree_Q4: if QUANTIZATION_BITS = 4 generate
	remainder <= 1 when unsigned(dimension(5 downto 0)) > 0 else 0;
	accumulation_count <= to_integer(shift_right(unsigned(dimension), 6)) + remainder;

	adder_tree: fixed_adder_tree
	generic map (
		VECTOR_SIZE_BITS => 6)
	port map (
		clk => clk,
		trigger => fp_mult_result_valid,
		vector => fp_mult_result,
		result_valid => adder_tree_result_valid,
		result => adder_tree_result);

	process(clk)
	variable temp_result : std_logic_vector(2303 downto 0);
	begin
	if clk'event and clk = '1' then
		for k in 0 to 63 loop
			if vector1(4*k+3 downto 4*k) = B"1000" then
				temp_result(36*k+34 downto 36*k) := vector2(32*k+31 downto 32*k) & B"000";
			else
				temp_result(36*k+35 downto 36*k) := std_logic_vector( signed(vector1(4*k+3 downto 4*k)) * signed(vector2(32*k+31 downto 32*k)) );
			end if;
			if normalized_to_minus1_1 = '0' then
				fp_mult_result(32*k+31 downto 32*k) <= temp_result(36*k+34 downto 36*k+3);
			else
				fp_mult_result(32*k+31 downto 32*k) <= temp_result(36*k+33 downto 36*k+2);
			end if;
		end loop;
	end if;
	end process;
end generate GEN_adder_tree_Q4;

GEN_adder_tree_Q8: if QUANTIZATION_BITS = 8 generate
	remainder <= 1 when unsigned(dimension(4 downto 0)) > 0 else 0;
	accumulation_count <= to_integer(shift_right(unsigned(dimension), 5)) + remainder;

	adder_tree: fixed_adder_tree
	generic map (
		VECTOR_SIZE_BITS => 5)
	port map (
		clk => clk,
		trigger => fp_mult_result_valid,
		vector => fp_mult_result,
		result_valid => adder_tree_result_valid,
		result => adder_tree_result);

	process(clk)
	variable temp_result : std_logic_vector(2559 downto 0);
	begin
	if clk'event and clk = '1' then
		for k in 0 to 31 loop
			if vector1(8*k+7 downto 8*k) = B"10000000" then
				temp_result(40*k+38 downto 40*k) := vector2(32*k+31 downto 32*k) & B"0000000";
			else
				temp_result(40*k+39 downto 40*k) := std_logic_vector( signed(vector1(8*k+7 downto 8*k)) * signed(vector2(32*k+31 downto 32*k)) );
			end if;
			if normalized_to_minus1_1 = '0' then
				fp_mult_result(32*k+31 downto 32*k) <= temp_result(40*k+38 downto 40*k+7);
			else
				fp_mult_result(32*k+31 downto 32*k) <= temp_result(40*k+37 downto 40*k+6);
			end if;
		end loop;
	end if;
	end process;
end generate GEN_adder_tree_Q8;

result_almost_valid <= internal_result_valid(0);

process(clk)
begin
if clk'event and clk = '1' then
	if resetn = '0' then
		internal_accumulation_count <= 0;
		accumulation <= (others => '0');
		valid_pulse_counter <= 0;

		internal_result_valid <= (others => '0');
		internal_result <= (others => (others => '0'));
	else
		fp_mult_result_valid <= trigger;

		internal_result_valid(0) <= '0';
		if adder_tree_result_valid = '1' then
			if internal_accumulation_count = accumulation_count-1 then
				internal_accumulation_count <= 0;
				internal_result_valid(0) <= '1';
				internal_result(0) <= accumulation + signed(adder_tree_result);
				accumulation <= (others => '0');
			else
				internal_accumulation_count <= internal_accumulation_count + 1;
				accumulation <= accumulation + signed(adder_tree_result);
			end if;
		end if;

		if internal_result_valid(2) = '1' then
			result <= std_logic_vector( internal_result(2) );
		end if;

		result_valid <= '0';
		if internal_result_valid(2) = '1' or valid_pulse_counter > 0 then
			result_valid <= '1';
			if valid_pulse_counter = accumulation_count-1 then
				valid_pulse_counter <= 0;
			else
				valid_pulse_counter <= valid_pulse_counter + 1;
			end if;
		end if;

		for k in 1 to 2 loop
			internal_result_valid(k) <= internal_result_valid(k-1);
			internal_result(k) <= internal_result(k-1);
		end loop;
	end if;
end if;
end process;

end architecture;