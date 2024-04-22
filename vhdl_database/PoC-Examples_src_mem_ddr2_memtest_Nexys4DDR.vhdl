-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- =============================================================================
-- Authors:					Martin Zabel
--
-- Module:					Memory tester for Nexys4 DDR board using Xilinx MIG.
--
-- Description:
-- ------------------------------------
--			
-- License:
-- =============================================================================
-- Copyright 2007-2016 Technische Universitaet Dresden - Germany
--										 Chair for VLSI-Design, Diagnostics and Architecture
-- Copyrigth 2018      Martin Zabel
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
-- =============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library poc;
use poc.utils.all;

entity memtest_Nexys4DDR is

  generic (
		-- Must match configuration of generated mig_Nexys4DDR
    ADDR_WIDTH    : integer := 27;
    BANK_WIDTH    : integer := 3;
    CK_WIDTH      : integer := 1;
    nCK_PER_CLK   : integer := 4;
    CS_WIDTH      : integer := 1;
    nCS_PER_RANK  : integer := 1;
    CKE_WIDTH     : integer := 1;
    DM_WIDTH      : integer := 2;
    DQ_WIDTH      : integer := 16;
    DQS_WIDTH     : integer := 2;
    PAYLOAD_WIDTH : integer := 16;
    ROW_WIDTH     : integer := 13;
    ODT_WIDTH     : integer := 1);

  port (
    sys_clk_i : in  std_logic;
    led       : out std_logic_vector(7 downto 0);

    ddr2_dq    : inout std_logic_vector(DQ_WIDTH-1 downto 0);
    ddr2_dqs_p : inout std_logic_vector(DQS_WIDTH-1 downto 0);
    ddr2_dqs_n : inout std_logic_vector(DQS_WIDTH-1 downto 0);
    ddr2_addr  : out   std_logic_vector(ROW_WIDTH-1 downto 0);
    ddr2_ba    : out   std_logic_vector(BANK_WIDTH-1 downto 0);
    ddr2_ras_n : out   std_logic;
    ddr2_cas_n : out   std_logic;
    ddr2_we_n  : out   std_logic;
    ddr2_ck_p  : out   std_logic_vector(CK_WIDTH-1 downto 0);
    ddr2_ck_n  : out   std_logic_vector(CK_WIDTH-1 downto 0);
    ddr2_cke   : out   std_logic_vector(CKE_WIDTH-1 downto 0);
    ddr2_cs_n  : out   std_logic_vector(CS_WIDTH*nCS_PER_RANK-1 downto 0);
    ddr2_dm    : out   std_logic_vector(DM_WIDTH-1 downto 0);
    ddr2_odt   : out   std_logic_vector(ODT_WIDTH-1 downto 0));

end entity memtest_Nexys4DDR;

architecture rtl of memtest_Nexys4DDR is
  signal sys_clk_unbuf       : std_logic;
  signal clk_ref         : std_logic;
  signal ref_clk_locked  : std_logic;
  signal memtest0_status : std_logic_vector(2 downto 0);
	
	-- Memory Controller signals
  signal app_addr            : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal app_cmd             : std_logic_vector(2 downto 0);
  signal app_en              : std_logic;
  signal app_wdf_data        : std_logic_vector((nCK_PER_CLK*2*PAYLOAD_WIDTH)-1 downto 0);
  signal app_wdf_end         : std_logic;
  signal app_wdf_mask        : std_logic_vector((nCK_PER_CLK*2*PAYLOAD_WIDTH)/8-1 downto 0);
  signal app_wdf_wren        : std_logic;
  signal app_rd_data         : std_logic_vector((nCK_PER_CLK*2*PAYLOAD_WIDTH)-1 downto 0);
  signal app_rd_data_end     : std_logic;
  signal app_rd_data_valid   : std_logic;
  signal app_rdy             : std_logic;
  signal app_wdf_rdy         : std_logic;
  signal ui_clk              : std_logic;
  signal ui_clk_sync_rst     : std_logic;
  signal init_calib_complete : std_logic;
