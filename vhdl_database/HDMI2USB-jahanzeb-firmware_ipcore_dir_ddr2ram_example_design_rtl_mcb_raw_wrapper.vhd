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
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: %version
--  \   \         Application: MIG
--  /   /         Filename: mcb_raw_wrapper.v
-- /___/   /\     Date Last Modified: $Date: 2011/06/02 07:17:04 $
-- \   \  /  \    Date Created: Thu June 24 2008
--  \___\/\___\
--
--Device: Spartan6
--Design Name: DDR/DDR2/DDR3/LPDDR 
--Purpose:
--Reference:
--   This module is the intialization control logic of the memory interface.
--   All commands are issued from here acoording to the burst, CAS Latency and
--   the user commands.
--   
-- Revised History:  
--    Rev 1.1 - added port_enable assignment for all configurations  and rearrange 
--              assignment siganls according to port number
--            - added timescale directive  -SN 7-28-08
--            - added C_ARB_NUM_TIME_SLOTS and removed the slot 12 through 
--              15 -SN 7-28-08
--            - changed C_MEM_DDR2_WRT_RECOVERY = (C_MEM_TWR /C_MEMCLK_PERIOD) -SN 7-28-08
--            - removed ghighb, gpwrdnb, gsr, gwe in port declaration. 
--              For now tb need to force the signals inside the MCB and Wrapper
--              until a glbl.v is ready.  Not sure how to do this in NCVerilog 
--              flow. -SN 7-28-08
--
--    Rev 1.2 -- removed p*_cmd_error signals -SN 8-05-08
--    Rev 1.3 -- Added gate logic for data port rd_en and wr_en in Config 3,4,5   - SN 8-8-08
--    Rev 1.4 -- update changes that required by MCB core.  - SN 9-11-09
--    Rev 1.5 -- update. CMD delays has been removed in Sept 26 database. -- SN 9-28-08
--               delay_cas_90,delay_ras_90,delay_cke_90,delay_odt_90,delay_rst_90 
--               delay_we_90 ,delay_address,delay_ba_90 =
--              --removed :assign #50 delay_dqnum = dqnum;
--              --removed :assign #50 delay_dqpum = dqpum;
--              --removed :assign #50 delay_dqnlm = dqnlm;
--              --removed :assign #50 delay_dqplm = dqplm;
--              --removed : delay_dqsIO_w_en_90_n
--              --removed : delay_dqsIO_w_en_90_p              
--              --removed : delay_dqsIO_w_en_0     
--              -- corrected spelling error: C_MEM_RTRAS
--    Rev 1.6 -- update IODRP2 and OSERDES connection and was updated by Chip.  1-12-09              
--                 -- rename the memc_wrapper.v to mcb_raw_wrapper.v
--    Rev 1.7  -- --  .READEN    is removed in IODRP2_MCB 1-28-09
--              -- connection has been updated                            
--    Rev 1.8   -- update memory parameter equations.    1-30_2009
--              -- added portion of Soft IP               
--              -- CAL_CLK_DIV is not used but MCB still has it
--    Rev  1.9  -- added Error checking for Invalid command to unidirectional port   
--    Rev  1.10 -- changed the backend connection so that Simulation will work while
--                 sw tools try to fix the model issues.                  2-3-2009      
--                 sysclk_2x_90 name is changed to sysclk_2x_180 . It created confusions.
--                 It is acutally 180 degree difference.
--    Rev  1.11 -- Added MCB_Soft_Calibration_top. 
--    Rev  1.12 -- fixed ui_clk connection to MCB when soft_calib_ip is on. 5-14-2009   
--    Rev  1.13 -- Added PULLUP/PULLDN for DQS/DQSN, UDQS/UDQSN lines.
--    Rev  1.14 -- Added minium condition for tRTP valud/                        
--    REv  1.15 -- Bring the SKIP_IN_TERM_CAL and SKIP_DYNAMIC_CAL from calib_ip to top.  6-16-2009
--    Rev  1.16 -- Fixed the WTR for DDR. 6-23-2009
--    Rev  1.17 -- Fixed width mismatch for px_cmd_ra,px_cmd_ca,px_cmd_ba 7-02-2009
--    Rev  1.18 -- Added lumpdelay parameters for 1.0 silicon support to bypass Calibration 7-10-2010
--    Rev  1.19 -- Added soft fix to support refresh command. 7-15-2009.
--    Rev  1.20 -- Turned on the CALIB_SOFT_IP and C_MC_CALIBRATION_MODE is used to enable/disable
--                 Dynamic DQS calibration in Soft Calibration module.
--    Rev  1.21 -- Added extra generate mcbx_dram_odt pin condition. It will not be generated if
--                 RTT value is set to "disabled"
--              -- Corrected the UIUDQSDEC connection between soft_calib and MCB.
--              -- PLL_LOCK pin to MCB tie high. Soft Calib module asserts MCB_RST when pll_lock is deasserted. 1-19-2010                
--    Rev  1.22 -- Added DDR2 Initialization fix to meet 400 ns wait as outlined in step d) of JEDEC DDR2 spec .
--    Rev  1.23 -- Fixed  CR 558661.  In Config "B64B64" mode, mig_p5_wr_data  <= p1_wr_data(63 downto 32).
--    Rev  1.24 -- Added DDR2 Initialization fix when C_CALIB_SOFT_IP set to "FALSE"
--    Rev  1.25 -- Fixed reset problem when MCB exits from SUSPEND SELFREFRESH mode. 10-20-2010	 
--    Rev  1.26 -- Synchronize sys_rst before connecting to mcb_soft_calibration module to fix
--                 CDC static timing issue.	 2-14-2011


--*************************************************************************************************************************
library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_unsigned.all;
library unisim;
use unisim.vcomponents.all;

entity mcb_raw_wrapper is
generic(
      C_MEMCLK_PERIOD                  : integer := 2500;
      C_PORT_ENABLE                    : std_logic_vector(5 downto 0) := (others => '1');

      C_MEM_ADDR_ORDER                 : string := "BANK_ROW_COLUMN";
      
      C_ARB_NUM_TIME_SLOTS             : integer := 12;
      C_ARB_TIME_SLOT_0                : bit_vector(17 downto 0):= "000" & "001" & "010" & "011" & "100" & "101";
      C_ARB_TIME_SLOT_1                : bit_vector(17 downto 0):= "001" & "010" & "011" & "100" & "101" & "000";
      C_ARB_TIME_SLOT_2                : bit_vector(17 downto 0):= "010" & "011" & "100" & "101" & "000" & "011"; 
      C_ARB_TIME_SLOT_3                : bit_vector(17 downto 0):= "011" & "100" & "101" & "000" & "001" & "010";
      C_ARB_TIME_SLOT_4                : bit_vector(17 downto 0):= "100" & "101" & "000" & "001" & "010" & "011";
      C_ARB_TIME_SLOT_5                : bit_vector(17 downto 0):= "101" & "000" & "001" & "010" & "011" & "100";
      C_ARB_TIME_SLOT_6                : bit_vector(17 downto 0):= "000" & "001" & "010" & "011" & "100" & "101";
      C_ARB_TIME_SLOT_7                : bit_vector(17 downto 0):= "001" & "010" & "011" & "100" & "101" & "000";
      C_ARB_TIME_SLOT_8                : bit_vector(17 downto 0):= "010" & "011" & "100" & "101" & "000" & "011"; 
      C_ARB_TIME_SLOT_9                : bit_vector(17 downto 0):= "011" & "100" & "101" & "000" & "001" & "010";
      C_ARB_TIME_SLOT_10               : bit_vector(17 downto 0):= "100" & "101" & "000" & "001" & "010" & "011";
      C_ARB_TIME_SLOT_11               : bit_vector(17 downto 0):= "101" & "000" & "001" & "010" & "011" & "100";
      C_PORT_CONFIG                    : string :=  "B32_B32_W32_W32_W32_W32";  

      
      C_MEM_TRAS                       : integer := 45000;
      C_MEM_TRCD                       : integer := 12500;
      C_MEM_TREFI                      : integer := 7800;
      C_MEM_TRFC                       : integer := 127500;
      C_MEM_TRP                        : integer := 12500;
      C_MEM_TWR                        : integer := 15000;
      C_MEM_TRTP                       : integer := 7500;
      C_MEM_TWTR                       : integer := 7500;
      
      C_NUM_DQ_PINS                    : integer := 8;
      C_MEM_TYPE                       : string := "DDR3";
      C_MEM_DENSITY                    : string := "512M";
      C_MEM_BURST_LEN                  : integer := 8;
      
      C_MEM_CAS_LATENCY                : integer := 4;
      C_MEM_ADDR_WIDTH                 : integer := 13;
      C_MEM_BANKADDR_WIDTH             : integer := 3;
      C_MEM_NUM_COL_BITS               : integer := 11;
      
      C_MEM_DDR3_CAS_LATENCY           : integer := 7;
      C_MEM_MOBILE_PA_SR               : string := "FULL";
      C_MEM_DDR1_2_ODS                 : string := "FULL";
      C_MEM_DDR3_ODS                   : string := "DIV6";
      C_MEM_DDR2_RTT                   : string := "50OHMS";
      C_MEM_DDR3_RTT                   : string := "DIV2";
      C_MEM_MDDR_ODS                   : string := "FULL";
      
      C_MEM_DDR2_DIFF_DQS_EN           : string := "YES";
      C_MEM_DDR2_3_PA_SR               : string := "OFF";
      C_MEM_DDR3_CAS_WR_LATENCY        : integer := 5;
      
      C_MEM_DDR3_AUTO_SR               : string := "ENABLED";
      C_MEM_DDR2_3_HIGH_TEMP_SR        : string := "NORMAL";
      C_MEM_DDR3_DYN_WRT_ODT           : string := "OFF";
      C_MEM_TZQINIT_MAXCNT             : std_logic_vector(9 downto 0) := "1000000000"; -- DDR3 Minimum delay between resets 
      
      C_MC_CALIB_BYPASS                : string := "NO";
      C_MC_CALIBRATION_RA              : bit_vector(15 downto 0) := X"0000";
      C_MC_CALIBRATION_BA              : bit_vector(2 downto 0) := "000";

      C_CALIB_SOFT_IP                  : string := "TRUE";
      C_SKIP_IN_TERM_CAL               : integer := 0;        --provides option to skip the input termination calibration
      C_SKIP_DYNAMIC_CAL               : integer := 0;        --provides option to skip the dynamic delay calibration
      C_SKIP_DYN_IN_TERM               : integer := 1;        -- provides option to skip the input termination calibration
      C_SIMULATION                     : string  := "FALSE";  -- Tells us whether the design is being simulated or implemented


--- ADDED for 1.0 silicon support to bypass Calibration //////
-- 07-10-09 chipl
--////////////////////////////////////////////////////////////
     LDQSP_TAP_DELAY_VAL                : integer := 0;
     UDQSP_TAP_DELAY_VAL                : integer := 0;
     LDQSN_TAP_DELAY_VAL                : integer := 0;
     UDQSN_TAP_DELAY_VAL                : integer := 0;
     DQ0_TAP_DELAY_VAL                  : integer := 0;  
     DQ1_TAP_DELAY_VAL                  : integer := 0;  
     DQ2_TAP_DELAY_VAL                  : integer := 0;  
     DQ3_TAP_DELAY_VAL                  : integer := 0;  
     DQ4_TAP_DELAY_VAL                  : integer := 0;  
     DQ5_TAP_DELAY_VAL                  : integer := 0;  
     DQ6_TAP_DELAY_VAL                  : integer := 0;  
     DQ7_TAP_DELAY_VAL                  : integer := 0;  
     DQ8_TAP_DELAY_VAL                  : integer := 0;  
     DQ9_TAP_DELAY_VAL                  : integer := 0;  
     DQ10_TAP_DELAY_VAL                  : integer := 0;  
     DQ11_TAP_DELAY_VAL                  : integer := 0;  
     DQ12_TAP_DELAY_VAL                  : integer := 0;  
     DQ13_TAP_DELAY_VAL                  : integer := 0;  
     DQ14_TAP_DELAY_VAL                  : integer := 0;  
     DQ15_TAP_DELAY_VAL                  : integer := 0;  

      C_MC_CALIBRATION_CA              : bit_vector(11 downto 0) := X"000";
      C_MC_CALIBRATION_CLK_DIV         : integer := 1;
      C_MC_CALIBRATION_MODE            : string := "CALIBRATION";
      C_MC_CALIBRATION_DELAY           : string := "HALF";
      
      C_P0_MASK_SIZE                   : integer := 4;
      C_P0_DATA_PORT_SIZE              : integer := 32;
      C_P1_MASK_SIZE                   : integer := 4;
      C_P1_DATA_PORT_SIZE              : integer := 32
      );
   PORT (

      sysclk_2x                        : in std_logic;
      sysclk_2x_180                    : in std_logic;
      pll_ce_0                         : in std_logic;
      pll_ce_90                        : in std_logic;
      pll_lock                         : in std_logic;
      sys_rst                          : in std_logic;
      
      p0_arb_en                        : in std_logic;
      p0_cmd_clk                       : in std_logic;
      p0_cmd_en                        : in std_logic;
      p0_cmd_instr                     : in std_logic_vector(2 downto 0);
      p0_cmd_bl                        : in std_logic_vector(5 downto 0);
      p0_cmd_byte_addr                 : in std_logic_vector(29 downto 0);
      p0_cmd_empty                     : out std_logic;
      p0_cmd_full                      : out std_logic;

      p0_wr_clk                        : in std_logic;
      p0_wr_en                         : in std_logic;
      p0_wr_mask                       : in std_logic_vector(C_P0_MASK_SIZE - 1 downto 0);
      p0_wr_data                       : in std_logic_vector(C_P0_DATA_PORT_SIZE - 1 downto 0);
      p0_wr_full                       : out std_logic;
      p0_wr_empty                      : out std_logic;
      p0_wr_count                      : out std_logic_vector(6 downto 0);
      p0_wr_underrun                   : out std_logic;
      p0_wr_error                      : out std_logic;

      p0_rd_clk                        : in std_logic;
      p0_rd_en                         : in std_logic;
      p0_rd_data                       : out std_logic_vector(C_P0_DATA_PORT_SIZE - 1 downto 0);
      p0_rd_full                       : out std_logic;
      p0_rd_empty                      : out std_logic;
      p0_rd_count                      : out std_logic_vector(6 downto 0);
      p0_rd_overflow                   : out std_logic;
      p0_rd_error                      : out std_logic;

      p1_arb_en                        : in std_logic;
      p1_cmd_clk                       : in std_logic;
      p1_cmd_en                        : in std_logic;
      p1_cmd_instr                     : in std_logic_vector(2 downto 0);
      p1_cmd_bl                        : in std_logic_vector(5 downto 0);
      p1_cmd_byte_addr                 : in std_logic_vector(29 downto 0);
      p1_cmd_empty                     : out std_logic;
      p1_cmd_full                      : out std_logic;
      p1_wr_clk                        : in std_logic;
      p1_wr_en                         : in std_logic;
      p1_wr_mask                       : in std_logic_vector(C_P1_MASK_SIZE - 1 downto 0);
      p1_wr_data                       : in std_logic_vector(C_P1_DATA_PORT_SIZE - 1 downto 0);
      p1_wr_full                       : out std_logic;
      p1_wr_empty                      : out std_logic;
      p1_wr_count                      : out std_logic_vector(6 downto 0);
      p1_wr_underrun                   : out std_logic;
      p1_wr_error                      : out std_logic;
      p1_rd_clk                        : in std_logic;
      p1_rd_en                         : in std_logic;
      p1_rd_data                       : out std_logic_vector(C_P1_DATA_PORT_SIZE - 1 downto 0);
      p1_rd_full                       : out std_logic;
      p1_rd_empty                      : out std_logic;
      p1_rd_count                      : out std_logic_vector(6 downto 0);
      p1_rd_overflow                   : out std_logic;
      p1_rd_error                      : out std_logic;

      p2_arb_en                        : in std_logic;
      p2_cmd_clk                       : in std_logic;
      p2_cmd_en                        : in std_logic;
      p2_cmd_instr                     : in std_logic_vector(2 downto 0);
      p2_cmd_bl                        : in std_logic_vector(5 downto 0);
      p2_cmd_byte_addr                 : in std_logic_vector(29 downto 0);
      p2_cmd_empty                     : out std_logic;
      p2_cmd_full                      : out std_logic;
      p2_wr_clk                        : in std_logic;
      p2_wr_en                         : in std_logic;
      p2_wr_mask                       : in std_logic_vector(3 downto 0);
      p2_wr_data                       : in std_logic_vector(31 downto 0);
      p2_wr_full                       : out std_logic;
      p2_wr_empty                      : out std_logic;
      p2_wr_count                      : out std_logic_vector(6 downto 0);
      p2_wr_underrun                   : out std_logic;
      p2_wr_error                      : out std_logic;
      p2_rd_clk                        : in std_logic;
      p2_rd_en                         : in std_logic;
      p2_rd_data                       : out std_logic_vector(31 downto 0);
      p2_rd_full                       : out std_logic;
      p2_rd_empty                      : out std_logic;
      p2_rd_count                      : out std_logic_vector(6 downto 0);
      p2_rd_overflow                   : out std_logic;
      p2_rd_error                      : out std_logic;

      p3_arb_en                        : in std_logic;
      p3_cmd_clk                       : in std_logic;
      p3_cmd_en                        : in std_logic;
      p3_cmd_instr                     : in std_logic_vector(2 downto 0);
      p3_cmd_bl                        : in std_logic_vector(5 downto 0);
      p3_cmd_byte_addr                 : in std_logic_vector(29 downto 0);
      p3_cmd_empty                     : out std_logic;
      p3_cmd_full                      : out std_logic;
      p3_wr_clk                        : in std_logic;
      p3_wr_en                         : in std_logic;
      p3_wr_mask                       : in std_logic_vector(3 downto 0);
      p3_wr_data                       : in std_logic_vector(31 downto 0);
      p3_wr_full                       : out std_logic;
      p3_wr_empty                      : out std_logic;
      p3_wr_count                      : out std_logic_vector(6 downto 0);
      p3_wr_underrun                   : out std_logic;
      p3_wr_error                      : out std_logic;
      p3_rd_clk                        : in std_logic;
      p3_rd_en                         : in std_logic;
      p3_rd_data                       : out std_logic_vector(31 downto 0);
      p3_rd_full                       : out std_logic;
      p3_rd_empty                      : out std_logic;
      p3_rd_count                      : out std_logic_vector(6 downto 0);
      p3_rd_overflow                   : out std_logic;
      p3_rd_error                      : out std_logic;

      p4_arb_en                        : in std_logic;
      p4_cmd_clk                       : in std_logic;
      p4_cmd_en                        : in std_logic;
      p4_cmd_instr                     : in std_logic_vector(2 downto 0);
      p4_cmd_bl                        : in std_logic_vector(5 downto 0);
      p4_cmd_byte_addr                 : in std_logic_vector(29 downto 0);
      p4_cmd_empty                     : out std_logic;
      p4_cmd_full                      : out std_logic;
      p4_wr_clk                        : in std_logic;
      p4_wr_en                         : in std_logic;
      p4_wr_mask                       : in std_logic_vector(3 downto 0);
      p4_wr_data                       : in std_logic_vector(31 downto 0);
      p4_wr_full                       : out std_logic;
      p4_wr_empty                      : out std_logic;
      p4_wr_count                      : out std_logic_vector(6 downto 0);
      p4_wr_underrun                   : out std_logic;
      p4_wr_error                      : out std_logic;
      p4_rd_clk                        : in std_logic;
      p4_rd_en                         : in std_logic;
      p4_rd_data                       : out std_logic_vector(31 downto 0);
      p4_rd_full                       : out std_logic;
      p4_rd_empty                      : out std_logic;
      p4_rd_count                      : out std_logic_vector(6 downto 0);
      p4_rd_overflow                   : out std_logic;
      p4_rd_error                      : out std_logic;

      p5_arb_en                        : in std_logic;
      p5_cmd_clk                       : in std_logic;
      p5_cmd_en                        : in std_logic;
      p5_cmd_instr                     : in std_logic_vector(2 downto 0);
      p5_cmd_bl                        : in std_logic_vector(5 downto 0);
      p5_cmd_byte_addr                 : in std_logic_vector(29 downto 0);
      p5_cmd_empty                     : out std_logic;
      p5_cmd_full                      : out std_logic;
      p5_wr_clk                        : in std_logic;
      p5_wr_en                         : in std_logic;
      p5_wr_mask                       : in std_logic_vector(3 downto 0);
      p5_wr_data                       : in std_logic_vector(31 downto 0);
      p5_wr_full                       : out std_logic;
      p5_wr_empty                      : out std_logic;
      p5_wr_count                      : out std_logic_vector(6 downto 0);
      p5_wr_underrun                   : out std_logic;
      p5_wr_error                      : out std_logic;
      p5_rd_clk                        : in std_logic;
      p5_rd_en                         : in std_logic;
      p5_rd_data                       : out std_logic_vector(31 downto 0);
      p5_rd_full                       : out std_logic;
      p5_rd_empty                      : out std_logic;
      p5_rd_count                      : out std_logic_vector(6 downto 0);
      p5_rd_overflow                   : out std_logic;
      p5_rd_error                      : out std_logic;

      mcbx_dram_addr                   : out std_logic_vector(C_MEM_ADDR_WIDTH - 1 downto 0);
      mcbx_dram_ba                     : out std_logic_vector(C_MEM_BANKADDR_WIDTH - 1 downto 0);
      mcbx_dram_ras_n                  : out std_logic;
      mcbx_dram_cas_n                  : out std_logic;
      mcbx_dram_we_n                   : out std_logic;
      mcbx_dram_cke                    : out std_logic;
      mcbx_dram_clk                    : out std_logic;
      mcbx_dram_clk_n                  : out std_logic;
      mcbx_dram_dq                     : INOUT std_logic_vector(C_NUM_DQ_PINS-1 downto 0);
      mcbx_dram_dqs                    : INOUT std_logic;
      mcbx_dram_dqs_n                  : INOUT std_logic;
      mcbx_dram_udqs                   : INOUT std_logic;
      mcbx_dram_udqs_n                 : INOUT std_logic;
      mcbx_dram_udm                    : out std_logic;
      mcbx_dram_ldm                    : out std_logic;
      mcbx_dram_odt                    : out std_logic;
      mcbx_dram_ddr3_rst               : out std_logic;

      calib_recal                      : in std_logic;
      rzq                              : INOUT std_logic;
      zio                              : INOUT std_logic;
      ui_read                          : in std_logic;
      ui_add                           : in std_logic;
      ui_cs                            : in std_logic;
      ui_clk                           : in std_logic;
      ui_sdi                           : in std_logic;
      ui_addr                          : in std_logic_vector(4 downto 0);
      ui_broadcast                     : in std_logic;
      ui_drp_update                    : in std_logic;
      ui_done_cal                      : in std_logic;
      ui_cmd                           : in std_logic;
      ui_cmd_in                        : in std_logic;
      ui_cmd_en                        : in std_logic;
      ui_dqcount                       : in std_logic_vector(3 downto 0);
      ui_dq_lower_dec                  : in std_logic;
      ui_dq_lower_inc                  : in std_logic;
      ui_dq_upper_dec                  : in std_logic;
      ui_dq_upper_inc                  : in std_logic;
      ui_udqs_inc                      : in std_logic;
      ui_udqs_dec                      : in std_logic;
      ui_ldqs_inc                      : in std_logic;
      ui_ldqs_dec                      : in std_logic;
      uo_data                          : out std_logic_vector(7 downto 0);
      uo_data_valid                    : out std_logic;
      uo_done_cal                      : out std_logic;
      uo_cmd_ready_in                  : out std_logic;
      uo_refrsh_flag                   : out std_logic;
      uo_cal_start                     : out std_logic;
      uo_sdo                           : out std_logic;
      status                           : out std_logic_vector(31 downto 0);
      selfrefresh_enter                : in std_logic;
      selfrefresh_mode                 : out std_logic
   );
end mcb_raw_wrapper;

 architecture aarch of mcb_raw_wrapper is
   
component mcb_soft_calibration_top is
   generic (
      C_MEM_TZQINIT_MAXCNT  : std_logic_vector(9 downto 0) := "1000000000"; -- DDR3 Minimum delay between resets 
      C_MC_CALIBRATION_MODE : string :=  "CALIBRATION";  -- if set to CALIBRATION will reset DQS IDELAY to DQS_NUMERATOR/DQS_DENOMINATOR local_param values,
                                                         --  and does dynamic recal,
                                                         -- if set to NOCALIBRATION then defaults to hard cal blocks setting of C_MC_CALBRATION_DELAY *and* 
                                                         --  no dynamic recal will be done 
      SKIP_IN_TERM_CAL      : integer := 0;             -- provides option to skip the input termination calibration
      SKIP_DYNAMIC_CAL      : integer := 0;             -- provides option to skip the dynamic delay calibration
      SKIP_DYN_IN_TERM      : integer := 0;             -- provides option to skip the dynamic delay calibration
      C_SIMULATION          : string  := "FALSE";       -- Tells us whether the design is being simulated or implemented
      C_MEM_TYPE            : string  := "DDR3"         -- provides the memory device used for the design

   );
   port (
      UI_CLK                : in std_logic;             -- Input - global clock to be used for input_term_tuner and IODRP clock
      RST                   : in std_logic;             -- Input - reset for input_term_tuner - synchronous for input_term_tuner state machine, asynch for 
                                                        --  IODRP (sub)controller
      IOCLK                 : in std_logic;             -- Input - IOCLK input to the IODRP's
      DONE_SOFTANDHARD_CAL  : out std_logic;            -- active high flag signals soft calibration of input delays is complete and MCB_UODONECAL is high
                                                        --  (MCB hard calib complete)
      PLL_LOCK              : in std_logic;             -- Lock signal from PLL
      SELFREFRESH_REQ       : in std_logic;             
      SELFREFRESH_MCB_MODE  : in std_logic;             
      SELFREFRESH_MCB_REQ   : out std_logic;            
      SELFREFRESH_MODE      : out std_logic;            
      MCB_UIADD             : out std_logic;            -- to MCB's UIADD port
      MCB_UISDI             : out std_logic;            -- to MCB's UISDI port
      MCB_UOSDO             : in std_logic;
      MCB_UODONECAL         : in std_logic;
      MCB_UOREFRSHFLAG      : in std_logic;
      MCB_UICS              : out std_logic;
      MCB_UIDRPUPDATE       : out std_logic;
      MCB_UIBROADCAST       : out std_logic;
      MCB_UIADDR            : out std_logic_vector(4 downto 0);
      MCB_UICMDEN           : out std_logic;
      MCB_UIDONECAL         : out std_logic;
      MCB_UIDQLOWERDEC      : out std_logic;
      MCB_UIDQLOWERINC      : out std_logic;
      MCB_UIDQUPPERDEC      : out std_logic;
      MCB_UIDQUPPERINC      : out std_logic;
      MCB_UILDQSDEC         : out std_logic;
      MCB_UILDQSINC         : out std_logic;
      MCB_UIREAD            : out std_logic;
      MCB_UIUDQSDEC         : out std_logic;
      MCB_UIUDQSINC         : out std_logic;
      MCB_RECAL             : out std_logic;
      MCB_SYSRST            : out std_logic;
      MCB_UICMD             : out std_logic;
      MCB_UICMDIN           : out std_logic;
      MCB_UIDQCOUNT         : out std_logic_vector(3 downto 0);
      MCB_UODATA            : in std_logic_vector(7 downto 0);
      MCB_UODATAVALID       : in std_logic;
      MCB_UOCMDREADY        : in std_logic;
      MCB_UO_CAL_START      : in std_logic;
      RZQ_PIN               : inout std_logic;
      ZIO_PIN               : inout std_logic;
      CKE_Train             : out std_logic
   );   
end component;

constant      C_OSERDES2_DATA_RATE_OQ          : STRING := "SDR";
constant      C_OSERDES2_DATA_RATE_OT          : STRING := "SDR";
constant      C_OSERDES2_SERDES_MODE_MASTER    : STRING := "MASTER";
constant      C_OSERDES2_SERDES_MODE_SLAVE     : STRING := "SLAVE";
constant      C_OSERDES2_OUTPUT_MODE_SE        : STRING := "SINGLE_ENDED";
constant      C_OSERDES2_OUTPUT_MODE_DIFF      : STRING := "DIFFERENTIAL";
      
constant      C_BUFPLL_0_LOCK_SRC              : STRING := "LOCK_TO_0";
      
constant      C_DQ_IODRP2_DATA_RATE            : STRING := "SDR";
constant      C_DQ_IODRP2_SERDES_MODE_MASTER   : STRING := "MASTER";
constant      C_DQ_IODRP2_SERDES_MODE_SLAVE    : STRING := "SLAVE";
      
constant      C_DQS_IODRP2_DATA_RATE           : STRING := "SDR";
constant      C_DQS_IODRP2_SERDES_MODE_MASTER  : STRING := "MASTER";
constant      C_DQS_IODRP2_SERDES_MODE_SLAVE   : STRING := "SLAVE";

-- MIG always set the below ADD_LATENCY to zero
constant      C_MEM_DDR3_ADD_LATENCY           : STRING := "OFF";
constant      C_MEM_DDR2_ADD_LATENCY           : INTEGER := 0;
constant      C_MEM_MOBILE_TC_SR               : INTEGER := 0;

