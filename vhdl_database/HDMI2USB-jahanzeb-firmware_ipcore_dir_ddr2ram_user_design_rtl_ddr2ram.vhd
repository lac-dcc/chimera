--*****************************************************************************
-- (c) Copyright 2009 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--*****************************************************************************
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor             : Xilinx
-- \   \   \/     Version            : 3.92
--  \   \         Application        : MIG
--  /   /         Filename           : ddr2ram.vhd
-- /___/   /\     Date Last Modified : $Date: 2011/06/02 07:16:56 $
-- \   \  /  \    Date Created       : Jul 03 2009
--  \___\/\___\
--
--Device           : Spartan-6
--Design Name      : DDR/DDR2/DDR3/LPDDR 
--Purpose          : This is the design top level. which instantiates top wrapper,
--                   test bench top and infrastructure modules.
--Reference        :
--Revision History :
--*****************************************************************************
library ieee;
use ieee.std_logic_1164.all;
entity ddr2ram is
generic
  (
            C3_P0_MASK_SIZE           : integer := 4;
          C3_P0_DATA_PORT_SIZE      : integer := 32;
          C3_P1_MASK_SIZE           : integer := 4;
          C3_P1_DATA_PORT_SIZE      : integer := 32;
    C3_MEMCLK_PERIOD        : integer := 3200; 
                                       -- Memory data transfer clock period.
    C3_RST_ACT_LOW          : integer := 0; 
                                       -- # = 1 for active low reset,
                                       -- # = 0 for active high reset.
    C3_INPUT_CLK_TYPE       : string := "SINGLE_ENDED"; 
                                       -- input clock type DIFFERENTIAL or SINGLE_ENDED.
    C3_CALIB_SOFT_IP        : string := "TRUE"; 
                                       -- # = TRUE, Enables the soft calibration logic,
                                       -- # = FALSE, Disables the soft calibration logic.
    C3_SIMULATION           : string := "FALSE"; 
                                       -- # = TRUE, Simulating the design. Useful to reduce the simulation time,
                                       -- # = FALSE, Implementing the design.
    DEBUG_EN                : integer := 0; 
                                       -- # = 1, Enable debug signals/controls,
                                       --   = 0, Disable debug signals/controls.
    C3_MEM_ADDR_ORDER       : string := "ROW_BANK_COLUMN"; 
                                       -- The order in which user address is provided to the memory controller,
                                       -- ROW_BANK_COLUMN or BANK_ROW_COLUMN.
    C3_NUM_DQ_PINS          : integer := 16; 
                                       -- External memory data width.
    C3_MEM_ADDR_WIDTH       : integer := 13; 
                                       -- External memory address width.
    C3_MEM_BANKADDR_WIDTH   : integer := 3 
                                       -- External memory bank address width.
  );
   
  port
  (

   mcb3_dram_dq                            : inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
   mcb3_dram_a                             : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
   mcb3_dram_ba                            : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
   mcb3_dram_ras_n                         : out std_logic;
   mcb3_dram_cas_n                         : out std_logic;
   mcb3_dram_we_n                          : out std_logic;
   mcb3_dram_odt                           : out std_logic;
   mcb3_dram_cke                           : out std_logic;
   mcb3_dram_dm                            : out std_logic;
   mcb3_dram_udqs                          : inout  std_logic;
   mcb3_dram_udqs_n                        : inout  std_logic;
   mcb3_rzq                                : inout  std_logic;
   mcb3_zio                                : inout  std_logic;
   mcb3_dram_udm                           : out std_logic;
   c3_sys_clk                              : in  std_logic;
   c3_sys_rst_i                            : in  std_logic;
   c3_calib_done                           : out std_logic;
   c3_clk0                                 : out std_logic;
   c3_rst0                                 : out std_logic;
   mcb3_dram_dqs                           : inout  std_logic;
   mcb3_dram_dqs_n                         : inout  std_logic;
   mcb3_dram_ck                            : out std_logic;
   mcb3_dram_ck_n                          : out std_logic;
   clk_img 			                       : out std_logic;   
   c3_p2_cmd_clk                           : in std_logic;
   c3_p2_cmd_en                            : in std_logic;
   c3_p2_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p2_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p2_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p2_cmd_empty                         : out std_logic;
   c3_p2_cmd_full                          : out std_logic;
   c3_p2_rd_clk                            : in std_logic;
   c3_p2_rd_en                             : in std_logic;
   c3_p2_rd_data                           : out std_logic_vector(31 downto 0);
   c3_p2_rd_full                           : out std_logic;
   c3_p2_rd_empty                          : out std_logic;
   c3_p2_rd_count                          : out std_logic_vector(6 downto 0);
   c3_p2_rd_overflow                       : out std_logic;
   c3_p2_rd_error                          : out std_logic;
   c3_p3_cmd_clk                           : in std_logic;
   c3_p3_cmd_en                            : in std_logic;
   c3_p3_cmd_instr                         : in std_logic_vector(2 downto 0);
   c3_p3_cmd_bl                            : in std_logic_vector(5 downto 0);
   c3_p3_cmd_byte_addr                     : in std_logic_vector(29 downto 0);
   c3_p3_cmd_empty                         : out std_logic;
   c3_p3_cmd_full                          : out std_logic;
   c3_p3_wr_clk                            : in std_logic;
   c3_p3_wr_en                             : in std_logic;
   c3_p3_wr_mask                           : in std_logic_vector(3 downto 0);
   c3_p3_wr_data                           : in std_logic_vector(31 downto 0);
   c3_p3_wr_full                           : out std_logic;
   c3_p3_wr_empty                          : out std_logic;
   c3_p3_wr_count                          : out std_logic_vector(6 downto 0);
   c3_p3_wr_underrun                       : out std_logic;
   c3_p3_wr_error                          : out std_logic
  );
