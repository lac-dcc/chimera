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

entity stepsize_and_regularization is
generic (VALUES_PER_LINE : integer := 16);
port (
	clk : in std_logic;
	reset : in std_logic;
	trigger : in std_logic;
	dot : in std_logic_vector(31 downto 0);
	model : in std_logic_vector(31 downto 0);
	stepsize : in std_logic_vector(31 downto 0);
	lambda : in std_logic_vector(31 downto 0);
	result_valid_once : out std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(31 downto 0));
end stepsize_and_regularization;

architecture structural of stepsize_and_regularization is

constant TOTAL_LATENCY : integer := 7;
signal internal_trigger : std_logic_vector(TOTAL_LATENCY-1 downto 0);

signal minus_lambda : std_logic_vector(31 downto 0);
signal step : std_logic_vector(31 downto 0);
signal delta : std_logic_vector(31 downto 0);
signal gt_result : std_logic;
signal lt_result : std_logic;

signal result_for_gt : std_logic_vector(31 downto 0);
signal result_for_lt : std_logic_vector(31 downto 0);

signal result_internal : std_logic_vector(31 downto 0);

component fp_mult_arria10
	port (
		a      : in  std_logic_vector(31 downto 0) := (others => '0'); --      a.a
		areset : in  std_logic                     := '0';             -- areset.reset
		b      : in  std_logic_vector(31 downto 0) := (others => '0'); --      b.b
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

component fp_gt_arria10
	port (
		a      : in  std_logic_vector(31 downto 0) := (others => '0'); --      a.a
		areset : in  std_logic                     := '0';             -- areset.reset
		b      : in  std_logic_vector(31 downto 0) := (others => '0'); --      b.b
		clk    : in  std_logic                     := '0';             --    clk.clk
		q      : out std_logic
	);
end component;

component fp_lt_arria10
	port (
		a      : in  std_logic_vector(31 downto 0) := (others => '0'); --      a.a
		areset : in  std_logic                     := '0';             -- areset.reset
		b      : in  std_logic_vector(31 downto 0) := (others => '0'); --      b.b
		clk    : in  std_logic                     := '0';             --    clk.clk
		q      : out std_logic
	);
end component;

begin

minus_lambda <= (not lambda(31)) & lambda(30 downto 0);

COMP_step_size_mult: fp_mult_arria10
port map (
	a => dot,
	areset => reset,
	b => stepsize,
	clk => clk,
	q => step);

COMP_subtract: fp_subtract_arria10
port map (
	a => model,
	areset => reset,
	b => step,
	clk => clk,
	q => delta);

COMP_subtract_for_output1: fp_subtract_arria10
port map (
	a => step,
	areset => reset,
	b => minus_lambda,
	clk => clk,
	q => result_for_gt);

COMP_subtract_for_output2: fp_subtract_arria10
port map (
	a => step,
	areset => reset,
	b => lambda,
	clk => clk,
	q => result_for_lt);

COMP_gt: fp_gt_arria10
port map (
	a => delta,
	areset => reset,
	b => lambda,
	clk => clk,
	q => gt_result);

COMP_lt: fp_lt_arria10
port map (
	a => delta,
	areset => reset,
	b => minus_lambda,
	clk => clk,
	q => lt_result);

result_valid_once <= internal_trigger(TOTAL_LATENCY-1) and (not internal_trigger(TOTAL_LATENCY-2));
result_valid <= internal_trigger(TOTAL_LATENCY-1);
result <= result_internal;

process(clk)
begin
if clk'event and clk = '1' then
	internal_trigger(0) <= trigger;
	for k in 1 to TOTAL_LATENCY-1 loop
		internal_trigger(k) <= internal_trigger(k-1);
	end loop;

	if gt_result = '1' then
		result_internal <= result_for_gt;
	elsif lt_result = '1' then
		result_internal <= result_for_lt;
	else
		result_internal <= model;
	end if;
end if;
end process;

end architecture;