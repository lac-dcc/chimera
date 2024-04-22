-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- ============================================================================
-- Authors:					Martin Zabel
-- 
-- Module:					Memory Controller Test for Spartan-3E Starter Kit
--
-- Description:
-- ------------------------------------
-- Top-Level of Memory Controller Test for Altera DE0 Board
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

library poc;
use poc.fifo.all;

entity memtest_s3esk is

  port (
    clk_in   : in  std_logic;
    sd_ck_fb : in  std_logic;

    btn_south : in  std_logic;
    led       : out std_logic_vector(7 downto 0);
    
    sd_ck_p          : out   std_logic;
    sd_ck_n          : out   std_logic;
    sd_cke           : out   std_logic;
    sd_cs            : out   std_logic;
    sd_ras           : out   std_logic;
    sd_cas           : out   std_logic;
    sd_we            : out   std_logic;
    sd_ba            : out   std_logic_vector(1 downto 0);
    sd_a             : out   std_logic_vector(12 downto 0);
    sd_ldm           : out   std_logic;
    sd_udm           : out   std_logic;
    sd_ldqs          : out   std_logic;
    sd_udqs          : out   std_logic;
    sd_dq            : inout std_logic_vector(15 downto 0));

end memtest_s3esk;

architecture rtl of memtest_s3esk is

  signal clk_sys       : std_logic;
  signal clk_mem       : std_logic;
  signal clk_mem_n     : std_logic;
  signal clk_mem90     : std_logic;
  signal clk_mem90_n   : std_logic;
  signal clk_memfb90   : std_logic;
  signal clk_memfb90_n : std_logic;
  signal rst_sys       : std_logic;
  signal rst_mem       : std_logic;
  signal rst_mem90     : std_logic;
  signal rst_mem180    : std_logic;
  signal rst_mem270    : std_logic;
  signal rst_memfb90   : std_logic;
  signal rst_memfb270  : std_logic;
  signal locked        : std_logic;

  signal clk_tb : std_logic;
  signal rst_tb : std_logic;
  
  signal cf_put   : std_logic;
  signal cf_full  : std_logic;
  signal cf_din   : std_logic_vector(25 downto 0);
  signal cf_dout  : std_logic_vector(25 downto 0);
  signal cf_valid : std_logic;
  signal cf_got   : std_logic;

  signal wf_put   : std_logic;
  signal wf_full  : std_logic;
  signal wf_din   : std_logic_vector(31 downto 0);
  signal wf_dout  : std_logic_vector(31 downto 0);
  signal wf_valid : std_logic;
  signal wf_got   : std_logic;

  signal mem_rdy    : std_logic;
  signal mem_rstb   : std_logic;
  signal mem_rdata  : std_logic_vector(31 downto 0);
  signal mem_req    : std_logic;
  signal mem_write  : std_logic;
  signal mem_addr   : unsigned(23 downto 0);
  signal mem_wdata  : std_logic_vector(31 downto 0);
  signal fsm_status : std_logic_vector(2 downto 0);
  
  signal rf_put   : std_logic;
  signal rf_din   : std_logic_vector(31 downto 0);

	-- Component declaration in case a netlist is used.
	component sdram_ctrl_s3esk is
    generic (
      CLK_PERIOD : real;
      BL         : positive);
    port (
      clk              : in    std_logic;
      clk_n            : in    std_logic;
      clk90            : in    std_logic;
      clk90_n          : in    std_logic;
      rst              : in    std_logic;
      rst90            : in    std_logic;
      rst180           : in    std_logic;
      rst270           : in    std_logic;
      clk_fb90         : in    std_logic;
      clk_fb90_n       : in    std_logic;
      rst_fb90         : in    std_logic;
      rst_fb270        : in    std_logic;
      user_cmd_valid   : in    std_logic;
      user_wdata_valid : in    std_logic;
      user_write       : in    std_logic;
      user_addr        : in    std_logic_vector(24 downto 0);
      user_wdata       : in    std_logic_vector(31 downto 0);
      user_got_cmd     : out   std_logic;
      user_got_wdata   : out   std_logic;
      user_rdata       : out   std_logic_vector(31 downto 0);
      user_rstb        : out   std_logic;
      sd_ck_p          : out   std_logic;
      sd_ck_n          : out   std_logic;
      sd_cke           : out   std_logic;
      sd_cs            : out   std_logic;
      sd_ras           : out   std_logic;
      sd_cas           : out   std_logic;
      sd_we            : out   std_logic;
      sd_ba            : out   std_logic_vector(1 downto 0);
      sd_a             : out   std_logic_vector(12 downto 0);
      sd_ldqs          : out   std_logic;
      sd_udqs          : out   std_logic;
      sd_dq            : inout std_logic_vector(15 downto 0));
	end component sdram_ctrl_s3esk;