end ddr2ram;

architecture arc of ddr2ram is

 

component memc3_infrastructure is
    generic (
      C_RST_ACT_LOW        : integer;
      C_INPUT_CLK_TYPE     : string;
      C_CLKOUT0_DIVIDE     : integer;
      C_CLKOUT1_DIVIDE     : integer;
      C_CLKOUT2_DIVIDE     : integer;
      C_CLKOUT3_DIVIDE     : integer;
      C_CLKOUT4_DIVIDE     : integer;
      C_CLKFBOUT_MULT      : integer;
      C_DIVCLK_DIVIDE      : integer;
      C_INCLK_PERIOD       : integer

      );
    port (
      sys_clk_p                              : in    std_logic;
      sys_clk_n                              : in    std_logic;
      sys_clk                                : in    std_logic;
      sys_rst_i                              : in    std_logic;
      clk0                                   : out   std_logic;
      clk_img                                : out   std_logic;
      rst0                                   : out   std_logic;
      async_rst                              : out   std_logic;
      sysclk_2x                              : out   std_logic;
      sysclk_2x_180                          : out   std_logic;
      pll_ce_0                               : out   std_logic;
      pll_ce_90                              : out   std_logic;
      pll_lock                               : out   std_logic;
      mcb_drp_clk                            : out   std_logic

      );
  end component;


