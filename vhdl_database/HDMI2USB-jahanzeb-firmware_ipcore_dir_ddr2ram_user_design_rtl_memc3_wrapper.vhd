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
--  /   /         Filename           : memc3_wrapper.vhd
-- /___/   /\     Date Last Modified : $Date: 2011/06/02 07:16:57 $
-- \   \  /  \    Date Created       : Jul 03 2009
--  \___\/\___\
--
--Device           : Spartan-6
--Design Name      : DDR/DDR2/DDR3/LPDDR
--Purpose          : This module instantiates mcb_raw_wrapper module.
--Reference        :
--Revision History :
--*****************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity memc3_wrapper is
generic (

      C_MEMCLK_PERIOD             : integer := 2500;
      C_P0_MASK_SIZE              : integer := 4;
      C_P0_DATA_PORT_SIZE         : integer := 32;
      C_P1_MASK_SIZE              : integer := 4;
      C_P1_DATA_PORT_SIZE         : integer := 32;

      C_ARB_NUM_TIME_SLOTS        : integer := 12;
      C_ARB_TIME_SLOT_0           : bit_vector := "000";
      C_ARB_TIME_SLOT_1           : bit_vector := "000";
      C_ARB_TIME_SLOT_2           : bit_vector := "000";
      C_ARB_TIME_SLOT_3           : bit_vector := "000";
      C_ARB_TIME_SLOT_4           : bit_vector := "000";
      C_ARB_TIME_SLOT_5           : bit_vector := "000";
      C_ARB_TIME_SLOT_6           : bit_vector := "000";
      C_ARB_TIME_SLOT_7           : bit_vector := "000";
      C_ARB_TIME_SLOT_8           : bit_vector := "000";
      C_ARB_TIME_SLOT_9           : bit_vector := "000";
      C_ARB_TIME_SLOT_10          : bit_vector := "000";
      C_ARB_TIME_SLOT_11          : bit_vector := "000";

      C_MEM_TRAS               : integer := 45000;
      C_MEM_TRCD               : integer := 12500;
      C_MEM_TREFI              : integer := 7800000;
      C_MEM_TRFC               : integer := 127500;
      C_MEM_TRP                : integer := 12500;
      C_MEM_TWR                : integer := 15000;
      C_MEM_TRTP               : integer := 7500;
      C_MEM_TWTR               : integer := 7500;

      C_MEM_ADDR_ORDER         : string :="ROW_BANK_COLUMN";
      C_MEM_TYPE               : string :="DDR2";
      C_MEM_DENSITY            : string :="1Gb";
      C_NUM_DQ_PINS            : integer := 4;
      C_MEM_BURST_LEN          : integer := 8;
      C_MEM_CAS_LATENCY        : integer := 5;
      C_MEM_ADDR_WIDTH         : integer := 14;
      C_MEM_BANKADDR_WIDTH     : integer := 3;
      C_MEM_NUM_COL_BITS       : integer := 11;

      C_MEM_DDR1_2_ODS          : string := "FULL";
      C_MEM_DDR2_RTT            : string := "50OHMS";
      C_MEM_DDR2_DIFF_DQS_EN    : string := "YES";
      C_MEM_DDR2_3_PA_SR        : string := "FULL";
      C_MEM_DDR2_3_HIGH_TEMP_SR : string := "NORMAL";

      C_MEM_DDR3_CAS_LATENCY    : integer:= 7;
      C_MEM_DDR3_CAS_WR_LATENCY : integer:= 5;
      C_MEM_DDR3_ODS            : string := "DIV6";
      C_MEM_DDR3_RTT            : string := "DIV2";
      C_MEM_DDR3_AUTO_SR        : string := "ENABLED";
      C_MEM_DDR3_DYN_WRT_ODT    : string := "OFF";
      C_MEM_MOBILE_PA_SR        : string := "FULL";
      C_MEM_MDDR_ODS            : string := "FULL";
      C_MC_CALIB_BYPASS         : string := "NO";
      C_LDQSP_TAP_DELAY_VAL		: integer := 0;
      C_UDQSP_TAP_DELAY_VAL		: integer := 0;
      C_LDQSN_TAP_DELAY_VAL		: integer := 0;
      C_UDQSN_TAP_DELAY_VAL		: integer := 0;
      C_DQ0_TAP_DELAY_VAL                 : integer := 0;  
      C_DQ1_TAP_DELAY_VAL                 : integer := 0;  
      C_DQ2_TAP_DELAY_VAL                 : integer := 0;  
      C_DQ3_TAP_DELAY_VAL                 : integer := 0;  
      C_DQ4_TAP_DELAY_VAL                 : integer := 0;  
      C_DQ5_TAP_DELAY_VAL                 : integer := 0;  
      C_DQ6_TAP_DELAY_VAL                 : integer := 0;  
      C_DQ7_TAP_DELAY_VAL                 : integer := 0;  
      C_DQ8_TAP_DELAY_VAL                 : integer := 0;  
      C_DQ9_TAP_DELAY_VAL                 : integer := 0;  
      C_DQ10_TAP_DELAY_VAL                : integer := 0;  
      C_DQ11_TAP_DELAY_VAL                : integer := 0;  
      C_DQ12_TAP_DELAY_VAL                : integer := 0;  
      C_DQ13_TAP_DELAY_VAL                : integer := 0;  
      C_DQ14_TAP_DELAY_VAL                : integer := 0;  
      C_DQ15_TAP_DELAY_VAL                : integer := 0;  


      C_SKIP_IN_TERM_CAL                 : integer := 0;  
      C_SKIP_DYNAMIC_CAL                 : integer := 0;  

      C_SIMULATION              : string  := "FALSE";  
      C_MC_CALIBRATION_MODE     : string := "CALIBRATION";
      C_MC_CALIBRATION_DELAY    : string := "QUARTER";
      C_CALIB_SOFT_IP           : string := "TRUE"


      );
    port
    (

      -- high-speed PLL clock interface
      sysclk_2x       : in std_logic;
      sysclk_2x_180   : in std_logic;
      pll_ce_0        : in std_logic;
      pll_ce_90       : in std_logic;
      pll_lock        : in std_logic;
      async_rst       : in std_logic;

      --User Port2 Interface Signals

      p2_cmd_clk                            : in std_logic;
      p2_cmd_en                             : in std_logic;
      p2_cmd_instr                          : in std_logic_vector(2 downto 0) ;
      p2_cmd_bl                             : in std_logic_vector(5 downto 0) ;
      p2_cmd_byte_addr                      : in std_logic_vector(29 downto 0) ;
      p2_cmd_empty                          : out std_logic;
      p2_cmd_full                           : out std_logic;

      --Data Rd Port signals
      p2_rd_clk                             : in std_logic;
      p2_rd_en                              : in std_logic;
      p2_rd_data                            : out std_logic_vector(31 downto 0) ;
      p2_rd_full                            : out std_logic;
      p2_rd_empty                           : out std_logic;
      p2_rd_count                           : out std_logic_vector(6 downto 0) ;
      p2_rd_overflow                        : out std_logic;
      p2_rd_error                           : out std_logic;

      --User Port3 Interface Signals

      p3_cmd_clk                            : in std_logic;
      p3_cmd_en                             : in std_logic;
      p3_cmd_instr                          : in std_logic_vector(2 downto 0) ;
      p3_cmd_bl                             : in std_logic_vector(5 downto 0) ;
      p3_cmd_byte_addr                      : in std_logic_vector(29 downto 0) ;
      p3_cmd_empty                          : out std_logic;
      p3_cmd_full                           : out std_logic;

      --Data Wr Port signals
      p3_wr_clk                             : in std_logic;
      p3_wr_en                              : in std_logic;
      p3_wr_mask                            : in std_logic_vector(3 downto 0) ;
      p3_wr_data                            : in std_logic_vector(31 downto 0) ;
      p3_wr_full                            : out std_logic;
      p3_wr_empty                           : out std_logic;
      p3_wr_count                           : out std_logic_vector(6 downto 0) ;
      p3_wr_underrun                        : out std_logic;
      p3_wr_error                           : out std_logic;



      -- memory interface signals
      mcb3_dram_ck          : out std_logic;
      mcb3_dram_ck_n        : out std_logic;
      mcb3_dram_a           : out std_logic_vector(C_MEM_ADDR_WIDTH-1 downto 0);
      mcb3_dram_ba          : out std_logic_vector(C_MEM_BANKADDR_WIDTH-1 downto 0);
      mcb3_dram_ras_n       : out std_logic;
      mcb3_dram_cas_n       : out std_logic;
      mcb3_dram_we_n        : out std_logic;
      mcb3_dram_odt         : out std_logic;
--      mcb3_dram_odt         : out std_logic;
      mcb3_dram_cke         : out std_logic;
      mcb3_dram_dq          : inout std_logic_vector(C_NUM_DQ_PINS-1 downto 0);
      mcb3_dram_dqs         : inout std_logic;
 mcb3_dram_dqs_n : inout std_logic;


mcb3_dram_udqs   : inout std_logic;
mcb3_dram_udm    : out std_logic; 


 mcb3_dram_udqs_n : inout std_logic;



mcb3_dram_dm : out std_logic;

      mcb3_rzq                             : inout std_logic;
      mcb3_zio                              : inout std_logic;

      -- Calibration signals
      mcb_drp_clk            : in std_logic;
      calib_done           : out std_logic;
      selfrefresh_enter    : in std_logic;
      selfrefresh_mode     : out std_logic

    );
