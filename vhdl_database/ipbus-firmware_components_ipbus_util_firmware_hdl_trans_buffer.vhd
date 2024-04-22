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


-- trans_buffer
--
-- Generic packet buffer for access to ipbus transactor by
-- non-ethernet master.
--
-- Dave Newbold, February 2013
--
-- The design is edge-sensitive on the req flag. There are basically two modes the block can be in (the state signal is 'mode' in the design).
--  
-- - When mode = 0, the master (MMC, etc) has control of the buffers
-- - When mode = 1, the transactor has control of the buffers
--  
-- The 'done' flag the master sees is just defined as done <= not mode;
--  
-- There are two dual-port buffers, the write buffer  (into which the master writes), and the read buffer (from which the master reads after the transactor is done). They share a common address pointer on the master port.
--  
-- - At reset, mode = 0 (so done is high) and the master-side address pointer is reset.
-- - The master pushes data into the write-side buffer, it fills from location 0 upwards.
-- - When master is done, it raises 'req' and holds it high.
-- - The mode changes to mode = 1 (so done goes low), and the master-side address pointer is reset
-- - When the transactor is free, it reads the contents of the write-side buffer and stores the output into the read-side buffer.
-- - When the transactor signals that it's finished, the mode changes to mode = 0
-- - The master sees 'done' go high, and can read the data from the read buffer, from location 0 onwards
-- - When the master is done, it drops req, which resets everything ready for the next go.
--  
-- From the software point of view, it looks like:
--  
-- - Write data into the buffer
-- - Assert req
-- - Wait for done to go high
-- - Read data from the buffer
-- - Drop req

-- $Id$

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.ipbus_trans_decl.all;

entity trans_buffer is
	port(
		clk_m: in std_logic;
		rst_m: in std_logic;
		m_wdata: in std_logic_vector(15 downto 0);
		m_we: in std_logic;
		m_rdata: out std_logic_vector(15 downto 0);
		m_re: in std_logic;
		m_req: in std_logic;
		m_done: out std_logic;
		clk_ipb: in std_logic;
		t_out: out ipbus_trans_in;
		t_in: in ipbus_trans_out
	);

end trans_buffer;

architecture rtl of trans_buffer is
	
	COMPONENT sdpram_16x10_32x9
		PORT (
			clka : IN STD_LOGIC;
			wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
			clkb : IN STD_LOGIC;
			addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
			doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT sdpram_32x9_16x10
		PORT (
			clka : IN STD_LOGIC;
			wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
			dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			clkb : IN STD_LOGIC;
			addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			doutb : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;

	signal req_d, mode, mode_fall_edge, done_m, done_m_s: std_logic;
	signal mode_ipb, mode_ipb_s, mode_ipb_d, rdy, done_catch: std_logic;
	signal addr: unsigned(9 downto 0);
	signal addr_sl: std_logic_vector(9 downto 0);
	signal we_in, we_out: std_logic_vector(0 downto 0); 
	
	attribute KEEP: string;
	attribute KEEP of done_m_s: signal is "TRUE"; -- Synchroniser not to be optimised into shreg
	attribute KEEP of mode_ipb_s: signal is "TRUE"; -- Synchroniser not to be optimised into shreg

begin
	
	process(clk_m)
	begin
		if rising_edge(clk_m) then
			mode <= (mode or (m_req and not req_d)) and not (done_m or rst_m);
			req_d <= m_req;
		end if;
	end process;
	
	m_done <= not mode;
	
	
	-- Need falling edge to move to ipb domain
	process(clk_m)
    begin
        if falling_edge(clk_m) then
            mode_fall_edge <= mode;
        end if;
    end process;
    
    m_done <= not mode;
	
	process(clk_ipb) -- Synchroniser clk_m -> clk_ipb
	begin
		if rising_edge(clk_ipb) then
			mode_ipb_s <= mode_fall_edge; --mode;
			mode_ipb <= mode_ipb_s;
			mode_ipb_d <= mode_ipb;
		end if;
	end process;
	
	process(clk_m) -- Synchroniser clk_ipb -> clk_m
	begin
		if rising_edge(clk_m) then
			done_m_s <= done_catch;
			done_m <= done_m_s;
		end if;
	end process;
	
	process(clk_ipb)
	begin
		if rising_edge(clk_ipb) then
			rdy <= (rdy or (mode_ipb and not mode_ipb_d)) and not t_in.pkt_done and mode_ipb;
			done_catch <= (done_catch or t_in.pkt_done) and mode_ipb;
		end if;
	end process;
	
	t_out.pkt_rdy <= rdy;
	t_out.busy <= '0';
	
	process(clk_m)
	begin
		if rising_edge(clk_m) then
			if rst_m = '1' or mode = '1' or (req_d and not m_req) = '1' then
				addr <= (others => '0');
			elsif m_re = '1' or m_we = '1' then
				addr <= addr + 1;
			end if;
		end if;
	end process;
	
	we_in(0) <= m_we;
	addr_sl <= std_logic_vector(addr);
	
	ram_in: sdpram_16x10_32x9
		port map(
			clka => clk_m,
			wea => we_in,
			addra => addr_sl,
			dina => m_wdata,
			clkb => clk_ipb,
			addrb => t_in.raddr(8 downto 0),
			doutb => t_out.rdata
		);
	
	we_out(0) <= t_in.we;
	
	ram_out: sdpram_32x9_16x10
		port map(
			clka => clk_ipb,
			wea => we_out,
			addra => t_in.waddr(8 downto 0),
			dina => t_in.wdata,
			clkb => clk_m,
			addrb => addr_sl,
			doutb => m_rdata
		);

end rtl;
