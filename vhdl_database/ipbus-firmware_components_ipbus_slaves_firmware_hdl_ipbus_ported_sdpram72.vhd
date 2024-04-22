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


-- ipbus_ported_sdpram
--
-- Generic 72b wide simple-dual-port memory with ipbus access on one port
-- Note that this takes up *four times* the ipbus address space indicated by ADDR_WIDTH,
-- with 18 bits of each RAM returned per ipbus address
--
-- Should lead to an inferred block RAM in Xilinx parts with modern tools
--
-- Note: you cannot write to this RAM via ipbus!
--
-- Dave Newbold, October 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

entity ipbus_ported_sdpram72 is
	generic(
		ADDR_WIDTH: positive := 9
	);
	port(
		clk: in std_logic;
		rst: in std_logic;
		ipb_in: in ipb_wbus;
		ipb_out: out ipb_rbus;
		wclk: in std_logic;
		we: in std_logic := '0';
		d: in std_logic_vector(71 downto 0);
		addr: in std_logic_vector(ADDR_WIDTH - 1 downto 0)
	);
	
end ipbus_ported_sdpram72;

architecture rtl of ipbus_ported_sdpram72 is

	type ram_array is array(2 ** ADDR_WIDTH - 1 downto 0) of std_logic_vector(71 downto 0);
	shared variable ram: ram_array := (others => (others => '0'));
	signal sel, rsel: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;
	signal dsel : std_logic_vector(1 downto 0);
	signal ptr: unsigned(ADDR_WIDTH + 1 downto 0);
	signal data: std_logic_vector(71 downto 0);
	signal data_o: std_logic_vector(31 downto 0);
	signal rdata: std_logic_vector(17 downto 0);
	signal v: std_logic;

begin

	process(clk)
	begin
		if falling_edge(clk) then
			-- reset ram pointer
			if rst = '1' then
				ptr <= (others => '0');
			elsif ipb_in.ipb_strobe = '1' then
				-- Update the ipbus address pointer if writing to the addr register (at 0)
				if ipb_in.ipb_addr(0) = '0' then
					if ipb_in.ipb_write = '1' then	
						ptr <= unsigned(ipb_in.ipb_wdata(ADDR_WIDTH + 1 downto 0));
					end if;

				-- increment the pointer otherwise
				else
					ptr <= ptr + 1;
				end if;
			end if;
		end if;
	 end process;
	
	sel <= to_integer(unsigned(ptr(ADDR_WIDTH + 1 downto 2)));
		
	process(clk)
	begin
		if rising_edge(clk) then
			dsel <= std_logic_vector(ptr(1 downto 0));
			data <= ram(sel);
		end if;
	end process;

	-- Pick the bitrange based on pointer	
	with dsel select rdata <=
		data(71 downto 54) when "11",
		data(53 downto 36) when "10",
		data(35 downto 18) when "01",
		data(17 downto 0) when "00",
		(others => '0') when others;

	-- re-build the output 32b word
	data_o <= X"000" & "00" & rdata;

	-- valid ram operations are access to addr 1 (ram) and not write
	v <= not ipb_in.ipb_addr(0) or not ipb_in.ipb_write;
	
	-- read only, ack read commands only
	ipb_out.ipb_ack <= ipb_in.ipb_strobe and v;
	-- read only, return error on write attempts
	ipb_out.ipb_err <= ipb_in.ipb_strobe and not v;
	
	ipb_out.ipb_rdata <= std_logic_vector(to_unsigned(0, 32 - ADDR_WIDTH - 2)) & std_logic_vector(ptr)
		when ipb_in.ipb_addr(0) = '0' else data_o;
	
	rsel <= to_integer(unsigned(addr));
	
	process(wclk)
	begin
		if rising_edge(wclk) then
			if we = '1' then
				ram(rsel) := d;
			end if;
		end if;
	end process;

end rtl;