end entity;
architecture acch of memc3_wrapper is
component mcb_raw_wrapper IS
   GENERIC (

      C_MEMCLK_PERIOD                  : integer;
      C_PORT_ENABLE                    : std_logic_vector(5 downto 0);
      C_MEM_ADDR_ORDER                 : string;
      C_ARB_NUM_TIME_SLOTS             : integer;
      C_ARB_TIME_SLOT_0                : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_1                : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_2                : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_3                : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_4                : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_5                : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_6                : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_7                : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_8                : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_9                : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_10               : bit_vector(17 downto 0);
      C_ARB_TIME_SLOT_11               : bit_vector(17 downto 0);
      C_PORT_CONFIG                    : string;


      C_MEM_TRAS                       : integer;
      C_MEM_TRCD                       : integer;
      C_MEM_TREFI                      : integer;
      C_MEM_TRFC                       : integer;
      C_MEM_TRP                        : integer;
      C_MEM_TWR                        : integer;
      C_MEM_TRTP                       : integer;
      C_MEM_TWTR                       : integer;

      C_NUM_DQ_PINS                    : integer;
      C_MEM_TYPE                       : string;
      C_MEM_DENSITY                    : string;
      C_MEM_BURST_LEN                  : integer;

      C_MEM_CAS_LATENCY                : integer;
      C_MEM_ADDR_WIDTH                 : integer;
      C_MEM_BANKADDR_WIDTH             : integer;
      C_MEM_NUM_COL_BITS               : integer;

      C_MEM_DDR3_CAS_LATENCY           : integer;
      C_MEM_MOBILE_PA_SR               : string;
      C_MEM_DDR1_2_ODS                 : string;
      C_MEM_DDR3_ODS                   : string;
      C_MEM_DDR2_RTT                   : string;
      C_MEM_DDR3_RTT                   : string;
      C_MEM_MDDR_ODS                   : string;

      C_MEM_DDR2_DIFF_DQS_EN           : string;
      C_MEM_DDR2_3_PA_SR               : string;
      C_MEM_DDR3_CAS_WR_LATENCY        : integer;

      C_MEM_DDR3_AUTO_SR               : string;
      C_MEM_DDR2_3_HIGH_TEMP_SR        : string;
      C_MEM_DDR3_DYN_WRT_ODT           : string;

      C_MC_CALIB_BYPASS                : string;
      C_MC_CALIBRATION_RA              : bit_vector(15 DOWNTO 0);
      C_MC_CALIBRATION_BA              : bit_vector(2 DOWNTO 0);
      C_CALIB_SOFT_IP                  : string;
      C_MC_CALIBRATION_CA              : bit_vector(11 DOWNTO 0);
      C_MC_CALIBRATION_CLK_DIV         : integer;
      C_MC_CALIBRATION_MODE            : string;
      C_MC_CALIBRATION_DELAY           : string;

     LDQSP_TAP_DELAY_VAL		: integer;
     UDQSP_TAP_DELAY_VAL		: integer;
     LDQSN_TAP_DELAY_VAL		: integer;
     UDQSN_TAP_DELAY_VAL		: integer;
     DQ0_TAP_DELAY_VAL                  : integer;  
     DQ1_TAP_DELAY_VAL                  : integer;  
     DQ2_TAP_DELAY_VAL                  : integer;  
     DQ3_TAP_DELAY_VAL                  : integer;  
     DQ4_TAP_DELAY_VAL                  : integer;  
     DQ5_TAP_DELAY_VAL                  : integer;  
     DQ6_TAP_DELAY_VAL                  : integer;  
     DQ7_TAP_DELAY_VAL                  : integer;  
     DQ8_TAP_DELAY_VAL                  : integer;  
     DQ9_TAP_DELAY_VAL                  : integer;  
     DQ10_TAP_DELAY_VAL                  : integer;  
     DQ11_TAP_DELAY_VAL                  : integer;  
     DQ12_TAP_DELAY_VAL                  : integer;  
     DQ13_TAP_DELAY_VAL                  : integer;  
     DQ14_TAP_DELAY_VAL                  : integer;  
     DQ15_TAP_DELAY_VAL                  : integer;  

      C_P0_MASK_SIZE                   : integer;
      C_P0_DATA_PORT_SIZE              : integer;
      C_P1_MASK_SIZE                   : integer;
      C_P1_DATA_PORT_SIZE              : integer;

      C_SIMULATION                       : string ;  
      C_SKIP_IN_TERM_CAL                 : integer; 
      C_SKIP_DYNAMIC_CAL                 : integer; 
      C_SKIP_DYN_IN_TERM                 : integer; 

      C_MEM_TZQINIT_MAXCNT              : std_logic_vector(9 downto 0)
   );
   PORT (
      -- HIGH-SPEED PLL clock interface

      sysclk_2x                        : in std_logic;
      sysclk_2x_180                    : in std_logic;
      pll_ce_0                         : in std_logic;
      pll_ce_90                        : in std_logic;
      pll_lock                         : in std_logic;
      sys_rst                          : in std_logic;

      p0_arb_en                        : in std_logic;
      p0_cmd_clk                       : in std_logic;
      p0_cmd_en                        : in std_logic;
      p0_cmd_instr                     : in std_logic_vector(2 DOWNTO 0);
      p0_cmd_bl                        : in std_logic_vector(5 DOWNTO 0);
      p0_cmd_byte_addr                 : in std_logic_vector(29 DOWNTO 0);
      p0_cmd_empty                     : out std_logic;
      p0_cmd_full                      : out std_logic;
      p0_wr_clk                        : in std_logic;
      p0_wr_en                         : in std_logic;
      p0_wr_mask                       : in std_logic_vector(C_P0_MASK_SIZE - 1 DOWNTO 0);
      p0_wr_data                       : in std_logic_vector(C_P0_DATA_PORT_SIZE - 1 DOWNTO 0);
      p0_wr_full                       : out std_logic;
      p0_wr_empty                      : out std_logic;
      p0_wr_count                      : out std_logic_vector(6 DOWNTO 0);
      p0_wr_underrun                   : out std_logic;
      p0_wr_error                      : out std_logic;
      p0_rd_clk                        : in std_logic;
      p0_rd_en                         : in std_logic;
      p0_rd_data                       : out std_logic_vector(C_P0_DATA_PORT_SIZE - 1 DOWNTO 0);
      p0_rd_full                       : out std_logic;
      p0_rd_empty                      : out std_logic;
      p0_rd_count                      : out std_logic_vector(6 DOWNTO 0);
      p0_rd_overflow                   : out std_logic;
      p0_rd_error                      : out std_logic;
      p1_arb_en                        : in std_logic;
      p1_cmd_clk                       : in std_logic;
      p1_cmd_en                        : in std_logic;
      p1_cmd_instr                     : in std_logic_vector(2 DOWNTO 0);
      p1_cmd_bl                        : in std_logic_vector(5 DOWNTO 0);
      p1_cmd_byte_addr                 : in std_logic_vector(29 DOWNTO 0);
      p1_cmd_empty                     : out std_logic;
      p1_cmd_full                      : out std_logic;
      p1_wr_clk                        : in std_logic;
      p1_wr_en                         : in std_logic;
      p1_wr_mask                       : in std_logic_vector(C_P1_MASK_SIZE - 1 DOWNTO 0);
      p1_wr_data                       : in std_logic_vector(C_P1_DATA_PORT_SIZE - 1 DOWNTO 0);
      p1_wr_full                       : out std_logic;
      p1_wr_empty                      : out std_logic;
      p1_wr_count                      : out std_logic_vector(6 DOWNTO 0);
      p1_wr_underrun                   : out std_logic;
      p1_wr_error                      : out std_logic;
      p1_rd_clk                        : in std_logic;
      p1_rd_en                         : in std_logic;
      p1_rd_data                       : out std_logic_vector(C_P1_DATA_PORT_SIZE - 1 DOWNTO 0);
      p1_rd_full                       : out std_logic;
      p1_rd_empty                      : out std_logic;
      p1_rd_count                      : out std_logic_vector(6 DOWNTO 0);
      p1_rd_overflow                   : out std_logic;
      p1_rd_error                      : out std_logic;
      p2_arb_en                        : in std_logic;
      p2_cmd_clk                       : in std_logic;
      p2_cmd_en                        : in std_logic;
      p2_cmd_instr                     : in std_logic_vector(2 DOWNTO 0);
      p2_cmd_bl                        : in std_logic_vector(5 DOWNTO 0);
      p2_cmd_byte_addr                 : in std_logic_vector(29 DOWNTO 0);
      p2_cmd_empty                     : out std_logic;
      p2_cmd_full                      : out std_logic;
      p2_wr_clk                        : in std_logic;
      p2_wr_en                         : in std_logic;
      p2_wr_mask                       : in std_logic_vector(3 DOWNTO 0);
      p2_wr_data                       : in std_logic_vector(31 DOWNTO 0);
      p2_wr_full                       : out std_logic;
      p2_wr_empty                      : out std_logic;
      p2_wr_count                      : out std_logic_vector(6 DOWNTO 0);
      p2_wr_underrun                   : out std_logic;
      p2_wr_error                      : out std_logic;
      p2_rd_clk                        : in std_logic;
      p2_rd_en                         : in std_logic;
      p2_rd_data                       : out std_logic_vector(31 DOWNTO 0);
      p2_rd_full                       : out std_logic;
      p2_rd_empty                      : out std_logic;
      p2_rd_count                      : out std_logic_vector(6 DOWNTO 0);
      p2_rd_overflow                   : out std_logic;
      p2_rd_error                      : out std_logic;
      p3_arb_en                        : in std_logic;
      p3_cmd_clk                       : in std_logic;
      p3_cmd_en                        : in std_logic;
      p3_cmd_instr                     : in std_logic_vector(2 DOWNTO 0);
      p3_cmd_bl                        : in std_logic_vector(5 DOWNTO 0);
      p3_cmd_byte_addr                 : in std_logic_vector(29 DOWNTO 0);
      p3_cmd_empty                     : out std_logic;
      p3_cmd_full                      : out std_logic;
      p3_wr_clk                        : in std_logic;
      p3_wr_en                         : in std_logic;
      p3_wr_mask                       : in std_logic_vector(3 DOWNTO 0);
      p3_wr_data                       : in std_logic_vector(31 DOWNTO 0);
      p3_wr_full                       : out std_logic;
      p3_wr_empty                      : out std_logic;
      p3_wr_count                      : out std_logic_vector(6 DOWNTO 0);
      p3_wr_underrun                   : out std_logic;
      p3_wr_error                      : out std_logic;
      p3_rd_clk                        : in std_logic;
      p3_rd_en                         : in std_logic;
      p3_rd_data                       : out std_logic_vector(31 DOWNTO 0);
      p3_rd_full                       : out std_logic;
      p3_rd_empty                      : out std_logic;
      p3_rd_count                      : out std_logic_vector(6 DOWNTO 0);
      p3_rd_overflow                   : out std_logic;
      p3_rd_error                      : out std_logic;
      p4_arb_en                        : in std_logic;
      p4_cmd_clk                       : in std_logic;
      p4_cmd_en                        : in std_logic;
      p4_cmd_instr                     : in std_logic_vector(2 DOWNTO 0);
      p4_cmd_bl                        : in std_logic_vector(5 DOWNTO 0);
      p4_cmd_byte_addr                 : in std_logic_vector(29 DOWNTO 0);
      p4_cmd_empty                     : out std_logic;
      p4_cmd_full                      : out std_logic;
      p4_wr_clk                        : in std_logic;
      p4_wr_en                         : in std_logic;
      p4_wr_mask                       : in std_logic_vector(3 DOWNTO 0);
      p4_wr_data                       : in std_logic_vector(31 DOWNTO 0);
      p4_wr_full                       : out std_logic;
      p4_wr_empty                      : out std_logic;
      p4_wr_count                      : out std_logic_vector(6 DOWNTO 0);
      p4_wr_underrun                   : out std_logic;
      p4_wr_error                      : out std_logic;
      p4_rd_clk                        : in std_logic;
      p4_rd_en                         : in std_logic;
      p4_rd_data                       : out std_logic_vector(31 DOWNTO 0);
      p4_rd_full                       : out std_logic;
      p4_rd_empty                      : out std_logic;
      p4_rd_count                      : out std_logic_vector(6 DOWNTO 0);
      p4_rd_overflow                   : out std_logic;
      p4_rd_error                      : out std_logic;
      p5_arb_en                        : in std_logic;
      p5_cmd_clk                       : in std_logic;
      p5_cmd_en                        : in std_logic;
      p5_cmd_instr                     : in std_logic_vector(2 DOWNTO 0);
      p5_cmd_bl                        : in std_logic_vector(5 DOWNTO 0);
      p5_cmd_byte_addr                 : in std_logic_vector(29 DOWNTO 0);
      p5_cmd_empty                     : out std_logic;
      p5_cmd_full                      : out std_logic;
      p5_wr_clk                        : in std_logic;
      p5_wr_en                         : in std_logic;
      p5_wr_mask                       : in std_logic_vector(3 DOWNTO 0);
      p5_wr_data                       : in std_logic_vector(31 DOWNTO 0);
      p5_wr_full                       : out std_logic;
      p5_wr_empty                      : out std_logic;
      p5_wr_count                      : out std_logic_vector(6 DOWNTO 0);
      p5_wr_underrun                   : out std_logic;
      p5_wr_error                      : out std_logic;
      p5_rd_clk                        : in std_logic;
      p5_rd_en                         : in std_logic;
      p5_rd_data                       : out std_logic_vector(31 DOWNTO 0);
      p5_rd_full                       : out std_logic;
      p5_rd_empty                      : out std_logic;
      p5_rd_count                      : out std_logic_vector(6 DOWNTO 0);
      p5_rd_overflow                   : out std_logic;
      p5_rd_error                      : out std_logic;

      mcbx_dram_addr                   : out std_logic_vector(C_MEM_ADDR_WIDTH - 1 DOWNTO 0);
      mcbx_dram_ba                     : out std_logic_vector(C_MEM_BANKADDR_WIDTH - 1 DOWNTO 0);
      mcbx_dram_ras_n                  : out std_logic;
      mcbx_dram_cas_n                  : out std_logic;
      mcbx_dram_we_n                   : out std_logic;
      mcbx_dram_cke                    : out std_logic;
      mcbx_dram_clk                    : out std_logic;
      mcbx_dram_clk_n                  : out std_logic;
      mcbx_dram_dq                     : inout std_logic_vector(C_NUM_DQ_PINS-1 DOWNTO 0);
      mcbx_dram_dqs                    : inout std_logic;
      mcbx_dram_dqs_n                  : inout std_logic;
      mcbx_dram_udqs                   : inout std_logic;
      mcbx_dram_udqs_n                 : inout std_logic;
      mcbx_dram_udm                    : out std_logic;
      mcbx_dram_ldm                    : out std_logic;
      mcbx_dram_odt                    : out std_logic;
      mcbx_dram_ddr3_rst               : out std_logic;
      calib_recal                      : in std_logic;
      rzq                              : inout std_logic;
      zio                              : inout std_logic;
      ui_read                          : in std_logic;
      ui_add                           : in std_logic;
      ui_cs                            : in std_logic;
      ui_clk                           : in std_logic;
      ui_sdi                           : in std_logic;
      ui_addr                          : in std_logic_vector(4 DOWNTO 0);
      ui_broadcast                     : in std_logic;
      ui_drp_update                    : in std_logic;
      ui_done_cal                      : in std_logic;
      ui_cmd                           : in std_logic;
      ui_cmd_in                        : in std_logic;
      ui_cmd_en                        : in std_logic;
      ui_dqcount                       : in std_logic_vector(3 DOWNTO 0);
      ui_dq_lower_dec                  : in std_logic;
      ui_dq_lower_inc                  : in std_logic;
      ui_dq_upper_dec                  : in std_logic;
      ui_dq_upper_inc                  : in std_logic;
      ui_udqs_inc                      : in std_logic;
      ui_udqs_dec                      : in std_logic;
      ui_ldqs_inc                      : in std_logic;
      ui_ldqs_dec                      : in std_logic;
      uo_data                          : out std_logic_vector(7 DOWNTO 0);
      uo_data_valid                    : out std_logic;
      uo_done_cal                      : out std_logic;
      uo_cmd_ready_in                  : out std_logic;
      uo_refrsh_flag                   : out std_logic;
      uo_cal_start                     : out std_logic;
      uo_sdo                           : out std_logic;
      status                           : out std_logic_vector(31 DOWNTO 0);
      selfrefresh_enter                : in std_logic;
      selfrefresh_mode                 : out std_logic
   );
