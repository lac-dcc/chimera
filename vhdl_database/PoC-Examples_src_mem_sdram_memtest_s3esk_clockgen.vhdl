-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- ============================================================================
-- Authors:					Martin Zabel
-- 
-- Module:					Clock Generator for Memory Test on Spartan-3E Starter Kit
--
-- Description:
-- ------------------------------------
-- DCM configuration for module 'memtest_s3esk'.
--
-- The DCMs dcm_mem* have either unstable input clocks upon configuration and/or
-- external feedback, and thus must be reset accordingly. So we do not use
-- the STARTUP_WAIT feature at all.
--
-- After startup the clocks are unstable. Thus, the logic
-- clocked by clk_* must be hold in reset until rst_* is deasserted.
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
use ieee.std_logic_1164.ALL;

entity memtest_s3esk_clockgen is
  port (
    clk_in        : in  std_logic;
    sd_ck_fb      : in  std_logic;
    user_rst      : in  std_logic;
    clk_sys       : out std_logic;
    clk_mem       : out std_logic;
    clk_mem_n     : out std_logic;
    clk_mem90     : out std_logic;
    clk_mem90_n   : out std_logic;
    clk_memfb90   : out std_logic;
    clk_memfb90_n : out std_logic;
    rst_sys       : out std_logic;
    rst_mem       : out std_logic;
    rst_mem90     : out std_logic;
    rst_mem180    : out std_logic;
    rst_mem270    : out std_logic;
    rst_memfb90   : out std_logic;
    rst_memfb270  : out std_logic;
    locked        : out std_logic);

end memtest_s3esk_clockgen;

library unisim;
use unisim.VComponents.all;

architecture rtl of memtest_s3esk_clockgen is
  -- input buffer
  signal clk_in_bufo   : std_logic;
  signal sd_ck_fb_bufo : std_logic;
  
  -- clock buffer inputs
  signal clk_sys_bufi       : std_logic;
  signal clk_dv_bufi        : std_logic;
  signal clk_mem_bufi       : std_logic;
  signal clk_mem90_bufi     : std_logic;
  signal clk_memfb90_bufi   : std_logic;
  signal clk_memfb90_n_bufi : std_logic;

  -- global clocks (internal signals)
  signal clk_sys_i       : std_logic;
  signal clk_mem_i       : std_logic;
  signal clk_mem_n_i     : std_logic;
  signal clk_mem90_i     : std_logic;
  signal clk_mem90_n_i   : std_logic;
  signal clk_memfb90_i   : std_logic;
  signal clk_memfb90_n_i : std_logic;

  -- dcm reset
  signal dcm_mem_rst        : std_logic;
  signal dcm_memfb_rst      : std_logic;

  -- locked signals
  signal dcm_sys_locked     : std_logic;
  signal dcm_mem_locked     : std_logic;
  signal dcm_mem90_locked   : std_logic;
  signal dcm_memfb_locked   : std_logic;
  
  -- reset synchronizers for clk_sys, clk_mem* and clk_memfb*
  signal rst_sys_r      : std_logic_vector(1 downto 0);
  signal rst_mem_r      : std_logic_vector(1 downto 0);
  signal rst_mem90_r    : std_logic_vector(1 downto 0);
  signal rst_mem180_r   : std_logic_vector(1 downto 0);
  signal rst_mem270_r   : std_logic_vector(1 downto 0);
  signal rst_memfb90_r  : std_logic_vector(1 downto 0);
  signal rst_memfb270_r : std_logic_vector(1 downto 0);

  -- internal version of output signals
  signal locked_i : std_logic;

  -- do reset
  signal do_rst : std_logic;

