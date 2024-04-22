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

entity decompressor is
generic(
	LOG2_BUFFER_DEPTH : integer := 8);
port (
	clk : in std_logic;
	resetn : in std_logic;
	to_integer_scaler : std_logic_vector(15 downto 0);
	in_valid : in std_logic;
	in_data : in std_logic_vector(511 downto 0);
	out_valid : out std_logic;
	out_data : out std_logic_vector(511 downto 0);
	out_fifo_free_count : out std_logic_vector(LOG2_BUFFER_DEPTH downto 0));
end decompressor;

architecture behavioral of decompressor is

constant BUFFER_DEPTH : integer := 2**LOG2_BUFFER_DEPTH;
signal reset : std_logic;

signal meta1 : std_logic_vector(3 downto 0);
signal meta2 : std_logic_vector(3 downto 0);

type fifo_data_type is array (7 downto 0) of std_logic_vector(255 downto 0);
type fifo_count_type is array (7 downto 0) of std_logic_vector(LOG2_BUFFER_DEPTH-1 downto 0);

signal read_status_valid : std_logic;
signal read_status_ready : std_logic;
signal read_status : std_logic_vector(7 downto 0);
signal read_status_almostfull : std_logic;
signal read_status_count : std_logic_vector(LOG2_BUFFER_DEPTH-1 downto 0);
signal read_next : integer range 0 to 7 := 0;

signal fifo_we : std_logic_vector(7 downto 0);
signal fifo_re : std_logic_vector(7 downto 0);
signal fifo_valid : std_logic_vector(7 downto 0);
signal fifo_din : fifo_data_type;
signal fifo_dout : fifo_data_type;
signal fifo_count : fifo_count_type;
signal fifo_empty : std_logic_vector(7 downto 0);
signal fifo_full : std_logic_vector(7 downto 0);
signal fifo_almostfull: std_logic_vector(7 downto 0);

constant DELAY : integer := 6;
signal out_line_part_valid : std_logic_vector(DELAY downto 0);

signal which_part : std_logic;
signal out_line_part : std_logic_vector(255 downto 0);
signal out_line_fixed : std_logic_vector(383 downto 0);
signal out_line_scaled : std_logic_vector(383 downto 0);
signal out_line_float : std_logic_vector(255 downto 0);
signal out_line : std_logic_vector(511 downto 0);

signal left_shift : integer range 0 to 23;

component fifo
generic(
	FIFO_WIDTH : integer := 32;
	FIFO_DEPTH_BITS : integer := 8;
	FIFO_ALMOSTFULL_THRESHOLD : integer := 220);
port(
	clk :		in std_logic;
	resetn :	in std_logic;

	we :		in std_logic;
	din :		in std_logic_vector(FIFO_WIDTH-1 downto 0);	
	re :		in std_logic;
	valid :		out std_logic;
	dout :		out std_logic_vector(FIFO_WIDTH-1 downto 0);
	count :		out std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
	empty :		out std_logic;
	full :		out std_logic;
	almostfull: out std_logic);
end component;

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

component fp_converter48_arria10
    port (
        a      : in  std_logic_vector(47 downto 0) := (others => '0'); --      a.a
        areset : in  std_logic                     := '0';             -- areset.reset
        clk    : in  std_logic                     := '0';             --    clk.clk
        q      : out std_logic_vector(31 downto 0)                     --      q.q
    );
end component;

begin

out_data <= out_line;
out_fifo_free_count <= std_logic_vector( to_unsigned(BUFFER_DEPTH, LOG2_BUFFER_DEPTH+1) - unsigned(fifo_count(0)) );

GenX: for k in 0 to 7 generate
	fifoX: fifo
	generic map (
		FIFO_WIDTH => 256,
		FIFO_DEPTH_BITS => LOG2_BUFFER_DEPTH,
		FIFO_ALMOSTFULL_THRESHOLD => 2**LOG2_BUFFER_DEPTH-30)
	port map (
		clk => clk,
		resetn => resetn,

		we => fifo_we(k),
		din => fifo_din(k),
		re => fifo_re(k),
		valid => fifo_valid(k),
		dout => fifo_dout(k),
		count => fifo_count(k),
		empty => fifo_empty(k),
		full => fifo_full(k),
		almostfull => fifo_almostfull(k));
end generate GenX;