-- convert the memory timing to memory clock units. I
constant      MEM_RAS_VAL   : INTEGER := ((C_MEM_TRAS + C_MEMCLK_PERIOD - 1) / C_MEMCLK_PERIOD);
constant      MEM_RCD_VAL   : INTEGER := ((C_MEM_TRCD + C_MEMCLK_PERIOD - 1) / C_MEMCLK_PERIOD);
constant      MEM_REFI_VAL  : INTEGER := ((C_MEM_TREFI + C_MEMCLK_PERIOD - 1) / C_MEMCLK_PERIOD) - 25;
constant      MEM_RFC_VAL   : INTEGER := ((C_MEM_TRFC + C_MEMCLK_PERIOD - 1) / C_MEMCLK_PERIOD);
constant      MEM_RP_VAL    : INTEGER := ((C_MEM_TRP + C_MEMCLK_PERIOD - 1) / C_MEMCLK_PERIOD);
constant      MEM_WR_VAL    : INTEGER := ((C_MEM_TWR + C_MEMCLK_PERIOD - 1) / C_MEMCLK_PERIOD);

 function cdiv return integer is
  begin
    if ( (C_MEM_TRTP mod C_MEMCLK_PERIOD)>0) then
      return (C_MEM_TRTP/C_MEMCLK_PERIOD)+1;
    else      
    return (C_MEM_TRTP/C_MEMCLK_PERIOD);
    end if;
  end function cdiv;

constant      MEM_RTP_VAL1                      : INTEGER := cdiv;


function MEM_RTP_CYC1 return integer is
  begin
    if (MEM_RTP_VAL1 < 4 and C_MEM_TYPE = "DDR3") then
      return 4;
    else if(MEM_RTP_VAL1 < 2) then
      return 2;
    else
      return MEM_RTP_VAL1;
    end if;
    end if;
  end function MEM_RTP_CYC1;

constant      MEM_RTP_VAL                      : INTEGER := MEM_RTP_CYC1;

function MEM_WTR_CYC return integer is
  begin
    if (C_MEM_TYPE = "DDR") then
      return 2;
    elsif (C_MEM_TYPE = "DDR3") then
      return 4;
    elsif (C_MEM_TYPE = "MDDR" OR C_MEM_TYPE = "LPDDR") then
      return C_MEM_TWTR;
    elsif (C_MEM_TYPE = "DDR2"  AND (((C_MEM_TWTR  + C_MEMCLK_PERIOD -1) /C_MEMCLK_PERIOD) > 2)) then
      return ((C_MEM_TWTR  + C_MEMCLK_PERIOD -1) /C_MEMCLK_PERIOD);
    elsif (C_MEM_TYPE = "DDR2")then
      return 2;
    else
      return 3;
    end if;
  end function MEM_WTR_CYC;

constant      MEM_WTR_VAL                      : INTEGER := MEM_WTR_CYC;

function DDR2_WRT_RECOVERY_CYC return integer is
  begin
    if (not(C_MEM_TYPE = "DDR2")) then
      return 5;
    else
      return ((C_MEM_TWR + C_MEMCLK_PERIOD - 1) / C_MEMCLK_PERIOD);
    end if;
  end function DDR2_WRT_RECOVERY_CYC;


constant        C_MEM_DDR2_WRT_RECOVERY          : INTEGER := DDR2_WRT_RECOVERY_CYC;

function DDR3_WRT_RECOVERY_CYC return integer is
  begin
    if (not(C_MEM_TYPE = "DDR3")) then
      return 5;
    else
      return ((C_MEM_TWR + C_MEMCLK_PERIOD - 1) / C_MEMCLK_PERIOD);
    end if;
  end function DDR3_WRT_RECOVERY_CYC;

constant      C_MEM_DDR3_WRT_RECOVERY          : INTEGER := DDR3_WRT_RECOVERY_CYC;

--CR 596422
constant allzero : std_logic_vector(127 downto 0) := (others => '0');
--signal allzero : std_logic_vector(127 downto 0) := (others => '0');

----------------------------------------------------------------------------
-- signal Declarations
----------------------------------------------------------------------------
signal addr_in0 : std_logic_vector(31 downto 0);
signal dqs_out_p : std_logic;              
signal dqs_out_n : std_logic;              
signal dqs_sys_p : std_logic;             --from dqs_gen to IOclk network
signal dqs_sys_n : std_logic;             --from dqs_gen to IOclk network
signal udqs_sys_p: std_logic;
signal udqs_sys_n: std_logic;
signal dqs_p : std_logic;                  -- open net now ?
signal dqs_n : std_logic;                  -- open net now ?

-- IOI and IOB enable/tristate interface
signal dqIO_w_en_0      : std_logic;          --enable DQ pads
signal dqsIO_w_en_90_p  : std_logic;          --enable p side of DQS
signal dqsIO_w_en_90_n  : std_logic;          --enable n side of DQS

--memory chip control interface
signal address_90 : std_logic_vector(14 downto 0);
signal ba_90  : std_logic_vector(2 downto 0);   
signal ras_90 : std_logic;
signal cas_90 : std_logic;
signal we_90  : std_logic;
signal cke_90 : std_logic;
signal odt_90 : std_logic;
signal rst_90 : std_logic;

-- calibration IDELAY control  signals
signal ioi_drp_clk       : std_logic;   --DRP interface - synchronous clock output
signal ioi_drp_addr      : std_logic_vector(4 downto 0);   --DRP interface - IOI selection
signal ioi_drp_sdo       : std_logic;   --DRP interface - serial output for commmands
signal ioi_drp_sdi       : std_logic;   --DRP interface - serial input for commands
signal ioi_drp_cs        : std_logic;   --DRP interface - chip select doubles as DONE signal
signal ioi_drp_add       : std_logic;   --DRP interface - serial address signal
signal ioi_drp_broadcast : std_logic; 
signal ioi_drp_train     : std_logic;

-- Calibration datacapture siganls
signal dqdonecount : std_logic_vector(3 downto 0); --select signal for the datacapture 16 to 1 mux
signal dq_in_p : std_logic;         --positive signal sent to calibration logic
signal dq_in_n : std_logic;         --negative signal sent to calibration logic
signal cal_done: std_logic;   

--DQS calibration interface
signal udqs_n : std_logic;
signal udqs_p : std_logic;
signal udqs_dqocal_p : std_logic;
signal udqs_dqocal_n : std_logic;

-- MUI enable interface
signal df_en_n90 : std_logic;

--INTERNAL signal FOR DRP chain
-- IOI <-> MUI
signal ioi_int_tmp : std_logic;

signal dqo_n : std_logic_vector(15 downto 0);  
signal dqo_p : std_logic_vector(15 downto 0);  
signal dqnlm : std_logic;      
signal dqplm : std_logic;      
signal dqnum : std_logic;      
signal dqpum : std_logic;      

-- IOI <-> IOB   routes
signal  ioi_addr  : std_logic_vector(C_MEM_ADDR_WIDTH-1 downto 0);
signal  ioi_ba : std_logic_vector(C_MEM_BANKADDR_WIDTH-1 downto 0);    
signal  ioi_cas : std_logic;  
signal  ioi_ck  : std_logic;  
signal  ioi_ckn : std_logic;   
signal  ioi_cke : std_logic;  
signal  ioi_dq : std_logic_vector(C_NUM_DQ_PINS-1 downto 0); 
signal  ioi_dqs  : std_logic; 
signal  ioi_dqsn : std_logic;
signal  ioi_udqs : std_logic;
signal  ioi_udqsn : std_logic;   
signal  ioi_odt  : std_logic; 
signal  ioi_ras  : std_logic; 
signal  ioi_rst  : std_logic; 
signal  ioi_we   : std_logic;
signal  ioi_udm  : std_logic;
signal  ioi_ldm  : std_logic;

signal  in_dq     : std_logic_vector(15 downto 0);
signal  in_pre_dq : std_logic_vector(C_NUM_DQ_PINS-1 downto 0);
signal  in_dqs       : std_logic;
signal  in_pre_dqsp  : std_logic;
signal  in_pre_dqsn  : std_logic;
signal  in_pre_udqsp : std_logic;
signal  in_pre_udqsn : std_logic;
signal  in_udqs      : std_logic;

-- Memory tri-state control signals
signal  t_addr  : std_logic_vector(C_MEM_ADDR_WIDTH-1 downto 0);
signal  t_ba    : std_logic_vector(C_MEM_BANKADDR_WIDTH-1 downto 0);    
signal  t_cas   : std_logic;
signal  t_ck    : std_logic;
signal  t_ckn   : std_logic;
signal  t_cke   : std_logic;
signal  t_dq    : std_logic_vector(C_NUM_DQ_PINS-1 downto 0);
signal  t_dqs   : std_logic;   
signal  t_dqsn  : std_logic;
signal  t_udqs  : std_logic;
signal  t_udqsn : std_logic;
signal  t_odt   : std_logic;   
signal  t_ras   : std_logic;   
signal  t_rst   : std_logic;   
signal  t_we    : std_logic;   

signal t_udm             : std_logic;
signal t_ldm             : std_logic;

signal idelay_dqs_ioi_s  : std_logic;
signal idelay_dqs_ioi_m  : std_logic;
signal idelay_udqs_ioi_s : std_logic;
signal idelay_udqs_ioi_m : std_logic;

signal dqs_pin           : std_logic;
signal udqs_pin          : std_logic;

-- USER Interface signals
-- translated memory addresses
signal p0_cmd_ra : std_logic_vector(14 downto 0);
signal p0_cmd_ba : std_logic_vector(2 downto 0);
signal p0_cmd_ca : std_logic_vector(11 downto 0);
signal p1_cmd_ra : std_logic_vector(14 downto 0);
signal p1_cmd_ba : std_logic_vector(2 downto 0);
signal p1_cmd_ca : std_logic_vector(11 downto 0);
signal p2_cmd_ra : std_logic_vector(14 downto 0);
signal p2_cmd_ba : std_logic_vector(2 downto 0);
signal p2_cmd_ca : std_logic_vector(11 downto 0);
signal p3_cmd_ra : std_logic_vector(14 downto 0);
signal p3_cmd_ba : std_logic_vector(2 downto 0);
signal p3_cmd_ca : std_logic_vector(11 downto 0);
signal p4_cmd_ra : std_logic_vector(14 downto 0);
signal p4_cmd_ba : std_logic_vector(2 downto 0);
signal p4_cmd_ca : std_logic_vector(11 downto 0);
signal p5_cmd_ra : std_logic_vector(14 downto 0);
signal p5_cmd_ba : std_logic_vector(2 downto 0);
signal p5_cmd_ca : std_logic_vector(11 downto 0);

   -- user command wires mapped from logical ports to physical ports
signal mig_p0_arb_en            : std_logic;
signal mig_p0_cmd_clk           : std_logic;
signal mig_p0_cmd_en            : std_logic;
signal mig_p0_cmd_ra            : std_logic_vector(14 downto 0);
signal mig_p0_cmd_ba            : std_logic_vector(2 downto 0);
signal mig_p0_cmd_ca            : std_logic_vector(11 downto 0);

signal mig_p0_cmd_instr         : std_logic_vector(2 downto 0);
signal mig_p0_cmd_bl            : std_logic_vector(5 downto 0);
signal mig_p0_cmd_empty         : std_logic;
signal mig_p0_cmd_full          : std_logic;

signal mig_p1_arb_en            : std_logic;
signal mig_p1_cmd_clk           : std_logic;
signal mig_p1_cmd_en            : std_logic;
signal mig_p1_cmd_ra            : std_logic_vector(14 downto 0);
signal mig_p1_cmd_ba            : std_logic_vector(2 downto 0);
signal mig_p1_cmd_ca            : std_logic_vector(11 downto 0);

signal mig_p1_cmd_instr         : std_logic_vector(2 downto 0);
signal mig_p1_cmd_bl            : std_logic_vector(5 downto 0);
signal mig_p1_cmd_empty         : std_logic;
signal mig_p1_cmd_full          : std_logic;

signal mig_p2_arb_en            : std_logic;
signal mig_p2_cmd_clk           : std_logic;
signal mig_p2_cmd_en            : std_logic;
signal mig_p2_cmd_ra            : std_logic_vector(14 downto 0);
signal mig_p2_cmd_ba            : std_logic_vector(2 downto 0);
signal mig_p2_cmd_ca            : std_logic_vector(11 downto 0);

signal mig_p2_cmd_instr         : std_logic_vector(2 downto 0);
signal mig_p2_cmd_bl            : std_logic_vector(5 downto 0);
signal mig_p2_cmd_empty         : std_logic;
signal mig_p2_cmd_full          : std_logic;

signal mig_p3_arb_en            : std_logic;
signal mig_p3_cmd_clk           : std_logic;
signal mig_p3_cmd_en            : std_logic;
signal mig_p3_cmd_ra            : std_logic_vector(14 downto 0);
signal mig_p3_cmd_ba            : std_logic_vector(2 downto 0);
signal mig_p3_cmd_ca            : std_logic_vector(11 downto 0);

signal mig_p3_cmd_instr         : std_logic_vector(2 downto 0);
signal mig_p3_cmd_bl            : std_logic_vector(5 downto 0);
signal mig_p3_cmd_empty         : std_logic;
signal mig_p3_cmd_full          : std_logic;

signal mig_p4_arb_en            : std_logic;
signal mig_p4_cmd_clk           : std_logic;
signal mig_p4_cmd_en            : std_logic;
signal mig_p4_cmd_ra            : std_logic_vector(14 downto 0);
signal mig_p4_cmd_ba            : std_logic_vector(2 downto 0);
signal mig_p4_cmd_ca            : std_logic_vector(11 downto 0);

signal mig_p4_cmd_instr         : std_logic_vector(2 downto 0);
signal mig_p4_cmd_bl            : std_logic_vector(5 downto 0);
signal mig_p4_cmd_empty         : std_logic;
signal mig_p4_cmd_full          : std_logic;

signal mig_p5_arb_en            : std_logic;
signal mig_p5_cmd_clk           : std_logic;
signal mig_p5_cmd_en            : std_logic;
signal mig_p5_cmd_ra            : std_logic_vector(14 downto 0);
signal mig_p5_cmd_ba            : std_logic_vector(2 downto 0);
signal mig_p5_cmd_ca            : std_logic_vector(11 downto 0);

signal mig_p5_cmd_instr         : std_logic_vector(2 downto 0);
signal mig_p5_cmd_bl            : std_logic_vector(5 downto 0);
signal mig_p5_cmd_empty         : std_logic;
signal mig_p5_cmd_full          : std_logic;

signal mig_p0_wr_clk            : std_logic;
signal mig_p0_rd_clk            : std_logic;
signal mig_p1_wr_clk            : std_logic;
signal mig_p1_rd_clk            : std_logic;
signal mig_p2_clk               : std_logic;
signal mig_p3_clk               : std_logic;
signal mig_p4_clk               : std_logic;
signal mig_p5_clk               : std_logic;

signal mig_p0_wr_en             : std_logic;
signal mig_p0_rd_en             : std_logic;
signal mig_p1_wr_en             : std_logic;
signal mig_p1_rd_en             : std_logic;
signal mig_p2_en                : std_logic;
signal mig_p3_en                : std_logic;
signal mig_p4_en                : std_logic;
signal mig_p5_en                : std_logic;

signal mig_p0_wr_data           : std_logic_vector(31 downto 0);
signal mig_p1_wr_data           : std_logic_vector(31 downto 0);
signal mig_p2_wr_data           : std_logic_vector(31 downto 0);
signal mig_p3_wr_data           : std_logic_vector(31 downto 0);
signal mig_p4_wr_data           : std_logic_vector(31 downto 0);
signal mig_p5_wr_data           : std_logic_vector(31 downto 0);

signal mig_p0_wr_mask           : std_logic_vector(C_P0_MASK_SIZE - 1 downto 0);
signal mig_p1_wr_mask           : std_logic_vector(C_P1_MASK_SIZE - 1 downto 0);
signal mig_p2_wr_mask           : std_logic_vector(3 downto 0);
signal mig_p3_wr_mask           : std_logic_vector(3 downto 0);
signal mig_p4_wr_mask           : std_logic_vector(3 downto 0);
signal mig_p5_wr_mask           : std_logic_vector(3 downto 0);

signal mig_p0_rd_data           : std_logic_vector(31 downto 0);
signal mig_p1_rd_data           : std_logic_vector(31 downto 0);
signal mig_p2_rd_data           : std_logic_vector(31 downto 0);
signal mig_p3_rd_data           : std_logic_vector(31 downto 0);
signal mig_p4_rd_data           : std_logic_vector(31 downto 0);
signal mig_p5_rd_data           : std_logic_vector(31 downto 0);

signal mig_p0_rd_overflow       : std_logic;
signal mig_p1_rd_overflow       : std_logic;
signal mig_p2_overflow          : std_logic;
signal mig_p3_overflow          : std_logic;

signal mig_p4_overflow          : std_logic;
signal mig_p5_overflow          : std_logic;

signal mig_p0_wr_underrun       : std_logic;
signal mig_p1_wr_underrun       : std_logic;
signal mig_p2_underrun          : std_logic;
signal mig_p3_underrun          : std_logic;
signal mig_p4_underrun          : std_logic;
signal mig_p5_underrun          : std_logic;

signal mig_p0_rd_error          : std_logic;
signal mig_p0_wr_error          : std_logic;
signal mig_p1_rd_error          : std_logic;
signal mig_p1_wr_error          : std_logic;
signal mig_p2_error             : std_logic;
signal mig_p3_error             : std_logic;
signal mig_p4_error             : std_logic;
signal mig_p5_error             : std_logic;

signal mig_p0_wr_count          : std_logic_vector(6 downto 0);
signal mig_p1_wr_count          : std_logic_vector(6 downto 0);
signal mig_p0_rd_count          : std_logic_vector(6 downto 0);
signal mig_p1_rd_count          : std_logic_vector(6 downto 0);

signal mig_p2_count             : std_logic_vector(6 downto 0);
signal mig_p3_count             : std_logic_vector(6 downto 0);
signal mig_p4_count             : std_logic_vector(6 downto 0);
signal mig_p5_count             : std_logic_vector(6 downto 0);

signal mig_p0_wr_full           : std_logic;
signal mig_p1_wr_full           : std_logic;

signal mig_p0_rd_empty          : std_logic;
signal mig_p1_rd_empty          : std_logic;
signal mig_p0_wr_empty          : std_logic;
signal mig_p1_wr_empty          : std_logic;
signal mig_p0_rd_full           : std_logic;
signal mig_p1_rd_full           : std_logic;
signal mig_p2_full              : std_logic;
signal mig_p3_full              : std_logic;
signal mig_p4_full              : std_logic;
signal mig_p5_full              : std_logic;
signal mig_p2_empty             : std_logic;
signal mig_p3_empty             : std_logic;
signal mig_p4_empty             : std_logic;
signal mig_p5_empty             : std_logic;

-- SELFREESH control signal for suspend feature
signal selfrefresh_mcb_enter    : std_logic;
signal selfrefresh_mcb_mode     : std_logic;
signal selfrefresh_mode_sig     : std_logic;

signal MCB_SYSRST : std_logic;
signal ioclk0  : std_logic;
signal ioclk90 : std_logic;
signal hard_done_cal       : std_logic;
signal uo_data_int         : std_logic_vector(7 downto 0);
signal uo_data_valid_int   : std_logic;
signal uo_cmd_ready_in_int : std_logic;
signal syn_uiclk_pll_lock  : std_logic;
signal int_sys_rst         : std_logic;

--testing
signal ioi_drp_update : std_logic;
signal aux_sdi_sdo : std_logic_vector(7 downto 0);


   signal mcb_recal                : std_logic;
   signal mcb_ui_read              : std_logic;
   signal mcb_ui_add               : std_logic;
   signal mcb_ui_cs                : std_logic;
   signal mcb_ui_clk               : std_logic;
   signal mcb_ui_sdi               : std_logic;
   signal mcb_ui_addr              : STD_LOGIC_vector(4 downto 0);
   signal mcb_ui_broadcast         : std_logic;
   signal mcb_ui_drp_update        : std_logic;
   signal mcb_ui_done_cal          : std_logic;
   signal mcb_ui_cmd               : std_logic;
   signal mcb_ui_cmd_in            : std_logic;
   signal mcb_ui_cmd_en            : std_logic;
   signal mcb_ui_dqcount           : std_logic_vector(3 downto 0);
   signal mcb_ui_dq_lower_dec      : std_logic;
   signal mcb_ui_dq_lower_inc      : std_logic;
   signal mcb_ui_dq_upper_dec      : std_logic;
   signal mcb_ui_dq_upper_inc      : std_logic;
   signal mcb_ui_udqs_inc          : std_logic;
   signal mcb_ui_udqs_dec          : std_logic;
   signal mcb_ui_ldqs_inc          : std_logic;
   signal mcb_ui_ldqs_dec          : std_logic;
   signal DONE_SOFTANDHARD_CAL     : std_logic;

   signal ck_shiftout0_1           : std_logic;
   signal ck_shiftout0_2           : std_logic;
   signal ck_shiftout1_3           : std_logic;
   signal ck_shiftout1_4           : std_logic;

   signal udm_oq                   : std_logic;
   signal udm_t                    : std_logic;
   signal ldm_oq                   : std_logic;
   signal ldm_t                    : std_logic;
   signal dqsp_oq                  : std_logic;
   signal dqsp_tq                  : std_logic;
   signal dqs_shiftout0_1          : std_logic;
   signal dqs_shiftout0_2          : std_logic;
   signal dqs_shiftout1_3          : std_logic;
   signal dqs_shiftout1_4          : std_logic;
   signal dqsn_oq                  : std_logic;
   signal dqsn_tq                  : std_logic;
   signal udqsp_oq                 : std_logic;
   signal udqsp_tq                 : std_logic;
   signal udqs_shiftout0_1         : std_logic;
   signal udqs_shiftout0_2         : std_logic;
   signal udqs_shiftout1_3         : std_logic;
   signal udqs_shiftout1_4         : std_logic;
   signal udqsn_oq                 : std_logic;
   signal udqsn_tq                 : std_logic;
   signal aux_sdi_out_dqsp         : std_logic;
   signal aux_sdi_out_udqsp        : std_logic;
   signal aux_sdi_out_udqsn        : std_logic;
   signal aux_sdi_out_0            : std_logic;
   signal aux_sdi_out_1            : std_logic;
   signal aux_sdi_out_2            : std_logic;
   signal aux_sdi_out_3            : std_logic;
   signal aux_sdi_out_5            : std_logic;
   signal aux_sdi_out_6            : std_logic;
   signal aux_sdi_out_7            : std_logic;
   signal aux_sdi_out_9            : std_logic;
   signal aux_sdi_out_10           : std_logic;
   signal aux_sdi_out_11           : std_logic;
   signal aux_sdi_out_12           : std_logic;
   signal aux_sdi_out_13           : std_logic;
   signal aux_sdi_out_14           : std_logic;
   signal aux_sdi_out_15           : std_logic;
   signal aux_sdi_out_8            : std_logic;
   signal aux_sdi_out_dqsn         : std_logic;
   signal aux_sdi_out_4            : std_logic;
   signal aux_sdi_out_udm          : std_logic;
   signal aux_sdi_out_ldm          : std_logic;
   signal uo_cal_start_int         : std_logic;
 
   signal cke_train                : std_logic;
   signal dq_oq                    : std_logic_vector(C_NUM_DQ_PINS-1 downto 0);
   signal dq_tq                    : std_logic_vector(C_NUM_DQ_PINS-1 downto 0);

   signal p0_wr_full_i             : std_logic;
   signal p0_rd_empty_i            : std_logic;
   signal p1_wr_full_i             : std_logic;
   signal p1_rd_empty_i            : std_logic;
   signal pllclk1                  : std_logic_vector(1 downto 0);
   signal pllce1                   : std_logic_vector(1 downto 0);
   signal uo_refrsh_flag_xhdl23    : std_logic;
   signal uo_sdo_xhdl24            : STD_LOGIC;
   signal Max_Value_Cal_Error      : std_logic;
   signal uo_done_cal_sig          : std_logic;
   signal wait_200us_counter       : std_logic_vector(15 downto 0);
   signal cke_train_reg            : std_logic;        
   signal wait_200us_done_r1       : std_logic;
   signal wait_200us_done_r2       : std_logic;
   signal syn1_sys_rst             : std_logic;
   signal syn2_sys_rst             : std_logic;
   signal selfrefresh_enter_r1     : std_logic;
   signal selfrefresh_enter_r2     : std_logic;
   signal selfrefresh_enter_r3     : std_logic;
   signal gated_pll_lock           : std_logic;
   signal soft_cal_selfrefresh_req : std_logic;
   signal normal_operation_window  : std_logic;

   attribute max_fanout            : string;
   attribute syn_maxfan            : integer;
   attribute max_fanout of int_sys_rst : signal is "1";
   attribute syn_maxfan of int_sys_rst : signal is 1;

begin
   uo_cmd_ready_in   <= uo_cmd_ready_in_int;
   uo_data_valid     <= uo_data_valid_int;
   uo_data           <= uo_data_int;
   uo_refrsh_flag    <= uo_refrsh_flag_xhdl23;
   uo_sdo            <= uo_sdo_xhdl24;

   p0_wr_full        <= p0_wr_full_i;
   p0_rd_empty       <= p0_rd_empty_i;
   p1_wr_full        <= p1_wr_full_i;
   p1_rd_empty       <= p1_rd_empty_i;
   ioclk0            <= sysclk_2x;
   ioclk90           <= sysclk_2x_180;
   pllclk1           <= (ioclk90 & ioclk0);
   pllce1            <= (pll_ce_90 & pll_ce_0);

   -- Assign the output signals with corresponding intermediate signals
   uo_done_cal       <= uo_done_cal_sig;

   -- Added 2/22 - Add flop to pll_lock status signal to improve timing
   process (ui_clk)
   begin
      if (ui_clk'event and ui_clk = '1') then      
        if ((selfrefresh_enter = '0') and (gated_pll_lock = '0')) then
         syn_uiclk_pll_lock <= pll_lock;
        end if;
      end if;
   end process;               

   -- logic to determine if Memory  is SELFREFRESH mode operation or NORMAL  mode.
   process (ui_clk)
   begin
      if (ui_clk'event and ui_clk = '1') then      
        if (sys_rst = '1') then  
           normal_operation_window <= '1';
        elsif (selfrefresh_enter_r2 = '1' or selfrefresh_mode_sig = '1') then
           normal_operation_window <= '0';
        elsif ((selfrefresh_enter_r2 = '0') and  (selfrefresh_mode_sig = '0')) then
           normal_operation_window <= '1';
        else
           normal_operation_window <= normal_operation_window;
        end if;
      end if;
   end process;   
   
   
   process(normal_operation_window,pll_lock,syn_uiclk_pll_lock)
   begin
     if (normal_operation_window = '1') then
      gated_pll_lock <= pll_lock;
     else
      gated_pll_lock <= syn_uiclk_pll_lock;
     end if;
   end process;

-- int_sys_rst will be asserted if pll lose lock during normal operation.
-- It uses the syn_uiclk_pll_lock version when it is entering suspend window , hence
-- reset will not be generated. 

   int_sys_rst <=  sys_rst or not(gated_pll_lock);

-- synchronize the selfrefresh_enter 
   process (ui_clk)
   begin
      if (ui_clk'event and ui_clk = '1') then      
        if (sys_rst = '1') then
          selfrefresh_enter_r1 <= '0';
          selfrefresh_enter_r2 <= '0';
          selfrefresh_enter_r3 <= '0';
        else
          selfrefresh_enter_r1 <= selfrefresh_enter;
          selfrefresh_enter_r2 <= selfrefresh_enter_r1;
          selfrefresh_enter_r3 <= selfrefresh_enter_r2;
        end if;
      end if;
    end process;



--  The soft_cal_selfrefresh siganl is conditioned before connect to mcb_soft_calibration module.
--  It will not deassert selfrefresh_mcb_enter to MCB until input pll_lock reestablished in system.
--  This is to ensure the IOI stables before issued a selfrefresh exit command to dram.
   process (ui_clk)
   begin
      if (ui_clk'event and ui_clk = '1') then      
        if (sys_rst = '1') then
          soft_cal_selfrefresh_req <= '0';
        elsif (selfrefresh_enter_r3 = '1') then
          soft_cal_selfrefresh_req <= '1';
        elsif (selfrefresh_enter_r3 = '0' and pll_lock = '1') then 
          soft_cal_selfrefresh_req <= '0';
        else
          soft_cal_selfrefresh_req <= soft_cal_selfrefresh_req;
        end if;
      end if;
    end process;
  

--Address Remapping
-- Byte Address remapping
-- 
-- Bank Address[x:0] & Row Address[x:0]  & Column Address[x:0]
-- column address remap for port 0

x16_addr        : if(C_NUM_DQ_PINS = 16) generate  --  port bus remapping sections for CONFIG 2   15,3,12
x16_addr_rbc    : if (C_MEM_ADDR_ORDER = "ROW_BANK_COLUMN") generate -- C_MEM_ADDR_ORDER = 0 : Bank Row  Column

-- port 0 address remapping
                
 x16_p0_a15     : if (C_MEM_ADDR_WIDTH = 15) generate
                   p0_cmd_ra <= p0_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS downto C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);                         
                end generate;

 x16_p0_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate
                   p0_cmd_ra <= (allzero(14 downto C_MEM_ADDR_WIDTH) &  p0_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS downto C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS + 1)); 
                   end generate;
                      

 x16_p0_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                        p0_cmd_ba <= p0_cmd_byte_addr( C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS   downto   C_MEM_NUM_COL_BITS + 1);
                end generate;

 x16_p0_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p0_cmd_ba <=  (allzero(2 downto C_MEM_BANKADDR_WIDTH) & p0_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +   C_MEM_NUM_COL_BITS   downto  + C_MEM_NUM_COL_BITS + 1));
                end generate;

                
 x16_p0_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                        p0_cmd_ca <= p0_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1);
                end generate;

 x16_p0_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                        p0_cmd_ca <=  (allzero(12 downto C_MEM_NUM_COL_BITS + 1) & p0_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1));
                end generate;

