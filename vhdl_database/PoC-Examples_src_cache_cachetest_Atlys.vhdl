-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- =============================================================================
-- Authors:					Martin Zabel
--
-- Module:					Test cache_mem on Digilent Atlys board.
--
-- Description:
-- ------------------------------------
-- Test cache_mem on Digilent Atlys board using the Xilinx Memory Controller
-- (MIG).
--
-- The user clock of the MIG core must be configured to 85 MHz by setting
-- the parameter C3_CLKOUT2_DIVIDE to 7. At the moment, this can be achieved
-- only by editing lib/PoC/py/config.entity.ini:
--
-- 1. Go to section [XST.xil.mig.Atlys_1x128.nl]
-- 2. Add the following line to the end of this section::
--
--      HDLParameters =  C3_CLKOUT2_DIVIDE=7
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

library poc;
use poc.utils.all;

entity cachetest_Atlys is

	generic (
		C3_SIMULATION    : string  := "FALSE");

	port (
		Atlys_SystemClock_100MHz  : in  std_logic;
		Atlys_GPIO_LED            : out std_logic_vector(7 downto 0);

		-- Memory Controller Bank 3
		mcb3_dram_dq     : inout std_logic_vector(16-1 downto 0);
		mcb3_dram_a      : out   std_logic_vector(13-1 downto 0);
		mcb3_dram_ba     : out   std_logic_vector(3-1 downto 0);
		mcb3_dram_ras_n  : out   std_logic;
		mcb3_dram_cas_n  : out   std_logic;
		mcb3_dram_we_n   : out   std_logic;
		mcb3_dram_odt    : out   std_logic;
		mcb3_dram_cke    : out   std_logic;
		mcb3_dram_dm     : out   std_logic;
		mcb3_dram_udqs   : inout std_logic;
		mcb3_dram_udqs_n : inout std_logic;
		mcb3_rzq         : inout std_logic;
		mcb3_dram_udm    : out   std_logic;
		mcb3_dram_dqs    : inout std_logic;
		mcb3_dram_dqs_n  : inout std_logic;
		mcb3_dram_ck     : out   std_logic;
		mcb3_dram_ck_n   : out   std_logic);

end entity cachetest_Atlys;

architecture rtl of cachetest_Atlys is
	signal memtest0_status : std_logic_vector(2 downto 0);

	-- Memory Controller signals
--  signal c3_sys_rst_i        : std_logic;
	signal c3_calib_done       : std_logic;
  signal c3_clk0             : std_logic;  -- output from IP core
  signal c3_rst0             : std_logic;  -- output from IP core, asynchronously asserted!
--  signal c3_p0_cmd_clk       : std_logic;
  signal c3_p0_cmd_en        : std_logic;
  signal c3_p0_cmd_instr     : std_logic_vector(2 downto 0);
  signal c3_p0_cmd_bl        : std_logic_vector(5 downto 0);
  signal c3_p0_cmd_byte_addr : std_logic_vector(29 downto 0);
  signal c3_p0_cmd_empty     : std_logic;
  signal c3_p0_cmd_full      : std_logic;
--  signal c3_p0_wr_clk        : std_logic;
  signal c3_p0_wr_en         : std_logic;
  signal c3_p0_wr_mask       : std_logic_vector(16-1 downto 0);
  signal c3_p0_wr_data       : std_logic_vector(128-1 downto 0);
  signal c3_p0_wr_full       : std_logic;
  signal c3_p0_wr_empty      : std_logic;
  signal c3_p0_wr_count      : std_logic_vector(6 downto 0);
  signal c3_p0_wr_underrun   : std_logic;
  signal c3_p0_wr_error      : std_logic;
--  signal c3_p0_rd_clk        : std_logic;
  signal c3_p0_rd_en         : std_logic;
  signal c3_p0_rd_data       : std_logic_vector(128-1 downto 0);
  signal c3_p0_rd_full       : std_logic;
  signal c3_p0_rd_empty      : std_logic;
  signal c3_p0_rd_count      : std_logic_vector(6 downto 0);
  signal c3_p0_rd_overflow   : std_logic;
  signal c3_p0_rd_error      : std_logic;
  