read_status_fifo: normal2axis_fifo
generic map (
	FIFO_WIDTH => 8,
	LOG2_FIFO_DEPTH => LOG2_BUFFER_DEPTH)
port map (
	clk => clk,
	resetn => resetn,

	write_enable => fifo_we(0),
	write_data => fifo_we,

	m_axis_tvalid => read_status_valid,
	m_axis_tready => read_status_ready,
	m_axis_tdata => read_status,

	almostfull => read_status_almostfull,
	count => read_status_count);


reset <= not resetn;
left_shift <= to_integer(23 - unsigned(to_integer_scaler));

GenConvert: for k in 0 to 7 generate
	fp_converter_arria10_inst: fp_converter48_arria10
	port map(
		a => out_line_scaled( (k+1)*48-1 downto k*48 ),
		areset => reset,
		clk => clk,
		q => out_line_float( (k+1)*32-1 downto k*32 ) );
end generate GenConvert;

meta1 <= in_data(255 downto 252);
meta2 <= in_data(511 downto 508);

fifo_we(0) <= in_valid when unsigned(meta1) > 0 else '0';
fifo_we(1) <= in_valid when meta1 = X"2" or meta1 = X"3" or meta1 = X"4" else '0';
fifo_we(2) <= in_valid when meta1 = X"3" or meta1 = X"4" else '0';
fifo_we(3) <= in_valid when meta1 = X"4" else '0';

fifo_we(4) <= in_valid when unsigned(meta2) > 0 else '0';
fifo_we(5) <= in_valid when meta2 = X"2" or meta2 = X"3" or meta2 = X"4" else '0';
fifo_we(6) <= in_valid when meta2 = X"3" or meta2 = X"4" else '0';
fifo_we(7) <= in_valid when meta2 = X"4" else '0';

fifo_din(0) <=	std_logic_vector( signed(in_data(80 downto 74)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(73 downto 67)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(66 downto 60)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(59 downto 53)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(52 downto 46)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(45 downto 39)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(38 downto 32)) + signed(in_data(31 downto 0)) ) &
				in_data(31 downto 0) when meta1 = X"4" else
				std_logic_vector( signed(in_data(94 downto 86)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(85 downto 77)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(76 downto 68)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(67 downto 59)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(58 downto 50)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(49 downto 41)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(40 downto 32)) + signed(in_data(31 downto 0)) ) &
				in_data(31 downto 0) when meta1 = X"3" else
				std_logic_vector( signed(in_data(129 downto 116)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(115 downto 102)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(101 downto 88)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(87 downto 74)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(73 downto 60)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(59 downto 46)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(45 downto 32)) + signed(in_data(31 downto 0)) ) &
				in_data(31 downto 0) when meta1 = X"2" else
				std_logic_vector( signed(in_data(248 downto 218)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(217 downto 187)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(186 downto 156)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(155 downto 125)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(124 downto 94)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(93 downto 63)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(62 downto 32)) + signed(in_data(31 downto 0)) ) &
				in_data(31 downto 0);

fifo_din(1) <=	std_logic_vector( signed(in_data(136 downto 130)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(129 downto 123)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(122 downto 116)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(115 downto 109)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(108 downto 102)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(101 downto 95)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(94 downto 88)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(87 downto 81)) + signed(in_data(31 downto 0)) )
				when meta1 = X"4" else
				std_logic_vector( signed(in_data(166 downto 158)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(157 downto 149)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(148 downto 140)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(139 downto 131)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(130 downto 122)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(121 downto 113)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(112 downto 104)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(103 downto 95)) + signed(in_data(31 downto 0)) )
				when meta1 = X"3" else
				std_logic_vector( signed(in_data(241 downto 228)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(227 downto 214)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(213 downto 200)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(199 downto 186)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(185 downto 172)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(171 downto 158)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(157 downto 144)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(143 downto 130)) + signed(in_data(31 downto 0)) );

fifo_din(2) <=	std_logic_vector( signed(in_data(192 downto 186)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(185 downto 179)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(178 downto 172)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(171 downto 165)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(164 downto 158)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(157 downto 151)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(150 downto 144)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(143 downto 137)) + signed(in_data(31 downto 0)) )
				when meta1 = X"4" else
				std_logic_vector( signed(in_data(238 downto 230)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(229 downto 221)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(220 downto 212)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(211 downto 203)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(202 downto 194)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(193 downto 185)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(184 downto 176)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(175 downto 167)) + signed(in_data(31 downto 0)) );
				