component memc3_wrapper is
    generic (
      C_MEMCLK_PERIOD      : integer;
      C_CALIB_SOFT_IP      : string;
      C_SIMULATION         : string;
      C_P0_MASK_SIZE       : integer;
      C_P0_DATA_PORT_SIZE   : integer;
      C_P1_MASK_SIZE       : integer;
      C_P1_DATA_PORT_SIZE   : integer;
      C_ARB_NUM_TIME_SLOTS   : integer;
      C_ARB_TIME_SLOT_0    : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_1    : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_2    : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_3    : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_4    : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_5    : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_6    : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_7    : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_8    : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_9    : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_10   : bit_vector(5 downto 0);
      C_ARB_TIME_SLOT_11   : bit_vector(5 downto 0);
      C_MEM_TRAS           : integer;
      C_MEM_TRCD           : integer;
      C_MEM_TREFI          : integer;
      C_MEM_TRFC           : integer;
      C_MEM_TRP            : integer;
      C_MEM_TWR            : integer;
      C_MEM_TRTP           : integer;
      C_MEM_TWTR           : integer;
      C_MEM_ADDR_ORDER     : string;
      C_NUM_DQ_PINS        : integer;
      C_MEM_TYPE           : string;
      C_MEM_DENSITY        : string;
      C_MEM_BURST_LEN      : integer;
      C_MEM_CAS_LATENCY    : integer;
      C_MEM_ADDR_WIDTH     : integer;
      C_MEM_BANKADDR_WIDTH   : integer;
      C_MEM_NUM_COL_BITS   : integer;
      C_MEM_DDR1_2_ODS     : string;
      C_MEM_DDR2_RTT       : string;
      C_MEM_DDR2_DIFF_DQS_EN   : string;
      C_MEM_DDR2_3_PA_SR   : string;
      C_MEM_DDR2_3_HIGH_TEMP_SR   : string;
      C_MEM_DDR3_CAS_LATENCY   : integer;
      C_MEM_DDR3_ODS       : string;
      C_MEM_DDR3_RTT       : string;
      C_MEM_DDR3_CAS_WR_LATENCY   : integer;
      C_MEM_DDR3_AUTO_SR   : string;
      C_MEM_DDR3_DYN_WRT_ODT   : string;
      C_MEM_MOBILE_PA_SR   : string;
      C_MEM_MDDR_ODS       : string;
      C_MC_CALIB_BYPASS    : string;
      C_MC_CALIBRATION_MODE   : string;
      C_MC_CALIBRATION_DELAY   : string;
      C_SKIP_IN_TERM_CAL   : integer;
      C_SKIP_DYNAMIC_CAL   : integer;
      C_LDQSP_TAP_DELAY_VAL   : integer;
      C_LDQSN_TAP_DELAY_VAL   : integer;
      C_UDQSP_TAP_DELAY_VAL   : integer;
      C_UDQSN_TAP_DELAY_VAL   : integer;
      C_DQ0_TAP_DELAY_VAL   : integer;
      C_DQ1_TAP_DELAY_VAL   : integer;
      C_DQ2_TAP_DELAY_VAL   : integer;
      C_DQ3_TAP_DELAY_VAL   : integer;
      C_DQ4_TAP_DELAY_VAL   : integer;
      C_DQ5_TAP_DELAY_VAL   : integer;
      C_DQ6_TAP_DELAY_VAL   : integer;
      C_DQ7_TAP_DELAY_VAL   : integer;
      C_DQ8_TAP_DELAY_VAL   : integer;
      C_DQ9_TAP_DELAY_VAL   : integer;
      C_DQ10_TAP_DELAY_VAL   : integer;
      C_DQ11_TAP_DELAY_VAL   : integer;
      C_DQ12_TAP_DELAY_VAL   : integer;
      C_DQ13_TAP_DELAY_VAL   : integer;
      C_DQ14_TAP_DELAY_VAL   : integer;
      C_DQ15_TAP_DELAY_VAL   : integer
      );
    port (
      mcb3_dram_dq                           : inout  std_logic_vector((C_NUM_DQ_PINS-1) downto 0);
      mcb3_dram_a                            : out  std_logic_vector((C_MEM_ADDR_WIDTH-1) downto 0);
      mcb3_dram_ba                           : out  std_logic_vector((C_MEM_BANKADDR_WIDTH-1) downto 0);
      mcb3_dram_ras_n                        : out  std_logic;
      mcb3_dram_cas_n                        : out  std_logic;
      mcb3_dram_we_n                         : out  std_logic;
      mcb3_dram_odt                          : out  std_logic;
      mcb3_dram_cke                          : out  std_logic;
      mcb3_dram_dm                           : out  std_logic;
      mcb3_dram_udqs                         : inout  std_logic;
      mcb3_dram_udqs_n                       : inout  std_logic;
      mcb3_rzq                               : inout  std_logic;
      mcb3_zio                               : inout  std_logic;
      mcb3_dram_udm                          : out  std_logic;
      calib_done                             : out  std_logic;
      async_rst                              : in  std_logic;
      sysclk_2x                              : in  std_logic;
      sysclk_2x_180                          : in  std_logic;
      pll_ce_0                               : in  std_logic;
      pll_ce_90                              : in  std_logic;
      pll_lock                               : in  std_logic;
      mcb_drp_clk                            : in  std_logic;
      mcb3_dram_dqs                          : inout  std_logic;
      mcb3_dram_dqs_n                        : inout  std_logic;
      mcb3_dram_ck                           : out  std_logic;
      mcb3_dram_ck_n                         : out  std_logic;
      p2_cmd_clk                            : in std_logic;
      p2_cmd_en                             : in std_logic;
      p2_cmd_instr                          : in std_logic_vector(2 downto 0);
      p2_cmd_bl                             : in std_logic_vector(5 downto 0);
      p2_cmd_byte_addr                      : in std_logic_vector(29 downto 0);
      p2_cmd_empty                          : out std_logic;
      p2_cmd_full                           : out std_logic;
      p2_rd_clk                             : in std_logic;
      p2_rd_en                              : in std_logic;
      p2_rd_data                            : out std_logic_vector(31 downto 0);
      p2_rd_full                            : out std_logic;
      p2_rd_empty                           : out std_logic;
      p2_rd_count                           : out std_logic_vector(6 downto 0);
      p2_rd_overflow                        : out std_logic;
      p2_rd_error                           : out std_logic;
      p3_cmd_clk                            : in std_logic;
      p3_cmd_en                             : in std_logic;
      p3_cmd_instr                          : in std_logic_vector(2 downto 0);
      p3_cmd_bl                             : in std_logic_vector(5 downto 0);
      p3_cmd_byte_addr                      : in std_logic_vector(29 downto 0);
      p3_cmd_empty                          : out std_logic;
      p3_cmd_full                           : out std_logic;
      p3_wr_clk                             : in std_logic;
      p3_wr_en                              : in std_logic;
      p3_wr_mask                            : in std_logic_vector(3 downto 0);
      p3_wr_data                            : in std_logic_vector(31 downto 0);
      p3_wr_full                            : out std_logic;
      p3_wr_empty                           : out std_logic;
      p3_wr_count                           : out std_logic_vector(6 downto 0);
      p3_wr_underrun                        : out std_logic;
      p3_wr_error                           : out std_logic;
      selfrefresh_enter                     : in std_logic;
      selfrefresh_mode                      : out std_logic

      );
  end component;






   constant C3_CLKOUT0_DIVIDE       : integer := 1; 
   constant C3_CLKOUT1_DIVIDE       : integer := 1; 
   constant C3_CLKOUT2_DIVIDE       : integer := 8; 
   constant C3_CLKOUT3_DIVIDE       : integer := 4; 
   constant C3_CLKOUT4_DIVIDE       : integer := 25; -- img clock divider 
   constant C3_CLKFBOUT_MULT        : integer := 25; 
   constant C3_DIVCLK_DIVIDE        : integer := 4; 
   constant C3_INCLK_PERIOD         : integer := ((C3_MEMCLK_PERIOD * C3_CLKFBOUT_MULT) / (C3_DIVCLK_DIVIDE * C3_CLKOUT0_DIVIDE * 2)); 
   constant C3_ARB_NUM_TIME_SLOTS   : integer := 12; 
   constant C3_ARB_TIME_SLOT_0      : bit_vector(5 downto 0) := o"23"; 
   constant C3_ARB_TIME_SLOT_1      : bit_vector(5 downto 0) := o"32"; 
   constant C3_ARB_TIME_SLOT_2      : bit_vector(5 downto 0) := o"23"; 
   constant C3_ARB_TIME_SLOT_3      : bit_vector(5 downto 0) := o"32"; 
   constant C3_ARB_TIME_SLOT_4      : bit_vector(5 downto 0) := o"23"; 
   constant C3_ARB_TIME_SLOT_5      : bit_vector(5 downto 0) := o"32"; 
   constant C3_ARB_TIME_SLOT_6      : bit_vector(5 downto 0) := o"23"; 
   constant C3_ARB_TIME_SLOT_7      : bit_vector(5 downto 0) := o"32"; 
   constant C3_ARB_TIME_SLOT_8      : bit_vector(5 downto 0) := o"23"; 
   constant C3_ARB_TIME_SLOT_9      : bit_vector(5 downto 0) := o"32"; 
   constant C3_ARB_TIME_SLOT_10     : bit_vector(5 downto 0) := o"23"; 
   constant C3_ARB_TIME_SLOT_11     : bit_vector(5 downto 0) := o"32"; 
   constant C3_MEM_TRAS             : integer := 42500; 
   constant C3_MEM_TRCD             : integer := 12500; 
   constant C3_MEM_TREFI            : integer := 7800000; 
   constant C3_MEM_TRFC             : integer := 127500; 
   constant C3_MEM_TRP              : integer := 12500; 
   constant C3_MEM_TWR              : integer := 15000; 
   constant C3_MEM_TRTP             : integer := 7500; 
   constant C3_MEM_TWTR             : integer := 7500; 
   constant C3_MEM_TYPE             : string := "DDR2"; 
   constant C3_MEM_DENSITY          : string := "1Gb"; 
   constant C3_MEM_BURST_LEN        : integer := 4; 
   constant C3_MEM_CAS_LATENCY      : integer := 5; 
   constant C3_MEM_NUM_COL_BITS     : integer := 10; 
   constant C3_MEM_DDR1_2_ODS       : string := "FULL"; 
   constant C3_MEM_DDR2_RTT         : string := "50OHMS"; 
   constant C3_MEM_DDR2_DIFF_DQS_EN  : string := "YES"; 
   constant C3_MEM_DDR2_3_PA_SR     : string := "FULL"; 
   constant C3_MEM_DDR2_3_HIGH_TEMP_SR  : string := "NORMAL"; 
   constant C3_MEM_DDR3_CAS_LATENCY  : integer := 6; 
   constant C3_MEM_DDR3_ODS         : string := "DIV6"; 
   constant C3_MEM_DDR3_RTT         : string := "DIV2"; 
   constant C3_MEM_DDR3_CAS_WR_LATENCY  : integer := 5; 
   constant C3_MEM_DDR3_AUTO_SR     : string := "ENABLED"; 
   constant C3_MEM_DDR3_DYN_WRT_ODT  : string := "OFF"; 
   constant C3_MEM_MOBILE_PA_SR     : string := "FULL"; 
   constant C3_MEM_MDDR_ODS         : string := "FULL"; 
   constant C3_MC_CALIB_BYPASS      : string := "NO"; 
   constant C3_MC_CALIBRATION_MODE  : string := "CALIBRATION"; 
   constant C3_MC_CALIBRATION_DELAY  : string := "HALF"; 
   constant C3_SKIP_IN_TERM_CAL     : integer := 0; 
   constant C3_SKIP_DYNAMIC_CAL     : integer := 0; 
   constant C3_LDQSP_TAP_DELAY_VAL  : integer := 0; 
   constant C3_LDQSN_TAP_DELAY_VAL  : integer := 0; 
   constant C3_UDQSP_TAP_DELAY_VAL  : integer := 0; 
   constant C3_UDQSN_TAP_DELAY_VAL  : integer := 0; 
   constant C3_DQ0_TAP_DELAY_VAL    : integer := 0; 
   constant C3_DQ1_TAP_DELAY_VAL    : integer := 0; 
   constant C3_DQ2_TAP_DELAY_VAL    : integer := 0; 
   constant C3_DQ3_TAP_DELAY_VAL    : integer := 0; 
   constant C3_DQ4_TAP_DELAY_VAL    : integer := 0; 
   constant C3_DQ5_TAP_DELAY_VAL    : integer := 0; 
   constant C3_DQ6_TAP_DELAY_VAL    : integer := 0; 
   constant C3_DQ7_TAP_DELAY_VAL    : integer := 0; 
   constant C3_DQ8_TAP_DELAY_VAL    : integer := 0; 
   constant C3_DQ9_TAP_DELAY_VAL    : integer := 0; 
   constant C3_DQ10_TAP_DELAY_VAL   : integer := 0; 
   constant C3_DQ11_TAP_DELAY_VAL   : integer := 0; 
   constant C3_DQ12_TAP_DELAY_VAL   : integer := 0; 
   constant C3_DQ13_TAP_DELAY_VAL   : integer := 0; 
   constant C3_DQ14_TAP_DELAY_VAL   : integer := 0; 
   constant C3_DQ15_TAP_DELAY_VAL   : integer := 0; 
   constant C3_SMALL_DEVICE         : string := "FALSE"; -- The parameter is set to TRUE for all packages of xc6slx9 device
                                                         -- as most of them cannot fit the complete example design when the
                                                         -- Chip scope modules are enabled

  signal  c3_sys_clk_p                             : std_logic;
  signal  c3_sys_clk_n                             : std_logic;
  signal  c3_async_rst                             : std_logic;
  signal  c3_sysclk_2x                             : std_logic;
  signal  c3_sysclk_2x_180                         : std_logic;
  signal  c3_pll_ce_0                              : std_logic;
  signal  c3_pll_ce_90                             : std_logic;
  signal  c3_pll_lock                              : std_logic;
  signal  c3_mcb_drp_clk                           : std_logic;
  signal  c3_cmp_error                             : std_logic;
  signal  c3_cmp_data_valid                        : std_logic;
  signal  c3_vio_modify_enable                     : std_logic;
  signal  c3_error_status                          : std_logic_vector(127 downto 0);
  signal  c3_vio_data_mode_value                   : std_logic_vector(2 downto 0);
  signal  c3_vio_addr_mode_value                   : std_logic_vector(2 downto 0);
  signal  c3_cmp_data                              : std_logic_vector(31 downto 0);
  signal  c3_selfrefresh_enter                     : std_logic;
  signal  c3_selfrefresh_mode                      : std_logic;



