---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------


-- ipbus_dpram
--
-- Generic 36b wide dual-port memory with ipbus access on one port
-- Note that this takes up *twice* the ipbus address space indicated by ADDR_WIDTH,
--	with the bottom 18 bits of each location in the lower half, and vice versa
--
-- Should lead to an inferred block RAM in Xilinx parts with modern tools
--
-- Note the wait state on ipbus access - full speed access is not possible
-- Can combine with peephole_ram access method for full speed access.
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ipbus_dpram36 is
	generic(
		ADDR_WIDTH: positive
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		rclk: in std_logic;
		we: in std_logic := '0';
		d: in std_logic_vector(35 downto 0) := (others => '0');
		q: out std_logic_vector(35 downto 0);
		addr: in std_logic_vector(ADDR_WIDTH - 1 downto 0)
	);
	
end ipbus_dpram36;

architecture rtl of ipbus_dpram36 is

	type ram_array is array(2 ** ADDR_WIDTH - 1 downto 0) of std_logic_vector(17 downto 0);
	shared variable ram_bh: ram_array := (others => (others => '0'));
	shared variable ram_th: ram_array := (others => (others => '0'));
	--shared variable ram_bh, ram_th: ram_array := (others => (others => '0'));
	signal sel, rsel: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;
	signal ack: std_logic;
	signal dsel: std_logic;
	signal wea_b, wea_t: std_logic;
	signal data: std_logic_vector(35 downto 0);
	signal data_o: std_logic_vector(31 downto 0);

begin

	sel <= to_integer(unsigned(ipb_in.ipb_addr(ADDR_WIDTH - 1 downto 0)));
	dsel <= ipb_in.ipb_addr(ADDR_WIDTH);
	wea_b <= ipb_in.ipb_strobe and ipb_in.ipb_write and not dsel;
	wea_t <= ipb_in.ipb_strobe and ipb_in.ipb_write and dsel;

	process(clk)
	begin
		if rising_edge(clk) then

			data <= ram_th(sel) & ram_bh(sel);
			if wea_b = '1' then
				ram_bh(sel) := ipb_in.ipb_wdata(17 downto 0);
			end if;

			if wea_t = '1' then
				ram_th(sel) := ipb_in.ipb_wdata(17 downto 0);
			end if;

			ack <= ipb_in.ipb_strobe and not ack;
		end if;
	end process;
	
	ipb_out.ipb_rdata(17 downto 0) <= data(35 downto 18) when dsel = '1' else data(17 downto 0);
	ipb_out.ipb_rdata(31 downto 18) <= (others => '0');
	ipb_out.ipb_ack <= ack;
	ipb_out.ipb_err <= '0';
	
	rsel <= to_integer(unsigned(addr));
	
	process(rclk)
	begin
		if rising_edge(rclk) then
			q <= ram_th(rsel) & ram_bh(rsel); -- Order of statements is important to infer read-first RAM!
			if we = '1' then
				ram_bh(rsel) := d(17 downto 0);
				ram_th(rsel) := d(35 downto 18);
			end if;
		end if;
	end process;

end rtl;
