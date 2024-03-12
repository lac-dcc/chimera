//*****************************************************************************
// (c) Copyright 2009 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//*****************************************************************************
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor             : Xilinx
// \   \   \/     Version            : 3.5
//  \   \         Application        : MIG
//  /   /         Filename           : memc3_wrapper.v
// /___/   /\     Date Last Modified : $Date: 2010-11-11 01:09:56 -0600 (Thu, 11 Nov 2010) $
// \   \  /  \    Date Created       : Mon Mar 2 2009
//  \___\/\___\
//
//Device           : Spartan-6
//Design Name      : DDR/DDR2/DDR3/LPDDR
//Purpose          : This module instantiates mcb_raw_wrapper module.
//Reference        :
//Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

(* X_CORE_INFO = "mig_v3_5_ddr2_s6, Coregen 12.2" , CORE_GENERATION_INFO = "mcb3_ddr2_s6,mig_v3_5,{LANGUAGE=Verilog, SYNTHESIS_TOOL=ISE,  NO_OF_CONTROLLERS=1, AXI_ENABLE=0, MEM_INTERFACE_TYPE=DDR2_SDRAM, CLK_PERIOD=3200, MEMORY_PART=mt47j64m16xx-3, OUTPUT_DRV=REDUCED, RTT_NOM=50OHMS, DQS#_ENABLE=YES, HIGH_TEMP_SR=NORMAL, PORT_CONFIG=Two 32-bit bi-directional and four 32-bit unidirectional ports, MEM_ADDR_ORDER=ROW_BANK_COLUMN, PORT_ENABLE=Port0, CLASS_ADDR=II, CLASS_DATA=II, INPUT_PIN_TERMINATION=CALIB_TERM, DATA_TERMINATION=25 Ohms, CLKFBOUT_MULT_F=2, CLKOUT_DIVIDE=1, DEBUG_PORT=0, INPUT_CLK_TYPE=Differential}" *)
module memc3_wrapper #
(
parameter C_MEMCLK_PERIOD              = 3200,       
parameter C_P0_MASK_SIZE               = 4,
parameter C_P0_DATA_PORT_SIZE          = 32,
parameter C_P1_MASK_SIZE               = 4,
parameter C_P1_DATA_PORT_SIZE          = 32,

parameter  C_ARB_NUM_TIME_SLOTS        = 12,
parameter  C_ARB_TIME_SLOT_0           = 3'o0,   
parameter  C_ARB_TIME_SLOT_1           = 3'o0,   
parameter  C_ARB_TIME_SLOT_2           = 3'o0,   
parameter  C_ARB_TIME_SLOT_3           = 3'o0,   
parameter  C_ARB_TIME_SLOT_4           = 3'o0,   
parameter  C_ARB_TIME_SLOT_5           = 3'o0,   
parameter  C_ARB_TIME_SLOT_6           = 3'o0,   
parameter  C_ARB_TIME_SLOT_7           = 3'o0,   
parameter  C_ARB_TIME_SLOT_8           = 3'o0,   
parameter  C_ARB_TIME_SLOT_9           = 3'o0,   
parameter  C_ARB_TIME_SLOT_10          = 3'o0,    
parameter  C_ARB_TIME_SLOT_11          = 3'o0,   

parameter  C_MEM_TRAS                  = 40000,         
parameter  C_MEM_TRCD                  = 15000,         
parameter  C_MEM_TREFI                 = 7800000,                
parameter  C_MEM_TRFC                  = 127500,         
parameter  C_MEM_TRP                   = 15000,          
parameter  C_MEM_TWR                   = 15000,          
parameter  C_MEM_TRTP                  = 7500,         
parameter  C_MEM_TWTR                  = 7500,         

parameter  C_MEM_ADDR_ORDER            = "ROW_BANK_COLUMN", 
parameter  C_NUM_DQ_PINS               = 16,                   
parameter  C_MEM_TYPE                  = "DDR2",  
parameter  C_MEM_DENSITY               = "1Gb",
parameter  C_MEM_BURST_LEN             = 4,             
parameter  C_MEM_CAS_LATENCY           = 5,
parameter  C_MEM_ADDR_WIDTH            = 13,    
parameter  C_MEM_BANKADDR_WIDTH        = 3,   
parameter  C_MEM_NUM_COL_BITS          = 10,   

parameter  C_MEM_DDR1_2_ODS            = "REDUCED",   
parameter  C_MEM_DDR2_RTT              = "50OHMS",    
parameter  C_MEM_DDR2_DIFF_DQS_EN      = "YES", 
parameter  C_MEM_DDR2_3_PA_SR          = "FULL",  
parameter  C_MEM_DDR2_3_HIGH_TEMP_SR   = "NORMAL",  

parameter  C_MEM_DDR3_CAS_LATENCY      = 7,   
parameter  C_MEM_DDR3_ODS              = "DIV6",   
parameter  C_MEM_DDR3_RTT              = "DIV2",
parameter  C_MEM_DDR3_CAS_WR_LATENCY   = 5, 
parameter  C_MEM_DDR3_AUTO_SR          = "ENABLED",  
parameter  C_MEM_DDR3_DYN_WRT_ODT      = "OFF",  
parameter  C_MEM_MOBILE_PA_SR          = "FULL",   
parameter  C_MEM_MDDR_ODS              = "FULL",   

parameter  C_MC_CALIB_BYPASS           = "NO",
parameter  C_SIMULATION                = "FALSE",

parameter C_LDQSP_TAP_DELAY_VAL  = 16,  // 0 to 255 inclusive
parameter C_UDQSP_TAP_DELAY_VAL  = 16,  // 0 to 255 inclusive
parameter C_LDQSN_TAP_DELAY_VAL  = 16,  // 0 to 255 inclusive
parameter C_UDQSN_TAP_DELAY_VAL  = 16,  // 0 to 255 inclusive
parameter C_DQ0_TAP_DELAY_VAL  = 0,  // 0 to 255 inclusive
parameter C_DQ1_TAP_DELAY_VAL  = 0,  // 0 to 255 inclusive
parameter C_DQ2_TAP_DELAY_VAL  = 0,  // 0 to 255 inclusive
parameter C_DQ3_TAP_DELAY_VAL  = 0,  // 0 to 255 inclusive
parameter C_DQ4_TAP_DELAY_VAL  = 0,  // 0 to 255 inclusive
parameter C_DQ5_TAP_DELAY_VAL  = 0,  // 0 to 255 inclusive
parameter C_DQ6_TAP_DELAY_VAL  = 0,  // 0 to 255 inclusive
parameter C_DQ7_TAP_DELAY_VAL  = 0,  // 0 to 255 inclusive
parameter C_DQ8_TAP_DELAY_VAL  = 0,  // 0 to 255 inclusive
parameter C_DQ9_TAP_DELAY_VAL  = 0,  // 0 to 255 inclusive
parameter C_DQ10_TAP_DELAY_VAL = 0,  // 0 to 255 inclusive
parameter C_DQ11_TAP_DELAY_VAL = 0,  // 0 to 255 inclusive
parameter C_DQ12_TAP_DELAY_VAL = 0,  // 0 to 255 inclusive
parameter C_DQ13_TAP_DELAY_VAL = 0,  // 0 to 255 inclusive
parameter C_DQ14_TAP_DELAY_VAL = 0,  // 0 to 255 inclusive
parameter C_DQ15_TAP_DELAY_VAL = 0,  // 0 to 255 inclusive

parameter  C_MC_CALIBRATION_MODE       = "CALIBRATION",     
parameter  C_MC_CALIBRATION_DELAY      = "HALF",     
parameter  C_CALIB_SOFT_IP             = "TRUE",
parameter  C_SKIP_IN_TERM_CAL            = 0,
parameter  C_SKIP_DYNAMIC_CAL            = 0

    )
  (

      // high-speed PLL clock interface
      input sysclk_2x,                         
      input sysclk_2x_180,                      
      input pll_ce_0,
      input pll_ce_90,
      input pll_lock,                          
      input async_rst,                         

      //User Port0 Interface Signals

      input                            p0_cmd_clk,
      input                             p0_cmd_en,
      input [2:0]       p0_cmd_instr,
      input [5:0]       p0_cmd_bl,
      input [29:0]        p0_cmd_byte_addr,
      output                          p0_cmd_empty,
      output                           p0_cmd_full,

      // Data Wr Port signals
      input                             p0_wr_clk,
      input                              p0_wr_en,
      input [C_P0_MASK_SIZE - 1:0]                        p0_wr_mask,
      input [C_P0_DATA_PORT_SIZE - 1:0]                             p0_wr_data,
      output                            p0_wr_full,
      output                           p0_wr_empty,
      output [6:0]       p0_wr_count,
      output                        p0_wr_underrun,
      output                           p0_wr_error,

      //Data Rd Port signals
      input                             p0_rd_clk,
      input                              p0_rd_en,
      output [C_P0_DATA_PORT_SIZE - 1:0]                             p0_rd_data,
      output                            p0_rd_full,
      output                           p0_rd_empty,
      output [6:0]       p0_rd_count,
      output                        p0_rd_overflow,
      output                           p0_rd_error,



      // memory interface signals    
   inout  [C_NUM_DQ_PINS-1:0]                      mcb3_dram_dq,
   output [C_MEM_ADDR_WIDTH-1:0]       mcb3_dram_a,
   output [C_MEM_BANKADDR_WIDTH-1:0]   mcb3_dram_ba,
   output                              mcb3_dram_ras_n,
   output                              mcb3_dram_cas_n,
   output                              mcb3_dram_we_n,
      output                              mcb3_dram_odt,
   output                              mcb3_dram_cke,
   inout                               mcb3_dram_dqs,
   inout                               mcb3_dram_dqs_n,
   output                              mcb3_dram_ck,
   output                              mcb3_dram_ck_n,  

   inout                                            mcb3_dram_udqs,
   output                                           mcb3_dram_udm,


   inout                                            mcb3_dram_udqs_n,



   output                                           mcb3_dram_dm,

      inout                             mcb3_rzq,
      inout                             mcb3_zio,


      // Calibration signals
      input                            mcb_drp_clk,
      output                           calib_done,
      input			       selfrefresh_enter,              
      output                           selfrefresh_mode            

    );