-- port 1 address remapping
  
 x16_p1_a15     : if (C_MEM_ADDR_WIDTH = 15) generate  --Row  
                        p1_cmd_ra <=  p1_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);                         
                end generate;

 x16_p1_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row  
                        p1_cmd_ra <= (allzero(14 downto C_MEM_ADDR_WIDTH) &  p1_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS + 1));                            
                   end generate;
                      

 x16_p1_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                        p1_cmd_ba <= p1_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS   downto   C_MEM_NUM_COL_BITS + 1);
                end generate;

 x16_p1_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p1_cmd_ba <= (allzero(2 downto C_MEM_BANKADDR_WIDTH) & p1_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +   C_MEM_NUM_COL_BITS   downto  + C_MEM_NUM_COL_BITS + 1));

                end generate;

                
 x16_p1_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                        p1_cmd_ca <= p1_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1);

                end generate;

 x16_p1_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                        p1_cmd_ca <= (allzero(12 downto C_MEM_NUM_COL_BITS + 1) & p1_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1));

                end generate;

 -- port 2 address remapping
 x16_p2_a15     : if (C_MEM_ADDR_WIDTH = 15) generate --Row  
                         p2_cmd_ra <= p2_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);                         
                end generate;

 x16_p2_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row  
                         p2_cmd_ra <= (allzero(14 downto C_MEM_ADDR_WIDTH) &  p2_cmd_byte_addr (C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS + 1));                         
                   end generate;
                      

 x16_p2_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                         p2_cmd_ba <= p2_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS   downto   C_MEM_NUM_COL_BITS + 1);
                end generate;

 x16_p2_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                         p2_cmd_ba <= (allzero(2 downto C_MEM_BANKADDR_WIDTH) & p2_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +   C_MEM_NUM_COL_BITS   downto   C_MEM_NUM_COL_BITS + 1));
                end generate;

                
 x16_p2_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                         p2_cmd_ca <= p2_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1);

                end generate;

 x16_p2_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                         p2_cmd_ca <= (allzero(12 downto C_MEM_NUM_COL_BITS + 1) & p2_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1));

                end generate;
                

-- port 3 address remapping
 x16_p3_a15     : if (C_MEM_ADDR_WIDTH = 15) generate --Row  
                         p3_cmd_ra <= p3_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);                         

                end generate;

 x16_p3_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row  
                        p3_cmd_ra <= (allzero(14 downto C_MEM_ADDR_WIDTH) &  p3_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS + 1));                         
                   end generate;
                      

 x16_p3_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                         p3_cmd_ba <= p3_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS   downto   C_MEM_NUM_COL_BITS + 1);

                end generate;

 x16_p3_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                         p3_cmd_ba <= (allzero(2 downto C_MEM_BANKADDR_WIDTH) & p3_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +   C_MEM_NUM_COL_BITS   downto  + C_MEM_NUM_COL_BITS + 1));

                end generate;

                
 x16_p3_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                        p3_cmd_ca <= p3_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1);

                end generate;

 x16_p3_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                        p3_cmd_ca <= (allzero(12 downto C_MEM_NUM_COL_BITS +1 ) & p3_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1));
                end generate;
                
                


 -- port 4 address remapping
                
  x16_p4_a15    : if (C_MEM_ADDR_WIDTH = 15) generate --Row  
                        p4_cmd_ra <= p4_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);                         

                end generate;

 x16_p4_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row  
                        p4_cmd_ra <= (allzero(14 downto C_MEM_ADDR_WIDTH) &  p4_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS + 1));                         
                   end generate;
                      

 x16_p4_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                        p4_cmd_ba <= p4_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS   downto   C_MEM_NUM_COL_BITS + 1);
                end generate;

 x16_p4_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p4_cmd_ba <= (allzero(2 downto C_MEM_BANKADDR_WIDTH) & p4_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +   C_MEM_NUM_COL_BITS   downto  C_MEM_NUM_COL_BITS + 1));
                end generate;

                
 x16_p4_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                        p4_cmd_ca <= p4_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1);

                end generate;

 x16_p4_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                        p4_cmd_ca <= (allzero(12 downto C_MEM_NUM_COL_BITS +1)& p4_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1));
                end generate;
               


-- port 5 address remapping
  x16_p5_a15    : if (C_MEM_ADDR_WIDTH = 15) generate --Row  
                          p5_cmd_ra <= p5_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);                         
                end generate;

 x16_p5_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row  
                         p5_cmd_ra <= (allzero(14 downto C_MEM_ADDR_WIDTH) &  p5_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS + 1));                         
                   end generate;
                      

 x16_p5_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                        p5_cmd_ba <= p5_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS   downto   C_MEM_NUM_COL_BITS + 1);
                end generate;

 x16_p5_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                         p5_cmd_ba <= (allzero(2 downto C_MEM_BANKADDR_WIDTH) & p5_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +   C_MEM_NUM_COL_BITS   downto  + C_MEM_NUM_COL_BITS + 1));
                end generate;

                
 x16_p5_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                        p5_cmd_ca <= p5_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1);
                end generate;

 x16_p5_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                        p5_cmd_ca <= (allzero(12 downto C_MEM_NUM_COL_BITS+1) & p5_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1));
                end generate;
end generate;   --x16_addr_rbc            
                
x16_addr_rbc_n  : if (not(C_MEM_ADDR_ORDER = "ROW_BANK_COLUMN")) generate 
                
                
 -- port 0 address remapping

x16_rbc_n_p0_ba3 :  if (C_MEM_BANKADDR_WIDTH  = 3 ) generate  --Bank
                        p0_cmd_ba <= p0_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS  downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);
               end generate;

x16_rbc_n_p0_ba3_n :  if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate  --Bank
                        p0_cmd_ba <= (allzero(2 downto C_MEM_BANKADDR_WIDTH) & p0_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS  downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1));
               end generate;

x16_rbc_n_p0_a15 :  if (C_MEM_ADDR_WIDTH  = 15 ) generate  --row
                        p0_cmd_ra <= p0_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_NUM_COL_BITS + 1);                         
               end generate;

x16_rbc_n_p0_a15_n :  if (not(C_MEM_ADDR_WIDTH  = 15 )) generate  --row
                        p0_cmd_ra <= (allzero(14 downto C_MEM_ADDR_WIDTH) &  p0_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_NUM_COL_BITS + 1));                         
               end generate;

x16_rbc_n_p0_c12 :  if (C_MEM_NUM_COL_BITS  = 12 ) generate  --column
                        p0_cmd_ca <= p0_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1);

               end generate;

x16_rbc_n_p0_c12_n :  if (not(C_MEM_NUM_COL_BITS  = 12 )) generate  --column
                        p0_cmd_ca <= (allzero(12 downto C_MEM_NUM_COL_BITS+1)& p0_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1));
               end generate;
                

                


-- port 1 address remapping
 x16_rbc_n_p1_ba3 :  if (C_MEM_BANKADDR_WIDTH  = 3 ) generate  --Bank
                        p1_cmd_ba <= p1_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS  downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);
               end generate;

x16_rbc_n_p1_ba3_n :  if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate  --Bank
                        p1_cmd_ba <= (allzero(2 downto C_MEM_BANKADDR_WIDTH) & p1_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS  downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1));
               end generate;

x16_rbc_n_p1_a15 :  if (C_MEM_ADDR_WIDTH  = 15 ) generate  --row
                        p1_cmd_ra <= p1_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_NUM_COL_BITS + 1);                         
               end generate;

x16_rbc_n_p1_a15_n :  if (not(C_MEM_ADDR_WIDTH  = 15 )) generate  --row
                        p1_cmd_ra <= (allzero(14 downto C_MEM_ADDR_WIDTH) &  p1_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_NUM_COL_BITS + 1));                         
               end generate;

x16_rbc_n_p1_c12 :  if (C_MEM_NUM_COL_BITS  = 12 ) generate  --column
                        p1_cmd_ca <= p1_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1);
               end generate;

x16_rbc_n_p1_c12_n :  if (not(C_MEM_NUM_COL_BITS  = 12 )) generate  --column
                        p1_cmd_ca <= (allzero(12 downto C_MEM_NUM_COL_BITS+1) & p1_cmd_byte_addr(C_MEM_NUM_COL_BITS  downto 1));
               end generate;



 -- port 2 address remapping
x16_rbc_n_p2_ba3 :  if (C_MEM_BANKADDR_WIDTH  = 3 ) generate  --Bank
                        p2_cmd_ba <= p2_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS   downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);
               end generate;

x16_rbc_n_p2_ba3_n :  if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate  --Bank
                        p2_cmd_ba <= (allzero(2  downto C_MEM_BANKADDR_WIDTH) & p2_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS   downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1));

               end generate;

x16_rbc_n_p2_a15 :  if (C_MEM_ADDR_WIDTH  = 15 ) generate  --row
                        p2_cmd_ra <= p2_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS    downto C_MEM_NUM_COL_BITS + 1);                         

               end generate;

x16_rbc_n_p2_a15_n :  if (not(C_MEM_ADDR_WIDTH  = 15 )) generate  --row
                        p2_cmd_ra <= (allzero(14  downto C_MEM_ADDR_WIDTH) &  p2_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS    downto C_MEM_NUM_COL_BITS + 1));    
               end generate;

x16_rbc_n_p2_c12 :  if (C_MEM_NUM_COL_BITS  = 12 ) generate  --column
                        p2_cmd_ca <= p2_cmd_byte_addr(C_MEM_NUM_COL_BITS  downto 1);

               end generate;

x16_rbc_n_p2_c12_n :  if (not(C_MEM_NUM_COL_BITS  = 12 )) generate  --column
                        p2_cmd_ca <= (allzero( 12 downto C_MEM_NUM_COL_BITS +1)& p2_cmd_byte_addr(C_MEM_NUM_COL_BITS  downto 1));

               end generate;


 -- port 3 address remapping
x16_rbc_n_p3_ba3 :  if (C_MEM_BANKADDR_WIDTH  = 3 ) generate  --Bank
                        p3_cmd_ba <= p3_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS   downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);

               end generate;

x16_rbc_n_p3_ba3_n :  if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate  --Bank
                        p3_cmd_ba <= (allzero(2  downto C_MEM_BANKADDR_WIDTH) & p3_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS   downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1));

               end generate;

x16_rbc_n_p3_a15 :  if (C_MEM_ADDR_WIDTH  = 15 ) generate  --row
                        p3_cmd_ra <= p3_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS    downto C_MEM_NUM_COL_BITS + 1);                         

               end generate;

x16_rbc_n_p3_a15_n :  if (not(C_MEM_ADDR_WIDTH  = 15 )) generate  --row
                        p3_cmd_ra <= (allzero(14  downto C_MEM_ADDR_WIDTH) &  p3_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS    downto C_MEM_NUM_COL_BITS + 1));                         

               end generate;

x16_rbc_n_p3_c12 :  if (C_MEM_NUM_COL_BITS  = 12 ) generate  --column
                        p3_cmd_ca <= p3_cmd_byte_addr(C_MEM_NUM_COL_BITS  downto 1);

               end generate;

x16_rbc_n_p3_c12_n :  if (not(C_MEM_NUM_COL_BITS  = 12 )) generate  --column
                        p3_cmd_ca <= (allzero(12 downto C_MEM_NUM_COL_BITS +1)& p3_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1));

               end generate;


 -- port 4 address remapping
x16_rbc_n_p4_ba3 :  if (C_MEM_BANKADDR_WIDTH  = 3 ) generate  --Bank
                        p4_cmd_ba <= p4_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS  downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);

               end generate;

x16_rbc_n_p4_ba3_n :  if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate  --Bank
                        p4_cmd_ba <= (allzero(2 downto C_MEM_BANKADDR_WIDTH) & p4_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS  downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1));

               end generate;

x16_rbc_n_p4_a15 :  if (C_MEM_ADDR_WIDTH  = 15 ) generate  --row
                        p4_cmd_ra <= p4_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_NUM_COL_BITS + 1);                         

               end generate;

x16_rbc_n_p4_a15_n :  if (not(C_MEM_ADDR_WIDTH  = 15 )) generate  --row
                        p4_cmd_ra <= (allzero(14 downto C_MEM_ADDR_WIDTH) &  p4_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_NUM_COL_BITS + 1));                         
               end generate;

x16_rbc_n_p4_c12 :  if (C_MEM_NUM_COL_BITS  = 12 ) generate  --column
                        p4_cmd_ca <= p4_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1);

               end generate;

x16_rbc_n_p4_c12_n :  if (not(C_MEM_NUM_COL_BITS  = 12 )) generate  --column
                        p4_cmd_ca <= (allzero(12 downto C_MEM_NUM_COL_BITS +1) & p4_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1));

               end generate;

 -- port 5 address remapping
x16_rbc_n_p5_ba3 :  if (C_MEM_BANKADDR_WIDTH  = 3 ) generate  --Bank
                        p5_cmd_ba <= p5_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS  downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1);

               end generate;

x16_rbc_n_p5_ba3_n :  if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate  --Bank
                        p5_cmd_ba <= (allzero(2 downto C_MEM_BANKADDR_WIDTH) & p5_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS  downto C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS + 1));

               end generate;

x16_rbc_n_p5_a15 :  if (C_MEM_ADDR_WIDTH  = 15 ) generate  --row
                        p5_cmd_ra <= p5_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_NUM_COL_BITS + 1);                         
               end generate;

x16_rbc_n_p5_a15_n :  if (not(C_MEM_ADDR_WIDTH  = 15 )) generate  --row
                        p5_cmd_ra <= (allzero(14 downto C_MEM_ADDR_WIDTH) &  p5_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_NUM_COL_BITS   downto C_MEM_NUM_COL_BITS + 1));                         

               end generate;

x16_rbc_n_p5_c12 :  if (C_MEM_NUM_COL_BITS  = 12 ) generate  --column
                        p5_cmd_ca <= p5_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1);

               end generate;

x16_rbc_n_p5_c12_n :  if (not(C_MEM_NUM_COL_BITS  = 12 )) generate  --column
                        p5_cmd_ca <= (allzero(12 downto C_MEM_NUM_COL_BITS +1) & p5_cmd_byte_addr(C_MEM_NUM_COL_BITS downto 1));

               end generate;
 end generate;--x16_addr_rbc_n
end generate; --x16_addr






x8_addr : if(C_NUM_DQ_PINS = 8) generate
x8_addr_rbc     : if (C_MEM_ADDR_ORDER = "ROW_BANK_COLUMN") generate 
-- port 0 address remapping

x8_p0_a15       : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                           p0_cmd_ra <= p0_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS );

                end generate;

 x8_p0_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p0_cmd_ra <= (allzero(14  downto C_MEM_ADDR_WIDTH) & p0_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ));

                   end generate;
                      

 x8_p0_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                           p0_cmd_ba <= p0_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_NUM_COL_BITS );  --14,3,10

                end generate;

 x8_p0_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                           p0_cmd_ba <= (allzero(2  downto C_MEM_BANKADDR_WIDTH)&  
                                   p0_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto C_MEM_NUM_COL_BITS ));  --14,3,10

                end generate;

                
 x8_p0_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p0_cmd_ca(11 downto 0) <= p0_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_p0_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p0_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p0_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;


                 
                 
-- port 1 address remapping
 x8_p1_a15      : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                            p1_cmd_ra <= p1_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS );

                end generate;

 x8_p1_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p1_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p1_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ));

                   end generate;
                      

 x8_p1_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                            p1_cmd_ba <= p1_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto   C_MEM_NUM_COL_BITS );  --14,3,10

                end generate;

 x8_p1_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                            p1_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH)&  
                                   p1_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_NUM_COL_BITS ));  --14,3,10

                end generate;

                
 x8_p1_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p1_cmd_ca(11 downto 0) <= p1_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_p1_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                           p1_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p1_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;

                 
                
 -- port 2 address remapping
  x8_p2_a15     : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                             p2_cmd_ra <= p2_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS );

                end generate;

 x8_p2_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p2_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p2_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ));

                   end generate;
                      

 x8_p2_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                            p2_cmd_ba <= p2_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto   C_MEM_NUM_COL_BITS );  --14,3,10

                end generate;

 x8_p2_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                            p2_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH)&  
                                   p2_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_NUM_COL_BITS ));  --14,2,10  ***

                end generate;

                
 x8_p2_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p2_cmd_ca(11 downto 0) <= p2_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_p2_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p2_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p2_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;

                 


--   port 3 address remapping
 x8_p3_a15      : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                            p3_cmd_ra <= p3_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS );

                end generate;

 x8_p3_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p3_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p3_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ));

                   end generate;
                      

 x8_p3_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                            p3_cmd_ba <= p3_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto   C_MEM_NUM_COL_BITS );  --14,3,10

                end generate;

 x8_p3_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                            p3_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH)&  
                                   p3_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_NUM_COL_BITS ));  --14,3,10

                end generate;

                
 x8_p3_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p3_cmd_ca(11 downto 0) <= p3_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_p3_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p3_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p3_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;

                
--   port 4 address remapping
 x8_p4_a15      : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                            p4_cmd_ra <= p4_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS );

                end generate;

 x8_p4_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p4_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p4_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ));

                   end generate;
                      

 x8_p4_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                            p4_cmd_ba <= p4_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto   C_MEM_NUM_COL_BITS );  --14,3,10

                end generate;

 x8_p4_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                            p4_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH)&  
                                   p4_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_NUM_COL_BITS ));  --14,3,10

                end generate;

                
 x8_p4_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p4_cmd_ca(11 downto 0) <= p4_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_p4_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p4_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p4_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;

                  

 --   port 5 address remapping
  x8_p5_a15     : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                           p5_cmd_ra <= p5_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS );

                end generate;

 x8_p5_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p5_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p5_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ));

                   end generate;
                      

 x8_p5_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                            p5_cmd_ba <= p5_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto   C_MEM_NUM_COL_BITS );  --14,3,10

                end generate;

 x8_p5_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                            p5_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH)&  
                                   p5_cmd_byte_addr(C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_NUM_COL_BITS ));  --14,3,10

                end generate;

                
 x8_p5_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p5_cmd_ca(11 downto 0) <= p5_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_p5_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p5_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p5_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;
  end generate; --x8_addr_rbc


                 
x8_addr_rbc_n   : if (not(C_MEM_ADDR_ORDER = "ROW_BANK_COLUMN")) generate 
 -- port 0 address remapping
  x8_rbc_n_p0_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                             p0_cmd_ba <= p0_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS );  

                end generate;

 x8_rbc_n_p0_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                            p0_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH)&  
                                   p0_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ));  

                end generate;

 x8_rbc_n_p0_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                            p0_cmd_ra <= p0_cmd_byte_addr(C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1   downto   C_MEM_NUM_COL_BITS );

                end generate;

 x8_rbc_n_p0_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p0_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p0_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_NUM_COL_BITS ));                

                   end generate;

                
 x8_rbc_n_p0_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p0_cmd_ca(11 downto 0) <= p0_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_rbc_n_p0_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p0_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p0_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;


 -- port 1 address remapping
  x8_rbc_n_p1_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                             p1_cmd_ba <= p1_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS );  

                end generate;

 x8_rbc_n_p1_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                            p1_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH)&  
                                   p1_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ));  

                end generate;

 x8_rbc_n_p1_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                            p1_cmd_ra <= p1_cmd_byte_addr(C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1   downto   C_MEM_NUM_COL_BITS );

                end generate;

 x8_rbc_n_p1_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p1_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p1_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_NUM_COL_BITS ));

                   end generate;

                
 x8_rbc_n_p1_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p1_cmd_ca(11 downto 0) <= p1_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_rbc_n_p1_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p1_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p1_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;

                
--port 2 address remapping
 x8_rbc_n_p2_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                         p2_cmd_ba <= p2_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS );  

                end generate;

 x8_rbc_n_p2_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                         p2_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH)&  
                                        p2_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS  ));  

                end generate;

 x8_rbc_n_p2_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                            p2_cmd_ra <= p2_cmd_byte_addr(C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1   downto   C_MEM_NUM_COL_BITS );

                end generate;

 x8_rbc_n_p2_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p2_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p2_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_NUM_COL_BITS ));

                   end generate;

                
 x8_rbc_n_p2_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p2_cmd_ca(11 downto 0) <= p2_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_rbc_n_p2_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p2_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p2_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;


 -- port 3 address remapping
  x8_rbc_n_p3_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                             p3_cmd_ba <= p3_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS );  

                end generate;

 x8_rbc_n_p3_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                            p3_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH)&  
                                   p3_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ));  

                end generate;

 x8_rbc_n_p3_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                            p3_cmd_ra <= p3_cmd_byte_addr(C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1   downto   C_MEM_NUM_COL_BITS );

                end generate;

 x8_rbc_n_p3_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p3_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p3_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_NUM_COL_BITS ));

                   end generate;

                
 x8_rbc_n_p3_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p3_cmd_ca(11 downto 0) <= p3_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_rbc_n_p3_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p3_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p3_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;

   
   
--   port 4 address remapping
 x8_rbc_n_p4_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                            p4_cmd_ba <= p4_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS );  

                end generate;

 x8_rbc_n_p4_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p4_cmd_ba <= (allzero(2 downto C_MEM_BANKADDR_WIDTH) &  
                                   p4_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 downto C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ));  
                end generate;

 x8_rbc_n_p4_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                            p4_cmd_ra <= p4_cmd_byte_addr(C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1   downto   C_MEM_NUM_COL_BITS );

                end generate;

 x8_rbc_n_p4_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p4_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p4_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_NUM_COL_BITS ));

                   end generate;

                
 x8_rbc_n_p4_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p4_cmd_ca(11 downto 0) <= p4_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_rbc_n_p4_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p4_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p4_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;


--   port 5 address remapping
 x8_rbc_n_p5_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                            p5_cmd_ba <= p5_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS );  

                end generate;

 x8_rbc_n_p5_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                            p5_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH)&  
                                   p5_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  downto  C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ));  

                end generate;

 x8_rbc_n_p5_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                            p5_cmd_ra <= p5_cmd_byte_addr(C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1   downto   C_MEM_NUM_COL_BITS );

                end generate;

 x8_rbc_n_p5_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                            p5_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH) & p5_cmd_byte_addr(C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1   downto  C_MEM_NUM_COL_BITS ));

                   end generate;

                
 x8_rbc_n_p5_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                            p5_cmd_ca(11 downto 0) <= p5_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0);

                end generate;

 x8_rbc_n_p5_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                            p5_cmd_ca(11 downto 0) <= (allzero(11  downto  C_MEM_NUM_COL_BITS) & p5_cmd_byte_addr(C_MEM_NUM_COL_BITS - 1  downto  0));

                end generate;
  end generate; --x8_addr_rbc_n
 end generate;  --x8_addr
             








x4_addr : if(C_NUM_DQ_PINS = 4) generate
x4_addr_rbc     : if (C_MEM_ADDR_ORDER = "ROW_BANK_COLUMN") generate 

--   port 0 address remapping
x4_p0_a15       : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                      p0_cmd_ra <= p0_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1);

                end generate;

 x4_p0_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                       p0_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p0_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1));

                   end generate;
                      

 x4_p0_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                        p0_cmd_ba <=  p0_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1);

                end generate;

 x4_p0_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p0_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p0_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1));

                end generate;

                
 x4_p0_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                       p0_cmd_ca <= (p0_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');                                --14,3,11

                end generate;

 x4_p0_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                       p0_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p0_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');

                end generate;
               
           
--   port 1 address remapping
x4_p1_a15       : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                      p1_cmd_ra <= p1_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1);

                end generate;

 x4_p1_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                       p1_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p1_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1));

                   end generate;
                      

 x4_p1_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                        p1_cmd_ba <=  p1_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1);

                end generate;

 x4_p1_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p1_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p1_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1));

                end generate;

                
 x4_p1_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                       p1_cmd_ca <= (p1_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');                                --14,3,11

                end generate;

 x4_p1_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                       p1_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p1_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');

                end generate;


--   port 2 address remapping
x4_p2_a15       : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                      p2_cmd_ra <= p2_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1);

                end generate;

 x4_p2_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                       p2_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p2_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1));
                   end generate;
                      

 x4_p2_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                        p2_cmd_ba <=  p2_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1);

                end generate;

 x4_p2_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p2_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p2_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1));

                end generate;

                
 x4_p2_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                       p2_cmd_ca <= (p2_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');                                --14,3,11

                end generate;

 x4_p2_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                       p2_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p2_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');

                end generate;


--   port 3 address remapping
x4_p3_a15       : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                      p3_cmd_ra <= p3_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1);

                end generate;

 x4_p3_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                       p3_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p3_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1));

                   end generate;
                      

 x4_p3_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                        p3_cmd_ba <=  p3_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1);

                end generate;

 x4_p3_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p3_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p3_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1));

                end generate;

                
 x4_p3_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                       p3_cmd_ca <= (p3_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');                                --14,3,11

                end generate;

 x4_p3_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                       p3_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p3_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');

                end generate;




 

 x4_p4_p5:if(C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
             C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
             C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
             C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
             C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
             C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
             C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
             C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32" or
             C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
             C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
             C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
             C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32" or
             C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
             C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32" or
             C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32" or
             C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32"
             ) generate
--   port 4 address remapping
 
x4_p4_a15       : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                      p4_cmd_ra <= p4_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1);

                end generate;

x4_p4_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                      p4_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p4_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1));

                   end generate;
                      

x4_p4_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                       p4_cmd_ba <=  p4_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1);

                end generate;

x4_p4_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                       p4_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p4_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1));

                end generate;

                
x4_p4_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                      p4_cmd_ca <= (p4_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');                                --14,3,11

                end generate;

x4_p4_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                      p4_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p4_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');

                end generate;
--   port 5 address remapping
               

x4_p5_a15       : if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                      p5_cmd_ra <= p5_cmd_byte_addr(C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1);

                end generate;

x4_p5_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                      p5_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p5_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto  C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 1));

                   end generate;
                      

x4_p5_ba3 :       if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                       p5_cmd_ba <=  p5_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1);

                end generate;

x4_p5_ba3_n :   if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                       p5_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p5_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_NUM_COL_BITS - 2  downto   C_MEM_NUM_COL_BITS - 1));

                end generate;

                
