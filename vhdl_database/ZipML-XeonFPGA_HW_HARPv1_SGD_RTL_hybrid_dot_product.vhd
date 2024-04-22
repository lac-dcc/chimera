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

entity hybrid_dot_product is
port (
	clk : in std_logic;
	resetn : in std_logic;

	trigger : in std_logic;
	accumulation_count : in std_logic_vector(17 downto 0);
	vector1 : in std_logic_vector(511 downto 0);
	vector2 : in std_logic_vector(511 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end hybrid_dot_product;

architecture behavioral of hybrid_dot_product is

signal accumulation_count_unsigned : unsigned(17 downto 0);

signal float_mult_result_almost_valid : std_logic;
signal float_mult_result_valid : std_logic;
signal float_mult_result : std_logic_vector(511 downto 0);

signal fixed_mult_result_valid : std_logic;
signal fixed_mult_result : std_logic_vector(511 downto 0);

signal adder_tree_result_valid : std_logic;
signal adder_tree_result : std_logic_vector(31 downto 0);

signal internal_accumulation_count : integer;
signal accumulation : signed(31 downto 0);

signal valid_pulse_counter : integer;

signal internal_result_valid : std_logic_vector(7 downto 0);
signal internal_result : signed(31 downto 0);

component my_float_converter23
port (
	clock		: IN STD_LOGIC ;
	dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
end component;

component my_float_converter27
port (
	clock		: IN STD_LOGIC ;
	dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
end component;

component float_vector_mult
generic (VECTOR_SIZE : integer := 16);
port (
	clk : in std_logic;
	trigger : in std_logic;
	vector1 : in std_logic_vector(32*VECTOR_SIZE-1 downto 0);
	vector2 : in std_logic_vector(32*VECTOR_SIZE-1 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(32*VECTOR_SIZE-1 downto 0));
end component;

component fixed_adder_tree
generic (VECTOR_SIZE_BITS : integer := 4);
port (
	clk : in std_logic;
	trigger : in std_logic;
	vector : in std_logic_vector(32*2**VECTOR_SIZE_BITS-1 downto 0);
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end component;

function convert_float_to_signed23(float : std_logic_vector(31 downto 0)) return std_logic_vector is
variable exponent : unsigned(7 downto 0);
variable mantissa : unsigned(22 downto 0);
variable temp : unsigned(31 downto 0);
variable result : signed(31 downto 0);
begin
	exponent := unsigned(float(30 downto 23));
	mantissa := unsigned(float(22 downto 0));
	temp := X"00" & '1' & mantissa;
	if exponent >= 127 then
		temp := shift_left(temp, to_integer(exponent-127));
	else
		temp := shift_right(temp, to_integer(127-exponent));
	end if;
	result := signed(std_logic_vector(temp));
	if float(31) = '1' then
		result := -result;
	end if;
	return std_logic_vector(result);
end function;

function convert_float_to_signed27(float : std_logic_vector(31 downto 0)) return std_logic_vector is
variable exponent : unsigned(7 downto 0);
variable mantissa : unsigned(22 downto 0);
variable temp : unsigned(35 downto 0);
variable result : signed(31 downto 0);
begin
	exponent := unsigned(float(30 downto 23));
	mantissa := unsigned(float(22 downto 0));
	temp := X"00" & '1' & mantissa & X"0";
	if exponent >= 127 then
		temp := shift_left(temp, to_integer(exponent-127));
	else
		temp := shift_right(temp, to_integer(127-exponent));
	end if;
	result := signed(std_logic_vector(temp(31 downto 0)));
	if float(31) = '1' then
		result := -result;
	end if;
	return std_logic_vector(result);
end function;

begin

vector_mult: float_vector_mult
generic map (
	VECTOR_SIZE => 16)
port map (
	clk => clk,
	trigger => trigger,
	vector1 => vector1,
	vector2 => vector2,
	result_almost_valid => float_mult_result_almost_valid,
	result_valid => float_mult_result_valid,
	result => float_mult_result);

adder_tree: fixed_adder_tree
generic map (
	VECTOR_SIZE_BITS => 4)
port map (
	clk => clk,
	trigger => fixed_mult_result_valid,
	vector => fixed_mult_result,
	result_valid => adder_tree_result_valid,
	result => adder_tree_result);

float_converter: my_float_converter23
port map (
	clock => clk,
	dataa => std_logic_vector(internal_result),
	result => result);

accumulation_count_unsigned <= unsigned(accumulation_count);

result_almost_valid <= internal_result_valid(3);

process(clk)
begin
if clk'event and clk = '1' then
	fixed_mult_result_valid <= float_mult_result_valid;
	for k in 0 to 15 loop
		fixed_mult_result(32*k+31 downto 32*k) <= convert_float_to_signed23(float_mult_result(32*k+31 downto 32*k));
	end loop;

	if resetn = '0' then
		internal_accumulation_count <= 0;
		accumulation <= (others => '0');
		valid_pulse_counter <= 0;

		internal_result_valid <= (others => '0');
		internal_result <= (others => '0');
	else

		internal_result_valid(0) <= '0';
		if adder_tree_result_valid = '1' then
			if internal_accumulation_count = accumulation_count_unsigned-1 then
				internal_accumulation_count <= 0;
				internal_result_valid(0) <= '1';
				internal_result <= accumulation + signed(adder_tree_result);
				accumulation <= (others => '0');
			else
				internal_accumulation_count <= internal_accumulation_count + 1;
				accumulation <= accumulation + signed(adder_tree_result);
			end if;
		end if;

		result_valid <= '0';
		if internal_result_valid(5) = '1' or valid_pulse_counter > 0 then
			result_valid <= '1';
			if valid_pulse_counter = accumulation_count_unsigned-1 then
				valid_pulse_counter <= 0;
			else
				valid_pulse_counter <= valid_pulse_counter + 1;
			end if;
		end if;

		for i in 1 to 7 loop
			internal_result_valid(i) <= internal_result_valid(i-1);
		end loop;
	end if;
end if;
end process;

end architecture;