end component;

signal uo_data : std_logic_vector(7 downto 0);

 constant C_PORT_ENABLE              : std_logic_vector(5 downto 0) := "001100";

constant C_PORT_CONFIG             : string :=  "B32_B32_R32_W32_R32_R32";


constant ARB_TIME_SLOT_0    : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_0(5 downto 3) & C_ARB_TIME_SLOT_0(2 downto 0));
constant ARB_TIME_SLOT_1    : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_1(5 downto 3) & C_ARB_TIME_SLOT_1(2 downto 0));
constant ARB_TIME_SLOT_2    : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_2(5 downto 3) & C_ARB_TIME_SLOT_2(2 downto 0));
constant ARB_TIME_SLOT_3    : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_3(5 downto 3) & C_ARB_TIME_SLOT_3(2 downto 0));
constant ARB_TIME_SLOT_4    : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_4(5 downto 3) & C_ARB_TIME_SLOT_4(2 downto 0));
constant ARB_TIME_SLOT_5    : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_5(5 downto 3) & C_ARB_TIME_SLOT_5(2 downto 0));
constant ARB_TIME_SLOT_6    : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_6(5 downto 3) & C_ARB_TIME_SLOT_6(2 downto 0));
constant ARB_TIME_SLOT_7    : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_7(5 downto 3) & C_ARB_TIME_SLOT_7(2 downto 0));
constant ARB_TIME_SLOT_8    : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_8(5 downto 3) & C_ARB_TIME_SLOT_8(2 downto 0));
constant ARB_TIME_SLOT_9    : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_9(5 downto 3) & C_ARB_TIME_SLOT_9(2 downto 0));
constant ARB_TIME_SLOT_10   : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_10(5 downto 3) & C_ARB_TIME_SLOT_10(2 downto 0));
constant ARB_TIME_SLOT_11   : bit_vector(17 downto 0) := ("000" & "000" & "000" & "000" & C_ARB_TIME_SLOT_11(5 downto 3) & C_ARB_TIME_SLOT_11(2 downto 0));