x4_p5_ca12 :     if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                      p5_cmd_ca <= (p5_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');                                --14,3,11

                end generate;

x4_p5_ca12_n :     if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                      p5_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p5_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');

                end generate;
     end generate; --x4_p4_p5
 end generate; --x4_addr_rbc



              
x4_addr_rbc_n   : if (not(C_MEM_ADDR_ORDER = "ROW_BANK_COLUMN")) generate 
            
--   port 0 address remapping
  x4_rbc_n_p0_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                         p0_cmd_ba <=  p0_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1);
                end generate;

 x4_rbc_n_p0_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p0_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p0_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1));
                end generate;

 x4_rbc_n_p0_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                       p0_cmd_ra <= p0_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1);
                end generate;

 x4_rbc_n_p0_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                       p0_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p0_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1));
                   end generate;

                
 x4_rbc_n_p0_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                       p0_cmd_ca <= (p0_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');
                end generate;

 x4_rbc_n_p0_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                       p0_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p0_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');
                end generate;
               
           
--   port 1 address remapping
  x4_rbc_n_p1_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                         p1_cmd_ba <=  p1_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1);


                end generate;

 x4_rbc_n_p1_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p1_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p1_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1));

                end generate;

 x4_rbc_n_p1_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                       p1_cmd_ra <= p1_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1);


                end generate;

 x4_rbc_n_p1_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                       p1_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p1_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1));


                   end generate;

                
 x4_rbc_n_p1_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                       p1_cmd_ca <= (p1_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');


                end generate;

 x4_rbc_n_p1_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                       p1_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p1_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');


                end generate;
            
--   port 2 address remapping
  x4_rbc_n_p2_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                         p2_cmd_ba <=  p2_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1);


                end generate;

 x4_rbc_n_p2_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p2_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p2_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1));

                end generate;

 x4_rbc_n_p2_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                       p2_cmd_ra <= p2_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1);


                end generate;

 x4_rbc_n_p2_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                       p2_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p2_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1));


                   end generate;

                
 x4_rbc_n_p2_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                       p2_cmd_ca <= (p2_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');


                end generate;

 x4_rbc_n_p2_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                       p2_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p2_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');


                end generate;
            
--   port 3 address remapping
  x4_rbc_n_p3_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                         p3_cmd_ba <=  p3_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1);


                end generate;

 x4_rbc_n_p3_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p3_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p3_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1));

                end generate;

 x4_rbc_n_p3_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                       p3_cmd_ra <= p3_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1);


                end generate;

 x4_rbc_n_p3_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                       p3_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p3_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1));


                   end generate;

                
 x4_rbc_n_p3_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                       p3_cmd_ca <= (p3_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');


                end generate;

 x4_rbc_n_p3_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                       p3_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p3_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');


                end generate;
            

  x4_p4_p5_n:  if(C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
             C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
             C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
             C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
             C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
             C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
             C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
             C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32" or
             C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
             C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
             C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
             C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32" or
             C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
             C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32" or
             C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32" or
             C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32"
             ) generate
--   port 4 address remapping

  x4_rbc_n_p4_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                         p4_cmd_ba <=  p4_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1);


                end generate;

 x4_rbc_n_p4_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p4_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p4_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1));

                end generate;

 x4_rbc_n_p4_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                       p4_cmd_ra <= p4_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1);


                end generate;

 x4_rbc_n_p4_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                       p4_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p4_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1));


                   end generate;

                
 x4_rbc_n_p4_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                       p4_cmd_ca <= (p4_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');


                end generate;

 x4_rbc_n_p4_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                       p4_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p4_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');
               end generate;
            
 
--   port 5 address remapping

  x4_rbc_n_p5_ba3 :if (C_MEM_BANKADDR_WIDTH  = 3 ) generate --Bank
                         p5_cmd_ba <=  p5_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1);


                end generate;

 x4_rbc_n_p5_ba3_n :if (not(C_MEM_BANKADDR_WIDTH  = 3 )) generate --Bank
                        p5_cmd_ba <= (allzero(2  downto  C_MEM_BANKADDR_WIDTH ) & p5_cmd_byte_addr(C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1));

                end generate;

 x4_rbc_n_p5_a15: if (C_MEM_ADDR_WIDTH = 15) generate -- Row
                       p5_cmd_ra <= p5_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1);


                end generate;

 x4_rbc_n_p5_a15_n : if (not(C_MEM_ADDR_WIDTH = 15)) generate --Row
                       p5_cmd_ra <= (allzero(14  downto  C_MEM_ADDR_WIDTH ) & p5_cmd_byte_addr(C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2  downto  C_MEM_NUM_COL_BITS - 1));


                   end generate;

                
 x4_rbc_n_p5_ca12 : if (C_MEM_NUM_COL_BITS = 12)  generate --Column
                       p5_cmd_ca <= (p5_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');


                end generate;

 x4_rbc_n_p5_ca12_n : if (not(C_MEM_NUM_COL_BITS = 12))  generate --Column
                       p5_cmd_ca <= (allzero(11  downto  C_MEM_NUM_COL_BITS ) &  p5_cmd_byte_addr(C_MEM_NUM_COL_BITS - 2  downto  0) & '0');


                end generate;
            
end generate;  --x4_p4_p5_n

end generate; --x4_addr_rbc_n
end generate; --x4_addr




   --  if(C_PORT_CONFIG[183:160] == "B32") begin : u_config1_0
u_config1_0:   if(C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32"
      ) generate  

  --synthesis translate_off 
  -- PORT2
  process (p2_cmd_en,p2_cmd_instr)
  begin
    if((C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32") and 
      p2_cmd_en = '1' and  p2_cmd_instr(2) = '0' and p2_cmd_instr(0) = '1')  then
      report "ERROR - Invalid Command for write only port 2";
    end if;
  end process;

  process (p2_cmd_en,p2_cmd_instr)
  begin
    if((C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32") and 
      p2_cmd_en = '1' and  p2_cmd_instr(2) = '0' and p2_cmd_instr(0) = '0')  then
      report "ERROR - Invalid Command for read only port 2";
    end if;
  end process;

  -- PORT3
  process (p3_cmd_en,p3_cmd_instr)
  begin
    if((C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32") and 
      p3_cmd_en = '1' and  p3_cmd_instr(2) = '0' and p3_cmd_instr(0) = '1')  then
      report "ERROR - Invalid Command for write only port 3";
    end if;
  end process;

  process (p3_cmd_en,p3_cmd_instr)
  begin
    if((C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32") and 
      p3_cmd_en = '1' and  p3_cmd_instr(2) = '0' and p3_cmd_instr(0) = '0')  then
      report "ERROR - Invalid Command for read only port 3";
    end if;
  end process;

  -- PORT4
  process (p4_cmd_en,p4_cmd_instr)
  begin
    if((C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32") and 
      p4_cmd_en = '1' and  p4_cmd_instr(2) = '0' and p4_cmd_instr(0) = '1')  then
      report "ERROR - Invalid Command for write only port 4";
    end if;
  end process;

  process (p4_cmd_en,p4_cmd_instr)
  begin
    if((C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32") and 
      p4_cmd_en = '1' and  p4_cmd_instr(2) = '0' and p4_cmd_instr(0) = '0')  then
      report "ERROR - Invalid Command for read only port 4";
    end if;
  end process;

  -- PORT5
  process (p5_cmd_en,p5_cmd_instr)
  begin
    if((C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32") and 
      p5_cmd_en = '1' and  p5_cmd_instr(2) = '0' and p5_cmd_instr(0) = '1')  then
      report "ERROR - Invalid Command for write only port 5";
    end if;
  end process;

  process (p5_cmd_en,p5_cmd_instr)
  begin
    if((C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32") and 
      p5_cmd_en = '1' and  p5_cmd_instr(2) = '0' and p5_cmd_instr(0) = '0')  then
      report "ERROR - Invalid Command for read only port 5";
    end if;
  end process;



 
   --synthesis translate_on 
 

 -- the local declaration of input port signals doesn't work.  The mig_p1_xxx through mig_p5_xxx always ends up
 -- high Z even though there are signals on p1_cmd_xxx through p5_cmd_xxxx.
 -- The only solutions that I have is to have MIG tool remove the entire internal codes that doesn't belongs to the Configuration..
 --

              -- Inputs from Application CMD Port

   p0_cmd_ena:  if (C_PORT_ENABLE(0) = '1') generate

                    mig_p0_arb_en      <=      p0_arb_en ;
                    mig_p0_cmd_clk     <=      p0_cmd_clk  ;
                    mig_p0_cmd_en      <=      p0_cmd_en   ;
                    mig_p0_cmd_ra      <=      p0_cmd_ra  ;
                    mig_p0_cmd_ba      <=      p0_cmd_ba   ;
                    mig_p0_cmd_ca      <=      p0_cmd_ca  ;
                    mig_p0_cmd_instr   <=      p0_cmd_instr;
                    mig_p0_cmd_bl      <=      ((p0_cmd_instr(2) or p0_cmd_bl(5)) & p0_cmd_bl(4 downto 0))  ;
                    p0_cmd_empty       <=      mig_p0_cmd_empty;
                    p0_cmd_full        <=      mig_p0_cmd_full ;
   end generate;   
   
      p0_cmd_dis:  if (C_PORT_ENABLE(0) = '0') generate
                    mig_p0_arb_en      <=     '0';
                    mig_p0_cmd_clk     <=     '0';
                    mig_p0_cmd_en      <=     '0';
                    mig_p0_cmd_ra      <=     (others => '0');
                    mig_p0_cmd_ba      <=     (others => '0');
                    mig_p0_cmd_ca      <=     (others => '0');
                    mig_p0_cmd_instr   <=     (others => '0');
                    mig_p0_cmd_bl      <=     (others => '0');
                    p0_cmd_empty       <=     '0';
                    p0_cmd_full        <=     '0';
                   
   end generate;   
               
   p1_cmd_ena:  if (C_PORT_ENABLE(1) = '1') generate
                    mig_p1_arb_en      <=      p1_arb_en ;
                    mig_p1_cmd_clk     <=      p1_cmd_clk  ;
                    mig_p1_cmd_en      <=      p1_cmd_en   ;
                    mig_p1_cmd_ra      <=      p1_cmd_ra  ;
                    mig_p1_cmd_ba      <=      p1_cmd_ba   ;
                    mig_p1_cmd_ca      <=      p1_cmd_ca  ;
                    mig_p1_cmd_instr   <=      p1_cmd_instr;
                    mig_p1_cmd_bl      <=      ((p1_cmd_instr(2) or p1_cmd_bl(5)) & p1_cmd_bl(4 downto 0))  ;                           
                    p1_cmd_empty       <=      mig_p1_cmd_empty;
                    p1_cmd_full        <=      mig_p1_cmd_full ;
   end generate;   
                   
   p1_cmd_dis:  if (C_PORT_ENABLE(1) = '0') generate
   
                   mig_p1_arb_en      <=     '0';
                    mig_p1_cmd_clk     <=     '0';
                    mig_p1_cmd_en      <=     '0';
                    mig_p1_cmd_ra      <=     (others => '0');
                    mig_p1_cmd_ba      <=     (others => '0');
                    mig_p1_cmd_ca      <=     (others => '0');
                    mig_p1_cmd_instr   <=     (others => '0');
                    mig_p1_cmd_bl      <=     (others => '0');
                    p1_cmd_empty       <=      '0';
                    p1_cmd_full        <=      '0';
   end generate;                      

               
   p2_cmd_ena:  if (C_PORT_ENABLE(2) = '1') generate
                    mig_p2_arb_en      <=      p2_arb_en ;
                    mig_p2_cmd_clk     <=      p2_cmd_clk  ;
                    mig_p2_cmd_en      <=      p2_cmd_en   ;
                    mig_p2_cmd_ra      <=      p2_cmd_ra  ;
                    mig_p2_cmd_ba      <=      p2_cmd_ba   ;
                    mig_p2_cmd_ca      <=      p2_cmd_ca  ;
                    mig_p2_cmd_instr   <=      p2_cmd_instr;
                    mig_p2_cmd_bl      <=      ((p2_cmd_instr(2) or p2_cmd_bl(5)) & p2_cmd_bl(4 downto 0))  ;                           

                    p2_cmd_empty   <=      mig_p2_cmd_empty;
                    p2_cmd_full    <=      mig_p2_cmd_full ;
    end generate;   
                   
   p2_cmd_dis:  if (C_PORT_ENABLE(2) = '0') generate
                    mig_p2_arb_en      <=       '0';
                    mig_p2_cmd_clk      <=       '0';
                    mig_p2_cmd_en      <=       '0';
                    mig_p2_cmd_ra      <=      (others => '0');
                    mig_p2_cmd_ba      <=      (others => '0');
                    mig_p2_cmd_ca      <=      (others => '0');
                    mig_p2_cmd_instr   <=      (others => '0');
                    mig_p2_cmd_bl      <=      (others => '0');
                    p2_cmd_empty      <=       '0';
                    p2_cmd_full      <=       '0';
    end generate;   
               
   p3_cmd_ena:  if (C_PORT_ENABLE(3) = '1') generate

                    mig_p3_arb_en    <=        p3_arb_en ;
                    mig_p3_cmd_clk     <=      p3_cmd_clk  ;
                    mig_p3_cmd_en      <=      p3_cmd_en   ;
                    mig_p3_cmd_ra      <=      p3_cmd_ra  ;
                    mig_p3_cmd_ba      <=      p3_cmd_ba   ;
                    mig_p3_cmd_ca      <=      p3_cmd_ca  ;
                    mig_p3_cmd_instr   <=      p3_cmd_instr;
                    mig_p3_cmd_bl      <=      ((p3_cmd_instr(2) or p3_cmd_bl(5)) & p3_cmd_bl(4 downto 0))  ;                           
                    p3_cmd_empty   <=      mig_p3_cmd_empty;
                    p3_cmd_full    <=      mig_p3_cmd_full ;
     end generate;   
                   
   p3_cmd_dis:  if (C_PORT_ENABLE(3) = '0') generate
                    mig_p3_arb_en    <=       '0';
                    mig_p3_cmd_clk     <=     '0';
                    mig_p3_cmd_en      <=     '0';
                    mig_p3_cmd_ra      <=     (others => '0');
                    mig_p3_cmd_ba      <=     (others => '0');
                    mig_p3_cmd_ca      <=     (others => '0');
                    mig_p3_cmd_instr   <=     (others => '0');
                    mig_p3_cmd_bl      <=     (others => '0');
                    p3_cmd_empty      <=       '0';
                    p3_cmd_full    <=     '0';
     end generate;   

               
    p4_cmd_ena: if (C_PORT_ENABLE(4) = '1') generate

                    mig_p4_arb_en    <=        p4_arb_en ;
                    mig_p4_cmd_clk     <=      p4_cmd_clk  ;
                    mig_p4_cmd_en      <=      p4_cmd_en   ;
                    mig_p4_cmd_ra      <=      p4_cmd_ra  ;
                    mig_p4_cmd_ba      <=      p4_cmd_ba   ;
                    mig_p4_cmd_ca      <=      p4_cmd_ca  ;
                    mig_p4_cmd_instr   <=      p4_cmd_instr;
                    mig_p4_cmd_bl      <= ((p4_cmd_instr(2) or p4_cmd_bl(5)) & p4_cmd_bl(4 downto 0))  ;                           

                    p4_cmd_empty   <=      mig_p4_cmd_empty;
                    p4_cmd_full    <=      mig_p4_cmd_full ;
end generate;

    p4_cmd_dis: if (C_PORT_ENABLE(4) = '0') generate

                    mig_p4_arb_en      <=       '0';
                    mig_p4_cmd_clk      <=       '0';
                    mig_p4_cmd_en      <=       '0';
                    mig_p4_cmd_ra      <=      (others => '0');
                    mig_p4_cmd_ba      <=      (others => '0');
                    mig_p4_cmd_ca      <=      (others => '0');
                    mig_p4_cmd_instr   <=      (others => '0');
                    mig_p4_cmd_bl      <=      (others => '0');
                    p4_cmd_empty      <=       '0';
                    p4_cmd_full    <=      '0';
end generate;
                   
    p5_cmd_ena: if (C_PORT_ENABLE(5) = '1') generate
                     mig_p5_arb_en    <=     p5_arb_en ;
                     mig_p5_cmd_clk   <=     p5_cmd_clk  ;
                     mig_p5_cmd_en    <=     p5_cmd_en   ;
                     mig_p5_cmd_ra    <=     p5_cmd_ra  ;
                     mig_p5_cmd_ba    <=     p5_cmd_ba   ;
                     mig_p5_cmd_ca    <=     p5_cmd_ca  ;
                     mig_p5_cmd_instr <=     p5_cmd_instr;
                     mig_p5_cmd_bl    <= ((p5_cmd_instr(2) or p5_cmd_bl(5)) & p5_cmd_bl(4 downto 0))  ;                           

                    p5_cmd_empty   <=     mig_p5_cmd_empty;
                    p5_cmd_full    <=     mig_p5_cmd_full ;
                   
end generate;

    p5_cmd_dis: if (C_PORT_ENABLE(5) = '0') generate

                     mig_p5_arb_en     <=   '0';
                     mig_p5_cmd_clk    <=   '0';
                     mig_p5_cmd_en     <=   '0';
                     mig_p5_cmd_ra     <=   (others => '0');
                     mig_p5_cmd_ba     <=   (others => '0');
                     mig_p5_cmd_ca     <=   (others => '0');
                    mig_p5_cmd_instr   <=   (others => '0');
                    mig_p5_cmd_bl      <=   (others => '0');
                    p5_cmd_empty      <=       '0';
                    p5_cmd_full    <=     '0';
end generate;



p0_wr_rd_ena:  if (C_PORT_ENABLE(0) = '1') generate
                 mig_p0_wr_clk   <= p0_wr_clk;
                 mig_p0_rd_clk   <= p0_rd_clk;
                 mig_p0_wr_en    <= p0_wr_en;
                 mig_p0_rd_en    <= p0_rd_en;
                 mig_p0_wr_mask  <= p0_wr_mask(3 downto 0);
                 mig_p0_wr_data  <= p0_wr_data(31 downto 0);
                 p0_rd_data        <= mig_p0_rd_data;
                 p0_rd_full        <= mig_p0_rd_full;
                 p0_rd_empty_i       <= mig_p0_rd_empty;
                 p0_rd_error       <= mig_p0_rd_error;
                 p0_wr_error       <= mig_p0_wr_error;
                 p0_rd_overflow    <= mig_p0_rd_overflow;
                 p0_wr_underrun    <= mig_p0_wr_underrun;
                 p0_wr_empty       <= mig_p0_wr_empty;
                 p0_wr_full_i        <= mig_p0_wr_full;
                 p0_wr_count       <= mig_p0_wr_count;
                 p0_rd_count       <= mig_p0_rd_count  ; 
end generate;                
p0_wr_rd_dis:  if (C_PORT_ENABLE(0) = '0') generate
                 mig_p0_wr_clk     <= '0';
                 mig_p0_rd_clk     <= '0';
                 mig_p0_wr_en      <= '0';
                 mig_p0_rd_en      <= '0';
                 mig_p0_wr_mask    <= (others => '0');
                 mig_p0_wr_data    <= (others => '0');
                 p0_rd_data        <= (others => '0');
                 p0_rd_full        <= '0';
                 p0_rd_empty_i       <= '0';
                 p0_rd_error       <= '0';
                 p0_wr_error       <= '0';
                 p0_rd_overflow    <= '0';
                 p0_wr_underrun    <= '0';
                 p0_wr_empty       <= '0';
                 p0_wr_full_i        <= '0';
                 p0_wr_count       <= (others => '0');
                 p0_rd_count       <= (others => '0');
end generate;                  
              
p1_wr_rd_ena:  if (C_PORT_ENABLE(1) = '1') generate
              
                 mig_p1_wr_clk   <= p1_wr_clk;
                 mig_p1_rd_clk   <= p1_rd_clk;                
                 mig_p1_wr_en    <= p1_wr_en;
                 mig_p1_wr_mask  <= p1_wr_mask(3 downto 0);                
                 mig_p1_wr_data  <= p1_wr_data(31 downto 0);
                 mig_p1_rd_en    <= p1_rd_en;
                 p1_rd_data     <= mig_p1_rd_data;
                 p1_rd_empty_i    <= mig_p1_rd_empty;
                 p1_rd_full     <= mig_p1_rd_full;
                 p1_rd_error    <= mig_p1_rd_error;
                 p1_wr_error    <= mig_p1_wr_error;
                 p1_rd_overflow <= mig_p1_rd_overflow;
                 p1_wr_underrun    <= mig_p1_wr_underrun;
                 p1_wr_empty    <= mig_p1_wr_empty;
                 p1_wr_full_i    <= mig_p1_wr_full;
                 p1_wr_count  <= mig_p1_wr_count;
                 p1_rd_count  <= mig_p1_rd_count  ; 
                
end generate;                
p1_wr_rd_dis:  if (C_PORT_ENABLE(1) = '0') generate
              
                 mig_p1_wr_clk   <= '0';
                 mig_p1_rd_clk   <= '0';           
                 mig_p1_wr_en    <= '0';
                 mig_p1_wr_mask  <= (others => '0');          
                 mig_p1_wr_data  <= (others => '0');
                 mig_p1_rd_en    <= '0';
                 p1_rd_data     <=  (others => '0');
                 p1_rd_empty_i    <=  '0';
                 p1_rd_full     <=  '0';
                 p1_rd_error    <=  '0';
                 p1_wr_error    <=  '0';
                 p1_rd_overflow <=  '0';
                 p1_wr_underrun <=  '0';
                 p1_wr_empty    <=  '0';
                 p1_wr_full_i     <=  '0';
                 p1_wr_count    <=  (others => '0');
                 p1_rd_count    <=  (others => '0');
end generate;                  
end generate;
                
                


--whenever PORT 2 is in Write mode     
--      xhdl272 : IF (C_PORT_CONFIG(23 downto 21) = "B32" AND C_PORT_CONFIG(15 downto 13) = "W32") GENERATE
--u_config1_2W: if(C_PORT_CONFIG(183 downto 160) = "B32" and C_PORT_CONFIG(119 downto 96) = "W32") generate

u_config1_2W: if(    C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32"
  ) generate

p2_wr_ena:    if (C_PORT_ENABLE(2) = '1') generate
                        mig_p2_clk      <= p2_wr_clk;
                        mig_p2_wr_data  <= p2_wr_data(31 downto 0);
                        mig_p2_wr_mask  <= p2_wr_mask(3 downto 0);
                        mig_p2_en       <= p2_wr_en;-- this signal will not shown up if the port 5 is for read dir
                        p2_wr_error     <= mig_p2_error;                       
                        p2_wr_full      <= mig_p2_full;
                        p2_wr_empty     <= mig_p2_empty;
                        p2_wr_underrun  <= mig_p2_underrun;
                        p2_wr_count     <= mig_p2_count  ;-- wr port
 end generate;                      
p2_wr_dis:    if (C_PORT_ENABLE(2) = '0') generate
                        mig_p2_clk      <= '0';
                        mig_p2_wr_data  <= (others => '0');
                        mig_p2_wr_mask  <= (others => '0');
                        mig_p2_en       <= '0';
                        p2_wr_error     <= '0';
                        p2_wr_full      <= '0';
                        p2_wr_empty     <= '0';
                        p2_wr_underrun  <= '0';
                        p2_wr_count     <= (others => '0');
end generate;                                                
                    p2_rd_data        <= (others => '0');
                    p2_rd_overflow    <= '0';
                    p2_rd_error       <= '0';
                    p2_rd_full        <= '0';
                    p2_rd_empty       <= '0';
                    p2_rd_count       <= (others => '0');
--                   p2_rd_error       <= '0';
 end generate;                      
--u_config1_2R: if(C_PORT_CONFIG(183 downto 160) = "B32" and C_PORT_CONFIG(119 downto 96) = "R32") generate
                         
u_config1_2R: if(C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32" ) generate

 p2_rd_ena :  if (C_PORT_ENABLE(2) = '1') generate
                        mig_p2_clk        <= p2_rd_clk;
                        p2_rd_data        <= mig_p2_rd_data;
                        mig_p2_en         <= p2_rd_en;  
                        p2_rd_overflow    <= mig_p2_overflow;
                        p2_rd_error       <= mig_p2_error;
                        p2_rd_full        <= mig_p2_full;
                        p2_rd_empty       <= mig_p2_empty;
                        p2_rd_count       <= mig_p2_count  ;-- wr port
 end generate;                      
 p2_rd_dis :  if (C_PORT_ENABLE(2) = '0') generate
                        mig_p2_clk        <= '0';
                        p2_rd_data        <= (others => '0');
                        mig_p2_en         <= '0';
                       
                        p2_rd_overflow    <= '0';
                        p2_rd_error       <= '0';
                        p2_rd_full        <= '0';
                        p2_rd_empty       <= '0';
                        p2_rd_count       <= (others => '0');
 end generate;                      
                   mig_p2_wr_data  <= (others => '0');
                   mig_p2_wr_mask  <= (others => '0');
                   p2_wr_error     <= '0';
                   p2_wr_full      <= '0';
                   p2_wr_empty     <= '0';
                   p2_wr_underrun  <= '0';
                   p2_wr_count     <= (others => '0');
          
 end generate;                      
--u_config1_3W: if(C_PORT_CONFIG(183 downto 160) = "B32" and C_PORT_CONFIG(87 downto 64)  = "W32") generate --whenever PORT 3 is in Write mode         

u_config1_3W: if(
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32") generate --whenever PORT 3 is in Write mode         

p3_wr_ena:  if (C_PORT_ENABLE(3) = '1')generate

                        mig_p3_clk   <= p3_wr_clk;
                        mig_p3_wr_data  <= p3_wr_data(31 downto 0);
                        mig_p3_wr_mask  <= p3_wr_mask(3 downto 0);
                        mig_p3_en       <= p3_wr_en; 
                        p3_wr_full      <= mig_p3_full;
                        p3_wr_empty     <= mig_p3_empty;
                        p3_wr_underrun  <= mig_p3_underrun;
                        p3_wr_count     <= mig_p3_count  ;-- wr port
                        p3_wr_error     <= mig_p3_error;
 end generate;                      
                       
p3_wr_dis:  if (C_PORT_ENABLE(3) = '0')generate
                        mig_p3_clk      <= '0';
                        mig_p3_wr_data  <= (others => '0');
                        mig_p3_wr_mask  <= (others => '0');
                        mig_p3_en      <= '0';
                        p3_wr_full      <= '0';
                        p3_wr_empty     <= '0';
                        p3_wr_underrun  <=  '0';
                        p3_wr_count     <= (others => '0');
                        p3_wr_error     <= '0';
                                                
 end generate;                      
                    p3_rd_overflow <= '0';
                    p3_rd_error    <= '0';
                    p3_rd_full     <= '0';
                    p3_rd_empty    <= '0';
                    p3_rd_count    <= (others => '0');
                    p3_rd_data     <= (others => '0');
 end generate;                      
                       
u_config1_3R : if(      
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32") generate
       
p3_rd_ena: if (C_PORT_ENABLE(3) = '1') generate

                        mig_p3_clk     <= p3_rd_clk;
                        p3_rd_data     <= mig_p3_rd_data;                
                        mig_p3_en      <= p3_rd_en; -- this signal will not shown up if the port 5 is for write dir
                        p3_rd_overflow <= mig_p3_overflow;
                        p3_rd_error    <= mig_p3_error;
                        p3_rd_full     <= mig_p3_full;
                        p3_rd_empty    <= mig_p3_empty;
                        p3_rd_count    <= mig_p3_count  ;-- wr port
 end generate;                      
p3_rd_dis: if (C_PORT_ENABLE(3) = '0') generate
                        mig_p3_clk     <= '0';
                        mig_p3_en      <= '0';
                        p3_rd_overflow <= '0';
                        p3_rd_full     <= '0';
                        p3_rd_empty    <= '0';
                        p3_rd_count    <= (others => '0');
                        p3_rd_error    <= '0';
                        p3_rd_data     <= (others => '0');
 end generate;                      
                   p3_wr_full      <= '0';
                   p3_wr_empty     <= '0';
                   p3_wr_underrun  <=  '0';
                   p3_wr_count     <= (others => '0');
                   p3_wr_error     <= '0';
                   mig_p3_wr_data  <= (others => '0');
                   mig_p3_wr_mask  <= (others => '0');
 end generate;   
 

u_config1_4W: if(      
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32") generate
      -- whenever PORT 4 is in Write mode       

p4_wr_ena : if (C_PORT_ENABLE(4) = '1') generate
                        mig_p4_clk      <= p4_wr_clk;
                        mig_p4_wr_data  <= p4_wr_data(31 downto 0);
                        mig_p4_wr_mask  <= p4_wr_mask(3 downto 0);
                        mig_p4_en       <= p4_wr_en;-- this signal will not shown up if the port 5 is for read dir
                        p4_wr_full      <= mig_p4_full;
                        p4_wr_empty     <= mig_p4_empty;
                        p4_wr_underrun  <= mig_p4_underrun;
                        p4_wr_count     <= mig_p4_count  ;-- wr port
                        p4_wr_error     <= mig_p4_error;
 end generate;   

p4_wr_dis : if (C_PORT_ENABLE(4) = '0') generate
                        mig_p4_clk      <= '0';
                        mig_p4_wr_data  <= (others => '0');
                        mig_p4_wr_mask  <= (others => '0');
                        mig_p4_en      <= '0';
                        p4_wr_full      <= '0';
                        p4_wr_empty     <= '0';
                        p4_wr_underrun  <=  '0';
                        p4_wr_count     <= (others => '0');
                        p4_wr_error     <= '0';
 end generate;   

                    p4_rd_overflow    <= '0';
                    p4_rd_error       <= '0';
                    p4_rd_full        <=  '0';
                    p4_rd_empty       <= '0';
                    p4_rd_count       <= (others => '0');
                    p4_rd_data        <= (others => '0');
 end generate;   

u_config1_4R : if(      
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32") generate
                       
p4_rd_ena: if (C_PORT_ENABLE(4) = '1') generate
                        mig_p4_clk        <= p4_rd_clk;
                        p4_rd_data        <= mig_p4_rd_data;                
                        mig_p4_en         <= p4_rd_en; -- this signal will not shown up if the port 5 is for write dir
                        p4_rd_overflow    <= mig_p4_overflow;
                        p4_rd_error       <= mig_p4_error;
                        p4_rd_full        <= mig_p4_full;
                        p4_rd_empty       <= mig_p4_empty;
                        p4_rd_count       <= mig_p4_count  ;-- wr port
 end generate;   
p4_rd_dis: if (C_PORT_ENABLE(4) = '0') generate
                        mig_p4_clk        <= '0';
                        p4_rd_data        <= (others => '0');
                        mig_p4_en         <= '0';
                        p4_rd_overflow    <= '0';
                        p4_rd_error       <= '0';
                        p4_rd_full        <=  '0';
                        p4_rd_empty       <= '0';
                        p4_rd_count       <= (others => '0');
 end generate;   
                   p4_wr_full      <= '0';
                   p4_wr_empty     <= '0';
                   p4_wr_underrun  <=  '0';
                   p4_wr_count     <= (others => '0');
                   p4_wr_error     <= '0';
                   mig_p4_wr_data  <= (others => '0');
                   mig_p4_wr_mask  <= (others => '0');
 end generate;   
         
u_config1_5W: if(      
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_W32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_W32") generate
      -- whenever PORT 5 is in Write mode           

                       
p5_wr_ena: if (C_PORT_ENABLE(5) = '1') generate
                        mig_p5_clk   <= p5_wr_clk;
                        mig_p5_wr_data  <= p5_wr_data(31 downto 0);
                        mig_p5_wr_mask  <= p5_wr_mask(3 downto 0);
                        mig_p5_en       <= p5_wr_en; 
                        p5_wr_full      <= mig_p5_full;
                        p5_wr_empty     <= mig_p5_empty;
                        p5_wr_underrun  <= mig_p5_underrun;
                        p5_wr_count     <= mig_p5_count  ; 
                        p5_wr_error     <= mig_p5_error;
                       
end generate;
p5_wr_dis: if (C_PORT_ENABLE(5) = '0') generate
                        mig_p5_clk      <= '0';
                        mig_p5_wr_data  <= (others => '0');
                        mig_p5_wr_mask  <= (others => '0');
                        mig_p5_en      <= '0';
                        p5_wr_full      <= '0';
                        p5_wr_empty     <= '0';
                        p5_wr_underrun  <=  '0';
                        p5_wr_count     <= (others => '0');
                        p5_wr_error     <= '0';
end generate;
                    p5_rd_data        <= (others => '0');
                    p5_rd_overflow    <= '0';
                    p5_rd_error       <= '0';
                    p5_rd_full        <=  '0';
                    p5_rd_empty       <= '0';
                    p5_rd_count       <= (others => '0');
end generate;                  
       
                       
                         
u_config1_5R :if(  
      C_PORT_CONFIG = "B32_B32_R32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_R32_W32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_R32_W32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_R32_R32" or
      C_PORT_CONFIG = "B32_B32_W32_W32_W32_R32") generate

p5_rd_ena:if (C_PORT_ENABLE(5) = '1')generate
                        mig_p5_clk        <= p5_rd_clk;
                        p5_rd_data        <= mig_p5_rd_data;                
                        mig_p5_en         <= p5_rd_en;  
                        p5_rd_overflow    <= mig_p5_overflow;
                        p5_rd_error       <= mig_p5_error;
                        p5_rd_full        <= mig_p5_full;
                        p5_rd_empty       <= mig_p5_empty;
                        p5_rd_count       <= mig_p5_count  ; 
                       
end generate;

p5_rd_dis:if (C_PORT_ENABLE(5) = '0')generate

                        mig_p5_clk        <= '0';
                        p5_rd_data        <= (others => '0');           
                        mig_p5_en         <= '0';
                        p5_rd_overflow    <= '0';
                        p5_rd_error       <= '0';
                        p5_rd_full        <= '0';
                        p5_rd_empty       <= '0';
                        p5_rd_count       <= (others => '0');
                 
end generate;
                  p5_wr_full      <= '0';
                  p5_wr_empty     <= '0';
                  p5_wr_underrun  <=  '0';
                  p5_wr_count     <= (others => '0');
                  p5_wr_error     <= '0';
                  mig_p5_wr_data  <= (others => '0');
                  mig_p5_wr_mask  <= (others => '0');
                       
end generate;

     --//////////////////////////////////////////////////////////////////////////
     --///////////////////////////////////////////////////////////////////////////
     ----    
     ----                        B32_B32_B32_B32
     ----    
     --///////////////////////////////////////////////////////////////////////////
     --//////////////////////////////////////////////////////////////////////////
                
u_config_2 : if(C_PORT_CONFIG = "B32_B32_B32_B32" ) generate

           
              -- Inputs from Application CMD Port
              -- *************  need to hook up rd /wr error outputs
               
p0_c2_ena:  if (C_PORT_ENABLE(0) = '1') generate
                          -- command port signals
                            mig_p0_arb_en      <=      p0_arb_en ;
                            mig_p0_cmd_clk     <=      p0_cmd_clk  ;
                            mig_p0_cmd_en      <=      p0_cmd_en   ;
                            mig_p0_cmd_ra      <=      p0_cmd_ra  ;
                            mig_p0_cmd_ba      <=      p0_cmd_ba   ;
                            mig_p0_cmd_ca      <=      p0_cmd_ca  ;
                            mig_p0_cmd_instr   <=      p0_cmd_instr;
                            mig_p0_cmd_bl      <=      ((p0_cmd_instr(2) or p0_cmd_bl(5)) & p0_cmd_bl(4 downto 0))  ;                           
                          -- Data port signals
                            mig_p0_rd_en    <= p0_rd_en;                            
                            mig_p0_wr_clk   <= p0_wr_clk;
                            mig_p0_rd_clk   <= p0_rd_clk;
                            mig_p0_wr_en    <= p0_wr_en;
                            mig_p0_wr_data  <= p0_wr_data(31 downto 0); 
                            mig_p0_wr_mask  <= p0_wr_mask(3 downto 0);
                            p0_wr_count     <= mig_p0_wr_count;
                            p0_rd_count  <= mig_p0_rd_count  ; 
end generate;

p0_c2_dis:  if (C_PORT_ENABLE(0) = '0') generate
                           
                            mig_p0_arb_en      <=       '0';
                            mig_p0_cmd_clk     <=       '0';
                            mig_p0_cmd_en      <=       '0';
                            mig_p0_cmd_ra      <=       (others => '0');
                            mig_p0_cmd_ba      <=       (others => '0');
                            mig_p0_cmd_ca      <=       (others => '0');
                            mig_p0_cmd_instr   <=       (others => '0');
                            mig_p0_cmd_bl      <=       (others => '0');
                           
                            mig_p0_rd_en    <= '0';                    
                            mig_p0_wr_clk   <= '0';
                            mig_p0_rd_clk   <= '0';
                            mig_p0_wr_en    <= '0';
                            mig_p0_wr_data  <= (others => '0'); 
                            mig_p0_wr_mask  <= (others => '0');
                            p0_wr_count     <= (others => '0');
                            p0_rd_count     <= (others => '0');

                           
end generate;                           
             
                         
                           
p1_c2_ena: if (C_PORT_ENABLE(1) = '1') generate
                          -- command port signals

                            mig_p1_arb_en      <=      p1_arb_en ;
                            mig_p1_cmd_clk     <=      p1_cmd_clk  ;
                            mig_p1_cmd_en      <=      p1_cmd_en   ;
                            mig_p1_cmd_ra      <=      p1_cmd_ra  ;
                            mig_p1_cmd_ba      <=      p1_cmd_ba   ;
                            mig_p1_cmd_ca      <=      p1_cmd_ca  ;
                            mig_p1_cmd_instr   <=      p1_cmd_instr;
                            mig_p1_cmd_bl      <=      ((p1_cmd_instr(2) or p1_cmd_bl(5)) & p1_cmd_bl(4 downto 0))  ;                           

                          -- Data port signals
                 
                             mig_p1_wr_en    <= p1_wr_en;
                             mig_p1_wr_clk   <= p1_wr_clk;
                             mig_p1_rd_en    <= p1_rd_en;
                             mig_p1_wr_data  <= p1_wr_data(31 downto 0);
                             mig_p1_wr_mask  <= p1_wr_mask(3 downto 0);                
                             mig_p1_rd_clk   <= p1_rd_clk;
                             p1_wr_count     <= mig_p1_wr_count;
                             p1_rd_count     <= mig_p1_rd_count;
                           
end generate;
p1_c2_dis: if (C_PORT_ENABLE(1) = '0') generate

                            mig_p1_arb_en      <=       '0';
                            mig_p1_cmd_clk     <=       '0';
                            mig_p1_cmd_en      <=       '0';
                            mig_p1_cmd_ra      <=       (others => '0');
                            mig_p1_cmd_ba      <=       (others => '0');
                            mig_p1_cmd_ca      <=       (others => '0');
                            mig_p1_cmd_instr   <=       (others => '0');
                            mig_p1_cmd_bl      <=       (others => '0');
                          -- Data port signals
                            mig_p1_wr_en    <= '0'; 
                            mig_p1_wr_clk   <= '0';
                            mig_p1_rd_en    <= '0';
                            mig_p1_wr_data  <= (others => '0');
                            mig_p1_wr_mask  <= (others => '0');                
                            mig_p1_rd_clk   <= '0';
                             p1_wr_count     <= (others => '0');
                             p1_rd_count     <= (others => '0');
                  
end generate;
                           
                           
 
p2_c2_ena :if (C_PORT_ENABLE(2) = '1') generate
                    --MCB Physical port               Logical Port
                            mig_p2_arb_en      <=      p2_arb_en ;
                            mig_p2_cmd_clk     <=      p2_cmd_clk  ;
                            mig_p2_cmd_en      <=      p2_cmd_en   ;
                            mig_p2_cmd_ra      <=      p2_cmd_ra  ;
                            mig_p2_cmd_ba      <=      p2_cmd_ba   ;
                            mig_p2_cmd_ca      <=      p2_cmd_ca  ;
                            mig_p2_cmd_instr   <=      p2_cmd_instr;
                            mig_p2_cmd_bl      <=      ((p2_cmd_instr(2) or p2_cmd_bl(5)) & p2_cmd_bl(4 downto 0))  ;                           
                            
                             mig_p2_en       <= p2_rd_en;
                             mig_p2_clk      <= p2_rd_clk;
                             mig_p3_en       <= p2_wr_en;
                             mig_p3_clk      <= p2_wr_clk;
                             mig_p3_wr_data  <= p2_wr_data(31 downto 0);
                             mig_p3_wr_mask  <= p2_wr_mask(3 downto 0);
                             p2_wr_count     <= mig_p3_count;
                             p2_rd_count     <= mig_p2_count;
end generate;
p2_c2_dis :if (C_PORT_ENABLE(2) = '0') generate

                            mig_p2_arb_en      <=       '0';
                            mig_p2_cmd_clk      <=       '0';
                            mig_p2_cmd_en      <=       '0';
                            mig_p2_cmd_ra      <=      (others => '0');
                            mig_p2_cmd_ba      <=      (others => '0');
                            mig_p2_cmd_ca      <=      (others => '0');
                            mig_p2_cmd_instr   <=      (others => '0');
                            mig_p2_cmd_bl      <=      (others => '0');

                             mig_p2_en      <= '0'; 
                             mig_p2_clk      <= '0';
                             mig_p3_en      <= '0';
                             mig_p3_clk      <= '0';
                             mig_p3_wr_data  <= (others => '0'); 
                             mig_p3_wr_mask  <= (others => '0');
                             p2_rd_count     <= (others => '0');
                             p2_wr_count     <= (others => '0');
                           
end generate;
                         
  
p3_c2_ena:  if (C_PORT_ENABLE(3) = '1') generate
                    --MCB Physical port               Logical Port
                            mig_p4_arb_en      <=      p3_arb_en ;
                            mig_p4_cmd_clk     <=      p3_cmd_clk  ;
                            mig_p4_cmd_en      <=      p3_cmd_en   ;
                            mig_p4_cmd_ra      <=      p3_cmd_ra  ;
                            mig_p4_cmd_ba      <=      p3_cmd_ba   ;
                            mig_p4_cmd_ca      <=      p3_cmd_ca  ;
                            mig_p4_cmd_instr   <=      p3_cmd_instr;
                            mig_p4_cmd_bl      <= ((p3_cmd_instr(2) or p3_cmd_bl(5)) & p3_cmd_bl(4 downto 0))  ;                           

                            mig_p4_clk      <= p3_rd_clk;
                            mig_p4_en       <= p3_rd_en;                            
                            mig_p5_clk      <= p3_wr_clk;
                            mig_p5_en       <= p3_wr_en; 
                            mig_p5_wr_data  <= p3_wr_data(31 downto 0);
                            mig_p5_wr_mask  <= p3_wr_mask(3 downto 0);
                            p3_rd_count     <= mig_p4_count;
                            p3_wr_count     <= mig_p5_count;
end generate;
                           
p3_c2_dis:  if (C_PORT_ENABLE(3) = '0') generate
                            mig_p4_arb_en      <=     '0';
                            mig_p4_cmd_clk     <=     '0';
                            mig_p4_cmd_en      <=     '0';
                            mig_p4_cmd_ra      <=     (others => '0');
                            mig_p4_cmd_ba      <=     (others => '0');
                            mig_p4_cmd_ca      <=     (others => '0');
                            mig_p4_cmd_instr   <=     (others => '0');
                            mig_p4_cmd_bl      <=     (others => '0');
                           
                             mig_p4_clk      <= '0'; 
                             mig_p4_en      <= '0';                   
                             mig_p5_clk      <= '0';
                             mig_p5_en      <= '0';
                             mig_p5_wr_data  <= (others => '0'); 
                             mig_p5_wr_mask  <= (others => '0');
                             p3_rd_count     <= (others => '0');
                             p3_wr_count     <= (others => '0');
end generate;
                           
                            p0_cmd_empty       <=      mig_p0_cmd_empty ;
                            p0_cmd_full        <=      mig_p0_cmd_full  ;
                            p1_cmd_empty       <=      mig_p1_cmd_empty ;
                            p1_cmd_full        <=      mig_p1_cmd_full  ;
                            p2_cmd_empty       <=      mig_p2_cmd_empty ;
                            p2_cmd_full        <=      mig_p2_cmd_full  ;
                            p3_cmd_empty       <=      mig_p4_cmd_empty ;
                            p3_cmd_full        <=      mig_p4_cmd_full  ;
                           
                           
                           -- outputs to Applications User Port
                             p0_rd_data     <= mig_p0_rd_data;
                             p1_rd_data     <= mig_p1_rd_data;
                             p2_rd_data     <= mig_p2_rd_data;
                             p3_rd_data     <= mig_p4_rd_data;

                             p0_rd_empty_i    <= mig_p0_rd_empty;
                             p1_rd_empty_i    <= mig_p1_rd_empty;
                             p2_rd_empty    <= mig_p2_empty;
                             p3_rd_empty    <= mig_p4_empty;

                             p0_rd_full     <= mig_p0_rd_full;
                             p1_rd_full     <= mig_p1_rd_full;
                             p2_rd_full     <= mig_p2_full;
                             p3_rd_full     <= mig_p4_full;

                             p0_rd_error    <= mig_p0_rd_error;
                             p1_rd_error    <= mig_p1_rd_error;
                             p2_rd_error    <= mig_p2_error;
                             p3_rd_error    <= mig_p4_error;
                            
                             p0_rd_overflow <= mig_p0_rd_overflow;
                             p1_rd_overflow <= mig_p1_rd_overflow;
                             p2_rd_overflow <= mig_p2_overflow;
                             p3_rd_overflow <= mig_p4_overflow;

                             p0_wr_underrun <= mig_p0_wr_underrun;
                             p1_wr_underrun <= mig_p1_wr_underrun;
                             p2_wr_underrun <= mig_p3_underrun;
                             p3_wr_underrun <= mig_p5_underrun;
                            
                             p0_wr_empty    <= mig_p0_wr_empty;
                             p1_wr_empty    <= mig_p1_wr_empty;
                             p2_wr_empty    <= mig_p3_empty; 
                             p3_wr_empty    <= mig_p5_empty; 
 
                             p0_wr_full_i    <= mig_p0_wr_full;
                             p1_wr_full_i    <= mig_p1_wr_full;
                             p2_wr_full    <= mig_p3_full;
                             p3_wr_full    <= mig_p5_full;

                             p0_wr_error    <= mig_p0_wr_error;
                             p1_wr_error    <= mig_p1_wr_error;
                             p2_wr_error    <= mig_p3_error;
                             p3_wr_error    <= mig_p5_error;

    -- unused ports signals
                            p4_cmd_empty        <=     '0';
                            p4_cmd_full         <=     '0';
                            mig_p2_wr_mask     <=      (others => '0');
                            mig_p4_wr_mask    <=      (others => '0');

                           mig_p2_wr_data     <=      (others => '0');
                           mig_p4_wr_data     <=      (others => '0');


                            p5_cmd_empty        <=     '0';
                            p5_cmd_full         <=     '0';
     
 
                             mig_p3_cmd_clk      <=       '0';
                             mig_p3_cmd_en      <=       '0';
                             mig_p3_cmd_ra      <=      (others => '0');
                             mig_p3_cmd_ba      <=      (others => '0');
                             mig_p3_cmd_ca      <=      (others => '0');
                             mig_p3_cmd_instr   <=      (others => '0');
                             mig_p3_cmd_bl      <=      (others => '0');
                             mig_p3_arb_en      <=       '0'; -- physical cmd port 3 is not used in this config
                            
                            
                            
                            
                             mig_p5_arb_en      <=       '0'; -- physical cmd port 3 is not used in this config
                             mig_p5_cmd_clk      <=       '0';
                             mig_p5_cmd_en      <=       '0';
                             mig_p5_cmd_ra      <=      (others => '0');
                             mig_p5_cmd_ba      <=      (others => '0');
                             mig_p5_cmd_ca      <=      (others => '0');
                             mig_p5_cmd_instr   <=      (others => '0');
                             mig_p5_cmd_bl      <=      (others => '0');

end generate;
--
--
--     --//////////////////////////////////////////////////////////////////////////
--     --///////////////////////////////////////////////////////////////////////////
--     ----    
--     ----                        B64_B32_B32
--     ----    
--     --///////////////////////////////////////////////////////////////////////////
--     --//////////////////////////////////////////////////////////////////////////
--
--     
--     
u_config_3:if(C_PORT_CONFIG = "B64_B32_B32" ) generate

              -- Inputs from Application CMD Port
 
 
p0_c3_ena : if (C_PORT_ENABLE(0) = '1') generate
                mig_p0_arb_en      <=  p0_arb_en ;
                mig_p0_cmd_clk     <=  p0_cmd_clk  ;
                mig_p0_cmd_en      <=  p0_cmd_en   ;
                mig_p0_cmd_ra      <=  p0_cmd_ra  ;
                mig_p0_cmd_ba      <=  p0_cmd_ba   ;
                mig_p0_cmd_ca      <=  p0_cmd_ca  ;
                mig_p0_cmd_instr   <=  p0_cmd_instr;
                mig_p0_cmd_bl      <= ((p0_cmd_instr(2) or p0_cmd_bl(5)) & p0_cmd_bl(4 downto 0))  ;
                p0_cmd_empty       <=  mig_p0_cmd_empty ;
                p0_cmd_full        <=  mig_p0_cmd_full  ;

                mig_p0_wr_clk   <= p0_wr_clk;
                mig_p0_rd_clk   <= p0_rd_clk;
                mig_p1_wr_clk   <= p0_wr_clk;
                mig_p1_rd_clk   <= p0_rd_clk;

                mig_p0_wr_en    <= p0_wr_en and not p0_wr_full_i;
                mig_p1_wr_en    <= p0_wr_en and not p0_wr_full_i;
                mig_p0_wr_data  <= p0_wr_data(31 downto 0);
                mig_p0_wr_mask(3 downto 0)  <= p0_wr_mask(3 downto 0);
                mig_p1_wr_data  <= p0_wr_data(63  downto  32);
                mig_p1_wr_mask(3 downto 0)  <= p0_wr_mask(7  downto  4);     

                p0_rd_empty_i       <= mig_p1_rd_empty;
                p0_rd_data        <= (mig_p1_rd_data & mig_p0_rd_data); 
                mig_p0_rd_en    <= p0_rd_en and not p0_rd_empty_i;
                mig_p1_rd_en    <= p0_rd_en and not p0_rd_empty_i;


                 p0_wr_count       <= mig_p1_wr_count; -- B64 for port 0, map most significant port to output
                 p0_rd_count       <= mig_p1_rd_count;
                 p0_wr_empty       <= mig_p1_wr_empty;
                 p0_wr_error       <= mig_p1_wr_error or mig_p0_wr_error;  
                 p0_wr_full_i        <= mig_p1_wr_full;
                 p0_wr_underrun    <= mig_p1_wr_underrun or mig_p0_wr_underrun; 
                 p0_rd_overflow    <= mig_p1_rd_overflow or mig_p0_rd_overflow; 
                 p0_rd_error       <= mig_p1_rd_error or mig_p0_rd_error; 
                 p0_rd_full        <= mig_p1_rd_full;

end generate; 
p0_c3_dis: if (C_PORT_ENABLE(0) = '0') generate
       
                mig_p0_arb_en      <= '0';
                mig_p0_cmd_clk     <= '0';
                mig_p0_cmd_en      <= '0';
                mig_p0_cmd_ra      <= (others => '0');
                mig_p0_cmd_ba      <= (others => '0');
                mig_p0_cmd_ca      <= (others => '0');
                mig_p0_cmd_instr   <= (others => '0');
                mig_p0_cmd_bl      <= (others => '0');
                p0_cmd_empty       <= '0';
                p0_cmd_full        <= '0';


                mig_p0_wr_clk   <= '0';
                mig_p0_rd_clk   <= '0';
                mig_p1_wr_clk   <= '0';
                mig_p1_rd_clk   <= '0';
               
                mig_p0_wr_en    <= '0';
                mig_p1_wr_en    <= '0';
                mig_p0_wr_data  <= (others => '0');
                mig_p0_wr_mask  <= (others => '0');
                mig_p1_wr_data  <= (others => '0');
                mig_p1_wr_mask  <= (others => '0'); 

                p0_rd_empty_i       <= '0';
                p0_rd_data        <= (others => '0');
                mig_p0_rd_en      <= '0';
                mig_p1_rd_en      <= '0';
 
 
                p0_wr_count       <=  (others => '0');
                p0_rd_count       <=  (others => '0');
                p0_wr_empty       <=  '0';
                p0_wr_error       <=  '0';
                p0_wr_full_i        <=  '0';
                p0_wr_underrun    <=  '0';
                p0_rd_overflow    <=  '0';
                p0_rd_error       <=  '0';
                p0_rd_full        <=  '0';
end generate; 

       
        
 
p1_c3_ena:  if (C_PORT_ENABLE(1) = '1')generate

                mig_p2_arb_en      <=      p1_arb_en ;
                mig_p2_cmd_clk     <=      p1_cmd_clk  ;
                mig_p2_cmd_en      <=      p1_cmd_en   ;
                mig_p2_cmd_ra      <=      p1_cmd_ra  ;
                mig_p2_cmd_ba      <=      p1_cmd_ba   ;
                mig_p2_cmd_ca      <=      p1_cmd_ca  ;
                mig_p2_cmd_instr   <=      p1_cmd_instr;
                mig_p2_cmd_bl      <=      ((p1_cmd_instr(2) or p1_cmd_bl(5)) & p1_cmd_bl(4 downto 0))  ;                           

                p1_cmd_empty       <=      mig_p2_cmd_empty;  
                p1_cmd_full        <=      mig_p2_cmd_full;   

                mig_p2_clk         <= p1_rd_clk;
                mig_p3_clk         <= p1_wr_clk;

                mig_p3_en       <= p1_wr_en;
                mig_p3_wr_data  <= p1_wr_data(31 downto 0);
                mig_p3_wr_mask  <= p1_wr_mask(3 downto 0);
                mig_p2_en       <= p1_rd_en;

                p1_rd_data        <= mig_p2_rd_data;
                p1_wr_count       <= mig_p3_count;
                p1_rd_count       <= mig_p2_count;
                p1_wr_empty       <= mig_p3_empty;
                p1_wr_error       <= mig_p3_error;                 
                p1_wr_full_i        <= mig_p3_full;
                p1_wr_underrun    <= mig_p3_underrun;
                p1_rd_overflow    <= mig_p2_overflow; 
                p1_rd_error       <= mig_p2_error;
                p1_rd_full        <= mig_p2_full;
                p1_rd_empty_i       <= mig_p2_empty;
 end generate;

p1_c3_dis:  if (C_PORT_ENABLE(1) = '0')generate

                mig_p2_arb_en      <=      '0'; 
                mig_p2_cmd_clk     <=      '0'; 
                mig_p2_cmd_en      <=     '0'; 
                mig_p2_cmd_ra      <=     (others => '0'); 
                mig_p2_cmd_ba      <=     (others => '0'); 
                mig_p2_cmd_ca      <=     (others => '0'); 
                mig_p2_cmd_instr   <=     (others => '0'); 
                mig_p2_cmd_bl      <=     (others => '0'); 
                p1_cmd_empty       <=     '0'; 
                p1_cmd_full        <=     '0'; 
                mig_p3_en      <= '0'; 
                mig_p3_wr_data  <= (others => '0'); 
                mig_p3_wr_mask  <= (others => '0'); 
                mig_p2_en      <= '0'; 

                mig_p2_clk   <= '0'; 
                mig_p3_clk   <= '0'; 
               
                p1_rd_data        <= (others => '0'); 
                p1_wr_count       <= (others => '0'); 
                p1_rd_count       <= (others => '0'); 
                p1_wr_empty       <= '0'; 
                p1_wr_error       <= '0';         
                p1_wr_full_i        <= '0'; 
                p1_wr_underrun    <= '0'; 
                p1_rd_overflow    <= '0'; 
                p1_rd_error       <= '0'; 
                p1_rd_full        <=  '0'; 
                p1_rd_empty_i       <= '0'; 
 
end generate;
       
p2_c3_ena:  if (C_PORT_ENABLE(2) = '1')generate
                mig_p4_arb_en      <= p2_arb_en ;
                mig_p4_cmd_clk     <= p2_cmd_clk  ;
                mig_p4_cmd_en      <= p2_cmd_en   ;
                mig_p4_cmd_ra      <= p2_cmd_ra  ;
                mig_p4_cmd_ba      <= p2_cmd_ba   ;
                mig_p4_cmd_ca      <= p2_cmd_ca  ;
                mig_p4_cmd_instr   <= p2_cmd_instr;
                mig_p4_cmd_bl      <= ((p2_cmd_instr(2) or p2_cmd_bl(5)) & p2_cmd_bl(4 downto 0))  ;                           

                p2_cmd_empty       <= mig_p4_cmd_empty ; 
                p2_cmd_full        <= mig_p4_cmd_full  ; 
                mig_p5_en          <= p2_wr_en;
                mig_p5_wr_data     <= p2_wr_data(31 downto 0);
                mig_p5_wr_mask     <= p2_wr_mask(3 downto 0);
                mig_p4_en          <= p2_rd_en;
               
                 mig_p4_clk        <= p2_rd_clk;
                 mig_p5_clk        <= p2_wr_clk;

                 p2_rd_data        <= mig_p4_rd_data;
                 p2_wr_count       <= mig_p5_count;
                 p2_rd_count       <= mig_p4_count;
                 p2_wr_empty       <= mig_p5_empty;
                 p2_wr_full        <= mig_p5_full;
                 p2_wr_error       <= mig_p5_error;  
                 p2_wr_underrun    <= mig_p5_underrun;
                 p2_rd_overflow    <= mig_p4_overflow;    
                 p2_rd_error       <= mig_p4_error;
                 p2_rd_full        <= mig_p4_full;
                 p2_rd_empty       <= mig_p4_empty;

end generate; 
               
p2_c3_dis:  if (C_PORT_ENABLE(2) = '0')generate

                mig_p4_arb_en      <= '0'; 
                mig_p4_cmd_clk     <= '0';   
                mig_p4_cmd_en      <= '0';   
                mig_p4_cmd_ra      <= (others => '0');   
                mig_p4_cmd_ba      <= (others => '0');   
                mig_p4_cmd_ca      <= (others => '0');   
                mig_p4_cmd_instr   <= (others => '0');   
                mig_p4_cmd_bl      <= (others => '0');   
                p2_cmd_empty       <= '0';   
                p2_cmd_full        <= '0'; 
                mig_p5_en          <= '0'; 
                mig_p5_wr_data     <= (others => '0'); 
                mig_p5_wr_mask     <= (others => '0'); 
                mig_p4_en          <= '0'; 

                 mig_p4_clk        <= '0'; 
                 mig_p5_clk        <= '0'; 

                 p2_rd_data        <=   (others => '0');   
                 p2_wr_count       <=   (others => '0');   
                 p2_rd_count       <=   (others => '0');   
                 p2_wr_empty       <=   '0'; 
                 p2_wr_full        <=   '0';  
                 p2_wr_error       <=   '0';   
                 p2_wr_underrun    <=   '0';   
                 p2_rd_overflow    <=   '0';     
                 p2_rd_error       <=   '0'; 
                 p2_rd_full        <=   '0'; 
                 p2_rd_empty       <=   '0'; 

end generate; 

             -- MCB's port 1,3,5 is not used in this Config mode
                mig_p1_arb_en      <=       '0';
                mig_p1_cmd_clk      <=       '0';
                mig_p1_cmd_en      <=       '0';
                mig_p1_cmd_ra      <=      (others => '0');
                mig_p1_cmd_ba      <=      (others => '0');
                mig_p1_cmd_ca      <=      (others => '0');
               
                mig_p1_cmd_instr   <=      (others => '0');
                mig_p1_cmd_bl      <=      (others => '0');
                
                mig_p3_arb_en    <=      '0'; 
                mig_p3_cmd_clk      <=       '0';
                mig_p3_cmd_en      <=       '0';
                mig_p3_cmd_ra      <=      (others => '0');
                mig_p3_cmd_ba      <=      (others => '0');
                mig_p3_cmd_ca      <=      (others => '0');
               
                mig_p3_cmd_instr   <=      (others => '0');
                mig_p3_cmd_bl      <=      (others => '0');

                mig_p5_arb_en    <=      '0'; 
                mig_p5_cmd_clk      <=       '0';
                mig_p5_cmd_en      <=       '0';
                mig_p5_cmd_ra      <=      (others => '0');
                mig_p5_cmd_ba      <=      (others => '0');
                mig_p5_cmd_ca      <=      (others => '0');
               
                mig_p5_cmd_instr   <=      (others => '0');
                mig_p5_cmd_bl      <=      (others => '0');
 
end generate;

u_config_4 : if(C_PORT_CONFIG = "B64_B64" ) generate

              -- Inputs from Application CMD Port

p0_c4_ena:  if (C_PORT_ENABLE(0) = '1') generate
               
                        mig_p0_arb_en      <=      p0_arb_en ;
                        mig_p1_arb_en      <=      p0_arb_en ;
                       
                        mig_p0_cmd_clk     <=      p0_cmd_clk  ;
                        mig_p0_cmd_en      <=      p0_cmd_en   ;
                        mig_p0_cmd_ra      <=      p0_cmd_ra  ;
                        mig_p0_cmd_ba      <=      p0_cmd_ba   ;
                        mig_p0_cmd_ca      <=      p0_cmd_ca  ;
                        mig_p0_cmd_instr   <=      p0_cmd_instr;
                        mig_p0_cmd_bl      <=      ((p0_cmd_instr(2) or p0_cmd_bl(5)) & p0_cmd_bl(4 downto 0))  ;

                         mig_p0_wr_clk   <= p0_wr_clk;
                         mig_p0_rd_clk   <= p0_rd_clk;
                         mig_p1_wr_clk   <= p0_wr_clk;
                         mig_p1_rd_clk   <= p0_rd_clk;
                         mig_p0_wr_en    <= p0_wr_en and not p0_wr_full_i;
                         mig_p0_wr_data  <= p0_wr_data(31 downto 0);
                         mig_p0_wr_mask(3 downto 0)  <= p0_wr_mask(3 downto 0);
                         mig_p1_wr_data  <= p0_wr_data(63  downto  32);
                         mig_p1_wr_mask(3 downto 0)  <= p0_wr_mask(7  downto  4);                
                         mig_p1_wr_en    <= p0_wr_en and not p0_wr_full_i;
                         mig_p0_rd_en    <= p0_rd_en and not p0_rd_empty_i;
                         mig_p1_rd_en    <= p0_rd_en and not p0_rd_empty_i;  
                         p0_rd_data     <= (mig_p1_rd_data & mig_p0_rd_data);
                        
                         p0_cmd_empty   <=     mig_p0_cmd_empty ;
                         p0_cmd_full    <=     mig_p0_cmd_full  ;
                         p0_wr_empty    <= mig_p1_wr_empty;      
                         p0_wr_full_i    <= mig_p1_wr_full;
                         p0_wr_error    <= mig_p1_wr_error or mig_p0_wr_error; 
                         p0_wr_count    <= mig_p1_wr_count;
                         p0_rd_count    <= mig_p1_rd_count;
                         p0_wr_underrun <= mig_p1_wr_underrun or mig_p0_wr_underrun; 
                         p0_rd_overflow <= mig_p1_rd_overflow or mig_p0_rd_overflow; 
                         p0_rd_error    <= mig_p1_rd_error or mig_p0_rd_error; 
                         p0_rd_full     <= mig_p1_rd_full;
                         p0_rd_empty_i    <= mig_p1_rd_empty;
end generate;                       

p0_c4_dis:  if (C_PORT_ENABLE(0) = '0') generate
                        mig_p0_arb_en      <=       '0';
                        mig_p0_cmd_clk      <=       '0';
                        mig_p0_cmd_en      <=       '0';
                        mig_p0_cmd_ra      <=      (others => '0');
                        mig_p0_cmd_ba      <=      (others => '0');
                        mig_p0_cmd_ca      <=      (others => '0');
                        mig_p0_cmd_instr   <=      (others => '0');
                        mig_p0_cmd_bl      <=      (others => '0');

                         mig_p0_wr_clk   <= '0';
                         mig_p0_rd_clk   <= '0';
                         mig_p1_wr_clk   <= '0';
                         mig_p1_rd_clk   <= '0';
                         mig_p0_wr_en    <= '0';
                         mig_p1_wr_en    <= '0';
                         mig_p0_wr_data  <= (others => '0');
                         mig_p0_wr_mask  <= (others => '0');
                         mig_p1_wr_data  <= (others => '0');
                         mig_p1_wr_mask  <= (others => '0');            
                  --      mig_p1_wr_en    <= (others => '0');
                         mig_p0_rd_en    <= '0';
                         mig_p1_rd_en    <= '0';
                         p0_rd_data     <= (others => '0');


                         p0_cmd_empty   <= '0';
                         p0_cmd_full    <= '0';
                         p0_wr_empty    <= '0';
                         p0_wr_full_i     <= '0';
                         p0_wr_error    <= '0';
                         p0_wr_count    <= (others => '0');
                         p0_rd_count    <= (others => '0');
                         p0_wr_underrun <= '0';  
                         p0_rd_overflow <= '0';
                         p0_rd_error    <= '0';
                         p0_rd_full     <= '0';
                         p0_rd_empty_i    <= '0';
                 
                 
end generate;
      

p1_c4_ena: if (C_PORT_ENABLE(1) = '1') generate

                        mig_p2_arb_en      <=      p1_arb_en ;
                       
                        mig_p2_cmd_clk     <=      p1_cmd_clk  ;
                        mig_p2_cmd_en      <=      p1_cmd_en   ;
                        mig_p2_cmd_ra      <=      p1_cmd_ra  ;
                        mig_p2_cmd_ba      <=      p1_cmd_ba   ;
                        mig_p2_cmd_ca      <=      p1_cmd_ca  ;
                        mig_p2_cmd_instr   <=      p1_cmd_instr;
                        mig_p2_cmd_bl      <=      ((p1_cmd_instr(2) or p1_cmd_bl(5)) & p1_cmd_bl(4 downto 0))  ;                           


                         mig_p2_clk     <= p1_rd_clk;
                         mig_p3_clk     <= p1_wr_clk;
                         mig_p4_clk     <= p1_rd_clk;
                         mig_p5_clk     <= p1_wr_clk;
                         mig_p3_en      <= p1_wr_en and not p1_wr_full_i;
                         mig_p5_en      <= p1_wr_en and not p1_wr_full_i;
                         mig_p3_wr_data  <= p1_wr_data(31 downto 0);
                         mig_p3_wr_mask  <= p1_wr_mask(3 downto 0);
                         mig_p5_wr_data  <= p1_wr_data(63 downto 32);
                         mig_p5_wr_mask  <= p1_wr_mask(7 downto 4);
                         mig_p2_en       <= p1_rd_en and not p1_rd_empty_i;
                         mig_p4_en       <= p1_rd_en and not p1_rd_empty_i;
                        
                         p1_cmd_empty       <=      mig_p2_cmd_empty ;  
                         p1_cmd_full        <=      mig_p2_cmd_full  ;

                         p1_wr_count    <= mig_p5_count;
                         p1_rd_count    <= mig_p4_count;
                         p1_wr_full_i    <= mig_p5_full;
                         p1_wr_error    <= mig_p5_error or mig_p5_error;
                         p1_wr_empty    <= mig_p5_empty;
                         p1_wr_underrun <= mig_p3_underrun or mig_p5_underrun;
                         p1_rd_overflow <= mig_p4_overflow;
                         p1_rd_error    <= mig_p4_error;
                         p1_rd_full     <= mig_p4_full;
                         p1_rd_empty_i    <= mig_p4_empty;

                         p1_rd_data     <= (mig_p4_rd_data & mig_p2_rd_data);
                       
end generate;                       
p1_c4_dis: if (C_PORT_ENABLE(1) = '0') generate

                        mig_p2_arb_en      <= '0';
                  --     mig_p3_arb_en      <= (others => '0');
                 --      mig_p4_arb_en      <= (others => '0');
                 --      mig_p5_arb_en      <= (others => '0');
                       
                        mig_p2_cmd_clk     <= '0';
                        mig_p2_cmd_en      <= '0';
                        mig_p2_cmd_ra      <= (others => '0');
                        mig_p2_cmd_ba      <= (others => '0');
                        mig_p2_cmd_ca      <= (others => '0');
                        mig_p2_cmd_instr   <= (others => '0');
                        mig_p2_cmd_bl      <= (others => '0');
                        mig_p2_clk      <= '0';
                        mig_p3_clk      <= '0';
                        mig_p4_clk      <= '0';
                        mig_p5_clk      <= '0';
                        mig_p3_en      <= '0';
                        mig_p5_en      <= '0';
                        mig_p3_wr_data  <= (others => '0');
                        mig_p3_wr_mask  <= (others => '0');
                        mig_p5_wr_data  <= (others => '0');
                        mig_p5_wr_mask  <= (others => '0'); 
                        mig_p2_en       <= '0';
                        mig_p4_en       <= '0';
                        p1_cmd_empty    <= '0';  
                        p1_cmd_full     <= '0';  

                        p1_wr_count    <= (others => '0');
                        p1_rd_count    <= (others => '0');
                        p1_wr_full_i     <= '0';
                        p1_wr_error    <= '0';
                        p1_wr_empty    <= '0';
                        p1_wr_underrun <= '0';
                        p1_rd_overflow <= '0';
                        p1_rd_error    <= '0'; 
                        p1_rd_full     <= '0'; 
                        p1_rd_empty_i    <= '0'; 
                        p1_rd_data     <= (others => '0');
                       
end generate;                       
              
                 -- unused MCB's signals in this configuration
                        mig_p3_arb_en      <=       '0';
                        mig_p4_arb_en      <=       '0';
                        mig_p5_arb_en      <=       '0';
                       
                        mig_p3_cmd_clk      <=       '0';
                        mig_p3_cmd_en      <=       '0';
                        mig_p3_cmd_ra      <=      (others => '0');
                        mig_p3_cmd_ba      <=      (others => '0');
                        mig_p3_cmd_ca      <=      (others => '0');
                        mig_p3_cmd_instr   <=      (others => '0');

                        mig_p4_cmd_clk      <=       '0';
                        mig_p4_cmd_en      <=       '0';
                        mig_p4_cmd_ra      <=      (others => '0');
                        mig_p4_cmd_ba      <=      (others => '0');
                        mig_p4_cmd_ca      <=      (others => '0');
                        mig_p4_cmd_instr   <=      (others => '0');
                        mig_p4_cmd_bl      <=      (others => '0');

                        mig_p5_cmd_clk      <=       '0';
                        mig_p5_cmd_en      <=       '0';
                        mig_p5_cmd_ra      <=      (others => '0');
                        mig_p5_cmd_ba      <=      (others => '0');
                        mig_p5_cmd_ca      <=      (others => '0');                       
                        mig_p5_cmd_instr   <=      (others => '0');
                        mig_p5_cmd_bl      <=      (others => '0');

 end generate;                       
               
                
--*******************************BEGIN OF CONFIG 5 SIGNALS ********************************     

u_config_5:   if(C_PORT_CONFIG = "B128" ) generate


              -- Inputs from Application CMD Port
               
                mig_p0_arb_en      <=  p0_arb_en ;
                mig_p0_cmd_clk     <=  p0_cmd_clk  ;
                mig_p0_cmd_en      <=  p0_cmd_en   ;
                mig_p0_cmd_ra      <=  p0_cmd_ra  ;
                mig_p0_cmd_ba      <=  p0_cmd_ba   ;
                mig_p0_cmd_ca      <=  p0_cmd_ca  ;
                mig_p0_cmd_instr   <=  p0_cmd_instr;
                mig_p0_cmd_bl      <=      ((p0_cmd_instr(2) or p0_cmd_bl(5)) & p0_cmd_bl(4 downto 0))  ;               
                p0_cmd_empty       <=      mig_p0_cmd_empty ;
                p0_cmd_full        <=      mig_p0_cmd_full  ;
               
 
 
               -- Inputs from Application User Port
                
                 mig_p0_wr_clk   <= p0_wr_clk;
                 mig_p0_rd_clk   <= p0_rd_clk;
                 mig_p1_wr_clk   <= p0_wr_clk;
                 mig_p1_rd_clk   <= p0_rd_clk;
                
                 mig_p2_clk   <= p0_rd_clk;
                 mig_p3_clk   <= p0_wr_clk;
                 mig_p4_clk   <= p0_rd_clk;
                 mig_p5_clk   <= p0_wr_clk;
                
                
                
                 mig_p0_wr_en    <= p0_wr_en and not p0_wr_full_i;
                 mig_p1_wr_en    <= p0_wr_en and not p0_wr_full_i;
                 mig_p3_en       <= p0_wr_en and not p0_wr_full_i;
                 mig_p5_en       <= p0_wr_en and not p0_wr_full_i;
                
                
                
                 mig_p0_wr_data <= p0_wr_data(31 downto 0);
                 mig_p0_wr_mask(3 downto 0) <= p0_wr_mask(3 downto 0);
                 mig_p1_wr_data <= p0_wr_data(63  downto  32);
                 mig_p1_wr_mask(3 downto 0) <= p0_wr_mask(7  downto  4);                
                 mig_p3_wr_data <= p0_wr_data(95  downto  64);
                 mig_p3_wr_mask(3 downto 0) <= p0_wr_mask(11  downto  8);
                 mig_p5_wr_data <= p0_wr_data(127  downto  96);
                 mig_p5_wr_mask(3 downto 0) <= p0_wr_mask(15  downto  12);
                
                 mig_p0_rd_en    <= p0_rd_en and not p0_rd_empty_i;
                 mig_p1_rd_en    <= p0_rd_en and not p0_rd_empty_i;
                 mig_p2_en       <= p0_rd_en and not p0_rd_empty_i;
                 mig_p4_en       <= p0_rd_en and not p0_rd_empty_i;
                
               -- outputs to Applications User Port
                 p0_rd_data     <= (mig_p4_rd_data & mig_p2_rd_data & mig_p1_rd_data & mig_p0_rd_data);
                 p0_rd_empty_i    <= mig_p4_empty;
                 p0_rd_full     <= mig_p4_full;
                 p0_rd_error    <= mig_p0_rd_error or mig_p1_rd_error or mig_p2_error or mig_p4_error;  
                 p0_rd_overflow    <= mig_p0_rd_overflow or mig_p1_rd_overflow or mig_p2_overflow or mig_p4_overflow; 

                 p0_wr_underrun    <= mig_p0_wr_underrun or mig_p1_wr_underrun or mig_p3_underrun or mig_p5_underrun;      
                 p0_wr_empty    <= mig_p5_empty;
                 p0_wr_full_i     <= mig_p5_full;
                 p0_wr_error    <= mig_p0_wr_error or mig_p1_wr_error or mig_p3_error or mig_p5_error; 
                
                 p0_wr_count    <= mig_p5_count;
                 p0_rd_count    <= mig_p4_count;


              -- unused MCB's siganls in this configuration
               
                mig_p1_arb_en      <=       '0';
                mig_p1_cmd_clk      <=       '0';
                mig_p1_cmd_en      <=       '0';
                mig_p1_cmd_ra      <=      (others => '0');
                mig_p1_cmd_ba      <=      (others => '0');
                mig_p1_cmd_ca      <=      (others => '0');
               
                mig_p1_cmd_instr   <=      (others => '0');
                mig_p1_cmd_bl      <=      (others => '0');
               
                mig_p2_arb_en    <=      '0';
                mig_p2_cmd_clk      <=       '0';
                mig_p2_cmd_en      <=       '0';
                mig_p2_cmd_ra      <=      (others => '0');
                mig_p2_cmd_ba      <=      (others => '0');
                mig_p2_cmd_ca      <=      (others => '0');
               
                mig_p2_cmd_instr   <=      (others => '0');
                mig_p2_cmd_bl      <=      (others => '0');
               
                mig_p3_arb_en    <=      '0';
                mig_p3_cmd_clk      <=       '0';
                mig_p3_cmd_en      <=       '0';
                mig_p3_cmd_ra      <=      (others => '0');
                mig_p3_cmd_ba      <=      (others => '0');
                mig_p3_cmd_ca      <=      (others => '0');
               
                mig_p3_cmd_instr   <=      (others => '0');
                mig_p3_cmd_bl      <=      (others => '0');
               
                mig_p4_arb_en    <=      '0';
                mig_p4_cmd_clk      <=       '0';
                mig_p4_cmd_en      <=       '0';
                mig_p4_cmd_ra      <=      (others => '0');
                mig_p4_cmd_ba      <=      (others => '0');
                mig_p4_cmd_ca      <=      (others => '0');
               
                mig_p4_cmd_instr   <=      (others => '0');
                mig_p4_cmd_bl      <=      (others => '0');
               
                mig_p5_arb_en    <=       '0';
                mig_p5_cmd_clk      <=       '0';
                mig_p5_cmd_en      <=       '0';
                mig_p5_cmd_ra      <=      (others => '0');
                mig_p5_cmd_ba      <=      (others => '0');
                mig_p5_cmd_ca      <=      (others => '0');
               
                mig_p5_cmd_instr   <=      (others => '0');
                mig_p5_cmd_bl      <=      (others => '0');
                             
--*******************************END OF CONFIG 5 SIGNALS ********************************     
                                
end generate;

uo_cal_start <= uo_cal_start_int;



samc_0:   MCB 
   GENERIC MAP   
     (          PORT_CONFIG             => C_PORT_CONFIG,                                   
               MEM_WIDTH              => C_NUM_DQ_PINS    ,       
               MEM_TYPE                => C_MEM_TYPE       ,
               MEM_BURST_LEN            => C_MEM_BURST_LEN  , 
               MEM_ADDR_ORDER           => C_MEM_ADDR_ORDER,              
               MEM_CAS_LATENCY          => C_MEM_CAS_LATENCY,       
               MEM_DDR3_CAS_LATENCY      => C_MEM_DDR3_CAS_LATENCY   ,
               MEM_DDR2_WRT_RECOVERY     => C_MEM_DDR2_WRT_RECOVERY  ,
               MEM_DDR3_WRT_RECOVERY     => C_MEM_DDR3_WRT_RECOVERY  ,
               MEM_MOBILE_PA_SR          => C_MEM_MOBILE_PA_SR       ,
               MEM_DDR1_2_ODS              => C_MEM_DDR1_2_ODS         ,
               MEM_DDR3_ODS                => C_MEM_DDR3_ODS           ,
               MEM_DDR2_RTT                => C_MEM_DDR2_RTT           ,
               MEM_DDR3_RTT                => C_MEM_DDR3_RTT           ,
               MEM_DDR3_ADD_LATENCY        => C_MEM_DDR3_ADD_LATENCY   ,
               MEM_DDR2_ADD_LATENCY        => C_MEM_DDR2_ADD_LATENCY   ,
               MEM_MOBILE_TC_SR            => C_MEM_MOBILE_TC_SR       ,
               MEM_MDDR_ODS                => C_MEM_MDDR_ODS           ,
               MEM_DDR2_DIFF_DQS_EN        => C_MEM_DDR2_DIFF_DQS_EN   ,
               MEM_DDR2_3_PA_SR            => C_MEM_DDR2_3_PA_SR       ,
               MEM_DDR3_CAS_WR_LATENCY    => C_MEM_DDR3_CAS_WR_LATENCY,
               MEM_DDR3_AUTO_SR           => C_MEM_DDR3_AUTO_SR       ,
               MEM_DDR2_3_HIGH_TEMP_SR    => C_MEM_DDR2_3_HIGH_TEMP_SR,
               MEM_DDR3_DYN_WRT_ODT       => C_MEM_DDR3_DYN_WRT_ODT   ,
               MEM_RA_SIZE               => C_MEM_ADDR_WIDTH            ,
               MEM_BA_SIZE               => C_MEM_BANKADDR_WIDTH            ,
               MEM_CA_SIZE               => C_MEM_NUM_COL_BITS            ,
               MEM_RAS_VAL               => MEM_RAS_VAL            , 
               MEM_RCD_VAL               => MEM_RCD_VAL            , 
               MEM_REFI_VAL               => MEM_REFI_VAL           , 
               MEM_RFC_VAL               => MEM_RFC_VAL            , 
               MEM_RP_VAL                => MEM_RP_VAL             , 
               MEM_WR_VAL                => MEM_WR_VAL             , 
               MEM_RTP_VAL               => MEM_RTP_VAL            , 
               MEM_WTR_VAL               => MEM_WTR_VAL            ,
               CAL_BYPASS        => C_MC_CALIB_BYPASS,     
               CAL_RA            => C_MC_CALIBRATION_RA,    
               CAL_BA            => C_MC_CALIBRATION_BA ,   
               CAL_CA            => C_MC_CALIBRATION_CA, 
               CAL_CLK_DIV        => C_MC_CALIBRATION_CLK_DIV,      
               CAL_DELAY         => C_MC_CALIBRATION_DELAY,
--               CAL_CALIBRATION_MODE=> C_MC_CALIBRATION_MODE,
               ARB_NUM_TIME_SLOTS         => C_ARB_NUM_TIME_SLOTS,
               ARB_TIME_SLOT_0            => C_ARB_TIME_SLOT_0,        
               ARB_TIME_SLOT_1            => C_ARB_TIME_SLOT_1,        
               ARB_TIME_SLOT_2            => C_ARB_TIME_SLOT_2,        
               ARB_TIME_SLOT_3            => C_ARB_TIME_SLOT_3,        
               ARB_TIME_SLOT_4            => C_ARB_TIME_SLOT_4,        
               ARB_TIME_SLOT_5            => C_ARB_TIME_SLOT_5,        
               ARB_TIME_SLOT_6            => C_ARB_TIME_SLOT_6,        
               ARB_TIME_SLOT_7            => C_ARB_TIME_SLOT_7,        
               ARB_TIME_SLOT_8            => C_ARB_TIME_SLOT_8,        
               ARB_TIME_SLOT_9            => C_ARB_TIME_SLOT_9,        
               ARB_TIME_SLOT_10           => C_ARB_TIME_SLOT_10,            
               ARB_TIME_SLOT_11           => C_ARB_TIME_SLOT_11            
             )   PORT MAP                                                
     (
                                                                    
            -- HIGH-SPEED PLL clock interface
             
             PLLCLK            => pllclk1,
             PLLCE              => pllce1,

             PLLLOCK           => '1',
             
            -- DQS CLOCK NETWork interface
             
             DQSIOIN           => idelay_dqs_ioi_s,
             DQSIOIP           => idelay_dqs_ioi_m,
             UDQSIOIN          => idelay_udqs_ioi_s,
             UDQSIOIP          => idelay_udqs_ioi_m,


              --DQSPIN    => in_pre_dqsp,
               DQI       => in_dq,
            -- RESETS - GLOBAl and local
             SYSRST         => MCB_SYSRST ,
   
           -- command port 0
             P0ARBEN            => mig_p0_arb_en,
             P0CMDCLK           => mig_p0_cmd_clk,
             P0CMDEN            => mig_p0_cmd_en,
             P0CMDRA            => mig_p0_cmd_ra,
             P0CMDBA            => mig_p0_cmd_ba,
             P0CMDCA            => mig_p0_cmd_ca,
             
             P0CMDINSTR         => mig_p0_cmd_instr,
             P0CMDBL            => mig_p0_cmd_bl,
             P0CMDEMPTY         => mig_p0_cmd_empty,
             P0CMDFULL          => mig_p0_cmd_full,
             
            -- command port 1 
            
             P1ARBEN            => mig_p1_arb_en,
             P1CMDCLK           => mig_p1_cmd_clk,
             P1CMDEN            => mig_p1_cmd_en,
             P1CMDRA            => mig_p1_cmd_ra,
             P1CMDBA            => mig_p1_cmd_ba,
             P1CMDCA            => mig_p1_cmd_ca,
             
             P1CMDINSTR         => mig_p1_cmd_instr,
             P1CMDBL            => mig_p1_cmd_bl,
             P1CMDEMPTY         => mig_p1_cmd_empty,
             P1CMDFULL          => mig_p1_cmd_full,

            -- command port 2
             
             P2ARBEN            => mig_p2_arb_en,
             P2CMDCLK           => mig_p2_cmd_clk,
             P2CMDEN            => mig_p2_cmd_en,
             P2CMDRA            => mig_p2_cmd_ra,
             P2CMDBA            => mig_p2_cmd_ba,
             P2CMDCA            => mig_p2_cmd_ca,
             
             P2CMDINSTR         => mig_p2_cmd_instr,
             P2CMDBL            => mig_p2_cmd_bl,
             P2CMDEMPTY         => mig_p2_cmd_empty,
             P2CMDFULL          => mig_p2_cmd_full,

            -- command port 3
             
             P3ARBEN            => mig_p3_arb_en,
             P3CMDCLK           => mig_p3_cmd_clk,
             P3CMDEN            => mig_p3_cmd_en,
             P3CMDRA            => mig_p3_cmd_ra,
             P3CMDBA            => mig_p3_cmd_ba,
             P3CMDCA            => mig_p3_cmd_ca,
                               
             P3CMDINSTR         => mig_p3_cmd_instr,
             P3CMDBL            => mig_p3_cmd_bl,
             P3CMDEMPTY         => mig_p3_cmd_empty,
             P3CMDFULL          => mig_p3_cmd_full,

            -- command port 4 -- don't care in config 2
             
             P4ARBEN            => mig_p4_arb_en,
             P4CMDCLK           => mig_p4_cmd_clk,
             P4CMDEN            => mig_p4_cmd_en,
             P4CMDRA            => mig_p4_cmd_ra,
             P4CMDBA            => mig_p4_cmd_ba,
             P4CMDCA            => mig_p4_cmd_ca,
                               
             P4CMDINSTR         => mig_p4_cmd_instr,
             P4CMDBL            => mig_p4_cmd_bl,
             P4CMDEMPTY         => mig_p4_cmd_empty,
             P4CMDFULL          => mig_p4_cmd_full,

            -- command port 5-- don't care in config 2
             
             P5ARBEN            => mig_p5_arb_en,
             P5CMDCLK           => mig_p5_cmd_clk,
             P5CMDEN            => mig_p5_cmd_en,
             P5CMDRA            => mig_p5_cmd_ra,
             P5CMDBA            => mig_p5_cmd_ba,
             P5CMDCA            => mig_p5_cmd_ca,
                               
             P5CMDINSTR         => mig_p5_cmd_instr,
             P5CMDBL            => mig_p5_cmd_bl,
             P5CMDEMPTY         => mig_p5_cmd_empty,
             P5CMDFULL          => mig_p5_cmd_full,

              
            -- IOI & IOB SIGNals/tristate interface
             
             DQIOWEN0        => dqIO_w_en_0,
             DQSIOWEN90P     => dqsIO_w_en_90_p,
             DQSIOWEN90N     => dqsIO_w_en_90_n,
             
             
            -- IOB MEMORY INTerface signals
             ADDR         => address_90, 
             BA           => ba_90 ,     
             RAS         => ras_90 ,    
             CAS         => cas_90 ,    
             WE          => we_90  ,    
             CKE          => cke_90 ,    
             ODT          => odt_90 ,    
             RST          => rst_90 ,    
             
            -- CALIBRATION DRP interface
             IOIDRPCLK           => ioi_drp_clk    ,
             IOIDRPADDR          => ioi_drp_addr   ,
             IOIDRPSDO           => ioi_drp_sdo    ,
             IOIDRPSDI           => ioi_drp_sdi    ,
             IOIDRPCS            => ioi_drp_cs     ,
             IOIDRPADD           => ioi_drp_add    ,
             IOIDRPBROADCAST     => ioi_drp_broadcast  ,
             IOIDRPTRAIN         => ioi_drp_train    ,
             IOIDRPUPDATE         => ioi_drp_update ,
             
            -- CALIBRATION DAtacapture interface
            --SPECIAL COMMANDs
             RECAL               => mcb_recal    ,
             UIREAD               => mcb_ui_read,
             UIADD                => mcb_ui_add    ,
             UICS                 => mcb_ui_cs     ,
             UICLK                => mcb_ui_clk    ,
             UISDI                => mcb_ui_sdi    ,
             UIADDR               => mcb_ui_addr   ,
             UIBROADCAST          => mcb_ui_broadcast,
             UIDRPUPDATE          => mcb_ui_drp_update,
             UIDONECAL            => mcb_ui_done_cal,
             UICMD                => mcb_ui_cmd,
             UICMDIN              => mcb_ui_cmd_in,
             UICMDEN              => mcb_ui_cmd_en,
             UIDQCOUNT            => mcb_ui_dqcount,
             UIDQLOWERDEC          => mcb_ui_dq_lower_dec,
             UIDQLOWERINC          => mcb_ui_dq_lower_inc,
             UIDQUPPERDEC          => mcb_ui_dq_upper_dec,
             UIDQUPPERINC          => mcb_ui_dq_upper_inc,
             UIUDQSDEC          => mcb_ui_udqs_dec,
             UIUDQSINC          => mcb_ui_udqs_inc,
             UILDQSDEC          => mcb_ui_ldqs_dec,
             UILDQSINC          => mcb_ui_ldqs_inc,
             UODATA             => uo_data_int,
             UODATAVALID          => uo_data_valid_int,
             UODONECAL            => hard_done_cal  ,
             UOCMDREADYIN         => uo_cmd_ready_in_int,
             UOREFRSHFLAG         => uo_refrsh_flag_xhdl23,
             UOCALSTART           => uo_cal_start_int,
             UOSDO                => uo_sdo_xhdl24,

            --CONTROL SIGNALS
              STATUS                    => status,
              SELFREFRESHENTER          => selfrefresh_mcb_enter,
              SELFREFRESHMODE           => selfrefresh_mcb_mode, 
------------------------------------------------
--MUIs
------------------------------------------------
            
              P0RDDATA         =>  mig_p0_rd_data ( 31 downto 0),
              P1RDDATA         =>  mig_p1_rd_data ( 31 downto 0),
              P2RDDATA         =>  mig_p2_rd_data ( 31 downto 0),
              P3RDDATA         =>  mig_p3_rd_data ( 31 downto 0),
              P4RDDATA         =>  mig_p4_rd_data ( 31 downto 0),
              P5RDDATA         =>  mig_p5_rd_data ( 31 downto 0),
              LDMN             =>  dqnlm       ,
              UDMN             =>  dqnum       ,
              DQON             =>  dqo_n       ,
              DQOP             =>  dqo_p       ,
              LDMP             =>  dqplm       ,
              UDMP             =>  dqpum       ,
              
              P0RDCOUNT          =>  mig_p0_rd_count ,
              P0WRCOUNT          =>  mig_p0_wr_count ,
              P1RDCOUNT          =>  mig_p1_rd_count ,
              P1WRCOUNT          =>  mig_p1_wr_count ,
              P2COUNT           =>  mig_p2_count  ,
              P3COUNT           =>  mig_p3_count  ,
              P4COUNT           =>  mig_p4_count  ,
              P5COUNT           =>  mig_p5_count  ,
              
             -- NEW ADDED FIFo status siganls
             -- MIG USER PORT 0
              P0RDEMPTY        =>  mig_p0_rd_empty,
              P0RDFULL         =>  mig_p0_rd_full,
              P0RDOVERFLOW     =>  mig_p0_rd_overflow,
              P0WREMPTY        =>  mig_p0_wr_empty,
              P0WRFULL         =>  mig_p0_wr_full,
              P0WRUNDERRUN     =>  mig_p0_wr_underrun,
             -- MIG USER PORT 1
              P1RDEMPTY        =>  mig_p1_rd_empty,
              P1RDFULL         =>  mig_p1_rd_full,
              P1RDOVERFLOW     =>  mig_p1_rd_overflow, 
              P1WREMPTY        =>  mig_p1_wr_empty,
              P1WRFULL         =>  mig_p1_wr_full,
              P1WRUNDERRUN     =>  mig_p1_wr_underrun, 
              
             -- MIG USER PORT 2
              P2EMPTY          =>  mig_p2_empty,
              P2FULL           =>  mig_p2_full,
              P2RDOVERFLOW        =>  mig_p2_overflow,
              P2WRUNDERRUN       =>  mig_p2_underrun,
              
              P3EMPTY          =>  mig_p3_empty ,
              P3FULL           =>  mig_p3_full ,
              P3RDOVERFLOW        =>  mig_p3_overflow,
              P3WRUNDERRUN       =>  mig_p3_underrun ,
             -- MIG USER PORT 3
              P4EMPTY          =>  mig_p4_empty,
              P4FULL           =>  mig_p4_full,
              P4RDOVERFLOW        =>  mig_p4_overflow,
              P4WRUNDERRUN       =>  mig_p4_underrun,
              
              P5EMPTY          =>  mig_p5_empty ,
              P5FULL           =>  mig_p5_full ,
              P5RDOVERFLOW        =>  mig_p5_overflow,
              P5WRUNDERRUN       =>  mig_p5_underrun,
              
             ---------------------------------------------------------
              P0WREN        =>  mig_p0_wr_en,
              P0RDEN        =>  mig_p0_rd_en,                        
              P1WREN        =>  mig_p1_wr_en,
              P1RDEN        =>  mig_p1_rd_en,
              P2EN          =>  mig_p2_en,
              P3EN          =>  mig_p3_en,
              P4EN          =>  mig_p4_en,
              P5EN          =>  mig_p5_en,
             -- WRITE  MASK BIts connection
              P0RWRMASK        =>  mig_p0_wr_mask(3 downto 0),
              P1RWRMASK        =>  mig_p1_wr_mask(3 downto 0),
              P2WRMASK        =>  mig_p2_wr_mask(3 downto 0),
              P3WRMASK        =>  mig_p3_wr_mask(3 downto 0),
              P4WRMASK        =>  mig_p4_wr_mask(3 downto 0),
              P5WRMASK        =>  mig_p5_wr_mask(3 downto 0),
             -- DATA WRITE COnnection
              P0WRDATA      =>  mig_p0_wr_data(31 downto 0),
              P1WRDATA      =>  mig_p1_wr_data(31 downto 0),
              P2WRDATA      =>  mig_p2_wr_data(31 downto 0),
              P3WRDATA      =>  mig_p3_wr_data(31 downto 0),
              P4WRDATA      =>  mig_p4_wr_data(31 downto 0),
              P5WRDATA      =>  mig_p5_wr_data(31 downto 0),
              
              P0WRERROR     => mig_p0_wr_error,
              P1WRERROR     => mig_p1_wr_error,
              P0RDERROR     => mig_p0_rd_error,
              P1RDERROR     => mig_p1_rd_error,
              
              P2ERROR       => mig_p2_error,
              P3ERROR       => mig_p3_error,
              P4ERROR       => mig_p4_error,
              P5ERROR       => mig_p5_error,
              
             --  USER SIDE DAta ports clock
             --  128 BITS CONnections
              P0WRCLK            =>  mig_p0_wr_clk  ,
              P1WRCLK            =>  mig_p1_wr_clk  ,
              P0RDCLK            =>  mig_p0_rd_clk  ,
              P1RDCLK            =>  mig_p1_rd_clk  ,
              P2CLK              =>  mig_p2_clk  ,
              P3CLK              =>  mig_p3_clk  ,
              P4CLK              =>  mig_p4_clk  ,
              P5CLK              =>  mig_p5_clk 
              );

--//////////////////////////////////////////////////////
--// Input Termination Calibration
--//////////////////////////////////////////////////////
             

--process(ui_clk)
--begin
--if (ui_clk'event and ui_clk = '1') then
--      syn1_sys_rst <= sys_rst;
--      syn2_sys_rst <= syn1_sys_rst;
--end if;
--end process;
             
 uo_done_cal_sig <= DONE_SOFTANDHARD_CAL WHEN (C_CALIB_SOFT_IP = "TRUE") ELSE
                         hard_done_cal;


   gen_term_calib : IF (C_CALIB_SOFT_IP = "TRUE") GENERATE
      mcb_soft_calibration_top_inst : mcb_soft_calibration_top
      generic map (   C_MEM_TZQINIT_MAXCNT  => C_MEM_TZQINIT_MAXCNT,
                      C_MC_CALIBRATION_MODE => C_MC_CALIBRATION_MODE, 
                      SKIP_IN_TERM_CAL      => C_SKIP_IN_TERM_CAL,
                      SKIP_DYNAMIC_CAL      => C_SKIP_DYNAMIC_CAL,
                      SKIP_DYN_IN_TERM      => C_SKIP_DYN_IN_TERM,
                      C_SIMULATION          => C_SIMULATION,
                      C_MEM_TYPE            => C_MEM_TYPE
                   )
  
         PORT MAP (
            UI_CLK                => ui_clk,
            --RST                   => syn2_sys_rst,
            RST                   => int_sys_rst,
            IOCLK                 => ioclk0,
            DONE_SOFTANDHARD_CAL  => DONE_SOFTANDHARD_CAL,
            --PLL_LOCK              => pll_lock,
            PLL_LOCK              => gated_pll_lock,

            --SELFREFRESH_REQ       => selfrefresh_enter,     -- from user app
            SELFREFRESH_REQ       => soft_cal_selfrefresh_req,     -- from user app
            SELFREFRESH_MCB_MODE  => selfrefresh_mcb_mode,  -- from MCB
            SELFREFRESH_MCB_REQ   => selfrefresh_mcb_enter, -- to mcb
            SELFREFRESH_MODE      => selfrefresh_mode_sig,      -- to user app

            MCB_UIADD             => mcb_ui_add,
            MCB_UISDI             => mcb_ui_sdi,
            MCB_UOSDO             => uo_sdo_xhdl24,
            MCB_UODONECAL         => hard_done_cal,
            MCB_UOREFRSHFLAG      => uo_refrsh_flag_xhdl23,
            MCB_UICS              => mcb_ui_cs,
            MCB_UIDRPUPDATE       => mcb_ui_drp_update,
            MCB_UIBROADCAST       => mcb_ui_broadcast,
            MCB_UIADDR            => mcb_ui_addr,
            MCB_UICMDEN           => mcb_ui_cmd_en,
            MCB_UIDONECAL         => mcb_ui_done_cal,
            MCB_UIDQLOWERDEC      => mcb_ui_dq_lower_dec,
            MCB_UIDQLOWERINC      => mcb_ui_dq_lower_inc,
            MCB_UIDQUPPERDEC      => mcb_ui_dq_upper_dec,
            MCB_UIDQUPPERINC      => mcb_ui_dq_upper_inc,
            MCB_UILDQSDEC         => mcb_ui_ldqs_dec,
            MCB_UILDQSINC         => mcb_ui_ldqs_inc,
            MCB_UIREAD            => mcb_ui_read,
            MCB_UIUDQSDEC         => mcb_ui_udqs_dec,
            MCB_UIUDQSINC         => mcb_ui_udqs_inc,
            MCB_RECAL             => mcb_recal,
            MCB_SYSRST            => MCB_SYSRST,
            MCB_UICMD             => mcb_ui_cmd,
            MCB_UICMDIN           => mcb_ui_cmd_in,    
            MCB_UIDQCOUNT         => mcb_ui_dqcount,     
            MCB_UODATA            => uo_data_int,    
            MCB_UODATAVALID       => uo_data_valid_int,    
            MCB_UOCMDREADY        => uo_cmd_ready_in_int, 
            MCB_UO_CAL_START      => uo_cal_start_int,
            RZQ_PIN               => rzq,
            ZIO_PIN               => zio,
            CKE_Train             => cke_train
         );
         mcb_ui_clk <= ui_clk;
   END GENERATE;


   gen_no_term_calib : if (NOT(C_CALIB_SOFT_IP = "TRUE")) generate
      DONE_SOFTANDHARD_CAL <= '0';
      MCB_SYSRST <= int_sys_rst or not(wait_200us_counter(15));
      mcb_recal <= calib_recal;
      mcb_ui_read <= ui_read;
      mcb_ui_add <= ui_add;
      mcb_ui_cs <= ui_cs;
      mcb_ui_clk <= ui_clk;
      mcb_ui_sdi <= ui_sdi;
      mcb_ui_addr <= ui_addr;
      mcb_ui_broadcast <= ui_broadcast;
      mcb_ui_drp_update <= ui_drp_update;
      mcb_ui_done_cal <= ui_done_cal;
      mcb_ui_cmd <= ui_cmd;
      mcb_ui_cmd_in <= ui_cmd_in;
      mcb_ui_cmd_en <= ui_cmd_en;
      mcb_ui_dqcount <= ui_dqcount;
      mcb_ui_dq_lower_dec <= ui_dq_lower_dec;
      mcb_ui_dq_lower_inc <= ui_dq_lower_inc;
      mcb_ui_dq_upper_dec <= ui_dq_upper_dec;
      mcb_ui_dq_upper_inc <= ui_dq_upper_inc;
      mcb_ui_udqs_inc <= ui_udqs_inc;
      mcb_ui_udqs_dec <= ui_udqs_dec;
      mcb_ui_ldqs_inc <= ui_ldqs_inc;
      mcb_ui_ldqs_dec <= ui_ldqs_dec;
      selfrefresh_mode_sig <= '0';

      -- synthesis translate_off
      init_sequence: if (C_SIMULATION = "FALSE") generate      
      -- synthesis translate_on
         process (ui_clk, int_sys_rst)
         begin
            if (int_sys_rst = '1') then
               wait_200us_counter <= (others => '0');
            elsif (ui_clk'event and ui_clk = '1') then   -- UI_CLK maximum is up to 100 MHz
               if (wait_200us_counter(15) = '1') then
                  wait_200us_counter <= wait_200us_counter;
               else
                  wait_200us_counter <= wait_200us_counter + '1';
               end if;
            end if;
         end process;
      -- synthesis translate_off
      end generate;

      init_sequence_skip: if (C_SIMULATION = "TRUE") generate
         wait_200us_counter <= X"FFFF";
         process
         begin
            report "The 200 us wait period required before CKE goes active has been skipped in Simulation";
            wait;
         end process;
      end generate;
      -- synthesis translate_on
 
      gen_cketrain_a: if (C_MEM_TYPE = "DDR2") generate
         process (ui_clk)
         begin
            -- When wait_200us_[13] and wait_200us_[14] are both asserted,
            -- 200 us wait should have been passed. 
            if (ui_clk'event and ui_clk = '1') then
               if ((wait_200us_counter(14) and wait_200us_counter(13)) = '1') then
                  wait_200us_done_r1 <= '1';
               else
                  wait_200us_done_r1 <= '0';
               end if;
               wait_200us_done_r2 <= wait_200us_done_r1;
            end if;
         end process;

         process (ui_clk, int_sys_rst)
         begin
            if (int_sys_rst = '1') then
               cke_train_reg <= '0';
            elsif (ui_clk'event and ui_clk = '1') then
               if ((wait_200us_done_r1 and not(wait_200us_done_r2)) = '1') then
                  cke_train_reg <= '1';
               elsif (uo_done_cal_sig = '1') then
                  cke_train_reg <= '0';
               end if;
            end if;
         end process;

         cke_train <= cke_train_reg;
      end generate;      

      gen_cketrain_b: if (NOT(C_MEM_TYPE = "DDR2")) generate
         
         cke_train <= '0';

      end generate;

   end generate;
   


--//////////////////////////////////////////////////////
--//ODDRDES2 instantiations
--//////////////////////////////////////////////////////

--------
--ADDR
--------

   gen_addr_oserdes2 : FOR addr_ioi IN 0 TO  C_MEM_ADDR_WIDTH - 1 GENERATE
      
      
      ioi_addr_0 : OSERDES2
         GENERIC MAP (
            BYPASS_GCLK_FF  => TRUE,
            DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
            DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
            OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
            SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
            DATA_WIDTH      => 2
         )
         PORT MAP (
            OQ         => ioi_addr(addr_ioi),
            SHIFTOUT1  => open,
            SHIFTOUT2  => open,
            SHIFTOUT3  => open,
            SHIFTOUT4  => open,
            TQ         => t_addr(addr_ioi),
            CLK0       => ioclk0,
            CLK1       => '0',
            CLKDIV     => '0',
            D1         => address_90(addr_ioi),
            D2         => address_90(addr_ioi),
            D3         => '0',
            D4         => '0',
            IOCE       => pll_ce_0,
            OCE        => '1',
            RST        => int_sys_rst,
            SHIFTIN1   => '0',
            SHIFTIN2   => '0',
            SHIFTIN3   => '0',
            SHIFTIN4   => '0',
            T1         => '0',
            T2         => '0',
            T3         => '0',
            T4         => '0',
            TCE        => '1',
            TRAIN      => '0'
         );
   END GENERATE;

--------
--BA
--------

   gen_ba_oserdes2 : FOR ba_ioi IN 0 TO  C_MEM_BANKADDR_WIDTH - 1 GENERATE
      
      
      ioi_ba_0 : OSERDES2
         GENERIC MAP (
            BYPASS_GCLK_FF  => TRUE,
            DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
            DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
            OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
            SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
            DATA_WIDTH      => 2
         )
         PORT MAP (
            OQ         => ioi_ba(ba_ioi),
            SHIFTOUT1  => open,
            SHIFTOUT2  => open,
            SHIFTOUT3  => open,
            SHIFTOUT4  => open,
            TQ         => t_ba(ba_ioi),
            CLK0       => ioclk0,
            CLK1       => '0',
            CLKDIV     => '0',
            D1         => ba_90(ba_ioi),
            D2         => ba_90(ba_ioi),
            D3         => '0',
            D4         => '0',
            IOCE       => pll_ce_0,
            OCE        => '1',
            RST        => int_sys_rst,
            SHIFTIN1   => '0',
            SHIFTIN2   => '0',
            SHIFTIN3   => '0',
            SHIFTIN4   => '0',
            T1         => '0',
            T2         => '0',
            T3         => '0',
            T4         => '0',
            TCE        => '1',
            TRAIN      => '0'
         );
   END GENERATE;
   
--------
--CAS
--------
   ioi_cas_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
         DATA_WIDTH      => 2
      )
      PORT MAP (
         OQ         => ioi_cas,
         SHIFTOUT1  => open,
         SHIFTOUT2  => open,
         SHIFTOUT3  => open,
         SHIFTOUT4  => open,
         TQ         => t_cas,
         CLK0       => ioclk0,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => cas_90,
         D2         => cas_90,
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_0,
         OCE        => '1',
         RST        => int_sys_rst,
         SHIFTIN1   => '0',
         SHIFTIN2   => '0',
         SHIFTIN3   => '0',
         SHIFTIN4   => '0',
         T1         => '0',
         T2         => '0',
         T3         => '0',
         T4         => '0',
         TCE        => '1',
         TRAIN      => '0'
      );
   
--------
--CKE
--------
   ioi_cke_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
         DATA_WIDTH      => 2,
         TRAIN_PATTERN   => 15
      )
      PORT MAP (
         OQ         => ioi_cke,
         SHIFTOUT1  => open,
         SHIFTOUT2  => open,
         SHIFTOUT3  => open,
         SHIFTOUT4  => open,
         TQ         => t_cke,
         CLK0       => ioclk0,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => cke_90,
         D2         => cke_90,
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_0,
         --OCE        => '1',
         OCE        => pll_lock,
         RST        => '0', --int_sys_rst
         SHIFTIN1   => '0',
         SHIFTIN2   => '0',
         SHIFTIN3   => '0',
         SHIFTIN4   => '0',
         T1         => '0',
         T2         => '0',
         T3         => '0',
         T4         => '0',
         TCE        => '1',
         TRAIN      => cke_train
      );
--------
--ODT
--------
   xhdl330 : IF (C_MEM_TYPE = "DDR3" OR C_MEM_TYPE = "DDR2") GENERATE
      
      ioi_odt_0 : OSERDES2
         GENERIC MAP (
            BYPASS_GCLK_FF  => TRUE,
            DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
            DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
            OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
            SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
            DATA_WIDTH      => 2
--            TRAIN_PATTERN   => 0
         )
         PORT MAP (
            OQ         => ioi_odt,
            SHIFTOUT1  => open,
            SHIFTOUT2  => open,
            SHIFTOUT3  => open,
            SHIFTOUT4  => open,
            TQ         => t_odt,
            CLK0       => ioclk0,
            CLK1       => '0',
            CLKDIV     => '0',
            D1         => odt_90,
            D2         => odt_90,
            D3         => '0',
            D4         => '0',
            IOCE       => pll_ce_0,
            OCE        => '1',
            RST        => int_sys_rst,
            SHIFTIN1   => '0',
            SHIFTIN2   => '0',
            SHIFTIN3   => '0',
            SHIFTIN4   => '0',
            T1         => '0',
            T2         => '0',
            T3         => '0',
            T4         => '0',
            TCE        => '1',
            TRAIN      => '0'
         );
   END GENERATE;

--------
--RAS
--------
   ioi_ras_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
         DATA_WIDTH      => 2
      )
      PORT MAP (
         OQ         => ioi_ras,
         SHIFTOUT1  => open,
         SHIFTOUT2  => open,
         SHIFTOUT3  => open,
         SHIFTOUT4  => open,
         TQ         => t_ras,
         CLK0       => ioclk0,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => ras_90,
         D2         => ras_90,
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_0,
         OCE        => '1',
         RST        => int_sys_rst,
         SHIFTIN1   => '0',
         SHIFTIN2   => '0',
         SHIFTIN3   => '0',
         SHIFTIN4   => '0',
         T1         => '0',
         T2         => '0',
         T3         => '0',
         T4         => '0',
         TCE        => '1',
         TRAIN      => '0'
      );
--------
--RST
--------
   xhdl331 : IF (C_MEM_TYPE = "DDR3") GENERATE
      ioi_rst_0 : OSERDES2
         GENERIC MAP (
            BYPASS_GCLK_FF  => TRUE,
            DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
            DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
            OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
            SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
            DATA_WIDTH      => 2
         )
         PORT MAP (
            OQ         => ioi_rst,
            SHIFTOUT1  => open,
            SHIFTOUT2  => open,
            SHIFTOUT3  => open,
            SHIFTOUT4  => open,
            TQ         => t_rst,
            CLK0       => ioclk0,
            CLK1       => '0',
            CLKDIV     => '0',
            D1         => rst_90,
            D2         => rst_90,
            D3         => '0',
            D4         => '0',
            IOCE       => pll_ce_0,
            --OCE        => '1',
            OCE        => pll_lock,
            RST        => int_sys_rst,
            SHIFTIN1   => '0',
            SHIFTIN2   => '0',
            SHIFTIN3   => '0',
            SHIFTIN4   => '0',
            T1         => '0',
            T2         => '0',
            T3         => '0',
            T4         => '0',
            TCE        => '1',
            TRAIN      => '0'
         );
   END GENERATE;
--------
--WE
--------
   ioi_we_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
         DATA_WIDTH      => 2
      )
      PORT MAP (
         OQ         => ioi_we,
         TQ         => t_we,
         SHIFTOUT1  => open,
         SHIFTOUT2  => open,
         SHIFTOUT3  => open,
         SHIFTOUT4  => open,
         CLK0       => ioclk0,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => we_90,
         D2         => we_90,
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_0,
         OCE        => '1',
         RST        => int_sys_rst,
         SHIFTIN1   => '0',
         SHIFTIN2   => '0',
         SHIFTIN3   => '0',
         SHIFTIN4   => '0',
         T1         => '0',
         T2         => '0',
         T3         => '0',
         T4         => '0',
         TCE        => '1',
         TRAIN      => '0'
      );
   
--------
--CK
--------
   ioi_ck_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,                    
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
         DATA_WIDTH      => 2
      )
      PORT MAP (
         OQ         => ioi_ck,
         SHIFTOUT1  => open,--ck_shiftout0_1,
         SHIFTOUT2  => open,--ck_shiftout0_2,
         SHIFTOUT3  => open,
         SHIFTOUT4  => open,
         TQ         => t_ck,
         CLK0       => ioclk0,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => '0',
         D2         => '1',
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_0,
         --OCE        => '1',
         OCE        => pll_lock,
         RST        => '0', --int_sys_rst
         SHIFTIN1   => '0',
         SHIFTIN2   => '0',
         SHIFTIN3   => '0',
         SHIFTIN4   => '0',
         T1         => '0',
         T2         => '0',
         T3         => '0',
         T4         => '0',
         TCE        => '1',
         TRAIN      => '0'
      );
   
----------
----CKN
----------
--   ioi_ckn_0 : OSERDES2
--      GENERIC MAP (
--         BYPASS_GCLK_FF  => TRUE,
--         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
--         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
--         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
--         SERDES_MODE     => C_OSERDES2_SERDES_MODE_SLAVE,
--         DATA_WIDTH      => 2
--      )
--      PORT MAP (
--         OQ         => ioi_ckn,
--         SHIFTOUT1  => open,
--         SHIFTOUT2  => open,
--         SHIFTOUT3  => open,--ck_shiftout1_3,
--         SHIFTOUT4  => open,--ck_shiftout1_4,
--         TQ         => t_ckn,
--         CLK0       => ioclk0,
--         CLK1       => '0',
--         CLKDIV     => '0',
--         D1         => '1',
--         D2         => '0',
--         D3         => '0',
--         D4         => '0',
--         IOCE       => pll_ce_0,
--         OCE        => '1',
--         RST        => '0',
--         SHIFTIN1   => '0',
--         SHIFTIN2   => '0',
--         SHIFTIN3   => '0',
--         SHIFTIN4   => '0',
--         T1         => '0',
--         T2         => '0',
--         T3         => '0',
--         T4         => '0',
--         TCE        => '1',
--         TRAIN      => '0'
--      );
--   
--------
--UDM
--------
   
   ioi_udm_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
         DATA_WIDTH      => 2
      )
      PORT MAP (
         OQ         => udm_oq,
         SHIFTOUT1  => open,
         SHIFTOUT2  => open,
         SHIFTOUT3  => open,
         SHIFTOUT4  => open,
         TQ         => udm_t,
         CLK0       => ioclk90,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => dqpum,
         D2         => dqnum,
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_90,
         OCE        => '1',
         RST        => int_sys_rst,
         SHIFTIN1   => '0',
         SHIFTIN2   => '0',
         SHIFTIN3   => '0',
         SHIFTIN4   => '0',
         T1         => dqIO_w_en_0,
         T2         => dqIO_w_en_0,
         T3         => '0',
         T4         => '0',
         TCE        => '1',
         TRAIN      => '0'
      );
   
--------
--LDM
--------
   ioi_ldm_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
         DATA_WIDTH      => 2
      )
      PORT MAP (
         OQ         => ldm_oq,
         SHIFTOUT1  => open,
         SHIFTOUT2  => open,
         SHIFTOUT3  => open,
         SHIFTOUT4  => open,
         TQ         => ldm_t,
         CLK0       => ioclk90,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => dqplm,
         D2         => dqnlm,
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_90,
         OCE        => '1',
         RST        => int_sys_rst,
         SHIFTIN1   => '0',
         SHIFTIN2   => '0',
         SHIFTIN3   => '0',
         SHIFTIN4   => '0',
         T1         => dqIO_w_en_0,
         T2         => dqIO_w_en_0,
         T3         => '0',
         T4         => '0',
         TCE        => '1',
         TRAIN      => '0'
      );
--------
--DQ
--------
   gen_dq : FOR dq IN 0 TO C_NUM_DQ_PINS-1 GENERATE
      oserdes2_dq_0 : OSERDES2
         GENERIC MAP (
            BYPASS_GCLK_FF  => TRUE,
            DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
            DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
            OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
            SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
            DATA_WIDTH      => 2,
            TRAIN_PATTERN   => 5
         )
         PORT MAP (
            OQ         => dq_oq(dq),
            SHIFTOUT1  => open,
            SHIFTOUT2  => open,
            SHIFTOUT3  => open,
            SHIFTOUT4  => open,
            TQ         => dq_tq(dq),
            CLK0       => ioclk90,
            CLK1       => '0',
            CLKDIV     => '0',
            D1         => dqo_p(dq),
            D2         => dqo_n(dq),
            D3         => '0',
            D4         => '0',
            IOCE       => pll_ce_90,
            OCE        => '1',
            RST        => int_sys_rst,
            SHIFTIN1   => '0',
            SHIFTIN2   => '0',
            SHIFTIN3   => '0',
            SHIFTIN4   => '0',
            T1         => dqIO_w_en_0,
            T2         => dqIO_w_en_0,
            T3         => '0',
            T4         => '0',
            TCE        => '1',
            TRAIN      => ioi_drp_train
         );
   END GENERATE;

--------
--DQSP
--------
   
   
   oserdes2_dqsp_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
         DATA_WIDTH      => 2
     --    TRAIN_PATTERN   => 0
      )
      PORT MAP (
         OQ         => dqsp_oq,
         SHIFTOUT1  => open,--dqs_shiftout0_1,
         SHIFTOUT2  => open,--dqs_shiftout0_2,
         SHIFTOUT3  => open,
         SHIFTOUT4  => open,
         TQ         => dqsp_tq,
         CLK0       => ioclk0,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => '0',
         D2         => '1',
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_0,
         OCE        => '1',
         RST        => int_sys_rst,
         SHIFTIN1   => '0',
         SHIFTIN2   => '0',
         SHIFTIN3   => '0',--dqs_shiftout1_3,
         SHIFTIN4   => '0',--dqs_shiftout1_4,
         T1         => dqsIO_w_en_90_n,
         T2         => dqsIO_w_en_90_p,
         T3         => '0',
         T4         => '0',
         TCE        => '1',
         TRAIN      => '0'
      );
   
--------
--DQSN
--------
   
   oserdes2_dqsn_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_SLAVE,
         DATA_WIDTH      => 2
  --       TRAIN_PATTERN   => 0
      )
      PORT MAP (
         OQ         => dqsn_oq,
         SHIFTOUT1  => open,
         SHIFTOUT2  => open,
         SHIFTOUT3  => open,--dqs_shiftout1_3,
         SHIFTOUT4  => open,--dqs_shiftout1_4,
         TQ         => dqsn_tq,
         CLK0       => ioclk0,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => '1',
         D2         => '0',
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_0,
         OCE        => '1',
         RST        => int_sys_rst,
         SHIFTIN1   => '0',--dqs_shiftout0_1,
         SHIFTIN2   => '0',--dqs_shiftout0_2,
         SHIFTIN3   => '0',
         SHIFTIN4   => '0',
         T1         => dqsIO_w_en_90_n,
         T2         => dqsIO_w_en_90_p,
         T3         => '0',
         T4         => '0',
         TCE        => '1',
         TRAIN      => '0'
      );
   
--------
--UDQSP
--------
   
   oserdeS2_UDQSP_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_MASTER,
         DATA_WIDTH      => 2
--         TRAIN_PATTERN   => 0
      )
      PORT MAP (
         OQ         => udqsp_oq,
         SHIFTOUT1  => open,--udqs_shiftout0_1,
         SHIFTOUT2  => open,--udqs_shiftout0_2,
         SHIFTOUT3  => open,
         SHIFTOUT4  => open,
         TQ         => udqsp_tq,
         CLK0       => ioclk0,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => '0',
         D2         => '1',
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_0,
         OCE        => '1',
         RST        => int_sys_rst,
         SHIFTIN1   => '0',
         SHIFTIN2   => '0',
         SHIFTIN3   => '0',--udqs_shiftout1_3,
         SHIFTIN4   => '0',--udqs_shiftout1_4,
         T1         => dqsIO_w_en_90_n,
         t2         => dqsIO_w_en_90_p,
         T3         => '0',
         T4         => '0',
         tce        => '1',
         train      => '0'
      );
   
--------
--UDQSN
--------
   
   oserdes2_udqsn_0 : OSERDES2
      GENERIC MAP (
         BYPASS_GCLK_FF  => TRUE,
         DATA_RATE_OQ    => C_OSERDES2_DATA_RATE_OQ,
         DATA_RATE_OT    => C_OSERDES2_DATA_RATE_OT,
         OUTPUT_MODE     => C_OSERDES2_OUTPUT_MODE_SE,
         SERDES_MODE     => C_OSERDES2_SERDES_MODE_SLAVE,
         DATA_WIDTH      => 2
--         TRAIN_PATTERN   => 0
      )
      PORT MAP (
         OQ         => udqsn_oq,
         SHIFTOUT1  => open,
         SHIFTOUT2  => open,
         SHIFTOUT3  => open,--udqs_shiftout1_3,
         SHIFTOUT4  => open,--udqs_shiftout1_4,
         TQ         => udqsn_tq,
         CLK0       => ioclk0,
         CLK1       => '0',
         CLKDIV     => '0',
         D1         => '1',
         D2         => '0',
         D3         => '0',
         D4         => '0',
         IOCE       => pll_ce_0,
         OCE        => '1',
         RST        => int_sys_rst,
         SHIFTIN1   => '0',--udqs_shiftout0_1,
         SHIFTIN2   => '0',--udqs_shiftout0_2,
         SHIFTIN3   => '0',
         SHIFTIN4   => '0',
         T1         => dqsIO_w_en_90_n,
         T2         => dqsIO_w_en_90_p,
         T3         => '0',
         T4         => '0',
         TCE        => '1',
         TRAIN      => '0'
      );
   
------------------------------------------------------
--*********************************** OSERDES2 instantiations end *******************************************
------------------------------------------------------

------------------------------------------------
--&&&&&&&&&&&&&&&&&&&&&&&&&&&  IODRP2 instantiations  &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
------------------------------------------------
---#####################################--X16 MEMORY WIDTH-#############################################
   
   dq_15_0_data : if (C_NUM_DQ_PINS = 16) GENERATE

--////////////////////////////////////////////////
--DQ14
--////////////////////////////////////////////////

   iodrp2_DQ_14 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ14_TAP_DELAY_VAL,
         MCB_ADDRESS         => 7,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_14,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(14),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(14),
         SDO        => open,
         TOUT       => t_dq(14),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_15,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(14),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(14),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(14)
      );

--////////////////////////////////////////////////
--DQ15
--////////////////////////////////////////////////
   
   
   iodrp2_dq_15 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ15_TAP_DELAY_VAL,
         MCB_ADDRESS         => 7,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_15,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(15),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(15),
         SDO        => open,
         TOUT       => t_dq(15),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => '0',
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(15),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(15),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(15)
      );
   
--////////////////////////////////////////////////
--DQ12
--////////////////////////////////////////////////
   
   iodrp2_DQ_12 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ12_TAP_DELAY_VAL,
         MCB_ADDRESS         => 6,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_12,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(12),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(12),
         SDO        => open,
         TOUT       => t_dq(12),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_13,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(12),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(12),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(12)
      );
   
--////////////////////////////////////////////////
--DQ13
--////////////////////////////////////////////////
   
   iodrp2_dq_13 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ13_TAP_DELAY_VAL,
         MCB_ADDRESS         => 6,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_13,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(13),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(13),
         SDO        => open,
         TOUT       => t_dq(13),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_14,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(13),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(13),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(13)
      );
   
--/////////
--UDQSP
--/////////
   
   iodrp2_UDQSP_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQS_IODRP2_DATA_RATE,
         IDELAY_VALUE        => UDQSP_TAP_DELAY_VAL,
         MCB_ADDRESS         => 14,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQS_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_udqsp,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_udqs,
         DQSOUTN    => open,
         DQSOUTP    => idelay_udqs_ioi_m,
         SDO        => open,
         TOUT       => t_udqs,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_udqsn,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_udqsp,
         IOCLK0     => ioclk0,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => udqsp_oq,
         SDI        => ioi_drp_sdo,
         T          => udqsp_tq
      );
   
--/////////
--UDQSN
--/////////
   
   iodrp2_udqsn_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQS_IODRP2_DATA_RATE,
         IDELAY_VALUE        => UDQSN_TAP_DELAY_VAL,
         MCB_ADDRESS         => 14,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQS_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_udqsn,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_udqsn,
         DQSOUTN    => open,
         DQSOUTP    => idelay_udqs_ioi_s,
         SDO        => open,
         TOUT       => t_udqsn,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_12,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_udqsp,
         IOCLK0     => ioclk0,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => udqsn_oq,
         SDI        => ioi_drp_sdo,
         T          => udqsn_tq
      );
   
--/////////////////////////////////////////////////
--//DQ10
--////////////////////////////////////////////////   
   iodrp2_DQ_10 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ10_TAP_DELAY_VAL,
         MCB_ADDRESS         => 5,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_10,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(10),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(10),
         SDO        => open,
         TOUT       => t_dq(10),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_11,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(10),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(10),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(10)
      );
   
--/////////////////////////////////////////////////
--//DQ11
--////////////////////////////////////////////////   
   
   iodrp2_dq_11 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ11_TAP_DELAY_VAL,
         MCB_ADDRESS         => 5,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_11,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(11),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(11),
         SDO        => open,
         TOUT       => t_dq(11),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_udqsp,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(11),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(11),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(11)
      );
   
--/////////////////////////////////////////////////
--//DQ8
--////////////////////////////////////////////////   
   
   iodrp2_DQ_8 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ8_TAP_DELAY_VAL,
         MCB_ADDRESS         => 4,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_8,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(8),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(8),
         SDO        => open,
         TOUT       => t_dq(8),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_9,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(8),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(8),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(8)
      );
   
