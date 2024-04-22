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
-- Generic 72b wide dual-port memory with ported ipbus access on one side
-- Only the bottom 18b of the data port are meaningful
-- Note that this takes up *4 times* the internal address space indicated by ADDR_WIDTH
--
-- Should lead to an inferred block RAM in Xilinx parts with modern tools
--
-- Dave Newbold, October 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ipbus_ported_dpram72 is
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
		d: in std_logic_vector(71 downto 0);
		q: out std_logic_vector(71 downto 0);
		addr: in std_logic_vector(ADDR_WIDTH - 1 downto 0)
	);
	
end ipbus_ported_dpram72;

architecture rtl of ipbus_ported_dpram72 is

	type ram_array is array(2 ** ADDR_WIDTH - 1 downto 0) of std_logic_vector(17 downto 0);
	shared variable ram_a, ram_b, ram_c, ram_d: ram_array := (others => (others => '0'));
	signal wea_a, wea_b, wea_c, wea_d: std_logic;
	signal sel, rsel: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;
	signal wcyc, wcyc_d: std_logic;
	signal dsel : std_logic_vector(1 downto 0);
	signal ptr: unsigned(ADDR_WIDTH+1 downto 0);
	signal data: std_logic_vector(71 downto 0);
	signal data_o: std_logic_vector(31 downto 0);

begin

	wcyc <= ipb_in.ipb_strobe and ipb_in.ipb_write;

	process(clk)
	begin
		if falling_edge(clk) then
			if rst = '1' then
				ptr <= (others => '0');				
			elsif ipb_in.ipb_addr(0) = '0' and wcyc = '1' then
				ptr <= unsigned(ipb_in.ipb_wdata(ADDR_WIDTH+1 downto 0));
			elsif (ipb_in.ipb_strobe = '1' and ipb_in.ipb_write = '0' and ipb_in.ipb_addr(0) = '1') or wcyc_d = '1' then
				ptr <= ptr + 1;
			end if;
		end if;
	end process;
	
	sel <= to_integer(ptr(ADDR_WIDTH+1 downto 2));
	wea_a <= '1' when wcyc = '1' and ipb_in.ipb_addr(0) = '1' and ptr(1 downto 0) = "00" else '0';
	wea_b <= '1' when wcyc = '1' and ipb_in.ipb_addr(0) = '1' and ptr(1 downto 0) = "01" else '0';
	wea_c <= '1' when wcyc = '1' and ipb_in.ipb_addr(0) = '1' and ptr(1 downto 0) = "10" else '0';
	wea_d <= '1' when wcyc = '1' and ipb_in.ipb_addr(0) = '1' and ptr(1 downto 0) = "11" else '0';
	
	process(clk)
	begin
		if rising_edge(clk) then

			data <= ram_d(sel) & ram_c(sel) & ram_b(sel) & ram_a(sel);
			dsel <= std_logic_vector(ptr(1 downto 0));
				
			if wea_a = '1' then
				ram_a(sel) := ipb_in.ipb_wdata(17 downto 0);
			end if;
			if wea_b = '1' then
				ram_b(sel) := ipb_in.ipb_wdata(17 downto 0);
			end if;
			if wea_c = '1' then
				ram_c(sel) := ipb_in.ipb_wdata(17 downto 0);
			end if;
			if wea_d = '1' then
				ram_d(sel) := ipb_in.ipb_wdata(17 downto 0);
			end if;
			
			wcyc_d <= wcyc and ipb_in.ipb_addr(0);
		
		end if;
	end process;
	
	with dsel select data_o(17 downto 0) <=
		data(17 downto 0) when "00",
		data(35 downto 18) when "01",
		data(53 downto 36) when "10",
		data(71 downto 54) when "11",
		(others => '0') when others;

	data_o(31 downto 18) <= (others => '0');
	
	ipb_out.ipb_ack <= ipb_in.ipb_strobe;
	ipb_out.ipb_err <= '0';
	ipb_out.ipb_rdata <= std_logic_vector(to_unsigned(0, 32 - ADDR_WIDTH - 2)) & std_logic_vector(ptr)
		when ipb_in.ipb_addr(0)='0' else data_o;
	
	rsel <= to_integer(unsigned(addr));
	
	process(rclk)
	begin
		if rising_edge(rclk) then
			q <= ram_d(rsel) & ram_c(rsel) & ram_b(rsel) & ram_a(rsel); -- Order of statements is important to infer read-first RAM!
			if we = '1' then
				ram_a(rsel) := d(17 downto 0);
				ram_b(rsel) := d(35 downto 18);
				ram_c(rsel) := d(53 downto 36);
				ram_d(rsel) := d(71 downto 54);
			end if;
		end if;
	end process;

end rtl;