fifo_din(3) <=	std_logic_vector( signed(in_data(248 downto 242)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(241 downto 235)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(234 downto 228)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(227 downto 221)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(220 downto 214)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(213 downto 207)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(206 downto 200)) + signed(in_data(31 downto 0)) ) &
				std_logic_vector( signed(in_data(199 downto 193)) + signed(in_data(31 downto 0)) );




fifo_din(4) <=	std_logic_vector( signed(in_data(80+256 downto 74+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(73+256 downto 67+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(66+256 downto 60+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(59+256 downto 53+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(52+256 downto 46+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(45+256 downto 39+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(38+256 downto 32+256)) + signed(in_data(31+256 downto 256)) ) &
				in_data(31+256 downto 256) when meta2 = X"4" else
				std_logic_vector( signed(in_data(94+256 downto 86+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(85+256 downto 77+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(76+256 downto 68+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(67+256 downto 59+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(58+256 downto 50+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(49+256 downto 41+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(40+256 downto 32+256)) + signed(in_data(31+256 downto 256)) ) &
				in_data(31+256 downto 256) when meta2 = X"3" else
				std_logic_vector( signed(in_data(129+256 downto 116+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(115+256 downto 102+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(101+256 downto 88+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(87+256 downto 74+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(73+256 downto 60+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(59+256 downto 46+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(45+256 downto 32+256)) + signed(in_data(31+256 downto 256)) ) &
				in_data(31+256 downto 256) when meta2 = X"2" else
				std_logic_vector( signed(in_data(248+256 downto 218+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(217+256 downto 187+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(186+256 downto 156+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(155+256 downto 125+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(124+256 downto 94+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(93+256 downto 63+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(62+256 downto 32+256)) + signed(in_data(31+256 downto 256)) ) &
				in_data(31+256 downto 256);

fifo_din(5) <=	std_logic_vector( signed(in_data(136+256 downto 130+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(129+256 downto 123+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(122+256 downto 116+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(115+256 downto 109+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(108+256 downto 102+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(101+256 downto 95+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(94+256 downto 88+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(87+256 downto 81+256)) + signed(in_data(31+256 downto 256)) )
				when meta2 = X"4" else
				std_logic_vector( signed(in_data(166+256 downto 158+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(157+256 downto 149+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(148+256 downto 140+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(139+256 downto 131+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(130+256 downto 122+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(121+256 downto 113+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(112+256 downto 104+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(103+256 downto 95+256)) + signed(in_data(31+256 downto 256)) )
				when meta2 = X"3" else
				std_logic_vector( signed(in_data(241+256 downto 228+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(227+256 downto 214+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(213+256 downto 200+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(199+256 downto 186+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(185+256 downto 172+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(171+256 downto 158+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(157+256 downto 144+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(143+256 downto 130+256)) + signed(in_data(31+256 downto 256)) );

fifo_din(6) <=	std_logic_vector( signed(in_data(192+256 downto 186+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(185+256 downto 179+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(178+256 downto 172+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(171+256 downto 165+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(164+256 downto 158+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(157+256 downto 151+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(150+256 downto 144+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(143+256 downto 137+256)) + signed(in_data(31+256 downto 256)) )
				when meta2 = X"4" else
				std_logic_vector( signed(in_data(238+256 downto 230+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(229+256 downto 221+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(220+256 downto 212+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(211+256 downto 203+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(202+256 downto 194+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(193+256 downto 185+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(184+256 downto 176+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(175+256 downto 167+256)) + signed(in_data(31+256 downto 256)) );
				
fifo_din(7) <=	std_logic_vector( signed(in_data(248+256 downto 242+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(241+256 downto 235+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(234+256 downto 228+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(227+256 downto 221+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(220+256 downto 214+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(213+256 downto 207+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(206+256 downto 200+256)) + signed(in_data(31+256 downto 256)) ) &
				std_logic_vector( signed(in_data(199+256 downto 193+256)) + signed(in_data(31+256 downto 256)) );

process(clk)
begin
if clk'event and clk = '1' then
	for d in 1 to DELAY loop
		out_line_part_valid(d) <= out_line_part_valid(d-1);
	end loop;

	if resetn = '0' then
		fifo_re <= (others => '0');

		read_status_ready <= '0';
		read_next <= 0;

		which_part <= '0';

		out_valid <= '0';
	else


		fifo_re <= (others => '0');
		read_status_ready <= '0';
		if read_status_valid = '1' and read_status_ready = '0' then
			if read_status(0) = '1' and read_next = 0 then
				fifo_re(0) <= '1';

				if read_status(1) = '1' then
					read_next <= 1;
				elsif read_status(4) = '1' then
					read_next <= 4;
				else
					read_status_ready <= '1';
					read_next <= 0;
				end if;
			elsif read_status(1) = '1' and read_next = 1 then
				fifo_re(1) <= '1';
				
				if read_status(2) = '1' then
					read_next <= 2;
				elsif read_status(4) = '1' then
					read_next <= 4;
				else
					read_status_ready <= '1';
					read_next <= 0;
				end if;
			elsif read_status(2) = '1' and read_next = 2 then
				fifo_re(2) <= '1';
				
				if read_status(3) = '1' then
					read_next <= 3;
				elsif read_status(4) = '1' then
					read_next <= 4;
				else
					read_status_ready <= '1';
					read_next <= 0;
				end if;
			elsif read_status(3) = '1' and read_next = 3 then
				fifo_re(3) <= '1';
				
				if read_status(4) = '1' then
					read_next <= 4;
				else
					read_status_ready <= '1';
					read_next <= 0;
				end if;
			elsif read_status(4) = '1' and read_next = 4 then
				fifo_re(4) <= '1';
				
				if read_status(5) = '1' then
					read_next <= 5;
				else
					read_status_ready <= '1';
					read_next <= 0;
				end if;
			elsif read_status(5) = '1' and read_next = 5 then
				fifo_re(5) <= '1';
				
				if read_status(6) = '1' then
					read_next <= 6;
				else
					read_status_ready <= '1';
					read_next <= 0;
				end if;
			elsif read_status(6) = '1' and read_next = 6 then
				fifo_re(6) <= '1';
				
				if read_status(7) = '1' then
					read_next <= 7;
				else
					read_status_ready <= '1';
					read_next <= 0;
				end if;
			elsif read_status(7) = '1' and read_next = 7 then
				fifo_re(7) <= '1';
				read_next <= 0;
				read_status_ready <= '1';
			end if;
		end if;
		

		out_line_part_valid(0) <= '0';
		if fifo_valid(0) = '1' then
			out_line_part_valid(0) <= '1';
			out_line_part <= fifo_dout(0);
		elsif fifo_valid(1) = '1' then
			out_line_part_valid(0) <= '1';
			out_line_part <= fifo_dout(1);
		elsif fifo_valid(2) = '1' then
			out_line_part_valid(0) <= '1';
			out_line_part <= fifo_dout(2);
		elsif fifo_valid(3) = '1' then
			out_line_part_valid(0) <= '1';
			out_line_part <= fifo_dout(3);
		elsif fifo_valid(4) = '1' then
			out_line_part_valid(0) <= '1';
			out_line_part <= fifo_dout(4);
		elsif fifo_valid(5) = '1' then
			out_line_part_valid(0) <= '1';
			out_line_part <= fifo_dout(5);
		elsif fifo_valid(6) = '1' then
			out_line_part_valid(0) <= '1';
			out_line_part <= fifo_dout(6);
		elsif fifo_valid(7) = '1' then
			out_line_part_valid(0) <= '1';
			out_line_part <= fifo_dout(7);
		end if;

		for k in 0 to 7 loop
			out_line_fixed( (k+1)*48-1 downto k*48 ) <= X"0000" & out_line_part( (k+1)*32-1 downto k*32 );
			out_line_scaled( (k+1)*48-1 downto k*48 ) <= std_logic_vector( shift_left(unsigned(out_line_fixed( (k+1)*48-1 downto k*48 )), left_shift) );
		end loop;

		out_valid <= '0';
		if out_line_part_valid(DELAY) = '1' then
			which_part <= not which_part;
			if which_part = '0' then
				out_line(255 downto 0) <= out_line_float;
			else
				out_valid <= '1';
				out_line(511 downto 256) <= out_line_float;
			end if;
		end if;

	end if;
end if;
end process;

end architecture;