wire [7:0]  uo_data;
wire [31:0] status;
 localparam C_PORT_ENABLE              = 6'b000001;

localparam C_PORT_CONFIG             =  "B32_B32_R32_R32_R32_R32";


localparam ARB_TIME_SLOT_0    = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_0[2:0]};
localparam ARB_TIME_SLOT_1    = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_1[2:0]};
localparam ARB_TIME_SLOT_2    = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_2[2:0]};
localparam ARB_TIME_SLOT_3    = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_3[2:0]};
localparam ARB_TIME_SLOT_4    = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_4[2:0]};
localparam ARB_TIME_SLOT_5    = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_5[2:0]};
localparam ARB_TIME_SLOT_6    = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_6[2:0]};
localparam ARB_TIME_SLOT_7    = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_7[2:0]};
localparam ARB_TIME_SLOT_8    = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_8[2:0]};
localparam ARB_TIME_SLOT_9    = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_9[2:0]};
localparam ARB_TIME_SLOT_10   = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_10[2:0]};
localparam ARB_TIME_SLOT_11   = {3'b111, 3'b111, 3'b111, 3'b111, 3'b111, C_ARB_TIME_SLOT_11[2:0]};


localparam C_MC_CALIBRATION_CLK_DIV    = 1;
localparam C_MEM_TZQINIT_MAXCNT        = 10'd512;
localparam C_SKIP_DYN_IN_TERM          = 1'b1;  

localparam C_MC_CALIBRATION_RA    = 16'h0000;       
localparam C_MC_CALIBRATION_BA    = 4'h0;       
localparam C_MC_CALIBRATION_CA    = 12'h000;       



 mcb_raw_wrapper #
 (
   .C_MEMCLK_PERIOD          (C_MEMCLK_PERIOD),
   .C_P0_MASK_SIZE           (C_P0_MASK_SIZE),
   .C_P0_DATA_PORT_SIZE      (C_P0_DATA_PORT_SIZE),
   .C_P1_MASK_SIZE           (C_P1_MASK_SIZE),
   .C_P1_DATA_PORT_SIZE      (C_P1_DATA_PORT_SIZE),

   .C_ARB_NUM_TIME_SLOTS     (C_ARB_NUM_TIME_SLOTS),
   .C_ARB_TIME_SLOT_0        (ARB_TIME_SLOT_0),
   .C_ARB_TIME_SLOT_1        (ARB_TIME_SLOT_1),
   .C_ARB_TIME_SLOT_2        (ARB_TIME_SLOT_2),
   .C_ARB_TIME_SLOT_3        (ARB_TIME_SLOT_3),
   .C_ARB_TIME_SLOT_4        (ARB_TIME_SLOT_4),
   .C_ARB_TIME_SLOT_5        (ARB_TIME_SLOT_5),
   .C_ARB_TIME_SLOT_6        (ARB_TIME_SLOT_6),
   .C_ARB_TIME_SLOT_7        (ARB_TIME_SLOT_7),
   .C_ARB_TIME_SLOT_8        (ARB_TIME_SLOT_8),
   .C_ARB_TIME_SLOT_9        (ARB_TIME_SLOT_9),
   .C_ARB_TIME_SLOT_10       (ARB_TIME_SLOT_10),
   .C_ARB_TIME_SLOT_11       (ARB_TIME_SLOT_11),

   .C_PORT_CONFIG            (C_PORT_CONFIG),
   .C_PORT_ENABLE            (C_PORT_ENABLE), 

   .C_MEM_TRAS               (C_MEM_TRAS),
   .C_MEM_TRCD               (C_MEM_TRCD),
   .C_MEM_TREFI              (C_MEM_TREFI),
   .C_MEM_TRFC               (C_MEM_TRFC),
   .C_MEM_TRP                (C_MEM_TRP),
   .C_MEM_TWR                (C_MEM_TWR),
   .C_MEM_TRTP               (C_MEM_TRTP),
   .C_MEM_TWTR               (C_MEM_TWTR),

   .C_MEM_ADDR_ORDER         (C_MEM_ADDR_ORDER),
   .C_NUM_DQ_PINS            (C_NUM_DQ_PINS),
   .C_MEM_TYPE               (C_MEM_TYPE),
   .C_MEM_DENSITY            (C_MEM_DENSITY),
   .C_MEM_BURST_LEN          (C_MEM_BURST_LEN),
   .C_MEM_CAS_LATENCY        (C_MEM_CAS_LATENCY),
   .C_MEM_ADDR_WIDTH         (C_MEM_ADDR_WIDTH),
   .C_MEM_BANKADDR_WIDTH     (C_MEM_BANKADDR_WIDTH),
   .C_MEM_NUM_COL_BITS       (C_MEM_NUM_COL_BITS),

   .C_MEM_DDR1_2_ODS         (C_MEM_DDR1_2_ODS),
   .C_MEM_DDR2_RTT           (C_MEM_DDR2_RTT),
   .C_MEM_DDR2_DIFF_DQS_EN   (C_MEM_DDR2_DIFF_DQS_EN),
   .C_MEM_DDR2_3_PA_SR       (C_MEM_DDR2_3_PA_SR),
   .C_MEM_DDR2_3_HIGH_TEMP_SR(C_MEM_DDR2_3_HIGH_TEMP_SR),

   .C_MEM_DDR3_CAS_LATENCY   (C_MEM_DDR3_CAS_LATENCY),
   .C_MEM_DDR3_ODS           (C_MEM_DDR3_ODS),
   .C_MEM_DDR3_RTT           (C_MEM_DDR3_RTT),
   .C_MEM_DDR3_CAS_WR_LATENCY(C_MEM_DDR3_CAS_WR_LATENCY),
   .C_MEM_DDR3_AUTO_SR       (C_MEM_DDR3_AUTO_SR),
   .C_MEM_DDR3_DYN_WRT_ODT   (C_MEM_DDR3_DYN_WRT_ODT),
   .C_MEM_MOBILE_PA_SR       (C_MEM_MOBILE_PA_SR),
   .C_MEM_MDDR_ODS           (C_MEM_MDDR_ODS),
   .C_MC_CALIBRATION_CLK_DIV (C_MC_CALIBRATION_CLK_DIV), 
   .C_MC_CALIBRATION_MODE    (C_MC_CALIBRATION_MODE),
   .C_MC_CALIBRATION_DELAY   (C_MC_CALIBRATION_DELAY),

   .C_MC_CALIB_BYPASS        (C_MC_CALIB_BYPASS),
   .C_MC_CALIBRATION_RA      (C_MC_CALIBRATION_RA),
   .C_MC_CALIBRATION_BA      (C_MC_CALIBRATION_BA),
   .C_MC_CALIBRATION_CA      (C_MC_CALIBRATION_CA),
   .C_CALIB_SOFT_IP          (C_CALIB_SOFT_IP),
   .C_SKIP_IN_TERM_CAL       (C_SKIP_IN_TERM_CAL),
   .C_SKIP_DYNAMIC_CAL       (C_SKIP_DYNAMIC_CAL),
   .C_MEM_TZQINIT_MAXCNT     (C_MEM_TZQINIT_MAXCNT),
   .C_SKIP_DYN_IN_TERM       (C_SKIP_DYN_IN_TERM),    
   .C_SIMULATION             (C_SIMULATION),

   .LDQSP_TAP_DELAY_VAL  (C_LDQSP_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .UDQSP_TAP_DELAY_VAL  (C_UDQSP_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .LDQSN_TAP_DELAY_VAL  (C_LDQSN_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .UDQSN_TAP_DELAY_VAL  (C_UDQSN_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ0_TAP_DELAY_VAL   (C_DQ0_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ1_TAP_DELAY_VAL   (C_DQ1_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ2_TAP_DELAY_VAL   (C_DQ2_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ3_TAP_DELAY_VAL   (C_DQ3_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ4_TAP_DELAY_VAL   (C_DQ4_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ5_TAP_DELAY_VAL   (C_DQ5_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ6_TAP_DELAY_VAL   (C_DQ6_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ7_TAP_DELAY_VAL   (C_DQ7_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ8_TAP_DELAY_VAL   (C_DQ8_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ9_TAP_DELAY_VAL   (C_DQ9_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ10_TAP_DELAY_VAL  (C_DQ10_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ11_TAP_DELAY_VAL  (C_DQ11_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ12_TAP_DELAY_VAL  (C_DQ12_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ13_TAP_DELAY_VAL  (C_DQ13_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ14_TAP_DELAY_VAL  (C_DQ14_TAP_DELAY_VAL),  // 0 to 255 inclusive
   .DQ15_TAP_DELAY_VAL  (C_DQ15_TAP_DELAY_VAL)  // 0 to 255 inclusive
   
   )

   memc3_mcb_raw_wrapper_inst
(
   .sys_rst                             (async_rst),
   .sysclk_2x                           (sysclk_2x),
   .sysclk_2x_180                       (sysclk_2x_180),
   .pll_ce_0                            (pll_ce_0),
   .pll_ce_90                           (pll_ce_90),
   .pll_lock                            (pll_lock),
   .mcbx_dram_addr                      (mcb3_dram_a),
   .mcbx_dram_ba                        (mcb3_dram_ba),
   .mcbx_dram_ras_n                     (mcb3_dram_ras_n),
   .mcbx_dram_cas_n                     (mcb3_dram_cas_n),
   .mcbx_dram_we_n                      (mcb3_dram_we_n),
   .mcbx_dram_cke                       (mcb3_dram_cke),
   .mcbx_dram_clk                       (mcb3_dram_ck),
   .mcbx_dram_clk_n                     (mcb3_dram_ck_n),
   .mcbx_dram_dq                        (mcb3_dram_dq),
   .mcbx_dram_odt                       (mcb3_dram_odt),
   .mcbx_dram_ldm                       (mcb3_dram_dm),
   .mcbx_dram_udm                       (mcb3_dram_udm),
   .mcbx_dram_dqs                       (mcb3_dram_dqs),
   .mcbx_dram_dqs_n                     (mcb3_dram_dqs_n),
   .mcbx_dram_udqs                      (mcb3_dram_udqs),
   .mcbx_dram_udqs_n                    (mcb3_dram_udqs_n),
   .mcbx_dram_ddr3_rst                  (),
   .calib_recal                         (1'b0),
   .rzq                                 (mcb3_rzq),
   .zio                                 (mcb3_zio),
   .ui_read                             (1'b0),
   .ui_add                              (1'b0),
   .ui_cs                               (1'b0),
   .ui_clk                              (mcb_drp_clk),
   .ui_sdi                              (1'b0),
   .ui_addr                             (5'b0000),
   .ui_broadcast                        (1'b0),
   .ui_drp_update                       (1'b0),
   .ui_done_cal                         (1'b1),
   .ui_cmd                              (1'b0),
   .ui_cmd_in                           (1'b0),
   .ui_cmd_en                           (1'b0),
   .ui_dqcount                          (4'b0000),
   .ui_dq_lower_dec                     (1'b0),
   .ui_dq_lower_inc                     (1'b0),
   .ui_dq_upper_dec                     (1'b0),
   .ui_dq_upper_inc                     (1'b0),
   .ui_udqs_inc                         (1'b0),
   .ui_udqs_dec                         (1'b0),
   .ui_ldqs_inc                         (1'b0),
   .ui_ldqs_dec                         (1'b0),
   .uo_data                             (uo_data),
   .uo_data_valid                       (uo_data_valid),
   .uo_done_cal                         (calib_done),
   .uo_cmd_ready_in                     (uo_cmd_ready_in),
   .uo_refrsh_flag                      (uo_refrsh_flag),
   .uo_cal_start                        (uo_cal_start),
   .uo_sdo                              (uo_sdo),
   .status                              (status),
   .selfrefresh_enter                   (1'b0),
   .selfrefresh_mode                    (selfrefresh_mode),
      .p0_arb_en                           (1'b1),
   .p0_cmd_clk                          (p0_cmd_clk),
   .p0_cmd_en                           (p0_cmd_en),
   .p0_cmd_instr                        (p0_cmd_instr),
   .p0_cmd_bl                           (p0_cmd_bl),
   .p0_cmd_byte_addr                    (p0_cmd_byte_addr),
   .p0_cmd_empty                        (p0_cmd_empty),
   .p0_cmd_full                         (p0_cmd_full),
   .p0_wr_clk                           (p0_wr_clk),
   .p0_wr_en                            (p0_wr_en),
   .p0_wr_mask                          (p0_wr_mask),
   .p0_wr_data                          (p0_wr_data),
   .p0_wr_full                          (p0_wr_full),
   .p0_wr_empty                         (p0_wr_empty),
   .p0_wr_count                         (p0_wr_count),
   .p0_wr_underrun                      (p0_wr_underrun),
   .p0_wr_error                         (p0_wr_error),
   .p0_rd_clk                           (p0_rd_clk),
   .p0_rd_en                            (p0_rd_en),
   .p0_rd_data                          (p0_rd_data),
   .p0_rd_full                          (p0_rd_full),
   .p0_rd_empty                         (p0_rd_empty),
   .p0_rd_count                         (p0_rd_count),
   .p0_rd_overflow                      (p0_rd_overflow),
   .p0_rd_error                         (p0_rd_error),
   .p1_arb_en                           (1'b0),
   .p1_cmd_clk                          (1'b0),
   .p1_cmd_en                           (1'b0),
   .p1_cmd_instr                        (3'd0),
   .p1_cmd_bl                           (6'd0),
   .p1_cmd_byte_addr                    (30'd0),
   .p1_cmd_empty                        (),
   .p1_cmd_full                         (),
   .p1_rd_clk                           (1'b0),
   .p1_rd_en                            (1'b0),
   .p1_rd_data                          (),
   .p1_rd_full                          (),
   .p1_rd_empty                         (),
   .p1_rd_count                         (),
   .p1_rd_overflow                      (),
   .p1_rd_error                         (),
   .p1_wr_clk                           (1'b0),
   .p1_wr_en                            (1'b0),
   .p1_wr_mask                          (4'd0),
   .p1_wr_data                          (32'd0),
   .p1_wr_full                          (),
   .p1_wr_empty                         (),
   .p1_wr_count                         (),
   .p1_wr_underrun                      (),
   .p1_wr_error                         (),
   .p2_arb_en                           (1'b0),
   .p2_cmd_clk                          (1'b0),
   .p2_cmd_en                           (1'b0),
   .p2_cmd_instr                        (3'd0),
   .p2_cmd_bl                           (6'd0),
   .p2_cmd_byte_addr                    (30'd0),
   .p2_cmd_empty                        (),
   .p2_cmd_full                         (),
   .p2_rd_clk                           (1'b0),
   .p2_rd_en                            (1'b0),
   .p2_rd_data                          (),
   .p2_rd_full                          (),
   .p2_rd_empty                         (),
   .p2_rd_count                         (),
   .p2_rd_overflow                      (),
   .p2_rd_error                         (),
   .p2_wr_clk                           (1'b0),
   .p2_wr_en                            (1'b0),
   .p2_wr_mask                          (4'd0),
   .p2_wr_data                          (32'd0),
   .p2_wr_full                          (),
   .p2_wr_empty                         (),
   .p2_wr_count                         (),
   .p2_wr_underrun                      (),
   .p2_wr_error                         (),
   .p3_arb_en                           (1'b0),
   .p3_cmd_clk                          (1'b0),
   .p3_cmd_en                           (1'b0),
   .p3_cmd_instr                        (3'd0),
   .p3_cmd_bl                           (6'd0),
   .p3_cmd_byte_addr                    (30'd0),
   .p3_cmd_empty                        (),
   .p3_cmd_full                         (),
   .p3_rd_clk                           (1'b0),
   .p3_rd_en                            (1'b0),
   .p3_rd_data                          (),
   .p3_rd_full                          (),
   .p3_rd_empty                         (),
   .p3_rd_count                         (),
   .p3_rd_overflow                      (),
   .p3_rd_error                         (),
   .p3_wr_clk                           (1'b0),
   .p3_wr_en                            (1'b0),
   .p3_wr_mask                          (4'd0),
   .p3_wr_data                          (32'd0),
   .p3_wr_full                          (),
   .p3_wr_empty                         (),
   .p3_wr_count                         (),
   .p3_wr_underrun                      (),
   .p3_wr_error                         (),
   .p4_arb_en                           (1'b0),
   .p4_cmd_clk                          (1'b0),
   .p4_cmd_en                           (1'b0),
   .p4_cmd_instr                        (3'd0),
   .p4_cmd_bl                           (6'd0),
   .p4_cmd_byte_addr                    (30'd0),
   .p4_cmd_empty                        (),
   .p4_cmd_full                         (),
   .p4_rd_clk                           (1'b0),
   .p4_rd_en                            (1'b0),
   .p4_rd_data                          (),
   .p4_rd_full                          (),
   .p4_rd_empty                         (),
   .p4_rd_count                         (),
   .p4_rd_overflow                      (),
   .p4_rd_error                         (),
   .p4_wr_clk                           (1'b0),
   .p4_wr_en                            (1'b0),
   .p4_wr_mask                          (4'd0),
   .p4_wr_data                          (32'd0),
   .p4_wr_full                          (),
   .p4_wr_empty                         (),
   .p4_wr_count                         (),
   .p4_wr_underrun                      (),
   .p4_wr_error                         (),
   .p5_arb_en                           (1'b0),
   .p5_cmd_clk                          (1'b0),
   .p5_cmd_en                           (1'b0),
   .p5_cmd_instr                        (3'd0),
   .p5_cmd_bl                           (6'd0),
   .p5_cmd_byte_addr                    (30'd0),
   .p5_cmd_empty                        (),
   .p5_cmd_full                         (),
   .p5_rd_clk                           (1'b0),
   .p5_rd_en                            (1'b0),
   .p5_rd_data                          (),
   .p5_rd_full                          (),
   .p5_rd_empty                         (),
   .p5_rd_count                         (),
   .p5_rd_overflow                      (),
   .p5_rd_error                         (),
   .p5_wr_clk                           (1'b0),
   .p5_wr_en                            (1'b0),
   .p5_wr_mask                          (4'd0),
   .p5_wr_data                          (32'd0),
   .p5_wr_full                          (),
   .p5_wr_empty                         (),
   .p5_wr_count                         (),
   .p5_wr_underrun                      (),
   .p5_wr_error                         ()
);



endmodule