constant C_MC_CALIBRATION_CLK_DIV  : integer  := 1;
constant C_MEM_TZQINIT_MAXCNT  : std_logic_vector(9 downto 0) := "1000000000" + "0000010000";   -- 16 cycles are added to avoid trfc violations
constant C_SKIP_DYN_IN_TERM : integer := 1;	  

constant C_MC_CALIBRATION_RA    : bit_vector(15 downto 0) := X"0000"; 
constant C_MC_CALIBRATION_BA    : bit_vector(2 downto 0) := o"0"; 
constant C_MC_CALIBRATION_CA    : bit_vector(11 downto 0) := X"000"; 

signal status          : std_logic_vector(31 downto 0);
signal uo_data_valid   : std_logic;
signal uo_cmd_ready_in : std_logic;
signal uo_refrsh_flag  : std_logic;
signal uo_cal_start    : std_logic;
signal uo_sdo          : std_logic;







attribute X_CORE_INFO : string;
attribute X_CORE_INFO of acch : architecture IS
  "mig_v3_92_ddr2_s6, Coregen 14.2";

attribute CORE_GENERATION_INFO : string;
attribute CORE_GENERATION_INFO of acch : architecture IS "mcb3_ddr2_s6,mig_v3_92,{LANGUAGE=VHDL, SYNTHESIS_TOOL=ISE,  NO_OF_CONTROLLERS=1, AXI_ENABLE=0, MEM_INTERFACE_TYPE=DDR2_SDRAM, CLK_PERIOD=3200, MEMORY_PART=mt47h64m16xx-25e, MEMORY_DEVICE_WIDTH=16, OUTPUT_DRV=FULL, RTT_NOM=50OHMS, DQS#_ENABLE=YES, HIGH_TEMP_SR=NORMAL, PORT_CONFIG=Two 32-bit bi-directional and four 32-bit unidirectional ports, MEM_ADDR_ORDER=ROW_BANK_COLUMN, PORT_ENABLE=Port2_Port3, CLASS_ADDR=II, CLASS_DATA=II, INPUT_PIN_TERMINATION=CALIB_TERM, DATA_TERMINATION=25 Ohms, CLKFBOUT_MULT_F=2, CLKOUT_DIVIDE=1, DEBUG_PORT=0, INPUT_CLK_TYPE=Single-Ended}";

