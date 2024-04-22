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


-- trans_arb
--
-- Arbitrates access to transactor by multiple packet buffers
--
-- Dave Newbold, February 2013
--
-- $Id$

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ipbus_trans_decl.all;

entity trans_arb is
  generic(NSRC: positive);
  port(
    clk: in std_logic; 
    rst: in std_logic;
    buf_in: in ipbus_trans_in_array(NSRC - 1 downto 0);
    buf_out: out ipbus_trans_out_array(NSRC - 1 downto 0);
    trans_out: out ipbus_trans_in;
    trans_in: in ipbus_trans_out;
    pkt: out std_logic_vector(NSRC - 1 downto 0)
  );

end trans_arb;

architecture rtl of trans_arb is
  
 	signal src: unsigned(1 downto 0); -- Up to four ports...
	signal sel: integer range 0 to NSRC - 1 := 0;
	signal busy: std_logic;
  
begin

	sel <= to_integer(src);

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				busy <= '0';
				src <= (others => '0');
			elsif busy = '0' then
				if buf_in(sel).pkt_rdy /= '1' then
					if src /= (NSRC - 1) then
						src <= src + 1;
					else
						src <= (others => '0');
					end if;
				else
					busy <= '1';
				end if;
			elsif trans_in.pkt_done = '1' then
				busy <= '0';
			end if;
		end if;
	end process;

	trans_out.pkt_rdy <= buf_in(sel).pkt_rdy;
	trans_out.rdata <= buf_in(sel).rdata;
	trans_out.busy <= buf_in(sel).busy;
	
  busgen: for i in NSRC - 1 downto 0 generate
		begin
			buf_out(i).pkt_done <= trans_in.pkt_done when sel = i else '0';
			buf_out(i).wdata <= trans_in.wdata;
			buf_out(i).waddr <= trans_in.waddr;
			buf_out(i).raddr <= trans_in.raddr;
			buf_out(i).we <= trans_in.we when sel = i else '0';
			pkt(i) <= trans_in.pkt_done when sel = i else '0';
		end generate;
  
end rtl;

