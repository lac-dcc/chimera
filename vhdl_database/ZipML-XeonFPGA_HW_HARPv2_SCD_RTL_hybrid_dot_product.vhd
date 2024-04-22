--
--  Copyright 2016 - 2017 Systems Group, ETH Zurich
-- 
--  This hardware operator is free software: you can redistribute it and/or
--  modify it under the terms of the GNU General Public License as published
--  by the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
-- 
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
-- 
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hybrid_dot_product is
generic (
	LOG2_VALUES_PER_LINE : integer := 5);
port (
	clk : in std_logic;
	resetn : in std_logic;
	trigger : in std_logic;
	accumulation_count : in std_logic_vector(31 downto 0);
	vector1 : in std_logic_vector(32*2**LOG2_VALUES_PER_LINE-1 downto 0);
	vector2 : in std_logic_vector(32*2**LOG2_VALUES_PER_LINE-1 downto 0);
	valid_allowed : in std_logic;
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end hybrid_dot_product;

architecture behavioral of hybrid_dot_product is

constant VALUES_PER_LINE : integer := 2**LOG2_VALUES_PER_LINE;

signal reset : std_logic;

constant CONVERSION_LATENCY : integer := 2;

signal accumulation_count_unsigned : unsigned(31 downto 0);

signal float_mult_result_almost_valid : std_logic;
signal float_mult_result_valid : std_logic;
signal float_mult_result : std_logic_vector(32*VALUES_PER_LINE-1 downto 0);

signal fixed_mult_result_valid : std_logic;
signal fixed_mult_result : std_logic_vector(48*VALUES_PER_LINE-1 downto 0);

signal adder_tree_result_valid : std_logic;
signal adder_tree_result : std_logic_vector(47 downto 0);

signal internal_accumulation_count : integer;
signal accumulation : signed(47 downto 0);

signal valid_pulse_counter : unsigned(31 downto 0);
signal valid_pulse_counter_actual : unsigned(31 downto 0);

signal internal_result_valid : std_logic_vector(CONVERSION_LATENCY downto 0);
signal internal_result : signed(47 downto 0);

type float_vector_type is array(15 downto 0) of std_logic_vector(31 downto 0);
signal vector1_monitor : float_vector_type;
signal vector2_monitor : float_vector_type;

signal result_valid_internal : std_logic;

component fp_converter48_arria10
    port (
        a      : in  std_logic_vector(47 downto 0) := (others => '0'); --      a.a
        areset : in  std_logic                     := '0';             -- areset.reset
        clk    : in  std_logic                     := '0';             --    clk.clk
        q      : out std_logic_vector(31 downto 0)                     --      q.q
    );
end component;

component float_vector_mult
generic (VALUES_PER_LINE : integer := 16);
port (
	clk : in std_logic;
	resetn : in std_logic;
	trigger : in std_logic;
	vector1 : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	vector2 : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(32*VALUES_PER_LINE-1 downto 0));
end component;

component fixed_adder_tree
generic (
	PRECISION : integer := 48;
	LOG2_VALUES_PER_LINE : integer := 4);
port (
	clk : in std_logic;
	trigger : in std_logic;
	vector : in std_logic_vector(PRECISION*2**LOG2_VALUES_PER_LINE-1 downto 0);
	result_valid : out std_logic;
	result : out std_logic_vector(PRECISION-1 downto 0));
end component;

function convert_float_to_signed23(float : std_logic_vector(31 downto 0)) return std_logic_vector is
variable exponent : unsigned(7 downto 0);
variable mantissa : unsigned(22 downto 0);
variable temp : unsigned(47 downto 0);
variable result : signed(47 downto 0);
begin
	exponent := unsigned(float(30 downto 23));
	mantissa := unsigned(float(22 downto 0));
	temp := X"000000" & '1' & mantissa;
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

begin

reset <= not resetn;

vector_mult: float_vector_mult
generic map (
	VALUES_PER_LINE => VALUES_PER_LINE)
port map (
	clk => clk,
	resetn => resetn,
	trigger => trigger,
	vector1 => vector1,
	vector2 => vector2,
	result_almost_valid => float_mult_result_almost_valid,
	result_valid => float_mult_result_valid,
	result => float_mult_result);

adder_tree: fixed_adder_tree
generic map (
	PRECISION => 48,
	LOG2_VALUES_PER_LINE => LOG2_VALUES_PER_LINE)
port map (
	clk => clk,
	trigger => fixed_mult_result_valid,
	vector => fixed_mult_result,
	result_valid => adder_tree_result_valid,
	result => adder_tree_result);

fp_converter_arria10_inst: fp_converter48_arria10
port map(
	a => std_logic_vector(internal_result),
	areset => reset,
	clk => clk,
	q => result);

result_almost_valid <= internal_result_valid(CONVERSION_LATENCY);
result_valid <= result_valid_internal;

process(clk)
begin
if clk'event and clk = '1' then
	accumulation_count_unsigned <= unsigned(accumulation_count);

	fixed_mult_result_valid <= float_mult_result_valid;
	for k in 0 to 15 loop
		fixed_mult_result(48*(k+1)-1 downto 48*k) <= convert_float_to_signed23(float_mult_result(32*(k+1)-1 downto 32*k));
	end loop;

	if resetn = '0' then
		internal_accumulation_count <= 0;
		accumulation <= (others => '0');
		valid_pulse_counter <= (others => '0');
		valid_pulse_counter_actual <= (others => '0');

		internal_result_valid <= (others => '0');
		internal_result <= (others => '0');

		result_valid_internal <= '0';
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

		if internal_result_valid(CONVERSION_LATENCY) = '1' then
			valid_pulse_counter <= accumulation_count_unsigned-1;
			valid_pulse_counter_actual <= accumulation_count_unsigned;
		end if;

		result_valid_internal <= '0';
		if valid_allowed = '1' and valid_pulse_counter > 0 then
			result_valid_internal <= '1';
			if result_valid_internal = '1' then
				valid_pulse_counter <= valid_pulse_counter - 1;
			end if;
		end if;

		if valid_allowed = '1' and result_valid_internal = '1' then
			valid_pulse_counter_actual <= valid_pulse_counter_actual - 1;
		end if;

		if valid_pulse_counter = 0 and valid_pulse_counter_actual = 1 and valid_allowed = '0' then
			valid_pulse_counter <= valid_pulse_counter + 1;
		end if;

		for i in 1 to CONVERSION_LATENCY loop
			internal_result_valid(i) <= internal_result_valid(i-1);
		end loop;
	end if;

	for k in 0 to 15 loop
		vector1_monitor(k) <= vector1(32*(k+1)-1 downto 32*k);
		vector2_monitor(k) <= vector2(32*(k+1)-1 downto 32*k);
	end loop;
end if;
end process;

end architecture;