begin
 

c3_sys_clk_p <= '0';
c3_sys_clk_n <= '0';
c3_selfrefresh_enter <= '0';
memc3_infrastructure_inst : memc3_infrastructure

generic map
 (
   C_RST_ACT_LOW                     => C3_RST_ACT_LOW,
   C_INPUT_CLK_TYPE                  => C3_INPUT_CLK_TYPE,
   C_CLKOUT0_DIVIDE                  => C3_CLKOUT0_DIVIDE,
   C_CLKOUT1_DIVIDE                  => C3_CLKOUT1_DIVIDE,
   C_CLKOUT2_DIVIDE                  => C3_CLKOUT2_DIVIDE,
   C_CLKOUT3_DIVIDE                  => C3_CLKOUT3_DIVIDE,
   C_CLKOUT4_DIVIDE                  => C3_CLKOUT4_DIVIDE,
   C_CLKFBOUT_MULT                   => C3_CLKFBOUT_MULT,
   C_DIVCLK_DIVIDE                   => C3_DIVCLK_DIVIDE,
   C_INCLK_PERIOD                    => C3_INCLK_PERIOD
   )
port map
 (
   sys_clk_p                       => c3_sys_clk_p,
   sys_clk_n                       => c3_sys_clk_n,
   sys_clk                         => c3_sys_clk,
   sys_rst_i                       => c3_sys_rst_i,
   clk0                            => c3_clk0,
   clk_img						   => clk_img,
   rst0                            => c3_rst0,
   async_rst                       => c3_async_rst,
   sysclk_2x                       => c3_sysclk_2x,
   sysclk_2x_180                   => c3_sysclk_2x_180,
   pll_ce_0                        => c3_pll_ce_0,
   pll_ce_90                       => c3_pll_ce_90,
   pll_lock                        => c3_pll_lock,
   mcb_drp_clk                     => c3_mcb_drp_clk
   );