begin


memc3_mcb_raw_wrapper_inst : mcb_raw_wrapper
generic map
 (
   C_MEMCLK_PERIOD            => C_MEMCLK_PERIOD,
   C_P0_MASK_SIZE             => C_P0_MASK_SIZE,
   C_P0_DATA_PORT_SIZE        => C_P0_DATA_PORT_SIZE,
   C_P1_MASK_SIZE             => C_P1_MASK_SIZE,
   C_P1_DATA_PORT_SIZE        => C_P1_DATA_PORT_SIZE,

   C_ARB_NUM_TIME_SLOTS       => C_ARB_NUM_TIME_SLOTS,
   C_ARB_TIME_SLOT_0          => ARB_TIME_SLOT_0,
   C_ARB_TIME_SLOT_1          => ARB_TIME_SLOT_1,
   C_ARB_TIME_SLOT_2          => ARB_TIME_SLOT_2,
   C_ARB_TIME_SLOT_3          => ARB_TIME_SLOT_3,
   C_ARB_TIME_SLOT_4          => ARB_TIME_SLOT_4,
   C_ARB_TIME_SLOT_5          => ARB_TIME_SLOT_5,
   C_ARB_TIME_SLOT_6          => ARB_TIME_SLOT_6,
   C_ARB_TIME_SLOT_7          => ARB_TIME_SLOT_7,
   C_ARB_TIME_SLOT_8          => ARB_TIME_SLOT_8,
   C_ARB_TIME_SLOT_9          => ARB_TIME_SLOT_9,
   C_ARB_TIME_SLOT_10         => ARB_TIME_SLOT_10,
   C_ARB_TIME_SLOT_11         => ARB_TIME_SLOT_11,

   C_PORT_CONFIG              => C_PORT_CONFIG,
   C_PORT_ENABLE              => C_PORT_ENABLE,

   C_MEM_TRAS                 => C_MEM_TRAS,
   C_MEM_TRCD                 => C_MEM_TRCD,
   C_MEM_TREFI                => C_MEM_TREFI,
   C_MEM_TRFC                 => C_MEM_TRFC,
   C_MEM_TRP                  => C_MEM_TRP,
   C_MEM_TWR                  => C_MEM_TWR,
   C_MEM_TRTP                 => C_MEM_TRTP,
   C_MEM_TWTR                 => C_MEM_TWTR,

   C_MEM_ADDR_ORDER           => C_MEM_ADDR_ORDER,
   C_NUM_DQ_PINS              => C_NUM_DQ_PINS,
   C_MEM_TYPE                 => C_MEM_TYPE,
   C_MEM_DENSITY              => C_MEM_DENSITY,
   C_MEM_BURST_LEN            => C_MEM_BURST_LEN,
   C_MEM_CAS_LATENCY          => C_MEM_CAS_LATENCY,
   C_MEM_ADDR_WIDTH           => C_MEM_ADDR_WIDTH,
   C_MEM_BANKADDR_WIDTH       => C_MEM_BANKADDR_WIDTH,
   C_MEM_NUM_COL_BITS         => C_MEM_NUM_COL_BITS,

   C_MEM_DDR1_2_ODS           => C_MEM_DDR1_2_ODS,
   C_MEM_DDR2_RTT             => C_MEM_DDR2_RTT,
   C_MEM_DDR2_DIFF_DQS_EN     => C_MEM_DDR2_DIFF_DQS_EN,
   C_MEM_DDR2_3_PA_SR         => C_MEM_DDR2_3_PA_SR,
   C_MEM_DDR2_3_HIGH_TEMP_SR  => C_MEM_DDR2_3_HIGH_TEMP_SR,

   C_MEM_DDR3_CAS_LATENCY     => C_MEM_DDR3_CAS_LATENCY,
   C_MEM_DDR3_ODS             => C_MEM_DDR3_ODS,
   C_MEM_DDR3_RTT             => C_MEM_DDR3_RTT,
   C_MEM_DDR3_CAS_WR_LATENCY  => C_MEM_DDR3_CAS_WR_LATENCY,
   C_MEM_DDR3_AUTO_SR         => C_MEM_DDR3_AUTO_SR,
   C_MEM_DDR3_DYN_WRT_ODT     => C_MEM_DDR3_DYN_WRT_ODT,
   C_MEM_MOBILE_PA_SR         => C_MEM_MOBILE_PA_SR,
   C_MEM_MDDR_ODS             => C_MEM_MDDR_ODS,
   C_MC_CALIBRATION_CLK_DIV   => C_MC_CALIBRATION_CLK_DIV,
   C_MC_CALIBRATION_MODE      => C_MC_CALIBRATION_MODE,
   C_MC_CALIBRATION_DELAY     => C_MC_CALIBRATION_DELAY,

   C_MC_CALIB_BYPASS          => C_MC_CALIB_BYPASS,
   C_MC_CALIBRATION_RA        => C_MC_CALIBRATION_RA,
   C_MC_CALIBRATION_BA        => C_MC_CALIBRATION_BA,
   C_MC_CALIBRATION_CA        => C_MC_CALIBRATION_CA,
   C_CALIB_SOFT_IP            => C_CALIB_SOFT_IP,

   C_SIMULATION               => C_SIMULATION,
   C_SKIP_IN_TERM_CAL         => C_SKIP_IN_TERM_CAL,
   C_SKIP_DYNAMIC_CAL         => C_SKIP_DYNAMIC_CAL,
   C_SKIP_DYN_IN_TERM         => C_SKIP_DYN_IN_TERM, 
   C_MEM_TZQINIT_MAXCNT       => C_MEM_TZQINIT_MAXCNT,

   LDQSP_TAP_DELAY_VAL => C_LDQSP_TAP_DELAY_VAL,  
   UDQSP_TAP_DELAY_VAL => C_UDQSP_TAP_DELAY_VAL,  
   LDQSN_TAP_DELAY_VAL => C_LDQSN_TAP_DELAY_VAL,  
   UDQSN_TAP_DELAY_VAL => C_UDQSN_TAP_DELAY_VAL,  
   DQ0_TAP_DELAY_VAL   => C_DQ0_TAP_DELAY_VAL, 
   DQ1_TAP_DELAY_VAL  => C_DQ1_TAP_DELAY_VAL,  
   DQ2_TAP_DELAY_VAL  => C_DQ2_TAP_DELAY_VAL,  
   DQ3_TAP_DELAY_VAL  => C_DQ3_TAP_DELAY_VAL,  
   DQ4_TAP_DELAY_VAL  => C_DQ4_TAP_DELAY_VAL,  
   DQ5_TAP_DELAY_VAL  => C_DQ5_TAP_DELAY_VAL,  
   DQ6_TAP_DELAY_VAL  => C_DQ6_TAP_DELAY_VAL,  
   DQ7_TAP_DELAY_VAL  => C_DQ7_TAP_DELAY_VAL,  
   DQ8_TAP_DELAY_VAL  => C_DQ8_TAP_DELAY_VAL,  
   DQ9_TAP_DELAY_VAL  => C_DQ9_TAP_DELAY_VAL,  
   DQ10_TAP_DELAY_VAL => C_DQ10_TAP_DELAY_VAL, 
   DQ11_TAP_DELAY_VAL => C_DQ11_TAP_DELAY_VAL, 
   DQ12_TAP_DELAY_VAL => C_DQ12_TAP_DELAY_VAL, 
   DQ13_TAP_DELAY_VAL => C_DQ13_TAP_DELAY_VAL, 
   DQ14_TAP_DELAY_VAL => C_DQ14_TAP_DELAY_VAL, 
   DQ15_TAP_DELAY_VAL => C_DQ15_TAP_DELAY_VAL
   )

