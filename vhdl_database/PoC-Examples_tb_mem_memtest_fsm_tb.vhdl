-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- ============================================================================
-- Authors:					Martin Zabel
-- 
-- Module:					Generic FSM for Memory Controller Test Modules
--
-- Description:
-- ------------------------------------
-- Check read/write by blocked and random memory accesses.
--
-- Output status(0) indicates if an read error has occured (high-active).
-- Output status(2 downto 1) are progress indicators, these should toogle with
-- a visible frequency. Otherwise the memory controller does not except new
-- commands.
--
-- License:
-- ============================================================================
-- Copyright 2007-2015 Technische Universitaet Dresden - Germany,
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memtest_fsm_tb is
end entity memtest_fsm_tb;

architecture sim of memtest_fsm_tb is

  constant A_BITS : positive  := 15-4;
  constant D_BITS : positive  := 128;
	constant LATENCY : positive := 10;
	
  signal clk	   : std_logic := '1';
  signal rst	   : std_logic;
  signal mem_rdy   : std_logic;
  signal mem_rstb  : std_logic;
  signal mem_rdata : std_logic_vector(D_BITS-1 downto 0);
  signal mem_req   : std_logic;
  signal mem_write : std_logic;
  signal mem_addr  : unsigned(A_BITS-1 downto 0);
  signal mem_wdata : std_logic_vector(D_BITS-1 downto 0);
  signal status	   : std_logic_vector(2 downto 0);

begin  -- architecture sim

  -- Memory Tester
  memtest: entity work.memtest_fsm
    generic map (
      A_BITS => A_BITS,
      D_BITS => D_BITS)
    port map (
      clk	=> clk,
      rst	=> rst,
      mem_rdy	=> mem_rdy,
      mem_rstb	=> mem_rstb,
      mem_rdata => mem_rdata,
      mem_req	=> mem_req,
      mem_write => mem_write,
      mem_addr	=> mem_addr,
      mem_wdata => mem_wdata,
      status	=> status);

	-- The Memory
	memory: entity work.mem_model
		generic map (
			A_BITS	=> A_BITS,
			D_BITS	=> D_BITS,
			LATENCY => LATENCY)
		port map (
			clk				=> clk,
			rst				=> rst,
			mem_req		=> mem_req,
			mem_write => mem_write,
			mem_addr	=> mem_addr,
			mem_wdata => mem_wdata,
			mem_rdy		=> mem_rdy,
			mem_rstb	=> mem_rstb,
			mem_rdata => mem_rdata);
	
  -- Clock Generation
  clk <= not clk after 5 ns when now < 85 us;

  -- Reset Generation
  ResetGen: process
  begin
    rst <= '1';
    
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    rst <= '0';

    wait;
  end process ResetGen;
end architecture sim;