-- wrapper instantiation
 memc3_wrapper_inst : memc3_wrapper

generic map
 (
   C_MEMCLK_PERIOD                   => C3_MEMCLK_PERIOD,
   C_CALIB_SOFT_IP                   => C3_CALIB_SOFT_IP,
   C_SIMULATION                      => C3_SIMULATION,
   C_P0_MASK_SIZE                    => C3_P0_MASK_SIZE,
   C_P0_DATA_PORT_SIZE               => C3_P0_DATA_PORT_SIZE,
   C_P1_MASK_SIZE                    => C3_P1_MASK_SIZE,
   C_P1_DATA_PORT_SIZE               => C3_P1_DATA_PORT_SIZE,
   C_ARB_NUM_TIME_SLOTS              => C3_ARB_NUM_TIME_SLOTS,
   C_ARB_TIME_SLOT_0                 => C3_ARB_TIME_SLOT_0,
   C_ARB_TIME_SLOT_1                 => C3_ARB_TIME_SLOT_1,
   C_ARB_TIME_SLOT_2                 => C3_ARB_TIME_SLOT_2,
   C_ARB_TIME_SLOT_3                 => C3_ARB_TIME_SLOT_3,
   C_ARB_TIME_SLOT_4                 => C3_ARB_TIME_SLOT_4,
   C_ARB_TIME_SLOT_5                 => C3_ARB_TIME_SLOT_5,
   C_ARB_TIME_SLOT_6                 => C3_ARB_TIME_SLOT_6,
   C_ARB_TIME_SLOT_7                 => C3_ARB_TIME_SLOT_7,
   C_ARB_TIME_SLOT_8                 => C3_ARB_TIME_SLOT_8,
   C_ARB_TIME_SLOT_9                 => C3_ARB_TIME_SLOT_9,
   C_ARB_TIME_SLOT_10                => C3_ARB_TIME_SLOT_10,
   C_ARB_TIME_SLOT_11                => C3_ARB_TIME_SLOT_11,
   C_MEM_TRAS                        => C3_MEM_TRAS,
   C_MEM_TRCD                        => C3_MEM_TRCD,
   C_MEM_TREFI                       => C3_MEM_TREFI,
   C_MEM_TRFC                        => C3_MEM_TRFC,
   C_MEM_TRP                         => C3_MEM_TRP,
   C_MEM_TWR                         => C3_MEM_TWR,
   C_MEM_TRTP                        => C3_MEM_TRTP,
   C_MEM_TWTR                        => C3_MEM_TWTR,
   C_MEM_ADDR_ORDER                  => C3_MEM_ADDR_ORDER,
   C_NUM_DQ_PINS                     => C3_NUM_DQ_PINS,
   C_MEM_TYPE                        => C3_MEM_TYPE,
   C_MEM_DENSITY                     => C3_MEM_DENSITY,
   C_MEM_BURST_LEN                   => C3_MEM_BURST_LEN,
   C_MEM_CAS_LATENCY                 => C3_MEM_CAS_LATENCY,
   C_MEM_ADDR_WIDTH                  => C3_MEM_ADDR_WIDTH,
   C_MEM_BANKADDR_WIDTH              => C3_MEM_BANKADDR_WIDTH,
   C_MEM_NUM_COL_BITS                => C3_MEM_NUM_COL_BITS,
   C_MEM_DDR1_2_ODS                  => C3_MEM_DDR1_2_ODS,
   C_MEM_DDR2_RTT                    => C3_MEM_DDR2_RTT,
   C_MEM_DDR2_DIFF_DQS_EN            => C3_MEM_DDR2_DIFF_DQS_EN,
   C_MEM_DDR2_3_PA_SR                => C3_MEM_DDR2_3_PA_SR,
   C_MEM_DDR2_3_HIGH_TEMP_SR         => C3_MEM_DDR2_3_HIGH_TEMP_SR,
   C_MEM_DDR3_CAS_LATENCY            => C3_MEM_DDR3_CAS_LATENCY,
   C_MEM_DDR3_ODS                    => C3_MEM_DDR3_ODS,
   C_MEM_DDR3_RTT                    => C3_MEM_DDR3_RTT,
   C_MEM_DDR3_CAS_WR_LATENCY         => C3_MEM_DDR3_CAS_WR_LATENCY,
   C_MEM_DDR3_AUTO_SR                => C3_MEM_DDR3_AUTO_SR,
   C_MEM_DDR3_DYN_WRT_ODT            => C3_MEM_DDR3_DYN_WRT_ODT,
   C_MEM_MOBILE_PA_SR                => C3_MEM_MOBILE_PA_SR,
   C_MEM_MDDR_ODS                    => C3_MEM_MDDR_ODS,
   C_MC_CALIB_BYPASS                 => C3_MC_CALIB_BYPASS,
   C_MC_CALIBRATION_MODE             => C3_MC_CALIBRATION_MODE,
   C_MC_CALIBRATION_DELAY            => C3_MC_CALIBRATION_DELAY,
   C_SKIP_IN_TERM_CAL                => C3_SKIP_IN_TERM_CAL,
   C_SKIP_DYNAMIC_CAL                => C3_SKIP_DYNAMIC_CAL,
   C_LDQSP_TAP_DELAY_VAL             => C3_LDQSP_TAP_DELAY_VAL,
   C_LDQSN_TAP_DELAY_VAL             => C3_LDQSN_TAP_DELAY_VAL,
   C_UDQSP_TAP_DELAY_VAL             => C3_UDQSP_TAP_DELAY_VAL,
   C_UDQSN_TAP_DELAY_VAL             => C3_UDQSN_TAP_DELAY_VAL,
   C_DQ0_TAP_DELAY_VAL               => C3_DQ0_TAP_DELAY_VAL,
   C_DQ1_TAP_DELAY_VAL               => C3_DQ1_TAP_DELAY_VAL,
   C_DQ2_TAP_DELAY_VAL               => C3_DQ2_TAP_DELAY_VAL,
   C_DQ3_TAP_DELAY_VAL               => C3_DQ3_TAP_DELAY_VAL,
   C_DQ4_TAP_DELAY_VAL               => C3_DQ4_TAP_DELAY_VAL,
   C_DQ5_TAP_DELAY_VAL               => C3_DQ5_TAP_DELAY_VAL,
   C_DQ6_TAP_DELAY_VAL               => C3_DQ6_TAP_DELAY_VAL,
   C_DQ7_TAP_DELAY_VAL               => C3_DQ7_TAP_DELAY_VAL,
   C_DQ8_TAP_DELAY_VAL               => C3_DQ8_TAP_DELAY_VAL,
   C_DQ9_TAP_DELAY_VAL               => C3_DQ9_TAP_DELAY_VAL,
   C_DQ10_TAP_DELAY_VAL              => C3_DQ10_TAP_DELAY_VAL,
   C_DQ11_TAP_DELAY_VAL              => C3_DQ11_TAP_DELAY_VAL,
   C_DQ12_TAP_DELAY_VAL              => C3_DQ12_TAP_DELAY_VAL,
   C_DQ13_TAP_DELAY_VAL              => C3_DQ13_TAP_DELAY_VAL,
   C_DQ14_TAP_DELAY_VAL              => C3_DQ14_TAP_DELAY_VAL,
   C_DQ15_TAP_DELAY_VAL              => C3_DQ15_TAP_DELAY_VAL
   )