--/////////////////////////////////////////////////
--//DQ9
--////////////////////////////////////////////////   
   
   iodrp2_dq_9 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ9_TAP_DELAY_VAL,
         MCB_ADDRESS         => 4,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_9,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(9),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(9),
         SDO        => open,
         TOUT       => t_dq(9),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_10,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(9),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(9),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(9)
      );
   
--/////////////////////////////////////////////////
--//DQ0
--////////////////////////////////////////////////   
   
   iodrp2_DQ_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ0_TAP_DELAY_VAL,
         MCB_ADDRESS         => 0,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_0,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(0),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(0),
         SDO        => open,
         TOUT       => t_dq(0),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_1,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(0),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(0),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(0)
      );
   
--/////////////////////////////////////////////////
--//DQ1
--////////////////////////////////////////////////   
   
   iodrp2_dq_1 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ1_TAP_DELAY_VAL,
         MCB_ADDRESS         => 0,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_1,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(1),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(1),
         SDO        => open,
         TOUT       => t_dq(1),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_8,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(1),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(1),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(1)
      );
   
--/////////////////////////////////////////////////
--//DQ2
--////////////////////////////////////////////////   
   
   iodrp2_DQ_2 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ2_TAP_DELAY_VAL,
         MCB_ADDRESS         => 1,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_2,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(2),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(2),
         SDO        => open,
         TOUT       => t_dq(2),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_3,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(2),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(2),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(2)
      );
   
