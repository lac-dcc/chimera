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

entity AESDEC_CBC is
port (
	clk : in std_logic;
	resetn : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(511 downto 0);
	in_length : in std_logic_vector(15 downto 0);

	program_key_index : in std_logic_vector(3 downto 0);
	program_key : in std_logic_vector(127 downto 0);

	out_valid : out std_logic;
	out_data : out std_logic_vector(511 downto 0));
end AESDEC_CBC;

architecture behavioral of AESDEC_CBC is

signal NumberOfProcessedLines : unsigned(15 downto 0);
signal ivec_written : std_logic;

type keys_type is array (0 to 14) of std_logic_vector(127 downto 0);
signal keys_index : integer range 0 to 15;
signal keys : keys_type := (others => (others => '0'));
signal ivec : std_logic_vector(127 downto 0) := (others => '0');

type intermediate_data_type is array (0 to 14) of std_logic_vector(127 downto 0);
signal intermediate_data0 : intermediate_data_type := (others => (others => '0'));
signal intermediate_data_valid0 : std_logic_vector(0 to 14) := (others => '0');
signal intermediate_data1 : intermediate_data_type := (others => (others => '0'));
signal intermediate_data_valid1 : std_logic_vector(0 to 14) := (others => '0');
signal intermediate_data2 : intermediate_data_type := (others => (others => '0'));
signal intermediate_data_valid2 : std_logic_vector(0 to 14) := (others => '0');
signal intermediate_data3 : intermediate_data_type := (others => (others => '0'));
signal intermediate_data_valid3 : std_logic_vector(0 to 14) := (others => '0');

type fifo_wdata_type is array (3 downto 0) of std_logic_vector(127 downto 0);
signal fifo_we : std_logic_vector(3 downto 0);
signal fifo_wdata : fifo_wdata_type;
signal fifo_rvalid : std_logic_vector(3 downto 0);
signal fifo_rready : std_logic_vector(3 downto 0);
signal fifo_rdata : fifo_wdata_type;
signal fifo_almostfull : std_logic_vector(3 downto 0);

signal in_length_1d : std_logic_vector(15 downto 0);
signal current_length : unsigned(15 downto 0);

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

component AESDEC
generic (
	LAST : integer := 0);
port (
	clk : in std_logic;

	in_valid : in std_logic;
	in_data : in std_logic_vector(127 downto 0);
	in_key : in std_logic_vector(127 downto 0);
	out_valid : out std_logic;
	out_data : out std_logic_vector(127 downto 0));
end component;

begin

fifo_rready(0) <= intermediate_data_valid0(14);
fifo_rready(1) <= intermediate_data_valid1(14);
fifo_rready(2) <= intermediate_data_valid2(14);
fifo_rready(3) <= intermediate_data_valid3(14);
GenFIFOs: for i in 0 to 3 generate
normal2axis_fifo_inst: normal2axis_fifo
generic map (
	FIFO_WIDTH => 128,
	LOG2_FIFO_DEPTH => 8)
port map (
	clk => clk,
	resetn => resetn,

	write_enable => fifo_we(i),
	write_data => fifo_wdata(i),

	m_axis_tvalid => fifo_rvalid(i),
	m_axis_tready => fifo_rready(i),
	m_axis_tdata => fifo_rdata(i),

	almostfull => fifo_almostfull(i));
end generate GenFIFOs;

GenAESDEC0: for i in 1 to 13 generate
AESDEC0_inst: AESDEC
generic map (
	LAST => 0)
port map (
	clk => clk,
	in_valid => intermediate_data_valid0(i-1),
	in_data => intermediate_data0(i-1),
	in_key => keys(i),
	out_valid => intermediate_data_valid0(i),
	out_data => intermediate_data0(i));
end generate GenAESDEC0;
AESDEC0_LAST_inst: AESDEC
generic map (
	LAST => 1)
port map (
	clk => clk,
	in_valid => intermediate_data_valid0(13),
	in_data => intermediate_data0(13),
	in_key => keys(14),
	out_valid => intermediate_data_valid0(14),
	out_data => intermediate_data0(14));


GenAESDEC1: for i in 1 to 13 generate
AESDEC1_inst: AESDEC
generic map (
	LAST => 0)
port map (
	clk => clk,
	in_valid => intermediate_data_valid1(i-1),
	in_data => intermediate_data1(i-1),
	in_key => keys(i),
	out_valid => intermediate_data_valid1(i),
	out_data => intermediate_data1(i));