port map
(
   mcb3_dram_dq                         => mcb3_dram_dq,
   mcb3_dram_a                          => mcb3_dram_a,
   mcb3_dram_ba                         => mcb3_dram_ba,
   mcb3_dram_ras_n                      => mcb3_dram_ras_n,
   mcb3_dram_cas_n                      => mcb3_dram_cas_n,
   mcb3_dram_we_n                       => mcb3_dram_we_n,
   mcb3_dram_odt                        => mcb3_dram_odt,
   mcb3_dram_cke                        => mcb3_dram_cke,
   mcb3_dram_dm                         => mcb3_dram_dm,
   mcb3_dram_udqs                       => mcb3_dram_udqs,
   mcb3_dram_udqs_n                     => mcb3_dram_udqs_n,
   mcb3_rzq                             => mcb3_rzq,
   mcb3_zio                             => mcb3_zio,
   mcb3_dram_udm                        => mcb3_dram_udm,
   calib_done                      => c3_calib_done,
   async_rst                       => c3_async_rst,
   sysclk_2x                       => c3_sysclk_2x,
   sysclk_2x_180                   => c3_sysclk_2x_180,
   pll_ce_0                        => c3_pll_ce_0,
   pll_ce_90                       => c3_pll_ce_90,
   pll_lock                        => c3_pll_lock,
   mcb_drp_clk                     => c3_mcb_drp_clk,
   mcb3_dram_dqs                        => mcb3_dram_dqs,
   mcb3_dram_dqs_n                      => mcb3_dram_dqs_n,
   mcb3_dram_ck                         => mcb3_dram_ck,
   mcb3_dram_ck_n                       => mcb3_dram_ck_n,
   p2_cmd_clk                           =>  c3_p2_cmd_clk,
   p2_cmd_en                            =>  c3_p2_cmd_en,
   p2_cmd_instr                         =>  c3_p2_cmd_instr,
   p2_cmd_bl                            =>  c3_p2_cmd_bl,
   p2_cmd_byte_addr                     =>  c3_p2_cmd_byte_addr,
   p2_cmd_empty                         =>  c3_p2_cmd_empty,
   p2_cmd_full                          =>  c3_p2_cmd_full,
   p2_rd_clk                            =>  c3_p2_rd_clk,
   p2_rd_en                             =>  c3_p2_rd_en,
   p2_rd_data                           =>  c3_p2_rd_data,
   p2_rd_full                           =>  c3_p2_rd_full,
   p2_rd_empty                          =>  c3_p2_rd_empty,
   p2_rd_count                          =>  c3_p2_rd_count,
   p2_rd_overflow                       =>  c3_p2_rd_overflow,
   p2_rd_error                          =>  c3_p2_rd_error,
   p3_cmd_clk                           =>  c3_p3_cmd_clk,
   p3_cmd_en                            =>  c3_p3_cmd_en,
   p3_cmd_instr                         =>  c3_p3_cmd_instr,
   p3_cmd_bl                            =>  c3_p3_cmd_bl,
   p3_cmd_byte_addr                     =>  c3_p3_cmd_byte_addr,
   p3_cmd_empty                         =>  c3_p3_cmd_empty,
   p3_cmd_full                          =>  c3_p3_cmd_full,
   p3_wr_clk                            =>  c3_p3_wr_clk,
   p3_wr_en                             =>  c3_p3_wr_en,
   p3_wr_mask                           =>  c3_p3_wr_mask,
   p3_wr_data                           =>  c3_p3_wr_data,
   p3_wr_full                           =>  c3_p3_wr_full,
   p3_wr_empty                          =>  c3_p3_wr_empty,
   p3_wr_count                          =>  c3_p3_wr_count,
   p3_wr_underrun                       =>  c3_p3_wr_underrun,
   p3_wr_error                          =>  c3_p3_wr_error,
   selfrefresh_enter                    =>  c3_selfrefresh_enter,
   selfrefresh_mode                     =>  c3_selfrefresh_mode
);

 
 
  

 end  arc;
