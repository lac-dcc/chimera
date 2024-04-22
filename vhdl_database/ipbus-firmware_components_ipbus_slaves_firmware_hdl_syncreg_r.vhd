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


-- syncreg_r
--
-- Clock domain crossing register with two-way handshaking
-- Data are transferred from slave to master when re is asserted
-- New requests are ignored while rdy is low
-- Ack signals completed transfer
-- Data is sampled from slv side on cycle after s_stb goes high
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity syncreg_r is
	generic(
		SIZE: positive := 32;
		ULTRA_SAFE: boolean
	);
	port(
		m_clk: in std_logic;
		m_rst: in std_logic;
		m_re: in std_logic;
		m_ack: out std_logic;
		m_rdy: out std_logic;
		m_q: out std_logic_vector(SIZE - 1 downto 0);
		s_clk: in std_logic;
		s_d: in std_logic_vector(SIZE - 1 downto 0);
		s_stb: out std_logic
	);
	
end syncreg_r;

architecture rtl of syncreg_r is
		
	signal we, rdy, cyc, ack, s1, s2, s3, s4, s5, m1, m2, m3, stab: std_logic;
	signal da, db: std_logic_vector(SIZE - 1 downto 0);
	
	attribute SHREG_EXTRACT: string;
	attribute SHREG_EXTRACT of s1, m1, s2, m2: signal is "no"; -- Synchroniser not to be optimised into shreg
	attribute ASYNC_REG: string;
	attribute ASYNC_REG of s1, m1, s2, m2: signal is "yes";

begin

-- Generate cyc and recover handshake into master domain

	process(m_clk)
	begin
		if rising_edge(m_clk) then
			m1 <= s5; -- CDC, with synchroniser
			m2 <= m1;
			m3 <= m2;
			cyc <= (cyc or (m_re and rdy)) and not (ack or m_rst);
			rdy <= (rdy or m_rst or (m3 and not m2)) and not m_re;
		end if;
	end process;
	
	ack <= m2 and not m3;
	m_ack <= ack;
	m_rdy <= rdy;

-- Move cyc into slave domain, generate handshake
	
	process(s_clk)
	begin
		if rising_edge(s_clk) then
			s1 <= cyc; -- CDC, with synchroniser
			s2 <= s1;
			s3 <= s2;
			s4 <= s3;
			s5 <= s4 and stab;
		end if;
	end process;
	
-- Capture register, in slave domain
	
	we <= s3 and not s4;
	s_stb <= s2 and not s3;
	
	process(s_clk)
	begin
		if rising_edge(s_clk) then
			if we = '1' then
				da <= s_d;
			end if;
		end if;
	end process;

	m_q <= da;
	
-- Avoid race between data and handshake (optimised away if ULTRA_SAFE is false)

	db <= da when rising_edge(s_clk);
	stab <= '1' when (da = db or not ULTRA_SAFE) else '0';


	
end rtl;
