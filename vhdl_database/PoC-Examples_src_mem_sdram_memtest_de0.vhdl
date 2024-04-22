-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- ============================================================================
-- Authors:					Martin Zabel
-- 
-- Module:					Memory Controller Test for Altera DE0 Board
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

entity memtest_de0 is

  port (
    clk_in   : in  std_logic;

    btn : in  std_logic_vector(2 downto 2);
    led  : out std_logic_vector(9 downto 0);
    
    sd_ck            : out   std_logic;
    sd_cke           : out   std_logic;
    sd_cs            : out   std_logic;
    sd_ras           : out   std_logic;
    sd_cas           : out   std_logic;
    sd_we            : out   std_logic;
    sd_ba            : out   std_logic_vector(1 downto 0);
    sd_a             : out   std_logic_vector(11 downto 0);
    sd_ldm           : out   std_logic;
    sd_udm           : out   std_logic;
    sd_dq            : inout std_logic_vector(15 downto 0));

end memtest_de0;

architecture rtl of memtest_de0 is

  signal clk_sys       : std_logic;
  signal clk_mem       : std_logic;
  signal clk_memout    : std_logic;
  signal rst_sys       : std_logic;
  signal rst_mem       : std_logic;
  signal locked        : std_logic;

  signal clk_tb : std_logic;
  signal rst_tb : std_logic;
  
  signal cf_put   : std_logic;
  signal cf_full  : std_logic;
  signal cf_din   : std_logic_vector(22 downto 0);
  signal cf_dout  : std_logic_vector(22 downto 0);
  signal cf_valid : std_logic;
  signal cf_got   : std_logic;

  signal wf_put   : std_logic;
  signal wf_full  : std_logic;
  signal wf_din   : std_logic_vector(15 downto 0);
  signal wf_dout  : std_logic_vector(15 downto 0);
  signal wf_valid : std_logic;
  signal wf_got   : std_logic;

  signal mem_rdy    : std_logic;
  signal mem_rstb   : std_logic;
  signal mem_rdata  : std_logic_vector(15 downto 0);
  signal mem_req    : std_logic;
  signal mem_write  : std_logic;
  signal mem_addr   : unsigned(21 downto 0);
  signal mem_wdata  : std_logic_vector(15 downto 0);
  signal fsm_status : std_logic_vector(2 downto 0);
  
  signal rf_put   : std_logic;
  signal rf_din   : std_logic_vector(15 downto 0);

begin  -- rtl

  pll: entity work.memtest_de0_pll
    port map (
      inclk0 => clk_in,
      c0     => clk_sys,
      c1     => clk_mem,
      c2     => clk_memout,
      locked => locked);

  rst_sync : block
    signal do_rst      : std_logic;
    signal rst_sys_r   : std_logic_vector(4 downto 0);
    signal rst_mem_r   : std_logic_vector(4 downto 0);
  begin  -- block clockgen

    -- reset synchronizer
    do_rst    <= not locked or not btn(2);
    rst_sys_r <= rst_sys_r(rst_sys_r'left-1 downto 0) & do_rst
                 when rising_edge(clk_sys);
    rst_mem_r <= rst_mem_r(rst_mem_r'left-1 downto 0) & do_rst
                 when rising_edge(clk_mem);
    rst_sys <= rst_sys_r(rst_sys_r'left);
    rst_mem <= rst_mem_r(rst_mem_r'left);
  end block rst_sync;

  -- Testbench clock selection
  -- Also update chipscope configuration.
--  clk_tb <= clk_mem;
--  rst_tb <= rst_mem;
  clk_tb <= clk_sys;
  rst_tb <= rst_sys;
  

  -- uses default configuration, see entity declaration
  mem_ctrl: entity poc.sdram_ctrl_de0
    generic map (
      CLK_PERIOD  => 7.5,
      CL          => 2,
      BL          => 1)
    port map (
      clk              => clk_mem,
      clkout           => clk_memout,
      rst              => rst_mem,
      user_cmd_valid   => cf_valid,
      user_wdata_valid => wf_valid,
      user_write       => cf_dout(cf_dout'left),
      user_addr        => cf_dout(cf_dout'left-1 downto 0),
      user_wdata       => wf_dout,
      user_got_cmd     => cf_got,
      user_got_wdata   => wf_got,
      user_rdata       => rf_din,
      user_rstb        => rf_put,
      sd_ck            => sd_ck,
      sd_cke           => sd_cke,
      sd_cs            => sd_cs,
      sd_ras           => sd_ras,
      sd_cas           => sd_cas,
      sd_we            => sd_we,
      sd_ba            => sd_ba,
      sd_a             => sd_a,
      sd_dq            => sd_dq);

  sd_ldm <= '0';
  sd_udm <= '0';
  
  cmd_fifo: fifo_ic_got
    generic map (
      DATA_REG  => true,
      D_BITS    => 23,
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
      D_BITS    => 16,
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
      D_BITS    => 16,
      MIN_DEPTH => 8)
    port map (
      clk_wr => clk_mem,
      rst_wr => rst_mem,
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
      A_BITS => 22,
      D_BITS => 16)
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
  cf_din <= mem_write & std_logic_vector(mem_addr);
  wf_din <= mem_wdata;

  -----------------------------------------------------------------------------
  -- Outputs
  -----------------------------------------------------------------------------

  led(9)          <= locked;
  led(8 downto 3) <= (others => '0');
  led(2 downto 0) <= fsm_status;

end rtl;
