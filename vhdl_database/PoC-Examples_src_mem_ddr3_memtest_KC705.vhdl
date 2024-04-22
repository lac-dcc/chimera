-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- =============================================================================
-- Authors:					Martin Zabel
--
-- Module:					Memory tester for KC705 board using Xilinx MIG with one
-- 									512-bit port.
--
-- Description:
-- ------------------------------------
--			
-- License:
-- =============================================================================
-- Copyright 2007-2016 Technische Universitaet Dresden - Germany
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
-- =============================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library poc;
use poc.utils.all;

entity memtest_KC705 is
  
	port (
		KC705_SystemClock_200MHz_p : in		 std_logic;
		KC705_SystemClock_200MHz_n : in		 std_logic;
		KC705_GPIO_LED						 : out	 std_logic_vector(7 downto 0);
		
		ddr3_dq			 : inout std_logic_vector(64-1 downto 0);
		ddr3_dqs_p	 : inout std_logic_vector(8-1 downto 0);
		ddr3_dqs_n	 : inout std_logic_vector(8-1 downto 0);
		ddr3_addr		 : out	 std_logic_vector(14-1 downto 0);
		ddr3_ba			 : out	 std_logic_vector(3-1 downto 0);
		ddr3_ras_n	 : out	 std_logic;
		ddr3_cas_n	 : out	 std_logic;
		ddr3_we_n		 : out	 std_logic;
		ddr3_reset_n : out	 std_logic;
		ddr3_ck_p		 : out	 std_logic_vector(1-1 downto 0);
		ddr3_ck_n		 : out	 std_logic_vector(1-1 downto 0);
		ddr3_cke		 : out	 std_logic_vector(1-1 downto 0);
		ddr3_cs_n		 : out	 std_logic_vector(1*1-1 downto 0);
		ddr3_dm			 : out	 std_logic_vector(8-1 downto 0);
		ddr3_odt		 : out	 std_logic_vector(1-1 downto 0));

end entity memtest_KC705;

architecture rtl of memtest_KC705 is
	signal sysclk_unbuf		: std_logic;
	signal refclk					: std_logic;
	signal memtest_status : std_logic_vector(2 downto 0);

	-- Inputs / Outputs of MIG core
	signal sys_rst 						 : std_logic;
	signal app_addr						 : std_logic_vector(28-1 downto 0);
	signal app_cmd						 : std_logic_vector(2 downto 0);
	signal app_en							 : std_logic;
	signal app_wdf_data				 : std_logic_vector((4*2*64)-1 downto 0);
	signal app_wdf_end				 : std_logic;
	signal app_wdf_mask				 : std_logic_vector((4*2*64)/8-1 downto 0);
	signal app_wdf_wren				 : std_logic;
	signal app_rd_data				 : std_logic_vector((4*2*64)-1 downto 0);
	signal app_rd_data_end		 : std_logic;
	signal app_rd_data_valid	 : std_logic;
	signal app_rdy						 : std_logic;
	signal app_wdf_rdy				 : std_logic;
	signal ui_clk							 : std_logic;
	signal ui_clk_sync_rst		 : std_logic;
	signal init_calib_complete : std_logic;
