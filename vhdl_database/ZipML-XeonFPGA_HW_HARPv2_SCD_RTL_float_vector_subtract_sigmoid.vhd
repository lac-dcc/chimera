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

entity float_vector_subtract_sigmoid is
generic (VALUES_PER_LINE : integer := 16);
port (
	clk : in std_logic;
	resetn : in std_logic;
	trigger : in std_logic;
	vector1 : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	vector2 : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	do_sigmoid : in std_logic;
	result_valid : out std_logic;
	result : out std_logic_vector(32*VALUES_PER_LINE-1 downto 0));
end float_vector_subtract_sigmoid;

architecture behavioral of float_vector_subtract_sigmoid is

signal reset : std_logic;

constant TOTAL_LATENCY : integer := 3;

type result_type is array (VALUES_PER_LINE-1 downto 0) of std_logic_vector(31 downto 0);
signal internal_result : result_type;

signal internal_trigger : std_logic_vector(TOTAL_LATENCY-1 downto 0);

signal sigmoid_trigger : std_logic;
signal sigmoid_valid : std_logic;
signal b_fifo_valid : std_logic;
signal b_fifo_dout : std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
signal b_fifo_almostfull : std_logic;
signal b_fifo_count : std_logic_vector(5 downto 0);
signal sigmoid : std_logic_vector(32*VALUES_PER_LINE-1 downto 0);

signal sub_vector1 : std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
signal sub_vector2 : std_logic_vector(32*VALUES_PER_LINE-1 downto 0);

type float_vector_type is array(15 downto 0) of std_logic_vector(31 downto 0);
signal vector1_monitor : float_vector_type;
signal vector2_monitor : float_vector_type;

component normal2axis_fifo
generic (
	FIFO_WIDTH : integer;
	LOG2_FIFO_DEPTH : integer);
 port(
	clk : in std_logic;
	resetn : in std_logic;

	write_enable : in std_logic;
	write_data : in std_logic_vector(FIFO_WIDTH-1 downto 0);
	
	m_axis_tvalid : out std_logic;
	m_axis_tready : in std_logic;
	m_axis_tdata : out std_logic_vector(FIFO_WIDTH-1 downto 0);

	almostfull : out std_logic;
	count : out std_logic_vector(LOG2_FIFO_DEPTH-1 downto 0) );
end component;

component float_sigmoid
generic (VALUES_PER_LINE : integer := 16);
port (
	clk : in std_logic;
	reset : in std_logic;
	trigger : in std_logic;
	vector : in std_logic_vector(32*VALUES_PER_LINE-1 downto 0);
	result_valid : out std_logic;
	result : out std_logic_vector(32*VALUES_PER_LINE-1 downto 0));
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

begin

reset <= not resetn;

sigmoid_trigger <= trigger when do_sigmoid = '1' else '0';
b_fifo: normal2axis_fifo
generic map (
	FIFO_WIDTH => 512,
	LOG2_FIFO_DEPTH => 6)
port map (
	clk => clk,
	resetn => resetn,

	write_enable => sigmoid_trigger,
	write_data => vector2,

	m_axis_tready => sigmoid_valid,
	m_axis_tvalid => b_fifo_valid,
	m_axis_tdata => b_fifo_dout,

	almostfull => b_fifo_almostfull,
	count => b_fifo_count);

float_sigmoid_inst: float_sigmoid
generic map (
	VALUES_PER_LINE => VALUES_PER_LINE)
port map (
	clk => clk,
	reset => reset,
	trigger => sigmoid_trigger,
	vector => vector1,
	result_valid => sigmoid_valid,
	result => sigmoid);

sub_vector1 <= vector1 when do_sigmoid = '0' else sigmoid;
sub_vector2 <= vector2 when do_sigmoid = '0' else b_fifo_dout;

GenFP_SUB: for k in 0 to VALUES_PER_LINE-1 generate
	fp_subtract_arria10_inst: fp_subtract_arria10 PORT MAP (
		a => sub_vector1(k*32+31 downto k*32),
		areset => reset,
		b => sub_vector2(k*32+31 downto k*32),
		clk => clk,
		q => internal_result(k));

	result(k*32+31 downto k*32) <= internal_result(k);
end generate GenFP_SUB;

result_valid <= internal_trigger(TOTAL_LATENCY-1);

process(clk)
begin
if clk'event and clk = '1' then
	if do_sigmoid = '0' then
		internal_trigger(0) <= trigger;
	else
		internal_trigger(0) <= sigmoid_valid;
	end if;
	for k in 1 to TOTAL_LATENCY-1 loop
		internal_trigger(k) <= internal_trigger(k-1);
	end loop;

	for k in 0 to 15 loop
		vector1_monitor(k) <= vector1(32*(k+1)-1 downto 32*k);
		vector2_monitor(k) <= vector2(32*(k+1)-1 downto 32*k);
	end loop;
end if;
end process;

end architecture;