end generate GenAESDEC1;
AESDEC1_LAST_inst: AESDEC
generic map (
	LAST => 1)
port map (
	clk => clk,
	in_valid => intermediate_data_valid1(13),
	in_data => intermediate_data1(13),
	in_key => keys(14),
	out_valid => intermediate_data_valid1(14),
	out_data => intermediate_data1(14));

GenAESDEC2: for i in 1 to 13 generate
AESDEC2_inst: AESDEC
generic map (
	LAST => 0)
port map (
	clk => clk,
	in_valid => intermediate_data_valid2(i-1),
	in_data => intermediate_data2(i-1),
	in_key => keys(i),
	out_valid => intermediate_data_valid2(i),
	out_data => intermediate_data2(i));
end generate GenAESDEC2;
AESDEC2_LAST_inst: AESDEC
generic map (
	LAST => 1)
port map (
	clk => clk,
	in_valid => intermediate_data_valid2(13),
	in_data => intermediate_data2(13),
	in_key => keys(14),
	out_valid => intermediate_data_valid2(14),
	out_data => intermediate_data2(14));

GenAESDEC3: for i in 1 to 13 generate
AESDEC3_inst: AESDEC
generic map (
	LAST => 0)
port map (
	clk => clk,
	in_valid => intermediate_data_valid3(i-1),
	in_data => intermediate_data3(i-1),
	in_key => keys(i),
	out_valid => intermediate_data_valid3(i),
	out_data => intermediate_data3(i));
end generate GenAESDEC3;
AESDEC3_LAST_inst: AESDEC
generic map (
	LAST => 1)
port map (
	clk => clk,
	in_valid => intermediate_data_valid3(13),
	in_data => intermediate_data3(13),
	in_key => keys(14),
	out_valid => intermediate_data_valid3(14),
	out_data => intermediate_data3(14));

keys_index <= to_integer(unsigned(program_key_index));
process(clk)
begin
if clk'event and clk = '1' then
	if keys_index < 15 then
		keys(keys_index) <= program_key;
	else
		ivec <= program_key;
	end if;

	intermediate_data_valid0(0) <= in_valid;
	intermediate_data_valid1(0) <= in_valid;
	intermediate_data_valid2(0) <= in_valid;
	intermediate_data_valid3(0) <= in_valid;

	intermediate_data0(0) <= in_data(127 downto 0) xor keys(0);
	intermediate_data1(0) <= in_data(255 downto 128) xor keys(0);
	intermediate_data2(0) <= in_data(383 downto 256) xor keys(0);
	intermediate_data3(0) <= in_data(511 downto 384) xor keys(0);

	out_valid <= intermediate_data_valid0(14);
	out_data(127 downto 0) <= intermediate_data0(14) xor fifo_rdata(0);
	out_data(255 downto 128) <= intermediate_data1(14) xor fifo_rdata(1);
	out_data(383 downto 256) <= intermediate_data2(14) xor fifo_rdata(2);
	out_data(511 downto 384) <= intermediate_data3(14) xor fifo_rdata(3);

	in_length_1d <= in_length;
	if unsigned(in_length_1d) = 0 and unsigned(in_length) > 0 then
		current_length <= unsigned(in_length);
	end if;

	if resetn = '0' then
		NumberOfProcessedLines <= (others => '0');
		ivec_written <= '0';
	else

		fifo_we <= (others => '0');
		if NumberOfProcessedLines = 0 and ivec_written = '0' and unsigned(current_length) > 0 then
			ivec_written <= '1';
			fifo_we(0) <= '1';
			fifo_wdata(0) <= ivec;
		end if;

		if in_valid = '1' then
			if NumberOfProcessedLines = unsigned(current_length)-1 then
				NumberOfProcessedLines <= (others => '0');
				ivec_written <= '0';

				fifo_we(3 downto 1) <= (others => '1');
				fifo_wdata(1) <= in_data(127 downto 0);
				fifo_wdata(2) <= in_data(255 downto 128);
				fifo_wdata(3) <= in_data(383 downto 256);
			else
				NumberOfProcessedLines <= NumberOfProcessedLines + 1;

				fifo_we <= (others => '1');
				fifo_wdata(0) <= in_data(511 downto 384);
				fifo_wdata(1) <= in_data(127 downto 0);
				fifo_wdata(2) <= in_data(255 downto 128);
				fifo_wdata(3) <= in_data(383 downto 256);
			end if;
		end if;

	end if;
end if;
end process;


end architecture;