begin	 -- architecture rtl

  -----------------------------------------------------------------------------
  -- Clock Buffer
  -----------------------------------------------------------------------------
  -- This system clock is used two-fold:
  --
  -- 1) It is used as the reference / system clock for the memory controllers
  --	(MIG). There it feeds only PLLs, so that, dedicated routing can be
  --	used and no BUFG is required.
  --
  -- 2) It is also used for the IDELAYCTRL and temperature monitor logic.
  --	This requires a BUFG, but could also be driven by another 200 MHz
  --	clock source. If this other clock is not free-runnning, then
  --	IDELAYCTRL and the temperature monitor must be hold in reset until
  --	this other clock is stable.
  sysclk_ibuf : ibufds
    port map (
      I  => KC705_SystemClock_200MHz_p,
      IB => KC705_SystemClock_200MHz_n,
      O  => sysclk_unbuf);  -- sufficient for memory controllers only.

  refclk_bufg : bufg
    port map (
      I => sysclk_unbuf,
      O => refclk); -- buffered 200 MHz reference clock

	-----------------------------------------------------------------------------
	-- MemoryTester
	-----------------------------------------------------------------------------
	MemoryTester : block
		-- The smallest addressable unit of the "app" interface has DQ_BITS bits.
		-- The smallest addressable unit of the "mem" interface has D_BITS	bits.
		-- The burst length is then D_BITS / DQ_BITS.
		constant D_BITS	 : positive := 512;
		constant DQ_BITS : positive := 64;
		constant BL_BITS : natural	:= log2ceil(D_BITS / DQ_BITS);

    constant MEM_A_BITS : natural := ite(SIMULATION,
					     17-3, -- 128 KByte / 8 = 16 KByte per chip (on SoDIMM)
					     30-3) -- 1 GB / 8 = 128 MB per chip (on SoDIMM)
					 -BL_BITS; 
    
    signal mem_rdy   : std_logic;
    signal mem_rstb  : std_logic;
    signal mem_req   : std_logic;
    signal mem_write : std_logic;
    signal mem_addr  : unsigned(MEM_A_BITS-1 downto 0);
    signal mem_wdata : std_logic_vector(D_BITS-1 downto 0);
    signal mem_rdata : std_logic_vector(D_BITS-1 downto 0);

	begin	 -- block MemoryTester
		fsm : entity work.memtest_fsm
			generic map (
				A_BITS => MEM_A_BITS,
				D_BITS => 128) -- check only 128 bits
			port map (
				clk				=> ui_clk,
				rst				=> ui_clk_sync_rst,
				mem_rdy		=> mem_rdy,
				mem_rstb	=> mem_rstb,
				mem_rdata => mem_rdata(127 downto 0), -- check only lower 128
				mem_req		=> mem_req,
				mem_write => mem_write,
				mem_addr	=> mem_addr,
				mem_wdata => mem_wdata(127 downto 0),
				status		=> memtest_status(2 downto 0));

		mem_wdata(D_BITS-1 downto 128) <= (others => '0'); -- TODO
		

		adapter : entity poc.ddr3_mem2mig_adapter_Series7
			generic map (
				D_BITS		 => D_BITS,
				DQ_BITS		 => DQ_BITS,
				MEM_A_BITS => MEM_A_BITS,
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
	end block MemoryTester;
	
  -----------------------------------------------------------------------------
  -- Memory Controller Instantiation
  -----------------------------------------------------------------------------

	-- Apply an initial reset pulse. Required for IDELAYCTRL.
	sys_rst_pulse : FD
		generic map (
			INIT => '1')
		port map (
			D	 => '0',
			C	 => refclk,
			Q	 => sys_rst);
    
	mig : entity poc.mig_KC705_MT8JTF12864HZ_1G6
		port map (
			ddr3_dq							=> ddr3_dq,
			ddr3_dqs_p					=> ddr3_dqs_p,
			ddr3_dqs_n					=> ddr3_dqs_n,
			ddr3_addr						=> ddr3_addr,
			ddr3_ba							=> ddr3_ba,
			ddr3_ras_n					=> ddr3_ras_n,
			ddr3_cas_n					=> ddr3_cas_n,
			ddr3_we_n						=> ddr3_we_n,
			ddr3_reset_n				=> ddr3_reset_n,
			ddr3_ck_p						=> ddr3_ck_p,
			ddr3_ck_n						=> ddr3_ck_n,
			ddr3_cke						=> ddr3_cke,
			ddr3_cs_n						=> ddr3_cs_n,
			ddr3_dm							=> ddr3_dm,
			ddr3_odt						=> ddr3_odt,
			sys_clk_i						=> sysclk_unbuf,
			clk_ref_i						=> refclk,
			app_addr						=> app_addr,
			app_cmd							=> app_cmd,
			app_en							=> app_en,
			app_wdf_data				=> app_wdf_data,
			app_wdf_end					=> app_wdf_end,
			app_wdf_mask				=> app_wdf_mask,
			app_wdf_wren				=> app_wdf_wren,
			app_rd_data					=> app_rd_data,
			app_rd_data_end			=> app_rd_data_end,
			app_rd_data_valid		=> app_rd_data_valid,
			app_rdy							=> app_rdy,
			app_wdf_rdy					=> app_wdf_rdy,
			app_sr_req					=> '0', -- reserved
			app_sr_active				=> open,
			app_ref_req					=> '0', -- unused
			app_ref_ack					=> open,
			app_zq_req					=> '0', -- unused
			app_zq_ack					=> open,
			ui_clk							=> ui_clk,
			ui_clk_sync_rst			=> ui_clk_sync_rst,
			init_calib_complete => init_calib_complete,
			device_temp_i       => (others => '0'), -- doesn't care if TEMP_MON_CONTROL is set
																							-- to "INTERNAL" during netlist generation
			sys_rst							=> sys_rst);		-- active high

  -----------------------------------------------------------------------------
  -- Status Output
  -----------------------------------------------------------------------------

	KC705_GPIO_LED(7) <= ui_clk_sync_rst;
	KC705_GPIO_LED(6) <= '0';
	KC705_GPIO_LED(5) <= '0';
	KC705_GPIO_LED(4) <= '0';
	KC705_GPIO_LED(3) <= init_calib_complete;
	KC705_GPIO_LED(2 downto 0) <= memtest_status;

end architecture rtl;