begin
  -----------------------------------------------------------------------------
  -- 0. Input Clock buffer and system clock.
  -----------------------------------------------------------------------------
  clk_in_buf : IBUFG port map (
    I => clk_in,
    O => clk_in_bufo);

  -----------------------------------------------------------------------------
  -- 1. System clock.
  -----------------------------------------------------------------------------
  dcm_sys : DCM_SP
      generic map (
        CLKIN_DIVIDE_BY_2     => FALSE,
        CLKIN_PERIOD          => 20.0,    --  period of input clock (50 Mhz)
        DLL_FREQUENCY_MODE    => "LOW",
        DUTY_CYCLE_CORRECTION => TRUE,
        CLK_FEEDBACK          => "1X",
        DESKEW_ADJUST         => "SYSTEM_SYNCHRONOUS",
        CLKOUT_PHASE_SHIFT    => "NONE",
        PHASE_SHIFT           => 0,
        CLKDV_DIVIDE          => 2.0,
        FACTORY_JF            => X"C080") --  ?

      port map (
        CLK0     => clk_sys_bufi,
        CLK180   => open,
        CLK270   => open,
        CLK2X    => open,
        CLK2X180 => open,
        CLK90    => open,
        CLKDV    => clk_dv_bufi,
        CLKFX    => open,
        CLKFX180 => open,
        LOCKED   => dcm_sys_locked,
        PSDONE   => open,
        STATUS   => open,
        CLKFB    => clk_sys_i,
        CLKIN    => clk_in_bufo,
        PSCLK    => '0',
        PSEN     => '0',
        PSINCDEC => '0',
        RST      => '0');

  clk_sys_buf : BUFG port map (
    I => clk_sys_bufi,
    O => clk_sys_i);

  clk_sys     <= clk_sys_i;

  -- clk_sys is stable as soon as GWE (Global Write Enable) is asserted.
  -- See documentation in file header.
  
  -----------------------------------------------------------------------------
  -- 2. Generate memory clocks.
  --
  -- The reset logic for this DCM has to wait until clk_sys gets stable.
  -- The reset must be asserted for three valid CLKIN cycles or longer.
  --
  -- IMPORTANT NOTE:
  -- Yes dcm_mem and dcm_mem90 might be merged, if doubled input clock is
  -- generated by dcm_sys and then clk0 and clk90 DCM outputs are used. But
  -- these requires a DCM input clock of 100 MHz, which is out of specification
  -- for Spartan-3E stepping 0.
  -----------------------------------------------------------------------------

  dcm_mem_rst_gen : SRLC16E
    generic map (
      INIT => x"FFFF")                  -- hold reset for 16 clock cycles
    port map (
      clk => clk_sys_i,
      ce  => dcm_sys_locked,            -- wait until clk_sys is stable
      d   => '0',                       -- finished
      a0  => '1',
      a1  => '1',
      a2  => '1',
      a3  => '1',
      q   => open,
      q15 => dcm_mem_rst);

  dcm_mem : DCM_SP
    generic map (
      CLKIN_DIVIDE_BY_2     => FALSE,
      CLKIN_PERIOD          => 20.0,    -- 50 MHz
      DLL_FREQUENCY_MODE    => "LOW",   -- no specification found in manual
      DUTY_CYCLE_CORRECTION => FALSE,   -- already 50 %
      CLK_FEEDBACK          => "2X",
      DESKEW_ADJUST         => "SOURCE_SYNCHRONOUS",
      CLKOUT_PHASE_SHIFT    => "NONE",
      PHASE_SHIFT           => 0,
      FACTORY_JF            => X"C080") --  ?

    port map (
      CLK0     => open,
      CLK180   => open,
      CLK270   => open,
      CLK2X    => clk_mem_bufi,
      CLK2X180 => open,
      CLK90    => open,
      CLKDV    => open,
      CLKFX    => open,
      CLKFX180 => open,
      LOCKED   => dcm_mem_locked,
      PSDONE   => open,
      STATUS   => open,
      CLKFB    => clk_mem_i,
      CLKIN    => clk_sys_i,
      PSCLK    => '0', 
      PSEN     => '0',
      PSINCDEC => '0',
      RST      => dcm_mem_rst);

  dcm_mem90 : DCM_SP
    generic map (
      CLKIN_DIVIDE_BY_2     => FALSE,
      CLKIN_PERIOD          => 20.0,    -- 50 MHz
      DLL_FREQUENCY_MODE    => "LOW",   -- no specification found in manual
      DUTY_CYCLE_CORRECTION => FALSE,   -- already 50 %
      CLK_FEEDBACK          => "2X",
      DESKEW_ADJUST         => "SOURCE_SYNCHRONOUS",
      CLKOUT_PHASE_SHIFT    => "FIXED",
      PHASE_SHIFT           => 32,      -- 90° @ CLK2x
      FACTORY_JF            => X"C080") --  ?

    port map (
      CLK0     => open,
      CLK180   => open,
      CLK270   => open,
      CLK2X    => clk_mem90_bufi,
      CLK2X180 => open,
      CLK90    => open,
      CLKDV    => open,
      CLKFX    => open,
      CLKFX180 => open,
      LOCKED   => dcm_mem90_locked,
      PSDONE   => open,
      STATUS   => open,
      CLKFB    => clk_mem90_i,
      CLKIN    => clk_sys_i,
      PSCLK    => '0', 
      PSEN     => '0',
      PSINCDEC => '0',
      RST      => dcm_mem_rst);

  clk_mem_buf : BUFG port map (
    I => clk_mem_bufi,
    O => clk_mem_i);

  clk_mem_n_i <= not clk_mem_i;
  
  clk_mem90_buf : BUFG port map (
    I => clk_mem90_bufi,
    O => clk_mem90_i);

  clk_mem90_n_i <= not clk_mem90_i;

  clk_mem     <= clk_mem_i;
  clk_mem_n   <= clk_mem_n_i;
  clk_mem90   <= clk_mem90_i;
  clk_mem90_n <= clk_mem90_n_i;

  -----------------------------------------------------------------------------
  -- 3. Synchronized read clock for DDR-SDRAM controller.
  --
  -- The reset logic for this DCM has to wait until clk_mem gets stable.
  -- The reset must be asserted for three valid CLKIN cycles or longer.
  -- Due to the external feedback, the number of cycles should be greater.
  -----------------------------------------------------------------------------

  dcm_memfb_rst_gen : SRLC16E
    generic map (
      INIT => x"FFFF")                  -- hold reset for 16 clock cycles
    port map (
      clk => clk_mem_i,
      ce  => dcm_mem_locked,            -- wait until clk_mem is stable
      d   => '0',                       -- finished
      a0  => '1',
      a1  => '1',
      a2  => '1',
      a3  => '1',
      q   => open,
      q15 => dcm_memfb_rst);

   
  sd_ck_fb_buf : IBUFG port map (
     I => sd_ck_fb,
     O => sd_ck_fb_bufo);
  
  dcm_memfb : DCM_SP
    generic map (
      CLKIN_DIVIDE_BY_2     => TRUE,
      CLKIN_PERIOD          => 10.0,    --  period of input clock (100 Mhz)
      DLL_FREQUENCY_MODE    => "LOW",
      DUTY_CYCLE_CORRECTION => FALSE,   -- already 50 %
      CLK_FEEDBACK          => "2X",
      DESKEW_ADJUST         => "SOURCE_SYNCHRONOUS",  -- no deskew
      CLKOUT_PHASE_SHIFT    => "FIXED",
      PHASE_SHIFT           => 32+5,   -- 90° +/- x @ CLK2X
      FACTORY_JF            => X"C080")

    port map (
      CLK0     => open,
      CLK180   => open,
      CLK270   => open,
      CLK2X    => clk_memfb90_bufi,
      CLK2X180 => clk_memfb90_n_bufi,
      CLK90    => open,
      CLKDV    => open,
      CLKFX    => open,
      CLKFX180 => open,
      LOCKED   => dcm_memfb_locked,
      PSDONE   => open,
      STATUS   => open,
      CLKFB    => clk_memfb90_i,
      CLKIN    => sd_ck_fb_bufo,
      PSCLK    => '0', 
      PSEN     => '0',
      PSINCDEC => '0',
      RST      => dcm_memfb_rst);

  clk_memfb90_buf : BUFG port map (
    I => clk_memfb90_bufi,
    O => clk_memfb90_i);

  clk_memfb90_n_buf : BUFG port map (
    I => clk_memfb90_n_bufi,
    O => clk_memfb90_n_i);

  clk_memfb90   <= clk_memfb90_i;
  clk_memfb90_n <= clk_memfb90_n_i;

  -----------------------------------------------------------------------------
  -- 4. Locked & Resets
  --
  -- Coordinated Reset removal:
  -- - First, remove reset of clk_mem*, because it always waits for commands
  --   before it writes anything to the read FIFO.
  -- - Second, remove reset from clk_sys because it writes to the command FIFO
  --   as soon as possible. But at this time, the rst_rd from that FIFO must
  --   not be asserted, so that the write_addr is correctly transfered between
  --   the clock domains (gray-encoding is kept).
  -----------------------------------------------------------------------------
  locked_i <= dcm_sys_locked and dcm_mem_locked and dcm_mem90_locked and dcm_memfb_locked;
  locked   <= locked_i;

  do_rst <= (not locked_i) or user_rst;
  
  -- synchronize locked_i with clock domain clk_sys
  process (do_rst, clk_sys_i)
  begin  -- process
    if do_rst = '1' then
      rst_sys_r <= (others => '1');
    elsif rising_edge(clk_sys_i) then
      rst_sys_r(0) <= rst_mem_r(rst_mem_r'left);        -- release as second
      rst_sys_r(rst_sys_r'left downto 1) <=
        rst_sys_r(rst_sys_r'left-1 downto 0);
    end if;
  end process;

  rst_sys <= rst_sys_r(rst_sys_r'left);

  -- synchronize locked_i with clock domain clk_mem
  process (do_rst, clk_mem_i)
  begin  -- process
    if do_rst = '1' then
      rst_mem_r <= (others => '1');
    elsif rising_edge(clk_mem_i) then
      rst_mem_r(0) <= '0';
      rst_mem_r(rst_mem_r'left downto 1) <=
        rst_mem_r(rst_mem_r'left-1 downto 0);
    end if;
  end process;

  rst_mem   <= rst_mem_r(rst_mem_r'left);

  -- synchronize locked_i with clock domain clk_mem90
  process (do_rst, clk_mem90_i)
  begin  -- process
    if do_rst = '1' then
      rst_mem90_r <= (others => '1');
    elsif rising_edge(clk_mem90_i) then
      rst_mem90_r(0) <= '0';
      rst_mem90_r(rst_mem90_r'left downto 1) <=
        rst_mem90_r(rst_mem90_r'left-1 downto 0);
    end if;
  end process;

  rst_mem90 <= rst_mem90_r(rst_mem90_r'left);

  -- synchronize locked_i with clock domain clk_mem_n
  process (do_rst, clk_mem_n_i)
  begin  -- process
    if do_rst = '1' then
      rst_mem180_r <= (others => '1');
    elsif falling_edge(clk_mem_n_i) then
      rst_mem180_r(0) <= '0';
      rst_mem180_r(rst_mem180_r'left downto 1) <=
        rst_mem180_r(rst_mem180_r'left-1 downto 0);
    end if;
  end process;

  rst_mem180 <= rst_mem180_r(rst_mem180_r'left);

  -- synchronize locked_i with clock domain clk_mem90_n
  process (do_rst, clk_mem90_n_i)
  begin  -- process
    if do_rst = '1' then
      rst_mem270_r <= (others => '1');
    elsif falling_edge(clk_mem90_n_i) then
      rst_mem270_r(0) <= '0';
      rst_mem270_r(rst_mem270_r'left downto 1) <=
        rst_mem270_r(rst_mem270_r'left-1 downto 0);
    end if;
  end process;

  rst_mem270 <= rst_mem270_r(rst_mem270_r'left);

  -- synchronize locked_i with clock domain clk_memfb90
  process (do_rst, clk_memfb90_i)
  begin  -- process
    if do_rst = '1' then
      rst_memfb90_r <= (others => '1');
    elsif rising_edge(clk_memfb90_i) then
      rst_memfb90_r(0) <= '0';
      rst_memfb90_r(rst_memfb90_r'left downto 1) <=
        rst_memfb90_r(rst_memfb90_r'left-1 downto 0);
    end if;
  end process;

  rst_memfb90 <= rst_memfb90_r(rst_memfb90_r'left);

  -- synchronize locked_i with clock domain clk_memfb90_n
  process (do_rst, clk_memfb90_n_i)
  begin  -- process
    if do_rst = '1' then
      rst_memfb270_r <= (others => '1');
    elsif rising_edge(clk_memfb90_n_i) then
      rst_memfb270_r(0) <= '0';
      rst_memfb270_r(rst_memfb270_r'left downto 1) <=
        rst_memfb270_r(rst_memfb270_r'left-1 downto 0);
    end if;
  end process;

  rst_memfb270 <= rst_memfb270_r(rst_memfb270_r'left);
  
end rtl;
