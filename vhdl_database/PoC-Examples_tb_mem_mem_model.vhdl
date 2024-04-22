-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- ============================================================================
-- Authors:					Martin Zabel
-- 
-- Module:					Model of pipelined memory with "mem" interface.
--
-- Description:
-- ------------------------------------
-- To be used for simulation as a replacement for a real memory controller.
--
-- Generic parameters:
--
-- * A_BITS:  number of word address bits.
-- * D_BTIS:  width of data bus.
-- * LATENCY: the latency of the pipelined read.
--
-- License:
-- ============================================================================
-- Copyright 2007-2016 Technische Universitaet Dresden - Germany,
--										 Chair for VLSI-Design, Diagnostics and Architecture
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--		http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- ============================================================================


-------------------------------------------------------------------------------
-- Naming Conventions:
-- (Based on: Keating and Bricaud: "Reuse Methodology Manual")
--
-- active low signals: "*_n"
-- clock signals: "clk", "clk_div#", "clk_#x"
-- reset signals: "rst", "rst_n"
-- generics: all UPPERCASE
-- user defined types: "*_TYPE"
-- state machine next state: "*_ns"
-- state machine current state: "*_cs"
-- output of a register: "*_r"
-- asynchronous signal: "*_a"
-- pipelined or register delay signals: "*_p#"
-- data before being registered into register with the same name: "*_nxt"
-- clock enable signals: "*_ce"
-- internal version of output port: "*_i"
-- tristate internal signal "*_z"
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem_model is
  
  generic (
    A_BITS  : positive;
    D_BITS  : positive;
		LATENCY : positive
  );

  port (
    clk : in std_logic;
    rst : in std_logic;

    mem_req   : in  std_logic;
    mem_write : in  std_logic;
    mem_addr  : in  unsigned(A_BITS-1 downto 0);
    mem_wdata : in  std_logic_vector(D_BITS-1 downto 0);
    mem_rdy   : out std_logic;
    mem_rstb  : out std_logic;
    mem_rdata : out std_logic_vector(D_BITS-1 downto 0));

end entity mem_model;

architecture sim of mem_model is
	-- data types
	type RAM_T is array(natural range<>) of std_logic_vector(D_BITS-1 downto 0);
	signal ram : RAM_T(0 to 2**A_BITS-1);

	-- read pipeline
	type RDATA_T is array(natural range<>) of std_logic_vector(D_BITS-1 downto 0);
	signal rdata_p : RDATA_T(1 to LATENCY);
	signal rstb_p : std_logic_vector(1 to LATENCY) := (others => '0');
	
	-- ready control logic
	type FSM_TYPE is (RESET, READY);
	signal fsm_cs : FSM_TYPE;
	
begin  -- architecture sim

	-- TODO: implement some logic / FSM which introduces wait states
	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				fsm_cs <= RESET;
			else
				fsm_cs <= READY;
			end if;
		end if;
	end process;

	-- Memory and Read Pipeline
	process(clk)
	begin
		if rising_edge(clk) then
			rstb_p(1)  <= '0'; -- default

			-- access memory only when ready, ignore requests otherwise
			if fsm_cs = READY then
				if mem_req = '1' then
					if mem_write = '1' then
						if Is_X(std_logic_vector(mem_addr)) then
							report "Invalid address during write." severity error;
						else
							ram(to_integer(mem_addr)) <= mem_wdata;
						end if;
					elsif mem_write = '0' then -- read
						if Is_X(std_logic_vector(mem_addr)) then
							report "Invalid address during read." severity error;
						else
							rdata_p(1) <= ram(to_integer(mem_addr));
							rstb_p(1)  <= '1';
						end if;
					else
						report "Invalid write/read command." severity error;
					end if;
				elsif mem_req /= '0' then
					report "Invalid request." severity error;	
				end if;
			end if;

			-- read pipeline
			if LATENCY > 1 then
				rstb_p (2 to LATENCY) <= rstb_p (1 to LATENCY-1);
				rdata_p(2 to LATENCY) <= rdata_p(1 to LATENCY-1);
			end if;
			
			-- reset only read strobe
			if rst = '1' then
				rstb_p <= (others => '0');
			end if;
		end if;
	end process;


	-- Read Pipeline
	--gReadPipe: if LATENCY > 1 generate
	--	process(clk)
	--	begin
	--		if rising_edge(clk) then

	--		end if;
	--	end process;
	--end generate gReadPipe;
	
	-- Outputs
	mem_rdy		<= '1' when fsm_cs = READY else '0';
	mem_rdata <= rdata_p(LATENCY);
	mem_rstb	<= rstb_p (LATENCY);

end architecture sim;
