-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- =============================================================================
-- Authors:					Martin Zabel
--
-- Module:					Test cache_mem on Xilinx KC705 board.
--
-- Description:
-- ------------------------------------
-- Test cache_mem on Xilinx KC705 board using the Xilinx Memory Controller
-- (MIG).
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

entity cachetest_KC705 is
  
	port (
		KC705_SystemClock_200MHz_p : in  std_logic;
		KC705_SystemClock_200MHz_n : in  std_logic;
		KC705_GPIO_LED             : out std_logic_vector(7 downto 0);

		ddr3_dq      : inout std_logic_vector(64-1 downto 0);
		ddr3_dqs_p   : inout std_logic_vector(8-1 downto 0);
		ddr3_dqs_n   : inout std_logic_vector(8-1 downto 0);
		ddr3_addr    : out   std_logic_vector(14-1 downto 0);
		ddr3_ba      : out   std_logic_vector(3-1 downto 0);
		ddr3_ras_n   : out   std_logic;
		ddr3_cas_n   : out   std_logic;
		ddr3_we_n    : out   std_logic;
		ddr3_reset_n : out   std_logic;
		ddr3_ck_p    : out   std_logic_vector(1-1 downto 0);
		ddr3_ck_n    : out   std_logic_vector(1-1 downto 0);
		ddr3_cke     : out   std_logic_vector(1-1 downto 0);
		ddr3_cs_n    : out   std_logic_vector(1*1-1 downto 0);
		ddr3_dm      : out   std_logic_vector(8-1 downto 0);
		ddr3_odt     : out   std_logic_vector(1-1 downto 0));

end entity cachetest_KC705;

architecture rtl of cachetest_KC705 is
	signal sysclk_unbuf   : std_logic;
	signal refclk         : std_logic;
	signal memtest_status : std_logic_vector(2 downto 0);

	-- Inputs / Outputs of MIG core
	signal sys_rst             : std_logic;
	signal app_addr            : std_logic_vector(28-1 downto 0);
	signal app_cmd             : std_logic_vector(2 downto 0);
	signal app_en              : std_logic;
	signal app_wdf_data        : std_logic_vector((4*2*64)-1 downto 0);
	signal app_wdf_end         : std_logic;
	signal app_wdf_mask        : std_logic_vector((4*2*64)/8-1 downto 0);
	signal app_wdf_wren        : std_logic;
	signal app_rd_data         : std_logic_vector((4*2*64)-1 downto 0);
	signal app_rd_data_end     : std_logic;
	signal app_rd_data_valid   : std_logic;
	signal app_rdy             : std_logic;
	signal app_wdf_rdy         : std_logic;
	signal ui_clk              : std_logic;
	signal ui_clk_sync_rst     : std_logic;
	signal init_calib_complete : std_logic;

	-- component declaration required for Xilinx Vivado
	component mig_KC705_MT8JTF12864HZ_1G6
		port (
			ddr3_dq       : inout std_logic_vector(63 downto 0);
			ddr3_dqs_p    : inout std_logic_vector(7 downto 0);
			ddr3_dqs_n    : inout std_logic_vector(7 downto 0);

			ddr3_addr     : out   std_logic_vector(13 downto 0);
			ddr3_ba       : out   std_logic_vector(2 downto 0);
			ddr3_ras_n    : out   std_logic;
			ddr3_cas_n    : out   std_logic;
			ddr3_we_n     : out   std_logic;
			ddr3_reset_n  : out   std_logic;
			ddr3_ck_p     : out   std_logic_vector(0 downto 0);
			ddr3_ck_n     : out   std_logic_vector(0 downto 0);
			ddr3_cke      : out   std_logic_vector(0 downto 0);
			ddr3_cs_n     : out   std_logic_vector(0 downto 0);
			ddr3_dm       : out   std_logic_vector(7 downto 0);
			ddr3_odt      : out   std_logic_vector(0 downto 0);
			app_addr                  : in    std_logic_vector(27 downto 0);
			app_cmd                   : in    std_logic_vector(2 downto 0);
			app_en                    : in    std_logic;
			app_wdf_data              : in    std_logic_vector(511 downto 0);
			app_wdf_end               : in    std_logic;
			app_wdf_mask              : in    std_logic_vector(63 downto 0);
			app_wdf_wren              : in    std_logic;
			app_rd_data               : out   std_logic_vector(511 downto 0);
			app_rd_data_end           : out   std_logic;
			app_rd_data_valid         : out   std_logic;
			app_rdy                   : out   std_logic;
			app_wdf_rdy               : out   std_logic;
			app_sr_req                : in    std_logic;
			app_ref_req               : in    std_logic;
			app_zq_req                : in    std_logic;
			app_sr_active             : out   std_logic;
			app_ref_ack               : out   std_logic;
			app_zq_ack                : out   std_logic;
			ui_clk                    : out   std_logic;
			ui_clk_sync_rst           : out   std_logic;
			init_calib_complete       : out   std_logic;
			-- System Clock Ports
			sys_clk_i                 : in    std_logic;
			-- Reference Clock Ports
			clk_ref_i                 : in    std_logic;
			sys_rst                   : in    std_logic
		);
	end component mig_KC705_MT8JTF12864HZ_1G6;

