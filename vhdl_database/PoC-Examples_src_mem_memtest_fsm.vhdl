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

library poc;
use poc.arith.all;
use poc.utils.all;

entity memtest_fsm is
  
  generic (
    A_BITS : positive;
    D_BITS : positive
  );

  port (
    clk : in std_logic;
    rst : in std_logic;

    mem_rdy   : in  std_logic;
    mem_rstb  : in  std_logic;
    mem_rdata : in  std_logic_vector(D_BITS-1 downto 0);
    mem_req   : out std_logic;
    mem_write : out std_logic;
    mem_addr  : out unsigned(A_BITS-1 downto 0);
    mem_wdata : out std_logic_vector(D_BITS-1 downto 0);

    status : out std_logic_vector(2 downto 0));

end memtest_fsm;

architecture rtl of memtest_fsm is
  
  -- Main FSM
  type FSM_TYPE is (INIT, WRITE_BLOCK, READ_BLOCK,
                    WRITE_READ1, WRITE_READ2, FINISHED);
  signal fsm_cs : FSM_TYPE;
  signal fsm_ns : FSM_TYPE;

  -- Read Check FSM
  type CHKFSM_TYPE is (CHK_INIT, CHK_RUN);
  signal chkfsm_cs : CHKFSM_TYPE;
  signal chkfsm_ns : CHKFSM_TYPE;

  -- Address register
  signal addr_r   : unsigned(A_BITS downto 0);
  signal addr_rst : std_logic;
  signal addr_inc : std_logic;
  
  -- Write Data register
  signal wdata_r   : std_logic_vector(D_BITS-1 downto 0);
  signal wdata_rst : std_logic;
  signal wdata_got : std_logic;

  -- Expected Read Data Register
  signal exp_rdata_r   : std_logic_vector(D_BITS-1 downto 0);
  signal exp_rdata_rst : std_logic;
  signal exp_rdata_got : std_logic;

  -- End of block has been reached.
  signal block_finished : std_logic;

  -- Read data / strobe register
  signal rdata_r : std_logic_vector(D_BITS-1 downto 0);
  signal rstb_r  : std_logic;
  
  -- Read data equals expected value.
  signal rdata_eq_exp : std_logic;

  -- Read fail indicator
  signal rd_failed_r   : std_logic;
  signal rd_failed_rst : std_logic;
  signal rd_failed_set : std_logic;

	-- Run counter
	signal run_r   : unsigned(1 downto 0) := (others => '0');
	signal run_inc : std_logic;
begin  -- rtl

  -----------------------------------------------------------------------------
  -- Component instantiations
  -----------------------------------------------------------------------------
  exp_rdata_prng: arith_prng
    generic map (
      BITS => D_BITS)
    port map (
      clk => clk,
      rst => exp_rdata_rst,
      got => exp_rdata_got,
      val => exp_rdata_r);
  
  wdata_prng: arith_prng
    generic map (
      BITS => D_BITS)
    port map (
      clk => clk,
      rst => wdata_rst,
      got => wdata_got,
      val => wdata_r);
  
  -----------------------------------------------------------------------------
  -- Datapath not depending on FSM
  -----------------------------------------------------------------------------
  block_finished <= addr_r(A_BITS);

  rdata_eq_exp <= '1' when rdata_r = std_logic_vector(exp_rdata_r) else '0';
  
  -----------------------------------------------------------------------------
  -- Main FSM
  -----------------------------------------------------------------------------
  process (fsm_cs, mem_rdy, block_finished)
  begin  -- process
    fsm_ns    <= fsm_cs;
    mem_req   <= '0';
    mem_write <= '-';
    run_inc   <= '0';

    addr_rst  <= '0';
    addr_inc  <= '0';
    wdata_rst <= '0';
    wdata_got <= '0';
		
    case fsm_cs is
      when INIT =>
        wdata_rst <= '1';
        addr_rst  <= '1';
        fsm_ns    <= WRITE_BLOCK;
        
      when WRITE_BLOCK =>
        if block_finished = '1' then
          addr_rst <= '1';
          fsm_ns   <= READ_BLOCK;
        else
          mem_req   <= '1';
          mem_write <= '1';
          if mem_rdy = '1' then
            wdata_got <= '1';
            addr_inc  <= '1';
          end if;
        end if;

      when READ_BLOCK =>
        if block_finished = '1' then
          addr_rst <= '1';
          fsm_ns   <= WRITE_READ1;
        else
          -- Note: Read data is checked concurrently.
          mem_req   <= '1';
          mem_write <= '0';
          if mem_rdy = '1' then
            addr_inc <= '1';
          end if;
        end if;

      when WRITE_READ1 =>
        if block_finished = '1' then
          addr_rst <= '1';
					if SIMULATION then
						fsm_ns <= FINISHED;
					else
						run_inc <= '1';
						fsm_ns <= WRITE_BLOCK;
					end if;
        else
          mem_req   <= '1';
          mem_write <= '1';
          if mem_rdy = '1' then
            wdata_got <= '1';
            -- do not increment address
            fsm_ns <= WRITE_READ2;
          end if;
        end if;

      when WRITE_READ2 =>
        -- Note: Read data is checked concurrently.
        mem_req   <= '1';
        mem_write <= '0';
        if mem_rdy = '1' then
          addr_inc <= '1';
          fsm_ns   <= WRITE_READ1;
        end if;

			when FINISHED =>
				null;
    end case;
  end process;

  -----------------------------------------------------------------------------
  -- Read Check FSM
  -----------------------------------------------------------------------------
  process (chkfsm_cs, rstb_r, rdata_eq_exp)
  begin  -- process
    chkfsm_ns <= chkfsm_cs;

    exp_rdata_rst <= '0';
    exp_rdata_got <= '0';

    rd_failed_rst <= '0';
    rd_failed_set <= '0';

    case chkfsm_cs is
      when CHK_INIT =>
        exp_rdata_rst <= '1';
        rd_failed_rst <= '1';
        chkfsm_ns <= CHK_RUN;

      when CHK_RUN =>
        if rstb_r = '1' then
          exp_rdata_got <= '1';
          if rdata_eq_exp = '0' then
            rd_failed_set <= '1';
          end if;
        end if;
    end case;
  end process;

  -----------------------------------------------------------------------------
  -- Registers
  -----------------------------------------------------------------------------
  process (clk)
  begin  -- process
    if rising_edge(clk) then
      if rst = '1' then
        fsm_cs    <= INIT;
        chkfsm_cs <= CHK_INIT;
				run_r     <= (others => '0');
      else
        fsm_cs    <= fsm_ns;
        chkfsm_cs <= chkfsm_ns;
				
				if run_inc = '1' then
					run_r <= run_r + 1;
				end if;
      end if;

      if addr_rst = '1' then
        addr_r <= (others => '0');
      elsif addr_inc = '1' then
        addr_r <= addr_r + 1;
      end if;

      if rd_failed_rst = '1' then
        rd_failed_r <= '0';
      elsif rd_failed_set = '1' then
        rd_failed_r <= '1';
      end if;

      if rst = '1' then
        rstb_r <= '0';
      else
        rstb_r <= mem_rstb;
      end if;

      if mem_rstb = '1' then
        rdata_r <= mem_rdata;
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Outputs
  -----------------------------------------------------------------------------

  mem_addr  <= addr_r(A_BITS-1 downto 0);
  mem_wdata <= std_logic_vector(wdata_r);

  status(0) <= rd_failed_r;
  status(2 downto 1) <= std_logic_vector(run_r);
end rtl;