--/////////////////////////////////////////////////
--//DQ3
--////////////////////////////////////////////////   
   
   iodrp2_dq_3 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ3_TAP_DELAY_VAL,
         MCB_ADDRESS         => 1,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_3,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(3),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(3),
         SDO        => open,
         TOUT       => t_dq(3),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_0,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(3),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(3),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(3)
      );
   
--/////////
--//DQSP
--/////////
   
   iodrp2_DQSP_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQS_IODRP2_DATA_RATE,
         IDELAY_VALUE        => LDQSP_TAP_DELAY_VAL,
         MCB_ADDRESS         => 15,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQS_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_dqsp,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dqs,
         DQSOUTN    => open,
         DQSOUTP    => idelay_dqs_ioi_m,
         SDO        => open,
         TOUT       => t_dqs,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_dqsn,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dqsp,
         IOCLK0     => ioclk0,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dqsp_oq,
         SDI        => ioi_drp_sdo,
         T          => dqsp_tq
      );
   
--/////////
--//DQSN
--/////////
   
   iodrp2_dqsn_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQS_IODRP2_DATA_RATE,
         IDELAY_VALUE        => LDQSN_TAP_DELAY_VAL,
         MCB_ADDRESS         => 15,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQS_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_dqsn,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dqsn,
         DQSOUTN    => open,
         DQSOUTP    => idelay_dqs_ioi_s,
         SDO        => open,
         TOUT       => t_dqsn,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_2,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dqsp,
         IOCLK0     => ioclk0,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dqsn_oq,
         SDI        => ioi_drp_sdo,
         T          => dqsn_tq
      );
   
