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

entity float_sigmoid is
generic (VALUES_PER_LINE : integer := 16);
port (
	clk : in std_logic;
	reset : in std_logic;
	trigger : in std_logic;
	vector : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	result_valid : out std_logic;
	result : out std_logic_vector(32*VALUES_PER_LINE-1 downto 0));
end float_sigmoid;

architecture structural of float_sigmoid is

constant TOTAL_LATENCY : integer := 27;
signal internal_trigger : std_logic_vector(TOTAL_LATENCY-1 downto 0);

type result_type is array (VALUES_PER_LINE-1 downto 0) of std_logic_vector(31 downto 0);
signal ones : result_type;
signal minus_ones : result_type;
signal exp_input : result_type;
signal exp_output : result_type;
signal denom_output : result_type;
signal result_internal : result_type;

component fp_exp_arria10_nohard
	port (
		a      : in  std_logic_vector(31 downto 0) := (others => '0'); --      a.a
		areset : in  std_logic                     := '0';             -- areset.reset
		clk    : in  std_logic                     := '0';             --    clk.clk
		q      : out std_logic_vector(31 downto 0)                     --      q.q
	);
end component;

component fp_subtract_arria10
	port (
		a      : in  std_logic_vector(31 downto 0) := (others => '0'); --      a.a
		areset : in  std_logic                     := '0';             -- areset.reset
		b      : in  std_logic_vector(31 downto 0) := (others => '0'); --      b.b
		clk    : in  std_logic                     := '0';             --    clk.clk
		q      : out std_logic_vector(31 downto 0)                     --      q.q
	);
end component;

component fp_div_arria10
	port (
		a      : in  std_logic_vector(31 downto 0) := (others => '0'); --      a.a
		areset : in  std_logic                     := '0';             -- areset.reset
		b      : in  std_logic_vector(31 downto 0) := (others => '0'); --      b.b
		clk    : in  std_logic                     := '0';             --    clk.clk
		q      : out std_logic_vector(31 downto 0)                     --      q.q
	);
end component;

begin

GenFP_SIGMOID: for k in 0 to VALUES_PER_LINE-1 generate
	ones(k) <= X"3f800000";
	minus_ones(k) <= X"bf800000";

	exp_input(k) <= (not vector(k*32+31)) & vector(k*32+30 downto k*32);
	fp_exp_arria10_inst: fp_exp_arria10_nohard PORT MAP (
		a => exp_input(k),
		areset => reset,
		clk => clk,
		q => exp_output(k));

	fp_subtract_arria10_inst: fp_subtract_arria10 PORT MAP (
		a => exp_output(k),
		areset => reset,
		b => minus_ones(k),
		clk => clk,
		q => denom_output(k));

	fp_div_arria10_inst: fp_div_arria10 PORT MAP (
		a => ones(k),
		areset => reset,
		b => denom_output(k),
		clk => clk,
		q => result_internal(k));

	result(k*32+31 downto k*32) <= result_internal(k);
end generate GenFP_SIGMOID;

result_valid <= internal_trigger(TOTAL_LATENCY-1);

process(clk)
begin
if clk'event and clk = '1' then
	internal_trigger(0) <= trigger;
	for k in 1 to TOTAL_LATENCY-1 loop
		internal_trigger(k) <= internal_trigger(k-1);
	end loop;
end if;
end process;

end architecture;