begin  -- architecture rtl

	----------------------------------------------------------------------------
	-- Clocking
	----------------------------------------------------------------------------
  -- This system clock is used two-fold:
  --
  -- 1) It is used as the system clock for the memory controllers
  --	(MIG). There it feeds only PLLs, so that, dedicated routing can be
  --	used and no BUFG is required.
  --
  -- 2) It is also used to generate a 200 MHz reference clock used for the
	--  IDELAYCTRL and temperature monitor logic.
  --	This requires a BUFG, but could also be driven by another 200 MHz
  --	clock source. If this other clock is not free-runnning, then
  --	IDELAYCTRL and the temperature monitor must be hold in reset until
  --	this other clock is stable.
	sys_clk_ibufg : IBUFG port map (
		I => sys_clk_i,
		O => sys_clk_unbuf);

  ref_clk_pll : entity work.pll_ref_clk
    port map (
      CLK_IN1  => sys_clk_unbuf,
      CLK_OUT1 => clk_ref, -- 200 MHz reference clock driven by BUFG
      LOCKED   => ref_clk_locked); -- will hold IDELAYCTRL in reset by
	                                 -- by driving sys_rst of 'mig'
	
	-----------------------------------------------------------------------------
  -- MemoryTester for Port 0
  -----------------------------------------------------------------------------
  MemoryTester0 : block
		constant BYTE_ADDR_BITS : natural := 4;  -- 16 Byte / Word
		constant WORD_ADDR_BITS : natural := ite(SIMULATION,
																						 15, -- 32 KByte = 2 rows
																						 27) -- 128 MB = 1 GBit
																				 -BYTE_ADDR_BITS; 

		signal mem_rdy	 : std_logic;
		signal mem_req	 : std_logic;
		signal mem_write : std_logic;
		signal mem_addr	 : unsigned(WORD_ADDR_BITS-1 downto 0);
		signal mem_wdata : std_logic_vector(127 downto 0);
		signal mem_rstb	 : std_logic;
		signal mem_rdata : std_logic_vector(127 downto 0);

  begin  -- block MemoryTester0
		fsm: entity work.memtest_fsm
			generic map (
				A_BITS => WORD_ADDR_BITS,
				D_BITS => 128)
			port map (
				clk				=> ui_clk,
				rst				=> ui_clk_sync_rst,
				mem_rdy		=> mem_rdy,
				mem_rstb	=> mem_rstb,
				mem_rdata => mem_rdata,
				mem_req		=> mem_req,
				mem_write => mem_write,
				mem_addr	=> mem_addr,
				mem_wdata => mem_wdata,
				status		=> memtest0_status);

		adapter : entity poc.ddr3_mem2mig_adapter_Series7
			generic map (
				D_BITS		 => 128,
				DQ_BITS		 => DQ_WIDTH,
				MEM_A_BITS => WORD_ADDR_BITS,
				APP_A_BITS => app_addr'length)
			port map (
				mem_req							=> mem_req,
				mem_write						=> mem_write,
				mem_addr						=> mem_addr,
				mem_wdata						=> mem_wdata,
				mem_rdy							=> mem_rdy,
				mem_rstb						=> mem_rstb,
				mem_rdata						=> mem_rdata,
				init_calib_complete => init_calib_complete,
				app_rd_data					=> app_rd_data,
				app_rd_data_end			=> app_rd_data_end,
				app_rd_data_valid		=> app_rd_data_valid,
				app_rdy							=> app_rdy,
				app_wdf_rdy					=> app_wdf_rdy,
				app_addr						=> app_addr,
				app_cmd							=> app_cmd,
				app_en							=> app_en,
				app_wdf_data				=> app_wdf_data,
				app_wdf_end					=> app_wdf_end,
				app_wdf_mask				=> app_wdf_mask,
				app_wdf_wren				=> app_wdf_wren);

  end block MemoryTester0;
	
	-----------------------------------------------------------------------------
	-- Memory Controller Instantiation
	-----------------------------------------------------------------------------
	
	mig : entity work.mig_Nexys4DDR
    port map (
      ddr2_dq             => ddr2_dq,
      ddr2_dqs_p          => ddr2_dqs_p,
      ddr2_dqs_n          => ddr2_dqs_n,
      ddr2_addr           => ddr2_addr,
      ddr2_ba             => ddr2_ba,
      ddr2_ras_n          => ddr2_ras_n,
      ddr2_cas_n          => ddr2_cas_n,
      ddr2_we_n           => ddr2_we_n,
      ddr2_ck_p           => ddr2_ck_p,
      ddr2_ck_n           => ddr2_ck_n,
      ddr2_cke            => ddr2_cke,
      ddr2_cs_n           => ddr2_cs_n,
      ddr2_dm             => ddr2_dm,
      ddr2_odt            => ddr2_odt,
      sys_clk_i           => sys_clk_unbuf,
      clk_ref_i           => clk_ref,
      app_addr            => app_addr,
      app_cmd             => app_cmd,
      app_en              => app_en,
      app_wdf_data        => app_wdf_data,
      app_wdf_end         => app_wdf_end,
      app_wdf_mask        => app_wdf_mask,
      app_wdf_wren        => app_wdf_wren,
      app_rd_data         => app_rd_data,
      app_rd_data_end     => app_rd_data_end,
      app_rd_data_valid   => app_rd_data_valid,
      app_rdy             => app_rdy,
      app_wdf_rdy         => app_wdf_rdy,
      app_sr_req          => '0',
      app_sr_active       => open,
      app_ref_req         => '0',
      app_ref_ack         => open,
      app_zq_req          => '0',
      app_zq_ack          => open,
      ui_clk              => ui_clk,
      ui_clk_sync_rst     => ui_clk_sync_rst,
      init_calib_complete => init_calib_complete,
      sys_rst             => ref_clk_locked); -- active low
	
  -----------------------------------------------------------------------------
  -- Status outputs
  -----------------------------------------------------------------------------
  led(7) <= ui_clk_sync_rst;
  led(6) <= ref_clk_locked;
  led(5) <= '0';
  led(4) <= '0';
  led(3) <= init_calib_complete;
  led(2 downto 0) <= memtest0_status;
end architecture rtl;