begin	 -- architecture rtl

	-----------------------------------------------------------------------------
	-- Clock Buffer
	-----------------------------------------------------------------------------
	-- This system clock is used two-fold:
	--
	-- 1) It is used as the reference / system clock for the memory controllers
	--  (MIG). There it feeds only PLLs, so that, dedicated routing can be
	--  used and no BUFG is required.
	--
	-- 2) It is also used for the IDELAYCTRL and temperature monitor logic.
	--  This requires a BUFG, but could also be driven by another 200 MHz
	--  clock source. If this other clock is not free-runnning, then
	--  IDELAYCTRL and the temperature monitor must be hold in reset until
	--  this other clock is stable.
	sysclk_ibuf : ibufds
		port map (
			I  => KC705_SystemClock_200MHz_p,
			IB => KC705_SystemClock_200MHz_n,
			O  => sysclk_unbuf);  -- sufficient for memory controllers only.

	refclk_bufg : bufg
		port map (
			I => sysclk_unbuf,
			O => refclk);                      -- buffered 200 MHz reference clock

	-----------------------------------------------------------------------------
	-- MemoryTester
	-----------------------------------------------------------------------------
	MemoryTester : block
		-- The smallest addressable unit of the "app" interface has DQ_BITS bits.
		-- The smallest addressable unit of the "mem" interface has MEM_DATA_BITS bits.
		-- The burst length is then MEM_DATA_BITS / DQ_BITS.
		constant MEM_DATA_BITS : positive := 512;
		constant DQ_BITS       : positive := 64;
		constant BL_BITS       : natural  := log2ceil(MEM_DATA_BITS / DQ_BITS);

		constant MEM_ADDR_BITS : natural :=
			ite(SIMULATION,
					17-3,  -- 128 KByte / 8 = 16 KByte per chip (on SoDIMM)
					30-3)  -- 1 GB / 8 = 128 MB per chip (on SoDIMM)
			-BL_BITS;

		constant CPU_DATA_BITS : positive := 32;  -- supported values: 8, 16, 32, 64, 128
		constant CPU_ADDR_BITS : positive := log2ceil(MEM_DATA_BITS/CPU_DATA_BITS)+MEM_ADDR_BITS;

		signal cpu_rdy   : std_logic;
		signal cpu_req   : std_logic;
		signal cpu_write : std_logic;
		signal cpu_addr  : unsigned(CPU_ADDR_BITS-1 downto 0);
		signal cpu_wdata : std_logic_vector(CPU_DATA_BITS-1 downto 0);
		signal cpu_rstb  : std_logic;
		signal cpu_rdata : std_logic_vector(CPU_DATA_BITS-1 downto 0);

		signal mem_rdy   : std_logic;
		signal mem_rstb  : std_logic;
		signal mem_req   : std_logic;
		signal mem_write : std_logic;
		signal mem_addr  : unsigned(MEM_ADDR_BITS-1 downto 0);
		signal mem_wdata : std_logic_vector(MEM_DATA_BITS-1 downto 0);
		signal mem_wmask : std_logic_vector(MEM_DATA_BITS/8-1 downto 0);
		signal mem_rdata : std_logic_vector(MEM_DATA_BITS-1 downto 0);

	begin  -- block MemoryTester
		fsm : entity work.memtest_fsm
			generic map (
				A_BITS => CPU_ADDR_BITS,
				D_BITS => CPU_DATA_BITS)
			port map (
				clk       => ui_clk,
				rst       => ui_clk_sync_rst,
				mem_rdy   => cpu_rdy,
				mem_rstb  => cpu_rstb,
				mem_rdata => cpu_rdata,
				mem_req   => cpu_req,
				mem_write => cpu_write,
				mem_addr  => cpu_addr,
				mem_wdata => cpu_wdata,
				status    => memtest_status(2 downto 0));

		cache : entity poc.cache_mem
			generic map (
				REPLACEMENT_POLICY => "LRU",
				CACHE_LINES        => 1024,  -- 64 KiB cache / 512 bit per cache line
				ASSOCIATIVITY      => 1,
				CPU_DATA_BITS      => CPU_DATA_BITS,
				MEM_ADDR_BITS      => MEM_ADDR_BITS,
				MEM_DATA_BITS      => MEM_DATA_BITS,
				OUTSTANDING_REQ    => 2)
			port map (
				clk       => ui_clk,
				rst       => ui_clk_sync_rst,
				cpu_req   => cpu_req,
				cpu_write => cpu_write,
				cpu_addr  => cpu_addr,
				cpu_wdata => cpu_wdata,
				cpu_rdy   => cpu_rdy,
				cpu_rstb  => cpu_rstb,
				cpu_rdata => cpu_rdata,
				mem_req   => mem_req,
				mem_write => mem_write,
				mem_addr  => mem_addr,
				mem_wdata => mem_wdata,
				mem_wmask => mem_wmask,
				mem_rdy   => mem_rdy,
				mem_rstb  => mem_rstb,
				mem_rdata => mem_rdata);

		adapter : entity poc.ddr3_mem2mig_adapter_Series7
			generic map (
				D_BITS     => MEM_DATA_BITS,
				DQ_BITS    => DQ_BITS,
				MEM_A_BITS => MEM_ADDR_BITS,
				APP_A_BITS => app_addr'length)
			port map (
				mem_req             => mem_req,
				mem_write           => mem_write,
				mem_addr            => mem_addr,
				mem_wdata           => mem_wdata,
				mem_wmask           => mem_wmask,
				mem_rdy             => mem_rdy,
				mem_rstb            => mem_rstb,
				mem_rdata           => mem_rdata,
				init_calib_complete => init_calib_complete,
				app_rd_data         => app_rd_data,
				app_rd_data_end     => app_rd_data_end,
				app_rd_data_valid   => app_rd_data_valid,
				app_rdy             => app_rdy,
				app_wdf_rdy         => app_wdf_rdy,
				app_addr            => app_addr,
				app_cmd             => app_cmd,
				app_en              => app_en,
				app_wdf_data        => app_wdf_data,
				app_wdf_end         => app_wdf_end,
				app_wdf_mask        => app_wdf_mask,
				app_wdf_wren        => app_wdf_wren);
	end block MemoryTester;

	-----------------------------------------------------------------------------
	-- Memory Controller Instantiation
	-----------------------------------------------------------------------------

	-- Apply an initial reset pulse. Required for IDELAYCTRL.
	sys_rst_pulse : FD
		generic map (
			INIT => '1')
		port map (
			D => '0',
			C => refclk,
			Q => sys_rst);

	mig : mig_KC705_MT8JTF12864HZ_1G6
		port map (
			ddr3_dq             => ddr3_dq,
			ddr3_dqs_p          => ddr3_dqs_p,
			ddr3_dqs_n          => ddr3_dqs_n,
			ddr3_addr           => ddr3_addr,
			ddr3_ba             => ddr3_ba,
			ddr3_ras_n          => ddr3_ras_n,
			ddr3_cas_n          => ddr3_cas_n,
			ddr3_we_n           => ddr3_we_n,
			ddr3_reset_n        => ddr3_reset_n,
			ddr3_ck_p           => ddr3_ck_p,
			ddr3_ck_n           => ddr3_ck_n,
			ddr3_cke            => ddr3_cke,
			ddr3_cs_n           => ddr3_cs_n,
			ddr3_dm             => ddr3_dm,
			ddr3_odt            => ddr3_odt,
			sys_clk_i           => sysclk_unbuf,
			clk_ref_i           => refclk,
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
			app_sr_req          => '0',        -- reserved
			app_sr_active       => open,
			app_ref_req         => '0',        -- unused
			app_ref_ack         => open,
			app_zq_req          => '0',        -- unused
			app_zq_ack          => open,
			ui_clk              => ui_clk,
			ui_clk_sync_rst     => ui_clk_sync_rst,
			init_calib_complete => init_calib_complete,
			sys_rst             => sys_rst);  -- active high

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