begin  -- rtl
  clockgen: entity work.memtest_s3esk_clockgen
    port map (
      clk_in        => clk_in,
      sd_ck_fb      => sd_ck_fb,
      user_rst      => btn_south,
      clk_sys       => clk_sys,
      clk_mem       => clk_mem,
      clk_mem_n     => clk_mem_n,
      clk_mem90     => clk_mem90,
      clk_mem90_n   => clk_mem90_n,
      clk_memfb90   => clk_memfb90,
      clk_memfb90_n => clk_memfb90_n,
      rst_sys       => rst_sys,
      rst_mem       => rst_mem,
      rst_mem90     => rst_mem90,
      rst_mem180    => rst_mem180,
      rst_mem270    => rst_mem270,
      rst_memfb90   => rst_memfb90,
      rst_memfb270  => rst_memfb270,
      locked        => locked);

  -- Testbench clock selection
  -- Also update chipscope configuration.
--  clk_tb <= clk_mem;
--  rst_tb <= rst_mem;
  clk_tb <= clk_sys;
  rst_tb <= rst_sys;
  

  -- uses default configuration, see entity declaration
  mem_ctrl: sdram_ctrl_s3esk
    generic map (
      CLK_PERIOD  => 10.0,
      BL          => 2)
    port map (
      clk              => clk_mem,
      clk_n            => clk_mem_n,
      clk90            => clk_mem90,
      clk90_n          => clk_mem90_n,
      rst              => rst_mem,
      rst90            => rst_mem90,
      rst180           => rst_mem180,
      rst270           => rst_mem270,
      clk_fb90         => clk_memfb90,
      clk_fb90_n       => clk_memfb90_n,
      rst_fb90         => rst_memfb90,
      rst_fb270        => rst_memfb270,
      user_cmd_valid   => cf_valid,
      user_wdata_valid => wf_valid,
      user_write       => cf_dout(25),
      user_addr        => cf_dout(24 downto 0),
      user_wdata       => wf_dout,
      user_got_cmd     => cf_got,
      user_got_wdata   => wf_got,
      user_rdata       => rf_din,
      user_rstb        => rf_put,
      sd_ck_p          => sd_ck_p,
      sd_ck_n          => sd_ck_n,
      sd_cke           => sd_cke,
      sd_cs            => sd_cs,
      sd_ras           => sd_ras,
      sd_cas           => sd_cas,
      sd_we            => sd_we,
      sd_ba            => sd_ba,
      sd_a             => sd_a,
      sd_ldqs          => sd_ldqs,
      sd_udqs          => sd_udqs,
      sd_dq            => sd_dq);

  sd_ldm <= '0';
  sd_udm <= '0';
  
  cmd_fifo: fifo_ic_got
    generic map (
      DATA_REG  => true,
      D_BITS    => 26,
      MIN_DEPTH => 8)
    port map (
      clk_wr => clk_tb,
      rst_wr => rst_tb,
      put    => cf_put,
      din    => cf_din,
      full   => cf_full,
      clk_rd => clk_mem,
      rst_rd => rst_mem,
      got    => cf_got,
      valid  => cf_valid,
      dout   => cf_dout);

  wr_fifo: fifo_ic_got
    generic map (
      DATA_REG  => true,
      D_BITS    => 32,
      MIN_DEPTH => 8)
    port map (
      clk_wr => clk_tb,
      rst_wr => rst_tb,
      put    => wf_put,
      din    => wf_din,
      full   => wf_full,
      clk_rd => clk_mem,
      rst_rd => rst_mem,
      got    => wf_got,
      valid  => wf_valid,
      dout   => wf_dout);

  -- The size fo this FIFO depends on the latency between write and read
  -- clock domain
  rd_fifo: fifo_ic_got
    generic map (
      DATA_REG  => true,
      D_BITS    => 32,
      MIN_DEPTH => 8)
    port map (
      clk_wr => clk_memfb90_n,
      rst_wr => rst_memfb270,
      put    => rf_put,
      din    => rf_din,
      full   => open,                   -- can't stall
      clk_rd => clk_tb,
      rst_rd => rst_tb,
      got    => mem_rstb,
      valid  => mem_rstb,
      dout   => mem_rdata);

  fsm: entity work.memtest_fsm
    generic map (
      A_BITS => 24,
      D_BITS => 32)
    port map (
      clk       => clk_tb,
      rst       => rst_tb,
      mem_rdy   => mem_rdy,
      mem_rstb  => mem_rstb,
      mem_rdata => mem_rdata,
      mem_req   => mem_req,
      mem_write => mem_write,
      mem_addr  => mem_addr,
      mem_wdata => mem_wdata,
      status    => fsm_status);

  -- Signal mem_ctrl ready only if both FIFOs are not full.
  mem_rdy <= cf_full nor wf_full;

  -- Word aligned access to memory.
  -- Parallel "put" to both FIFOs.
  cf_put <= mem_req and mem_rdy;
  wf_put <= mem_req and mem_write and mem_rdy;
  cf_din <= mem_write & std_logic_vector(mem_addr) & '0';
  wf_din <= mem_wdata;

  -----------------------------------------------------------------------------
  -- Outputs
  -----------------------------------------------------------------------------

  led(7)          <= locked;
  led(6 downto 3) <= (others => '0');
  led(2 downto 0) <= fsm_status;

end rtl;