--/////////////////////////////////////////////////
--//DQ6
--////////////////////////////////////////////////
   
   iodrp2_DQ_6 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ6_TAP_DELAY_VAL,
         MCB_ADDRESS         => 3,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_6,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(6),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(6),
         SDO        => open,
         TOUT       => t_dq(6),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_7,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(6),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(6),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(6)
      );
   
--/////////////////////////////////////////////////
--//DQ7
--////////////////////////////////////////////////
   
   iodrp2_dq_7 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ7_TAP_DELAY_VAL,
         MCB_ADDRESS         => 3,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_7,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(7),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(7),
         SDO        => open,
         TOUT       => t_dq(7),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_dqsp,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(7),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(7),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(7)
      );
   
--/////////////////////////////////////////////////
--//DQ4
--////////////////////////////////////////////////
   
   iodrp2_DQ_4 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ4_TAP_DELAY_VAL,
         MCB_ADDRESS         => 2,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_4,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(4),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(4),
         SDO        => open,
         TOUT       => t_dq(4),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_5,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(4),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(4),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(4)
      );
   
--/////////////////////////////////////////////////
--//DQ5
--////////////////////////////////////////////////
   
   iodrp2_dq_5 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ5_TAP_DELAY_VAL,
         MCB_ADDRESS         => 2,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_5,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(5),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(5),
         SDO        => open,
         TOUT       => t_dq(5),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_6,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(5),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(5),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(5)
      );
   
   
  
   