begin  -- architecture rtl

	-----------------------------------------------------------------------------
	-- MemoryTester for Port 0
	-----------------------------------------------------------------------------
  MemoryTester0 : block
		constant MEM_BYTE_ADDR_BITS : natural := 4;  -- 16 Byte / Word
		constant MEM_WORD_ADDR_BITS : natural :=
			ite(SIMULATION,
					15, -- 32 KByte = 2 rows
					27) -- 128 MB = 1 GBit
			-MEM_BYTE_ADDR_BITS; 

		constant MEM_DATA_BITS : positive := 128; -- fixed value

		constant CPU_DATA_BITS : positive := 32; -- supported values: 8, 16, 32, 64, 128
		constant CPU_ADDR_BITS : positive := log2ceil(MEM_DATA_BITS/CPU_DATA_BITS)+MEM_WORD_ADDR_BITS;

		signal cpu_rdy	 : std_logic;
		signal cpu_req	 : std_logic;
		signal cpu_write : std_logic;
		signal cpu_addr	 : unsigned(CPU_ADDR_BITS-1 downto 0);
		signal cpu_wdata : std_logic_vector(CPU_DATA_BITS-1 downto 0);
		signal cpu_rstb	 : std_logic;
		signal cpu_rdata : std_logic_vector(CPU_DATA_BITS-1 downto 0);

		signal mem_rdy	 : std_logic;
		signal mem_req	 : std_logic;
		signal mem_write : std_logic;
		signal mem_addr	 : unsigned(MEM_WORD_ADDR_BITS-1 downto 0);
		signal mem_wdata : std_logic_vector(MEM_DATA_BITS-1 downto 0);
		signal mem_wmask : std_logic_vector(MEM_DATA_BITS/8-1  downto 0);
		signal mem_rstb	 : std_logic;
		signal mem_rdata : std_logic_vector(MEM_DATA_BITS-1 downto 0);

  begin  -- block MemoryTester0
		fsm: entity work.memtest_fsm
			generic map (
				A_BITS => CPU_ADDR_BITS,
				D_BITS => CPU_DATA_BITS)
			port map (
				clk       => c3_clk0,
				rst       => c3_rst0,
				mem_rdy   => cpu_rdy,
				mem_rstb  => cpu_rstb,
				mem_rdata => cpu_rdata,
				mem_req   => cpu_req,
				mem_write => cpu_write,
				mem_addr  => cpu_addr,
				mem_wdata => cpu_wdata,
				status    => memtest0_status);

		cache: entity poc.cache_mem
			generic map (
				REPLACEMENT_POLICY => "LRU",
				CACHE_LINES        => 512, -- 8 KiB cache / 128 bit per cache line
				ASSOCIATIVITY      => 1,
				CPU_DATA_BITS      => CPU_DATA_BITS,
				MEM_ADDR_BITS      => MEM_WORD_ADDR_BITS,
				MEM_DATA_BITS      => MEM_DATA_BITS,
				OUTSTANDING_REQ    => 2)
			port map (
				clk       => c3_clk0,
				rst       => c3_rst0,
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

		adapter: entity poc.ddr2_mem2mig_adapter_Spartan6
			generic map (
				D_BITS     => MEM_DATA_BITS,
				MEM_A_BITS => MEM_WORD_ADDR_BITS,
				APP_A_BITS => c3_p0_cmd_byte_addr'length)
			port map (
				mem_req           => mem_req,
				mem_write         => mem_write,
				mem_addr          => mem_addr,
				mem_wdata         => mem_wdata,
				mem_wmask         => mem_wmask,
				mem_rdy           => mem_rdy,
				mem_rstb          => mem_rstb,
				mem_rdata         => mem_rdata,
				mig_calib_done    => c3_calib_done,
				mig_cmd_full      => c3_p0_cmd_full,
				mig_wr_full       => c3_p0_wr_full,
				mig_rd_empty      => c3_p0_rd_empty,
				mig_rd_data       => c3_p0_rd_data,
				mig_cmd_instr     => c3_p0_cmd_instr,
				mig_cmd_en        => c3_p0_cmd_en,
				mig_cmd_bl        => c3_p0_cmd_bl,
				mig_cmd_byte_addr => c3_p0_cmd_byte_addr,
				mig_wr_data       => c3_p0_wr_data,
				mig_wr_mask       => c3_p0_wr_mask,
				mig_wr_en         => c3_p0_wr_en,
				mig_rd_en         => c3_p0_rd_en);
  end block MemoryTester0;
	
	-----------------------------------------------------------------------------
	-- Memory Controller Instantiation
	-----------------------------------------------------------------------------
	
	mig : entity poc.mig_Atlys_1x128
		port map (
			mcb3_dram_dq        => mcb3_dram_dq,
			mcb3_dram_a         => mcb3_dram_a,
			mcb3_dram_ba        => mcb3_dram_ba,
			mcb3_dram_ras_n     => mcb3_dram_ras_n,
			mcb3_dram_cas_n     => mcb3_dram_cas_n,
			mcb3_dram_we_n      => mcb3_dram_we_n,
			mcb3_dram_odt       => mcb3_dram_odt,
			mcb3_dram_cke       => mcb3_dram_cke,
			mcb3_dram_dm        => mcb3_dram_dm,
			mcb3_dram_udqs      => mcb3_dram_udqs,
			mcb3_dram_udqs_n    => mcb3_dram_udqs_n,
			mcb3_rzq            => mcb3_rzq,
			mcb3_dram_udm       => mcb3_dram_udm,
			c3_sys_clk          => Atlys_SystemClock_100MHz,
			c3_sys_rst_i        => '0',        -- active high
			c3_calib_done       => c3_calib_done,
			c3_clk0             => c3_clk0,
			c3_rst0             => c3_rst0,
			mcb3_dram_dqs       => mcb3_dram_dqs,
			mcb3_dram_dqs_n     => mcb3_dram_dqs_n,
			mcb3_dram_ck        => mcb3_dram_ck,
			mcb3_dram_ck_n      => mcb3_dram_ck_n,
			c3_p0_cmd_clk       => c3_clk0,
			c3_p0_cmd_en        => c3_p0_cmd_en,
			c3_p0_cmd_instr     => c3_p0_cmd_instr,
			c3_p0_cmd_bl        => c3_p0_cmd_bl,
			c3_p0_cmd_byte_addr => c3_p0_cmd_byte_addr,
			c3_p0_cmd_empty     => c3_p0_cmd_empty,
			c3_p0_cmd_full      => c3_p0_cmd_full,
			c3_p0_wr_clk        => c3_clk0,
			c3_p0_wr_en         => c3_p0_wr_en,
			c3_p0_wr_mask       => c3_p0_wr_mask,
			c3_p0_wr_data       => c3_p0_wr_data,
			c3_p0_wr_full       => c3_p0_wr_full,
			c3_p0_wr_empty      => c3_p0_wr_empty,
			c3_p0_wr_count      => c3_p0_wr_count,
			c3_p0_wr_underrun   => c3_p0_wr_underrun,
			c3_p0_wr_error      => c3_p0_wr_error,
			c3_p0_rd_clk        => c3_clk0,
			c3_p0_rd_en         => c3_p0_rd_en,
			c3_p0_rd_data       => c3_p0_rd_data,
			c3_p0_rd_full       => c3_p0_rd_full,
			c3_p0_rd_empty      => c3_p0_rd_empty,
			c3_p0_rd_count      => c3_p0_rd_count,
			c3_p0_rd_overflow   => c3_p0_rd_overflow,
			c3_p0_rd_error      => c3_p0_rd_error);

	-----------------------------------------------------------------------------
	-- Status outputs
	-----------------------------------------------------------------------------
  Atlys_GPIO_LED(7) <= c3_rst0;
  Atlys_GPIO_LED(6) <= '0';
  Atlys_GPIO_LED(5) <= '0';
  Atlys_GPIO_LED(4) <= '0';
  Atlys_GPIO_LED(3) <= c3_calib_done;
  Atlys_GPIO_LED(2 downto 0) <= memtest0_status;
end architecture rtl;
