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

entity fifo is
generic(
  FIFO_WIDTH : integer;
  FIFO_DEPTH_BITS : integer;
  FIFO_ALMOSTFULL_THRESHOLD: integer);
port(
  clk :    in std_logic;
  resetn :  in std_logic;

  we :    in std_logic;
  din :    in std_logic_vector(FIFO_WIDTH-1 downto 0);  
  re :    in std_logic;
  valid :    out std_logic;
  dout :    out std_logic_vector(FIFO_WIDTH-1 downto 0);
  count :    out std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
  empty :    out std_logic;
  full :    out std_logic;
  almostfull: out std_logic);
end fifo;

architecture behavioral of fifo is

constant FIFO_DEPTH : unsigned(FIFO_DEPTH_BITS-1 downto 0) := (others => '1');

signal rpointer : unsigned(FIFO_DEPTH_BITS-1 downto 0);
signal wpointer : unsigned(FIFO_DEPTH_BITS-1 downto 0);

signal bram_we : std_logic;
signal bram_re : std_logic;
signal bram_raddr : std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
signal bram_waddr : std_logic_vector(FIFO_DEPTH_BITS-1 downto 0);
signal bram_din : std_logic_vector(FIFO_WIDTH-1 downto 0);
signal bram_dout : std_logic_vector(FIFO_WIDTH-1 downto 0);

signal bram_re_1d : std_logic;

signal internal_count : unsigned(FIFO_DEPTH_BITS-1 downto 0);
signal internal_empty : std_logic;
signal internal_full : std_logic;

component simple_dual_port_ram_single_clock
generic(
  DATA_WIDTH : integer := 32;
  ADDR_WIDTH : integer := 8);
port(
  clk :   in std_logic;
  raddr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
  waddr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
  data :  in std_logic_vector(DATA_WIDTH-1 downto 0);
  we :    in std_logic;
  q :     out std_logic_vector(DATA_WIDTH-1 downto 0));
end component;

begin

bram: simple_dual_port_ram_single_clock
generic map (
	DATA_WIDTH => FIFO_WIDTH,
	ADDR_WIDTH => FIFO_DEPTH_BITS)
port map (
	clk => clk,
	raddr => bram_raddr,
	waddr => bram_waddr,
	data => bram_din,
	we => bram_we,
	q => bram_dout);

count <= std_logic_vector(internal_count);
empty <= internal_empty;
full <= internal_full;

process(clk)
begin
if clk'event and clk = '1' then
	if internal_count < to_unsigned(FIFO_ALMOSTFULL_THRESHOLD, FIFO_DEPTH_BITS) then
		almostfull <= '0';
	else
		almostfull <= '1';
	end if;

	bram_din <= din;
	bram_re_1d <= bram_re;

	if resetn ='0' then
		rpointer <= (others => '0');
		wpointer <= (others => '0');

		bram_we <= '0';
		bram_re <= '0';
		bram_raddr <= (others => '0');
		bram_waddr <= (others => '0');

		valid <= '0';
		dout <= (others => '0');
		
		internal_count <= (others => '0');
		internal_empty <= '1';
		internal_full <= '0';
	else
		bram_we <= '0';
		if we = '1' then
			bram_we <= '1';
			bram_waddr <= std_logic_vector(wpointer);
			wpointer <= wpointer + 1;
		end if;

		bram_re <= '0';
		if re = '1' and internal_empty = '0' then
			bram_re <= '1';
			bram_raddr <= std_logic_vector(rpointer);
			rpointer <= rpointer + 1;
		end if;

		valid <= '0';
		if bram_re_1d = '1' then
			valid <= '1';
			dout <= bram_dout;
		end if;
		
		if we = '1' and (re = '1' nand internal_empty = '0') then
			internal_count <= internal_count+1;
			if internal_count = FIFO_DEPTH-1 then
				internal_full <= '1';
			end if;
			internal_empty <= '0';
		elsif we = '0' and (re = '1' and internal_empty = '0') then
			internal_count <= internal_count-1;
			if internal_count = 1 then
				internal_empty <= '1';
			end if;
			internal_full <= '0';
		end if;

	end if;
end if;
end process;

end architecture;