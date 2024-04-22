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


-- ipbus_reg_v
--
-- Generic ipbus register bank
--
-- Dave Newbold, March 2011

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;
use work.ipbus_reg_types.all;

entity ipbus_reg_v is
	generic(
		N_REG: positive := 1
	);
	port(
		clk: in std_logic;
		reset: in std_logic;
		ipbus_in: in ipb_wbus;
		ipbus_out: out ipb_rbus;
		q: out ipb_reg_v(N_REG - 1 downto 0);
		qmask: in ipb_reg_v(N_REG - 1 downto 0) := (others => (others => '1'));
		stb: out std_logic_vector(N_REG - 1 downto 0)
	);
	
end ipbus_reg_v;

architecture rtl of ipbus_reg_v is

	constant ADDR_WIDTH: integer := calc_width(N_REG);

	signal reg: ipb_reg_v(N_REG - 1 downto 0);
	signal ri: ipb_reg_v(2 ** ADDR_WIDTH - 1 downto 0);
	signal sel: integer range 0 to 2 ** ADDR_WIDTH - 1 := 0;

begin

	sel <= to_integer(unsigned(ipbus_in.ipb_addr(ADDR_WIDTH - 1 downto 0))) when ADDR_WIDTH > 0 else 0;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				reg <= (others => (others => '0'));
			elsif ipbus_in.ipb_strobe = '1' and ipbus_in.ipb_write = '1' and sel < N_REG then
				reg(sel) <= ipbus_in.ipb_wdata and qmask(sel);
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			for i in N_REG - 1 downto 0 loop
				if sel = i then
					stb(i) <= ipbus_in.ipb_strobe and ipbus_in.ipb_write;
				else
					stb(i) <= '0';
				end if;
			end loop;
		end if;
	end process;
	
	ri(N_REG - 1 downto 0) <= reg;
	ri(2 ** ADDR_WIDTH - 1 downto N_REG) <= (others => (others => '0'));
	
	ipbus_out.ipb_rdata <= ri(sel);
	ipbus_out.ipb_ack <= ipbus_in.ipb_strobe;
	ipbus_out.ipb_err <= '0';

	q <= reg;

end rtl;