port map
(
   sys_rst                    =>  async_rst,
   sysclk_2x                  =>  sysclk_2x,
   sysclk_2x_180              =>  sysclk_2x_180,
   pll_ce_0                   =>  pll_ce_0,
   pll_ce_90                  =>  pll_ce_90,
   pll_lock                   =>  pll_lock,
   mcbx_dram_addr             =>  mcb3_dram_a,
   mcbx_dram_ba               =>  mcb3_dram_ba,
   mcbx_dram_ras_n            =>  mcb3_dram_ras_n,
   mcbx_dram_cas_n            =>  mcb3_dram_cas_n,
   mcbx_dram_we_n             =>  mcb3_dram_we_n,
   mcbx_dram_cke              =>  mcb3_dram_cke,
   mcbx_dram_clk              =>  mcb3_dram_ck,
   mcbx_dram_clk_n            =>  mcb3_dram_ck_n,
   mcbx_dram_dq               =>  mcb3_dram_dq,
   mcbx_dram_odt              =>  mcb3_dram_odt,
   mcbx_dram_ldm              =>  mcb3_dram_dm,
   mcbx_dram_udm              =>  mcb3_dram_udm,
   mcbx_dram_dqs              =>  mcb3_dram_dqs,
   mcbx_dram_dqs_n            =>  mcb3_dram_dqs_n,
   mcbx_dram_udqs             =>  mcb3_dram_udqs,
   mcbx_dram_udqs_n           =>  mcb3_dram_udqs_n,
   mcbx_dram_ddr3_rst         =>  open,
   calib_recal                =>  '0',
   rzq                        =>  mcb3_rzq,
   zio                        =>  mcb3_zio,
   ui_read                    =>  '0',
   ui_add                     =>  '0',
   ui_cs                      =>  '0',
   ui_clk                     =>  mcb_drp_clk,
   ui_sdi                     =>  '0',
   ui_addr                    =>  (others => '0'),
   ui_broadcast               =>  '0',
   ui_drp_update              =>  '0',
   ui_done_cal                =>  '1',
   ui_cmd                     =>  '0',
   ui_cmd_in                  =>  '0',
   ui_cmd_en                  =>  '0',
   ui_dqcount                 =>  (others => '0'),
   ui_dq_lower_dec            =>  '0',
   ui_dq_lower_inc            =>  '0',
   ui_dq_upper_dec            =>  '0',
   ui_dq_upper_inc            =>  '0',
   ui_udqs_inc                =>  '0',
   ui_udqs_dec                =>  '0',
   ui_ldqs_inc                =>  '0',
   ui_ldqs_dec                =>  '0',
   uo_data                    =>  uo_data,
   uo_data_valid              =>  uo_data_valid,
   uo_done_cal                =>  calib_done,
   uo_cmd_ready_in            =>  uo_cmd_ready_in,
   uo_refrsh_flag             =>  uo_refrsh_flag,
   uo_cal_start               =>  uo_cal_start,
   uo_sdo                     =>  uo_sdo,
   status                     =>  status,
   selfrefresh_enter          =>  '0',
   selfrefresh_mode           =>  selfrefresh_mode,


      p0_arb_en                            =>  '0',
   p0_cmd_clk                           =>  '0',
   p0_cmd_en                            =>  '0',
   p0_cmd_instr                         =>  (others => '0'),
   p0_cmd_bl                            =>  (others => '0'),
   p0_cmd_byte_addr                     =>  (others => '0'),
   p0_cmd_empty                         =>  open,
   p0_cmd_full                          =>  open,
   p0_rd_clk                            =>  '0',
   p0_rd_en                             =>  '0',
   p0_rd_data                           =>  open,
   p0_rd_full                           =>  open,
   p0_rd_empty                          =>  open,
   p0_rd_count                          =>  open,
   p0_rd_overflow                       =>  open,
   p0_rd_error                          =>  open,
   p0_wr_clk                            =>  '0',
   p0_wr_en                             =>  '0',
   p0_wr_mask                           =>  (others => '0'),
   p0_wr_data                           =>  (others => '0'),
   p0_wr_full                           =>  open,
   p0_wr_empty                          =>  open,
   p0_wr_count                          =>  open,
   p0_wr_underrun                       =>  open,
   p0_wr_error                          =>  open,
   p1_arb_en                            =>  '0',
   p1_cmd_clk                           =>  '0',
   p1_cmd_en                            =>  '0',
   p1_cmd_instr                         =>  (others => '0'),
   p1_cmd_bl                            =>  (others => '0'),
   p1_cmd_byte_addr                     =>  (others => '0'),
   p1_cmd_empty                         =>  open,
   p1_cmd_full                          =>  open,
   p1_rd_clk                            =>  '0',
   p1_rd_en                             =>  '0',
   p1_rd_data                           =>  open,
   p1_rd_full                           =>  open,
   p1_rd_empty                          =>  open,
   p1_rd_count                          =>  open,
   p1_rd_overflow                       =>  open,
   p1_rd_error                          =>  open,
   p1_wr_clk                            =>  '0',
   p1_wr_en                             =>  '0',
   p1_wr_mask                           =>  (others => '0'),
   p1_wr_data                           =>  (others => '0'),
   p1_wr_full                           =>  open,
   p1_wr_empty                          =>  open,
   p1_wr_count                          =>  open,
   p1_wr_underrun                       =>  open,
   p1_wr_error                          =>  open,
   p2_arb_en                            =>  '1',
   p2_cmd_clk                           =>  p2_cmd_clk,
   p2_cmd_en                            =>  p2_cmd_en,
   p2_cmd_instr                         =>  p2_cmd_instr,
   p2_cmd_bl                            =>  p2_cmd_bl,
   p2_cmd_byte_addr                     =>  p2_cmd_byte_addr,
   p2_cmd_empty                         =>  p2_cmd_empty,
   p2_cmd_full                          =>  p2_cmd_full,
   p2_rd_clk                            =>  p2_rd_clk,
   p2_rd_en                             =>  p2_rd_en,
   p2_rd_data                           =>  p2_rd_data,
   p2_rd_full                           =>  p2_rd_full,
   p2_rd_empty                          =>  p2_rd_empty,
   p2_rd_count                          =>  p2_rd_count,
   p2_rd_overflow                       =>  p2_rd_overflow,
   p2_rd_error                          =>  p2_rd_error,
   p2_wr_clk                            =>  '0',
   p2_wr_en                             =>  '0',
   p2_wr_mask                           =>  (others => '0'),
   p2_wr_data                           =>  (others => '0'),
   p2_wr_full                           =>  open,
   p2_wr_empty                          =>  open,
   p2_wr_count                          =>  open,
   p2_wr_underrun                       =>  open,
   p2_wr_error                          =>  open,
   p3_arb_en                            =>  '1',
   p3_cmd_clk                           =>  p3_cmd_clk,
   p3_cmd_en                            =>  p3_cmd_en,
   p3_cmd_instr                         =>  p3_cmd_instr,
   p3_cmd_bl                            =>  p3_cmd_bl,
   p3_cmd_byte_addr                     =>  p3_cmd_byte_addr,
   p3_cmd_empty                         =>  p3_cmd_empty,
   p3_cmd_full                          =>  p3_cmd_full,
   p3_rd_clk                            =>  '0',
   p3_rd_en                             =>  '0',
   p3_rd_data                           =>  open,
   p3_rd_full                           =>  open,
   p3_rd_empty                          =>  open,
   p3_rd_count                          =>  open,
   p3_rd_overflow                       =>  open,
   p3_rd_error                          =>  open,
   p3_wr_clk                            =>  p3_wr_clk,
   p3_wr_en                             =>  p3_wr_en,
   p3_wr_mask                           =>  p3_wr_mask,
   p3_wr_data                           =>  p3_wr_data,
   p3_wr_full                           =>  p3_wr_full,
   p3_wr_empty                          =>  p3_wr_empty,
   p3_wr_count                          =>  p3_wr_count,
   p3_wr_underrun                       =>  p3_wr_underrun,
   p3_wr_error                          =>  p3_wr_error,
   p4_arb_en                            =>  '0',
   p4_cmd_clk                           =>  '0',
   p4_cmd_en                            =>  '0',
   p4_cmd_instr                         =>  (others => '0'),
   p4_cmd_bl                            =>  (others => '0'),
   p4_cmd_byte_addr                     =>  (others => '0'),
   p4_cmd_empty                         =>  open,
   p4_cmd_full                          =>  open,
   p4_rd_clk                            =>  '0',
   p4_rd_en                             =>  '0',
   p4_rd_data                           =>  open,
   p4_rd_full                           =>  open,
   p4_rd_empty                          =>  open,
   p4_rd_count                          =>  open,
   p4_rd_overflow                       =>  open,
   p4_rd_error                          =>  open,
   p4_wr_clk                            =>  '0',
   p4_wr_en                             =>  '0',
   p4_wr_mask                           =>  (others => '0'),
   p4_wr_data                           =>  (others => '0'),
   p4_wr_full                           =>  open,
   p4_wr_empty                          =>  open,
   p4_wr_count                          =>  open,
   p4_wr_underrun                       =>  open,
   p4_wr_error                          =>  open,
   p5_arb_en                            =>  '0',
   p5_cmd_clk                           =>  '0',
   p5_cmd_en                            =>  '0',
   p5_cmd_instr                         =>  (others => '0'),
   p5_cmd_bl                            =>  (others => '0'),
   p5_cmd_byte_addr                     =>  (others => '0'),
   p5_cmd_empty                         =>  open,
   p5_cmd_full                          =>  open,
   p5_rd_clk                            =>  '0',
   p5_rd_en                             =>  '0',
   p5_rd_data                           =>  open,
   p5_rd_full                           =>  open,
   p5_rd_empty                          =>  open,
   p5_rd_count                          =>  open,
   p5_rd_overflow                       =>  open,
   p5_rd_error                          =>  open,
   p5_wr_clk                            =>  '0',
   p5_wr_en                             =>  '0',
   p5_wr_mask                           =>  (others => '0'),
   p5_wr_data                           =>  (others => '0'),
   p5_wr_full                           =>  open,
   p5_wr_empty                          =>  open,
   p5_wr_count                          =>  open,
   p5_wr_underrun                       =>  open,
   p5_wr_error                          =>  open
);



end architecture;