--/////////////////////////////////////////////////
--//UDM
--////////////////////////////////////////////////
   
   iodrp2_dq_udm : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => 0,
         MCB_ADDRESS         => 8,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => ioi_drp_sdi,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_udm,
         DQSOUTN    => open,
         DQSOUTP    => open,
         SDO        => open,
         TOUT       => t_udm,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_ldm,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => '0',
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => udm_oq,
         SDI        => ioi_drp_sdo,
         T          => udm_t
      );

--/////////////////////////////////////////////////
--//LDM
--////////////////////////////////////////////////
   
   iodrp2_dq_ldm : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => 0,
         MCB_ADDRESS         => 8,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_ldm,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_ldm,
         DQSOUTN    => open,
         DQSOUTP    => open,
         SDO        => open,
         TOUT       => t_ldm,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_4,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => '0',
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => ldm_oq,
         SDI        => ioi_drp_sdo,
         T          => ldm_t
      );

end generate;

---#####################################--X8 MEMORY WIDTH-#############################################
   
   dq_7_0_data : if (C_NUM_DQ_PINS = 8) GENERATE
--/////////////////////////////////////////////////
--//DQ0
--////////////////////////////////////////////////
   iodrp2_DQ_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ0_TAP_DELAY_VAL,
         MCB_ADDRESS         => 0,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_0,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(0),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(0),
         SDO        => open,
         TOUT       => t_dq(0),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_1,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(0),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(0),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(0)
      );
   
--/////////////////////////////////////////////////
--//DQ1
--////////////////////////////////////////////////
   
   iodrp2_dq_1 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ1_TAP_DELAY_VAL,
         MCB_ADDRESS         => 0,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_1,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(1),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(1),
         SDO        => open,
         TOUT       => t_dq(1),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => '0',
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(1),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(1),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(1)
      );
   
--/////////////////////////////////////////////////
--//DQ2
--////////////////////////////////////////////////
   
   iodrp2_DQ_2 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ2_TAP_DELAY_VAL,
         MCB_ADDRESS         => 1,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_2,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(2),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(2),
         SDO        => open,
         TOUT       => t_dq(2),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_3,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(2),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(2),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(2)
      );
   
--/////////////////////////////////////////////////
--//DQ3
--////////////////////////////////////////////////
   
   iodrp2_dq_3 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ3_TAP_DELAY_VAL,
         MCB_ADDRESS         => 1,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_3,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(3),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(3),
         SDO        => open,
         TOUT       => t_dq(3),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_0,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(3),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(3),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(3)
      );
   
--/////////
--//DQSP
--/////////
   
   iodrp2_DQSP_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQS_IODRP2_DATA_RATE,
         IDELAY_VALUE        => LDQSP_TAP_DELAY_VAL,
         MCB_ADDRESS         => 15,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQS_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_dqsp,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dqs,
         DQSOUTN    => open,
         DQSOUTP    => idelay_dqs_ioi_m,
         SDO        => open,
         TOUT       => t_dqs,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_dqsn,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dqsp,
         IOCLK0     => ioclk0,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dqsp_oq,
         SDI        => ioi_drp_sdo,
         T          => dqsp_tq
      );
   
--/////////
--//DQSN
--/////////   
   iodrp2_dqsn_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQS_IODRP2_DATA_RATE,
         IDELAY_VALUE        => LDQSN_TAP_DELAY_VAL,
         MCB_ADDRESS         => 15,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQS_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_dqsn,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dqsn,
         DQSOUTN    => open,
         DQSOUTP    => idelay_dqs_ioi_s,
         SDO        => open,
         TOUT       => t_dqsn,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_2,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dqsp,
         IOCLK0     => ioclk0,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dqsn_oq,
         SDI        => ioi_drp_sdo,
         T          => dqsn_tq
      );
   
--/////////////////////////////////////////////////
--//DQ6
--////////////////////////////////////////////////
   
   iodrp2_DQ_6 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ6_TAP_DELAY_VAL,
         MCB_ADDRESS         => 3,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_6,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(6),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(6),
         SDO        => open,
         TOUT       => t_dq(6),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_7,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(6),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(6),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(6)
      );
   
--/////////////////////////////////////////////////
--//DQ7
--////////////////////////////////////////////////
   
   iodrp2_dq_7 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ7_TAP_DELAY_VAL,
         MCB_ADDRESS         => 3,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_7,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(7),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(7),
         SDO        => open,
         TOUT       => t_dq(7),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_dqsp,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(7),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(7),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(7)
      );
   
--/////////////////////////////////////////////////
--//DQ4
--////////////////////////////////////////////////
   
   iodrp2_DQ_4 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ4_TAP_DELAY_VAL,
         MCB_ADDRESS         => 2,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_4,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(4),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(4),
         SDO        => open,
         TOUT       => t_dq(4),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_5,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(4),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(4),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(4)
      );
--/////////////////////////////////////////////////
--//DQ5
--////////////////////////////////////////////////
   
   
   iodrp2_dq_5 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ5_TAP_DELAY_VAL,
         MCB_ADDRESS         => 2,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_5,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(5),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(5),
         SDO        => open,
         TOUT       => t_dq(5),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_6,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(5),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(5),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(5)
      );
   
   
   
--NEED TO GENERATE UDM so that user won't instantiate in this location
   
--/////////////////////////////////////////////////
--//UDM
--////////////////////////////////////////////////
   
   iodrp2_dq_udm : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => 0,
         MCB_ADDRESS         => 8,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => ioi_drp_sdi,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_udm,
         DQSOUTN    => open,
         DQSOUTP    => open,
         SDO        => open,
         TOUT       => t_udm,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_ldm,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => '0',
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => udm_oq,
         SDI        => ioi_drp_sdo,
         T          => udm_t
      );

--/////////////////////////////////////////////////
--//LDM
--////////////////////////////////////////////////
   
   iodrp2_dq_ldm : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => 0,
         MCB_ADDRESS         => 8,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_ldm,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_ldm,
         DQSOUTN    => open,
         DQSOUTP    => open,
         SDO        => open,
         TOUT       => t_ldm,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_4,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => '0',
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => ldm_oq,
         SDI        => ioi_drp_sdo,
         T          => ldm_t
      );

end generate;

---#####################################--X4 MEMORY WIDTH-#############################################
   
   dq_3_0_data : if (C_NUM_DQ_PINS = 4) GENERATE
--/////////////////////////////////////////////////
--//DQ0
--////////////////////////////////////////////////

   iodrp2_DQ_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ0_TAP_DELAY_VAL,
         MCB_ADDRESS         => 0,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_0,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(0),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(0),
         SDO        => open,
         TOUT       => t_dq(0),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_1,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(0),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(0),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(0)
      );
   
 --/////////////////////////////////////////////////
--//DQ1
--////////////////////////////////////////////////
  
   iodrp2_dq_1 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ1_TAP_DELAY_VAL,
         MCB_ADDRESS         => 0,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_1,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(1),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(1),
         SDO        => open,
         TOUT       => t_dq(1),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => '0',
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(1),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(1),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(1)
      );
   
 --/////////////////////////////////////////////////
--//DQ2
--////////////////////////////////////////////////
  
   iodrp2_DQ_2 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ2_TAP_DELAY_VAL,
         MCB_ADDRESS         => 1,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_2,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(2),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(2),
         SDO        => open,
         TOUT       => t_dq(2),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_3,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(2),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(2),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(2)
      );
   
--/////////////////////////////////////////////////
--//DQ3
--////////////////////////////////////////////////
   
   iodrp2_dq_3 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => DQ3_TAP_DELAY_VAL,
         MCB_ADDRESS         => 1,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_3,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dq(3),
         DQSOUTN    => open,
         DQSOUTP    => in_dq(3),
         SDO        => open,
         TOUT       => t_dq(3),
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_0,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dq(3),
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dq_oq(3),
         SDI        => ioi_drp_sdo,
         T          => dq_tq(3)
      );
   
--///////////////////////////////////////////////
--DQSP
--///////////////////////////////////////////////
   iodrp2_DQSP_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQS_IODRP2_DATA_RATE,
         IDELAY_VALUE        => LDQSP_TAP_DELAY_VAL,
         MCB_ADDRESS         => 15,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQS_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_dqsp,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dqs,
         DQSOUTN    => open,
         DQSOUTP    => idelay_dqs_ioi_m,
         SDO        => open,
         TOUT       => t_dqs,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_dqsn,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dqsp,
         IOCLK0     => ioclk0,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dqsp_oq,
         SDI        => ioi_drp_sdo,
         T          => dqsp_tq
      );
   
--///////////////////////////////////////////////
--DQSN
--///////////////////////////////////////////////
   
   iodrp2_dqsn_0 : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQS_IODRP2_DATA_RATE,
         IDELAY_VALUE        => LDQSN_TAP_DELAY_VAL,
         MCB_ADDRESS         => 15,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQS_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_dqsn,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_dqsn,
         DQSOUTN    => open,
         DQSOUTP    => idelay_dqs_ioi_s,
         SDO        => open,
         TOUT       => t_dqsn,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_2,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => in_pre_dqsp,
         IOCLK0     => ioclk0,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => dqsn_oq,
         SDI        => ioi_drp_sdo,
         T          => dqsn_tq
      );
--///////////////////////////////////////////////
--UDM
--//////////////////////////////////////////////  
 --NEED TO GENERATE UDM so that user won't instantiate in this location
  
   
   iodrp2_dq_udm : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => 0,
         MCB_ADDRESS         => 8,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_MASTER,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => ioi_drp_sdi,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_udm,
         DQSOUTN    => open,
         DQSOUTP    => open,
         SDO        => open,
         TOUT       => t_udm,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_ldm,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => '0',
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => udm_oq,
         SDI        => ioi_drp_sdo,
         T          => udm_t
      );

--///////////////////////////////////////////////
--LDM
--//////////////////////////////////////////////  
   
   
   iodrp2_dq_ldm : IODRP2_MCB
      GENERIC MAP (
         DATA_RATE           => C_DQ_IODRP2_DATA_RATE,
         IDELAY_VALUE        => 0,
         MCB_ADDRESS         => 8,
         ODELAY_VALUE        => 0,
         SERDES_MODE         => C_DQ_IODRP2_SERDES_MODE_SLAVE,
         SIM_TAPDELAY_VALUE  => 10
      )
      PORT MAP (
         AUXSDO     => aux_sdi_out_ldm,
         DATAOUT    => open,
         DATAOUT2   => open,
         DOUT       => ioi_ldm,
         DQSOUTN    => open,
         DQSOUTP    => open,
         SDO        => open,
         TOUT       => t_ldm,
         ADD        => ioi_drp_add,
         AUXADDR    => ioi_drp_addr,
         AUXSDOIN   => aux_sdi_out_4,
         BKST       => ioi_drp_broadcast,
         CLK        => ioi_drp_clk,
         CS         => ioi_drp_cs,
         IDATAIN    => '0',
         IOCLK0     => ioclk90,
         IOCLK1     => '0',
         MEMUPDATE  => ioi_drp_update,
         ODATAIN    => ldm_oq,
         SDI        => ioi_drp_sdo,
         T          => ldm_t
      );

end generate;

------------------------------------------------
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& IODRP2 instantiations end &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
------------------------------------------------   

 -------^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 --IOBs instantiations
 -- this part need more inputs from design team 
 -- for now just use as listed in fpga.v
 -----^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- DRAM Address
   gen_addr_obuft : FOR addr_i IN 0 TO  C_MEM_ADDR_WIDTH - 1 GENERATE
      iob_addr_inst : OBUFT
         PORT MAP (
            I  => ioi_addr(addr_i),
            T  => t_addr(addr_i),
            O  => mcbx_dram_addr(addr_i)
         );
   END GENERATE;
   
   gen_ba_obuft : FOR ba_i IN 0 TO  C_MEM_BANKADDR_WIDTH - 1 GENERATE
      iob_ba_inst : OBUFT
         PORT MAP (
            I  => ioi_ba(ba_i),
            T  => t_ba(ba_i),
            O  => mcbx_dram_ba(ba_i)
         );
   END GENERATE;
   
-- DRAM control
--RAS   
   iob_ras : OBUFT
      PORT MAP (
         O  => mcbx_dram_ras_n,
         I  => ioi_ras,
         T  => t_ras
      );
   
--CAS      
   iob_cas : OBUFT
      PORT MAP (
         O  => mcbx_dram_cas_n,
         I  => ioi_cas,
         T  => t_cas
      );
   
--WE      
   iob_we : OBUFT
      PORT MAP (
         O  => mcbx_dram_we_n,
         I  => ioi_we,
         T  => t_we
      );
   
--CKE   
   iob_cke : OBUFT
      PORT MAP (
         O  => mcbx_dram_cke,
         I  => ioi_cke,
         T  => t_cke
      );

--DDR3 RST
   gen_ddr3_rst : IF (C_MEM_TYPE = "DDR3") GENERATE
      iob_rst : OBUFT
         PORT MAP (
            O  => mcbx_dram_ddr3_rst,
            I  => ioi_rst,
            T  => t_rst
         );
   END GENERATE;

--ODT
   gen_dram_odt : IF ((C_MEM_TYPE = "DDR3" AND (not(C_MEM_DDR3_RTT = "OFF") OR not(C_MEM_DDR3_DYN_WRT_ODT = "OFF"))) 
   OR (C_MEM_TYPE = "DDR2" AND not(C_MEM_DDR2_RTT = "OFF")) ) GENERATE
      iob_odt : OBUFT
         PORT MAP (
            O  => mcbx_dram_odt,
            I  => ioi_odt,
            t  => t_odt
         );
   END GENERATE;
   
--MEMORY CLOCK   
   iob_clk : OBUFTDS
      PORT MAP (
         I  => ioi_ck,
         T  => t_ck,
         O  => mcbx_dram_clk,
         OB => mcbx_dram_clk_n
      );
   
--DQ
   gen_dq_iobuft : FOR dq_i IN 0 TO C_NUM_DQ_PINS-1 GENERATE
      gen_iob_dq_inst : IOBUF
         PORT MAP (
            IO  => mcbx_dram_dq(dq_i),
            I   => ioi_dq(dq_i),
            T   => t_dq(dq_i),
            O   => in_pre_dq(dq_i)
         );
   END GENERATE;
   
-- x4 and x8
--DQS
gen_dqs_iobuf :   if((C_MEM_TYPE = "DDR" or C_MEM_TYPE = "MDDR" or (C_MEM_TYPE = "DDR2" and 
(C_MEM_DDR2_DIFF_DQS_EN = "NO")))) generate
      iob_dqs : IOBUF
      PORT MAP (
         IO  => mcbx_dram_dqs,
         I   => ioi_dqs,
         T   => t_dqs,
         O   => in_pre_dqsp
      );
end generate;   

--DQSP/DQSN
gen_dqs_iobufds :   if((C_MEM_TYPE = "DDR3" or (C_MEM_TYPE = "DDR2" and 
(C_MEM_DDR2_DIFF_DQS_EN = "YES")))) generate
   iob_dqs : IOBUFDS
      PORT MAP (
         IO   => mcbx_dram_dqs,
         IOB  => mcbx_dram_dqs_n,
         I    => ioi_dqs,
         T    => t_dqs,
         O    => in_pre_dqsp
      );
end generate;   

-- x16
--UDQS   
gen_udqs_iobuf :   if((C_MEM_TYPE = "DDR" or C_MEM_TYPE = "MDDR" or (C_MEM_TYPE = "DDR2" and 
(C_MEM_DDR2_DIFF_DQS_EN = "NO"))) and C_NUM_DQ_PINS = 16) generate
      iob_udqs : IOBUF
      PORT MAP (
         IO  => mcbx_dram_udqs,
         I   => ioi_udqs,
         T   => t_udqs,
         O   => in_pre_udqsp
      );
end generate;   

----UDQSP/UDQSN
gen_udqs_iobufds :   if((C_MEM_TYPE = "DDR3" or (C_MEM_TYPE = "DDR2" and 
(C_MEM_DDR2_DIFF_DQS_EN = "YES"))) and C_NUM_DQ_PINS = 16) generate
   iob_udqs : IOBUFDS
      PORT MAP (
         IO   => mcbx_dram_udqs,
         IOB  => mcbx_dram_udqs_n,
         I    => ioi_udqs,
         T    => t_udqs,
         O    => in_pre_udqsp
      );
end generate;   
   
-- DQS PULLDWON
gen_dqs_pullupdn: if(C_MEM_TYPE = "DDR" or C_MEM_TYPE ="MDDR" or (C_MEM_TYPE = "DDR2" and (C_MEM_DDR2_DIFF_DQS_EN = "NO"))) generate 
dqs_pulldown : PULLDOWN  port map (O => mcbx_dram_dqs);
end generate;

gen_dqs_pullupdn_ds :   if((C_MEM_TYPE = "DDR3" or (C_MEM_TYPE = "DDR2" and 
(C_MEM_DDR2_DIFF_DQS_EN = "YES")))) generate
dqs_pulldown :PULLDOWN port map (O => mcbx_dram_dqs);
dqs_n_pullup : PULLUP port map  (O  =>  mcbx_dram_dqs_n);   
end generate;

-- DQSN PULLUP
gen_udqs_pullupdn :   if((C_MEM_TYPE = "DDR" or C_MEM_TYPE = "MDDR" or (C_MEM_TYPE = "DDR2" and 
(C_MEM_DDR2_DIFF_DQS_EN = "NO"))) and C_NUM_DQ_PINS = 16) generate
udqs_pulldown : PULLDOWN  port map (O => mcbx_dram_udqs);
end generate;

gen_udqs_pullupdn_ds :   if ((C_NUM_DQ_PINS = 16) and not(C_MEM_TYPE = "DDR" or C_MEM_TYPE = "MDDR" or (C_MEM_TYPE = "DDR2" and 
                                                          (C_MEM_DDR2_DIFF_DQS_EN = "NO"))) ) generate
udqs_pulldown :PULLDOWN port map (O => mcbx_dram_udqs);
udqs_n_pullup : PULLUP port map  (O  =>  mcbx_dram_udqs_n);   
end generate;

--UDM   
gen_udm : if(C_NUM_DQ_PINS = 16) generate   
   iob_udm : OBUFT
      PORT MAP (
         I  => ioi_udm,
         T  => t_udm,
         O  => mcbx_dram_udm
      );
end generate;   
--LDM   
   iob_ldm : OBUFT
      PORT MAP (
         I  => ioi_ldm,
         T  => t_ldm,
         O  => mcbx_dram_ldm
      );
   
selfrefresh_mode <= selfrefresh_mode_sig;

 end aarch;    

