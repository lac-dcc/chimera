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

entity float_scalar_vector_mult is
generic (VALUES_PER_LINE : integer := 16);
port (
	clk : in std_logic;
	resetn : in std_logic;
	trigger : in std_logic;
	scalar : in std_logic_vector(31 downto 0);
	vector : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	result_almost_valid : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(32*VALUES_PER_LINE-1 downto 0));
end float_scalar_vector_mult;

architecture behavioral of float_scalar_vector_mult is

signal reset : std_logic;

signal internal_scalar : std_logic_vector(31 downto 0);
signal internal_vector : std_logic_vector(32*VALUES_PER_LINE-1 downto 0);

constant TOTAL_LATENCY : integer := 4;

signal internal_trigger : std_logic_vector(TOTAL_LATENCY-1 downto 0);

type result_type is array (VALUES_PER_LINE-1 downto 0) of std_logic_vector(31 downto 0);
signal internal_result : result_type;

component fp_mult_arria10
	port (
		a      : in  std_logic_vector(31 downto 0) := (others => '0'); --      a.a
		areset : in  std_logic                     := '0';             -- areset.reset
		b      : in  std_logic_vector(31 downto 0) := (others => '0'); --      b.b
		clk    : in  std_logic                     := '0';             --    clk.clk
		q      : out std_logic_vector(31 downto 0)                     --      q.q
	);
end component;

begin

reset <= not resetn;

GenFP_MULT: for k in 0 to VALUES_PER_LINE-1 generate
	fp_mult_arria10_inst: fp_mult_arria10 PORT MAP(
		a => internal_scalar,
		areset => reset,
		b => internal_vector(k*32+31 downto k*32),
		clk => clk,
		q => internal_result(k));

	result(k*32+31 downto k*32) <= internal_result(k);
end generate GenFP_MULT;

result_almost_valid <= internal_trigger(TOTAL_LATENCY-3);
result_valid <= internal_trigger(TOTAL_LATENCY-1);

process(clk)
begin
if clk'event and clk = '1' then
	internal_scalar <= scalar;
	internal_vector <= vector;

	internal_trigger(0) <= trigger;
	for k in 1 to TOTAL_LATENCY-1 loop
		internal_trigger(k) <= internal_trigger(k-1);
	end loop;
end if;
end process;

end architecture;