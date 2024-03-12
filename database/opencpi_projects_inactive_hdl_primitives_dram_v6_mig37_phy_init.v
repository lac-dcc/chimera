//*****************************************************************************
// (c) Copyright 2009 - 2010 Xilinx, Inc. All rights reserved.
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
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: 3.7
//  \   \         Application: MIG
//  /   /         Filename: phy_init.v
// /___/   /\     Date Last Modified: $Date: 2010/12/13 21:26:31 $
// \   \  /  \    Date Created: Mon Jun 23 2008
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Memory initialization and overall master state control during
//  initialization and calibration. Specifically, the following functions
//  are performed:
//    1. Memory initialization (initial AR, mode register programming, etc.)
//    2. Initiating write leveling
//    3. Generate training pattern writes for read leveling. Generate
//       memory readback for read leveling.
//  This module has a DFI interface for providing control/address and write
//  data to the rest of the PHY datapath during initialization/calibration.
//  Once initialization is complete, control is passed to the MC. 
//  NOTES:
//    1. Multiple CS (multi-rank) not supported
//    2. DDR2 not supported
//Reference:
//Revision History:
// 9-16-2008 Adding DDR2 initialization sequence. Also adding the DDR_MODE 
// parmater. KP
// 12-8-2008 Fixed the address[12] for OTF mode. KP 
//*****************************************************************************

/******************************************************************************
**$Id: phy_init.v,v 1.4 2010/12/13 21:26:31 richc Exp $
**$Date: 2010/12/13 21:26:31 $
**$Author: richc $
**$Revision: 1.4 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/O/mig_v3_7/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_init.v,v $
******************************************************************************/

`timescale 1ps/1ps


module phy_init #
  (
   parameter TCQ          = 100,
   parameter nCK_PER_CLK  = 2,           // # of memory clocks per CLK
   parameter CLK_PERIOD   = 3333,        // Logic (internal) clk period (in ps)
   parameter BANK_WIDTH   = 2,
   parameter COL_WIDTH    = 10,
   parameter nCS_PER_RANK = 1,           // # of CS bits per rank e.g. for 
                                         // component I/F with CS_WIDTH=1, 
                                         // nCS_PER_RANK=# of components
   parameter DQ_WIDTH     = 64,
   parameter ROW_WIDTH    = 14,
   parameter CS_WIDTH     = 1,
   parameter CKE_WIDTH    = 1,       // # of cke outputs 
   parameter DRAM_TYPE    = "DDR3",
   parameter REG_CTRL     = "ON",

   // calibration Address
   parameter CALIB_ROW_ADD   = 16'h0000,// Calibration row address
   parameter CALIB_COL_ADD   = 12'h000, // Calibration column address
   parameter CALIB_BA_ADD    = 3'h0,    // Calibration bank address 
   
   // DRAM mode settings
   parameter AL               = "0",     // Additive Latency option
   parameter BURST_MODE       = "8",     // Burst length
   parameter BURST_TYPE       = "SEQ",   // Burst type 
   parameter nAL              = 0,       // Additive latency (in clk cyc)
   parameter nCL              = 5,       // Read CAS latency (in clk cyc)
   parameter nCWL             = 5,       // Write CAS latency (in clk cyc)
   parameter tRFC             = 110000,  // Refresh-to-command delay (in ps)
   parameter OUTPUT_DRV       = "HIGH",  // DRAM reduced output drive option
   parameter RTT_NOM          = "60",    // Nominal ODT termination value
   parameter RTT_WR           = "60",    // Write ODT termination value
   parameter WRLVL            = "ON",    // Enable write leveling
   parameter PHASE_DETECT     = "ON",    // Enable read phase detector
   parameter DDR2_DQSN_ENABLE = "YES",   // Enable differential DQS for DDR2
   parameter nSLOTS           = 1,       // Number of DIMM SLOTs in the system
   parameter SIM_INIT_OPTION  = "NONE",  // "NONE", "SKIP_PU_DLY", "SKIP_INIT"
   parameter SIM_CAL_OPTION   = "NONE"   // "NONE", "FAST_CAL", "SKIP_CAL"
   )
  (
   input                       clk,
   input                       rst,
   // Read/write calibration interface
   input [2:0]                 calib_width,
   input                       rdpath_rdy,
   input                       wrlvl_done,
   input                       wrlvl_rank_done,
   input [7:0]                 slot_0_present,
   input [7:0]                 slot_1_present,
   output reg                  wrlvl_active,
   input [1:0]                 rdlvl_done,  
   output reg [1:0]            rdlvl_start,
   input                       rdlvl_clkdiv_done,
   output reg                  rdlvl_clkdiv_start,
   input                       rdlvl_prech_req,
   input                       rdlvl_resume,
   // To phy_write for write bitslip during read leveling
   output [1:0]                chip_cnt,
   // Read phase detector calibration control 
   output reg                  pd_cal_start,
   input                       pd_cal_done,
   input                       pd_prech_req,
   // Signals shared btw multiple calibration stages
   output reg                  prech_done,
   // Data select / status
   output reg                  dfi_init_complete, 
   // PHY DFI address/control
   output reg [ROW_WIDTH-1:0]  phy_address0,
   output reg [ROW_WIDTH-1:0]  phy_address1,
   output reg [BANK_WIDTH-1:0] phy_bank0,
   output reg [BANK_WIDTH-1:0] phy_bank1,
   output reg                  phy_cas_n0,
   output reg                  phy_cas_n1,
   output reg [CKE_WIDTH-1:0]   phy_cke0,
   output reg [CKE_WIDTH-1:0]   phy_cke1,
   output reg [CS_WIDTH*nCS_PER_RANK-1:0]   phy_cs_n0,
   output reg [CS_WIDTH*nCS_PER_RANK-1:0]   phy_cs_n1,
   output                      phy_init_data_sel,
   output reg [CS_WIDTH*nCS_PER_RANK-1:0]   phy_odt0,
   output reg [CS_WIDTH*nCS_PER_RANK-1:0]   phy_odt1,
   output reg                  phy_ras_n0,
   output reg                  phy_ras_n1,
   output reg                  phy_reset_n,
   output reg                  phy_we_n0,
   output reg                  phy_we_n1, 
   // PHY DFI Write
   output reg                  phy_wrdata_en,
   output reg [4*DQ_WIDTH-1:0] phy_wrdata,
   // PHY DFI Read
   output reg                  phy_rddata_en,
   // PHY sideband signals
   output reg [0:0]            phy_ioconfig,
   output reg                  phy_ioconfig_en
   );
   
  // In a 2 slot dual rank per system RTT_NOM values 
  // for Rank2 and Rank3 default to 40 ohms
  localparam RTT_NOM2 = "40";
  localparam RTT_NOM3 = "40";

  // Specifically for use with half-frequency controller (nCK_PER_CLK=2)
  // = 1 if burst length = 4, = 0 if burst length = 8. Determines how
  // often row command needs to be issued during read-leveling
  // For DDR3 the burst length is fixed during calibration 
  localparam BURST4_FLAG = (DRAM_TYPE == "DDR3")? 1'b0 : 
             (BURST_MODE == "8") ? 1'b0 : 
             ((BURST_MODE == "4") ? 1'b1 : 1'b0);
             
  //***************************************************************************
  // Counter values used to determine bus timing
  // NOTE on all counter terminal counts - these can/should be one less than 
  //   the actual delay to take into account extra clock cycle delay in 
  //   generating the corresponding "done" signal
  //***************************************************************************

  localparam CLK_MEM_PERIOD = CLK_PERIOD / nCK_PER_CLK;
  
  // Calculate initial delay required in number of CLK clock cycles
  // to delay initially. The counter is clocked by [CLK/1024] - which
  // is approximately division by 1000 - note that the formulas below will
  // result in more than the minimum wait time because of this approximation.
  // NOTE: For DDR3 JEDEC specifies to delay reset
  //       by 200us, and CKE by an additional 500us after power-up
  //       For DDR2 CKE is delayed by 200us after power up.
  localparam DDR3_RESET_DELAY_NS   = 200000;
  localparam DDR3_CKE_DELAY_NS     = 500000 + DDR3_RESET_DELAY_NS;
  localparam DDR2_CKE_DELAY_NS     = 200000;
  localparam PWRON_RESET_DELAY_CNT = 
             ((DDR3_RESET_DELAY_NS+CLK_PERIOD-1)/CLK_PERIOD);
  localparam PWRON_CKE_DELAY_CNT   = (DRAM_TYPE == "DDR3") ?
             (((DDR3_CKE_DELAY_NS+CLK_PERIOD-1)/CLK_PERIOD)) :
             (((DDR2_CKE_DELAY_NS+CLK_PERIOD-1)/CLK_PERIOD));
              // FOR DDR2 -1 taken out. With -1 not getting 200us. The equation
              // needs to be reworked. 
   localparam DDR2_INIT_PRE_DELAY_PS = 400000;
   localparam DDR2_INIT_PRE_CNT = 
              ((DDR2_INIT_PRE_DELAY_PS+CLK_PERIOD-1)/CLK_PERIOD)-1;
   
   
  // Calculate tXPR time: reset from CKE HIGH to valid command after power-up
  // tXPR = (max(5nCK, tRFC(min)+10ns). Add a few (blah, messy) more clock
  // cycles because this counter actually starts up before CKE is asserted
  // to memory.
  localparam TXPR_DELAY_CNT =
             (5*CLK_MEM_PERIOD > tRFC+10000) ?
             (((5+nCK_PER_CLK-1)/nCK_PER_CLK)-1)+5 :
             (((tRFC+10000+CLK_PERIOD-1)/CLK_PERIOD)-1)+5;

  // tDLLK/tZQINIT time = 512*tCK = 256*tCLKDIV
  localparam TDLLK_TZQINIT_DELAY_CNT = 255;
  
  // TWR values in ns. Both DDR2 and DDR3 have the same value.
  // 15000ns/tCK
  localparam TWR_CYC = ((15000) %  CLK_MEM_PERIOD) ?
                       (15000/CLK_MEM_PERIOD) + 1 : 15000/CLK_MEM_PERIOD;

  // time to wait between consecutive commands in PHY_INIT - this is a
  // generic number, and must be large enough to account for worst case
  // timing parameter (tRFC - refresh-to-active) across all memory speed
  // grades and operating frequencies. Expressed in CLKDIV clock cycles. 
  localparam  CNTNEXT_CMD = 7'b1111111;
  
  // Counter values to keep track of which MR register to load during init
  // Set value of INIT_CNT_MR_DONE to equal value of counter for last mode
  // register configured during initialization. 
  // NOTE: Reserve more bits for DDR2 - more MR accesses for DDR2 init
  localparam  INIT_CNT_MR2     = 2'b00;
  localparam  INIT_CNT_MR3     = 2'b01;
  localparam  INIT_CNT_MR1     = 2'b10;
  localparam  INIT_CNT_MR0     = 2'b11;
  localparam  INIT_CNT_MR_DONE = 2'b11;

  // Register chip programmable values for DDR3
  // The register chip for the registered DIMM needs to be programmed
  // before the initialization of the registered DIMM.
  // Address for the control word is in : DBA2, DA2, DA1, DA0
  // Data for the control word is in: DBA1 DBA0, DA4, DA3
  // The values will be stored in the local param in the following format
  // {DBA[2:0], DA[4:0]}
  
  // RC0 is global features control word. Address == 000

  localparam  REG_RC0 = 8'b00000000;
  
  // RC1 Clock driver enable control word. Enables or disables the four
  // output clocks in the register chip. For single rank and dual rank
  // two clocks will be enabled and for quad rank all the four clocks
  // will be enabled. Address == 000. Data = 0110 for single and dual rank.
  // = 0000 for quad rank 
  localparam REG_RC1 = (CS_WIDTH <= 2) ? 8'b00110001 : 8'b00000001;

  // RC2 timing control word. Set in 1T timing mode
  // Address = 010. Data = 0000
  localparam REG_RC2 = 8'b00000010;
   
  // RC3 timing control word. Setting the data to 0000
   localparam REG_RC3 = 8'b00000011;

  // RC4 timing control work. Setting the data to 0000 
   localparam REG_RC4 = 8'b00000100;
    
  // RC5 timing control work. Setting the data to 0000 
   localparam REG_RC5 = 8'b00000101;   

  // Adding the register dimm latency to write latency
   localparam CWL_M = (REG_CTRL == "ON") ? nCWL + 1 : nCWL;

  // Master state machine encoding
  localparam  INIT_IDLE                    = 6'b000000; //0
  localparam  INIT_WAIT_CKE_EXIT           = 6'b000001; //1
  localparam  INIT_LOAD_MR                 = 6'b000010; //2
  localparam  INIT_LOAD_MR_WAIT            = 6'b000011; //3
  localparam  INIT_ZQCL                    = 6'b000100; //4
  localparam  INIT_WAIT_DLLK_ZQINIT        = 6'b000101; //5
  localparam  INIT_WRLVL_START             = 6'b000110; //6
  localparam  INIT_WRLVL_WAIT              = 6'b000111; //7
  localparam  INIT_WRLVL_LOAD_MR           = 6'b001000; //8
  localparam  INIT_WRLVL_LOAD_MR_WAIT      = 6'b001001; //9
  localparam  INIT_WRLVL_LOAD_MR2          = 6'b001010; //A  
  localparam  INIT_WRLVL_LOAD_MR2_WAIT     = 6'b001011; //B  
  localparam  INIT_RDLVL_ACT               = 6'b001100; //C
  localparam  INIT_RDLVL_ACT_WAIT          = 6'b001101; //D
  localparam  INIT_RDLVL_STG1_WRITE        = 6'b001110; //E
  localparam  INIT_RDLVL_STG1_WRITE_READ   = 6'b001111; //F 
  localparam  INIT_RDLVL_STG1_READ         = 6'b010000; //10 
  localparam  INIT_RDLVL_STG2_WRITE        = 6'b010001; //11 
  localparam  INIT_RDLVL_STG2_WRITE_READ   = 6'b010010; //12 
  localparam  INIT_RDLVL_STG2_READ         = 6'b010011; //13 
  localparam  INIT_RDLVL_STG2_READ_WAIT    = 6'b010100; //14 
  localparam  INIT_PRECHARGE_PREWAIT       = 6'b010101; //15 
  localparam  INIT_PRECHARGE               = 6'b010110; //16 
  localparam  INIT_PRECHARGE_WAIT          = 6'b010111; //17 
  localparam  INIT_DONE                    = 6'b011000; //18 
  localparam  INIT_IOCONFIG_WR             = 6'b011001; //19 
  localparam  INIT_IOCONFIG_RD             = 6'b011010; //1A 
  localparam  INIT_IOCONFIG_WR_WAIT        = 6'b011011; //1B 
  localparam  INIT_IOCONFIG_RD_WAIT        = 6'b011100; //1C 
  localparam  INIT_DDR2_PRECHARGE          = 6'b011101; //1D 
  localparam  INIT_DDR2_PRECHARGE_WAIT     = 6'b011110; //1E 
  localparam  INIT_REFRESH                 = 6'b011111; //1F 
  localparam  INIT_REFRESH_WAIT            = 6'b100000; //20
  localparam  INIT_PD_ACT                  = 6'b100001; //21
  localparam  INIT_PD_ACT_WAIT             = 6'b100010; //22
  localparam  INIT_PD_READ                 = 6'b100011; //23
  localparam  INIT_REG_WRITE               = 6'b100100; //24
  localparam  INIT_REG_WRITE_WAIT          = 6'b100101; //25
  localparam  INIT_DDR2_MULTI_RANK         = 6'b100110; //26
  localparam  INIT_DDR2_MULTI_RANK_WAIT    = 6'b100111; //27
  localparam  INIT_RDLVL_CLKDIV_WRITE      = 6'b101000; //28  
  localparam  INIT_RDLVL_CLKDIV_WRITE_READ = 6'b101001; //29  
  localparam  INIT_RDLVL_CLKDIV_READ       = 6'b101010; //2A

  reg [1:0]   auto_cnt_r;
  reg [1:0]   burst_addr_r;  
  reg [1:0]   chip_cnt_r;
  reg [6:0]   cnt_cmd_r;
  reg         cnt_cmd_done_r;  
  reg [7:0]   cnt_dllk_zqinit_r;
  reg         cnt_dllk_zqinit_done_r;
  reg         cnt_init_af_done_r;  
  reg [1:0]   cnt_init_af_r;
  reg [3:0]   cnt_init_data_r;  
  reg [1:0]   cnt_init_mr_r;
  reg         cnt_init_mr_done_r;
  reg         cnt_init_pre_wait_done_r;
  reg [7:0]   cnt_init_pre_wait_r; 
  reg [9:0]   cnt_pwron_ce_r;  
  reg         cnt_pwron_cke_done_r;  
  reg [8:0]   cnt_pwron_r;  
  reg         cnt_pwron_reset_done_r; 
  reg         cnt_txpr_done_r;  
  reg [7:0]   cnt_txpr_r;
  reg         ddr2_pre_flag_r;
  reg         ddr2_refresh_flag_r;
  reg         ddr3_lm_done_r;
  reg [4:0]   enable_wrlvl_cnt;
  reg         init_complete_r;
  reg         init_complete_r1;
  reg         init_complete_r2;
  reg [5:0]   init_next_state;  
  reg [5:0]   init_state_r;
  reg [5:0]   init_state_r1;
  wire [15:0] load_mr0;
  wire [15:0] load_mr1;
  wire [15:0] load_mr2;
  wire [15:0] load_mr3;
  reg         mem_init_done_r;
  reg         mem_init_done_r1;
  reg [1:0]   mr2_r [0:3];
  reg [2:0]   mr1_r [0:3];
  reg         new_burst_r;
  reg [15:0]  pd_cal_start_dly_r;
  wire        pd_cal_start_pre;
  reg [CS_WIDTH*nCS_PER_RANK-1:0]   phy_tmp_odt0_r;
  reg [CS_WIDTH*nCS_PER_RANK-1:0]   phy_tmp_odt1_r;
  reg [CS_WIDTH*nCS_PER_RANK-1:0]   phy_tmp_odt0_r1;
  reg [CS_WIDTH*nCS_PER_RANK-1:0]   phy_tmp_odt1_r1;
  reg [CS_WIDTH*nCS_PER_RANK-1:0]   phy_tmp_cs1_r;
  wire        prech_done_pre;
  reg [15:0]  prech_done_dly_r;  
  reg         prech_pending_r;
  reg         prech_req_posedge_r;  
  reg         prech_req_r;    
  reg         pwron_ce_r;
  reg [ROW_WIDTH-1:0] address_w;
  reg [BANK_WIDTH-1:0] bank_w;
  reg [15:0]  rdlvl_start_dly0_r;
  reg [15:0]  rdlvl_start_dly1_r;  
  reg [15:0]  rdlvl_start_dly_clkdiv_r;  
  wire [1:0]  rdlvl_start_pre;
  wire        rdlvl_start_pre_clkdiv;  
  wire        rdlvl_rd;
  wire        rdlvl_wr;
  reg         rdlvl_wr_r;
  wire        rdlvl_wr_rd;
  reg [2:0]   reg_ctrl_cnt_r;
  reg [1:0]   tmp_mr2_r [0:3];
  reg [2:0]   tmp_mr1_r [0:3];
  reg         wrlvl_done_r;
  reg         wrlvl_done_r1;
  reg         wrlvl_rank_done_r1;
  reg         wrlvl_rank_done_r2;
  reg         wrlvl_rank_done_r3;
  reg [2:0]   wrlvl_rank_cntr;
  reg         wrlvl_odt;
  reg         wrlvl_odt_r1;
  
  //***************************************************************************
  // Debug
  //***************************************************************************

  //synthesis translate_off
  always @(posedge mem_init_done_r1) begin 
    if (!rst)
      $display ("PHY_INIT: Memory Initialization completed at %t", $time);
  end

  always @(posedge wrlvl_done) begin
    if (!rst && (WRLVL == "ON"))
      $display ("PHY_INIT: Write Leveling completed at %t", $time);
  end

  always @(posedge rdlvl_done[0]) begin
    if (!rst) 
      $display ("PHY_INIT: Read Leveling Stage 1 completed at %t", $time);
  end

  always @(posedge rdlvl_done[1]) begin
    if (!rst) 
      $display ("PHY_INIT: Read Leveling Stage 2 completed at %t", $time);
  end
    
  always @(posedge rdlvl_clkdiv_done) begin
    if (!rst) 
      $display ("PHY_INIT: Read Leveling CLKDIV cal completed at %t", $time);
  end  
    
  always @(posedge pd_cal_done) begin
    if (!rst && (PHASE_DETECT == "ON"))
      $display ("PHY_INIT: Phase Detector Initial Cal completed at %t", $time);
  end
    
  //synthesis translate_on

  //***************************************************************************
  // Signal PHY completion when calibration is finished
  // Signal assertion is delayed by four clock cycles to account for the
  // multi cycle path constraint to (phy_init_data_sel) signal. 
  //***************************************************************************
  
  always @(posedge clk)
    if (rst) begin
      init_complete_r <= #TCQ 1'b0;
      init_complete_r1 <= #TCQ 1'b0;
      init_complete_r2 <= #TCQ 1'b0;
      dfi_init_complete <= #TCQ 1'b0;
    end else begin
      if (init_state_r == INIT_DONE)
        init_complete_r <= #TCQ 1'b1;
      init_complete_r1 <= #TCQ init_complete_r;
      init_complete_r2 <= #TCQ init_complete_r1; 
      dfi_init_complete <= #TCQ init_complete_r2;
    end 

  //***************************************************************************
  // Instantiate FF for the phy_init_data_sel signal. A multi cycle path 
  // constraint will be assigned to this signal. This signal will only be 
  // used within the PHY 
  //***************************************************************************

  FDRSE u_ff_phy_init_data_sel
    (
     .Q   (phy_init_data_sel),
     .C   (clk),
     .CE  (1'b1),
     .D   (init_complete_r),
     .R   (1'b0),
     .S   (1'b0)
     ) /* synthesis syn_preserve=1 */
       /* synthesis syn_replicate = 0 */;
  
  //***************************************************************************
  // Mode register programming
  //***************************************************************************
  
  //*****************************************************************
  // DDR3 Load mode reg0
  // Mode Register (MR0):
  //   [15:13]   - unused          - 000
  //   [12]      - Precharge Power-down DLL usage - 0 (DLL frozen, slow-exit), 
  //               1 (DLL maintained)
  //   [11:9]    - write recovery for Auto Precharge (tWR/tCK = 6)
  //   [8]       - DLL reset       - 0 or 1
  //   [7]       - Test Mode       - 0 (normal)
  //   [6:4],[2] - CAS latency     - CAS_LAT
  //   [3]       - Burst Type      - BURST_TYPE
  //   [1:0]     - Burst Length    - BURST_LEN
  // DDR2 Load mode register
  // Mode Register (MR):
  //   [15:14] - unused          - 00
  //   [13]    - reserved        - 0
  //   [12]    - Power-down mode - 0 (normal)
  //   [11:9]  - write recovery  - write recovery for Auto Precharge
  //                               (tWR/tCK = 6)
  //   [8]     - DLL reset       - 0 or 1
  //   [7]     - Test Mode       - 0 (normal)
  //   [6:4]   - CAS latency     - CAS_LAT
  //   [3]     - Burst Type      - BURST_TYPE
  //   [2:0]   - Burst Length    - BURST_LEN
                          
  //*****************************************************************
  generate
    if(DRAM_TYPE == "DDR3") begin: gen_load_mr0_DDR3
      assign load_mr0[1:0]   = (BURST_MODE == "8")   ? 2'b00 :
                               (BURST_MODE == "OTF") ? 2'b01 : 
                               (BURST_MODE == "4")   ? 2'b10 : 2'b11;
      assign load_mr0[2]     = 1'b0;   // LSb of CAS latency
      assign load_mr0[3]     = (BURST_TYPE == "SEQ") ? 1'b0 : 1'b1;
      assign load_mr0[6:4]   = (nCL == 5)  ? 3'b001 :
                               (nCL == 6)  ? 3'b010 : 
                               (nCL == 7)  ? 3'b011 : 
                               (nCL == 8)  ? 3'b100 :
                               (nCL == 9)  ? 3'b101 :
                               (nCL == 10) ? 3'b110 : 
                               (nCL == 11) ? 3'b111 :  3'b111;
      assign load_mr0[7]     = 1'b0;
      assign load_mr0[8]     = 1'b1;   // Reset DLL (init only)    
      assign load_mr0[11:9]  = (TWR_CYC == 5)  ? 3'b001 :
                               (TWR_CYC == 6)  ? 3'b010 : 
                               (TWR_CYC == 7)  ? 3'b011 :
                               (TWR_CYC == 8)  ? 3'b100 :
                               (TWR_CYC == 9)  ? 3'b101 :
                               (TWR_CYC == 10)  ? 3'b101 :
                               (TWR_CYC == 11)  ? 3'b110 : 
                               (TWR_CYC == 12)  ? 3'b110 : 3'b010;
      assign load_mr0[12]    = 1'b0;   // Precharge Power-Down DLL 'slow-exit'
      assign load_mr0[15:13] = 3'b000;
    end else if (DRAM_TYPE == "DDR2") begin: gen_load_mr0_DDR2 // block: gen
      assign load_mr0[2:0]   = (BURST_MODE == "8")   ? 3'b011 :
                               (BURST_MODE == "4")   ? 3'b010 : 3'b111;
      assign load_mr0[3]     = (BURST_TYPE == "SEQ") ? 1'b0 : 1'b1;       
      assign load_mr0[6:4]   = (nCL == 3)  ? 3'b011 :
                               (nCL == 4)  ? 3'b100 :
                               (nCL == 5)  ? 3'b101 : 
                               (nCL == 6)  ? 3'b110 : 3'b111;
      assign load_mr0[7]     = 1'b0;
      assign load_mr0[8]     = 1'b1;   // Reset DLL (init only)
      assign load_mr0[11:9]  = (TWR_CYC == 2)  ? 3'b001 :
                               (TWR_CYC == 3)  ? 3'b010 :
                               (TWR_CYC == 4)  ? 3'b011 :
                               (TWR_CYC == 5)  ? 3'b100 : 
                               (TWR_CYC == 6)  ? 3'b101 : 3'b010;
      assign load_mr0[15:12]= 4'b0000; // Reserved
    end
  endgenerate
   
  //*****************************************************************
  // DDR3 Load mode reg1
  // Mode Register (MR1):
  //   [15:13] - unused          - 00
  //   [12]    - output enable   - 0 (enabled for DQ, DQS, DQS#)
  //   [11]    - TDQS enable     - 0 (TDQS disabled and DM enabled)
  //   [10]    - reserved   - 0 (must be '0')
  //   [9]     - RTT[2]     - 0 
  //   [8]     - reserved   - 0 (must be '0')
  //   [7]     - write leveling - 0 (disabled), 1 (enabled)
  //   [6]     - RTT[1]          - RTT[1:0] = 0(no ODT), 1(75), 2(150), 3(50)
  //   [5]     - Output driver impedance[1] - 0 (RZQ/6 and RZQ/7)
  //   [4:3]   - Additive CAS    - ADDITIVE_CAS
  //   [2]     - RTT[0]
  //   [1]     - Output driver impedance[0] - 0(RZQ/6), or 1 (RZQ/7)
  //   [0]     - DLL enable      - 0 (normal)
  // DDR2 ext mode register
  // Extended Mode Register (MR):
  //   [15:14] - unused          - 00
  //   [13]    - reserved        - 0
  //   [12]    - output enable   - 0 (enabled)
  //   [11]    - RDQS enable     - 0 (disabled)
  //   [10]    - DQS# enable     - 0 (enabled)
  //   [9:7]   - OCD Program     - 111 or 000 (first 111, then 000 during init)
  //   [6]     - RTT[1]          - RTT[1:0] = 0(no ODT), 1(75), 2(150), 3(50)
  //   [5:3]   - Additive CAS    - ADDITIVE_CAS
  //   [2]     - RTT[0]
  //   [1]     - Output drive    - REDUCE_DRV (= 0(full), = 1 (reduced)
  //   [0]     - DLL enable      - 0 (normal)
  //*****************************************************************
 
  generate
    if(DRAM_TYPE == "DDR3") begin: gen_load_mr1_DDR3
      assign load_mr1[0]     = 1'b0;   // DLL enabled during Imitialization
      assign load_mr1[1]     = (OUTPUT_DRV == "LOW") ? 1'b0 : 1'b1; 
      assign load_mr1[2]     = ((RTT_NOM == "30") || (RTT_NOM == "40") || 
                                (RTT_NOM == "60")) ? 1'b1 : 1'b0;
      assign load_mr1[4:3]   = (AL == "0")    ? 2'b00 :
                               (AL == "CL-1") ? 2'b01 :
                               (AL == "CL-2") ? 2'b10 : 2'b11;
      assign load_mr1[5]     = 1'b0; 
      assign load_mr1[6]     = ((RTT_NOM == "40") || (RTT_NOM == "120")) ? 
                               1'b1 : 1'b0;
      assign load_mr1[7]     = 1'b0;   // Enable write lvl after init sequence
      assign load_mr1[8]     = 1'b0;
      assign load_mr1[9]     = ((RTT_NOM == "20") || (RTT_NOM == "30")) ?
                                1'b1 : 1'b0;
      assign load_mr1[10]    = 1'b0;
      assign load_mr1[15:11] = 5'b00000;
    end else if (DRAM_TYPE == "DDR2") begin: gen_load_mr1_DDR2 
      assign load_mr1[0]     = 1'b0;   // DLL enabled during Imitialization
      assign load_mr1[1]     = (OUTPUT_DRV == "LOW") ? 1'b1 : 1'b0; 
      assign load_mr1[2]     = ((RTT_NOM == "75") || (RTT_NOM == "50")) ?
                                1'b1 : 1'b0;
      assign load_mr1[5:3]   = (AL == "0") ? 3'b000 :
                               (AL == "1") ? 3'b001 :
                               (AL == "2") ? 3'b010 :
                               (AL == "3") ? 3'b011 :
                               (AL == "4") ? 3'b100 : 3'b111;     
      assign load_mr1[6]     = ((RTT_NOM == "50") || 
                                (RTT_NOM == "150")) ? 1'b1 : 1'b0;
      assign load_mr1[9:7]   = 3'b000;
      assign load_mr1[10]    = (DDR2_DQSN_ENABLE == "YES") ? 1'b0 : 1'b1;
      assign load_mr1[15:11] = 5'b00000;
    end
  endgenerate

  //*****************************************************************
  // DDR3 Load mode reg2
  // Mode Register (MR2):
  //   [15:11] - unused     - 00
  //   [10:9]  - RTT_WR     - 00 (Dynamic ODT off) 
  //   [8]     - reserved   - 0 (must be '0')
  //   [7]     - self-refresh temperature range - 
  //               0 (normal), 1 (extended)
  //   [6]     - Auto Self-Refresh - 0 (manual), 1(auto)
  //   [5:3]   - CAS Write Latency (CWL) - 
  //               000 (5 for 400 MHz device), 
  //               001 (6 for 400 MHz to 533 MHz devices), 
  //               010 (7 for 533 MHz to 667 MHz devices), 
  //               011 (8 for 667 MHz to 800 MHz)
  //   [2:0]   - Partial Array Self-Refresh (Optional)      - 
  //               000 (full array)
  // Not used for DDR2 
  //*****************************************************************
  generate
    if(DRAM_TYPE == "DDR3") begin: gen_load_mr2_DDR3
      assign load_mr2[2:0]   = 3'b000; 
      assign load_mr2[5:3]   = (nCWL == 5) ? 3'b000 :
                               (nCWL == 6) ? 3'b001 : 
                               (nCWL == 7) ? 3'b010 : 
                               (nCWL == 8) ? 3'b011 : 3'b111;
      assign load_mr2[6]     = 1'b0;
      assign load_mr2[7]     = 1'b0;
      assign load_mr2[8]     = 1'b0;
                               // Dynamic ODT disabled
      assign load_mr2[10:9]  = 2'b00;
      assign load_mr2[15:11] = 5'b00000;
    end else begin: gen_load_mr2_DDR2
      assign load_mr2[15:0] = 16'd0;
    end
  endgenerate
   
  //*****************************************************************
  // DDR3 Load mode reg3
  // Mode Register (MR3):
  //   [15:3] - unused        - All zeros
  //   [2]    - MPR Operation - 0(normal operation), 1(data flow from MPR)
  //   [1:0]  - MPR location  - 00 (Predefined pattern)
  //*****************************************************************

  assign load_mr3[1:0]  = 2'b00;
  assign load_mr3[2]    = 1'b0;
  assign load_mr3[15:3] = 13'b0000000000000;
  
  // For multi-rank systems the rank being accessed during writes in 
  // Read Leveling must be sent to phy_write for the bitslip logic
  // Due to timing issues this signal is registered in phy_top.v
  assign chip_cnt = chip_cnt_r;

  //***************************************************************************
  // Logic to begin initial calibration, and to handle precharge requests
  // during read-leveling (to avoid tRAS violations if individual read 
  // levelling calibration stages take more than max{tRAS) to complete). 
  //***************************************************************************

  // Assert when readback for each stage of read-leveling begins. However,
  // note this indicates only when the read command is issued, it does not
  // indicate when the read data is present on the bus (when this happens 
  // after the read command is issued depends on CAS LATENCY) - there will 
  // need to be some delay before valid data is present on the bus. 
  assign rdlvl_start_pre[0]     = (init_state_r == INIT_RDLVL_STG1_READ);
  assign rdlvl_start_pre[1]     = (init_state_r == INIT_RDLVL_STG2_READ);
  assign rdlvl_start_pre_clkdiv = (init_state_r == INIT_RDLVL_CLKDIV_READ);  

  // Similar comment applies to start of PHASE DETECTOR
  assign pd_cal_start_pre = (init_state_r == INIT_PD_READ);
  
  // Common precharge signal done signal - pulses only when there has been
  // a precharge issued as a result of a PRECH_REQ pulse. Note also a common
  // PRECH_DONE signal is used for all blocks
  assign prech_done_pre = (((init_state_r == INIT_RDLVL_STG1_READ) ||
                            (init_state_r == INIT_RDLVL_STG2_READ) ||
                            (init_state_r == INIT_RDLVL_CLKDIV_READ) || 
                            (init_state_r == INIT_PD_READ)) &&
                           prech_pending_r && 
                           !prech_req_posedge_r);
  
  // Delay start of each calibration by 16 clock cycles to ensure that when 
  // calibration logic begins, read data is already appearing on the bus.   
  // Each circuit should synthesize using an SRL16. Assume that reset is
  // long enough to clear contents of SRL16. 
  always @(posedge clk) begin   
    rdlvl_start_dly0_r       <= #TCQ {rdlvl_start_dly0_r[14:0], 
                                      rdlvl_start_pre[0]};
    rdlvl_start_dly1_r       <= #TCQ {rdlvl_start_dly1_r[14:0], 
                                      rdlvl_start_pre[1]};
    rdlvl_start_dly_clkdiv_r <= #TCQ {rdlvl_start_dly_clkdiv_r[14:0], 
                                      rdlvl_start_pre_clkdiv};
    pd_cal_start_dly_r       <= #TCQ {pd_cal_start_dly_r[14:0],
                                      pd_cal_start_pre};
    prech_done_dly_r         <= #TCQ {prech_done_dly_r[14:0], 
                                      prech_done_pre};
  end

  always @(posedge clk)    
    prech_done <= #TCQ prech_done_dly_r[15];  
  
  // Generate latched signals for start of write and read leveling
  always @(posedge clk)
    if (rst) begin
      rdlvl_start        <= #TCQ 2'b00;
      rdlvl_clkdiv_start <= #TCQ 1'b0;
      pd_cal_start       <= #TCQ 1'b0;      
    end else begin      
      if (rdlvl_start_dly0_r[15])
        rdlvl_start[0] <= #TCQ 1'b1;
      if (rdlvl_start_dly1_r[15])
        rdlvl_start[1] <= #TCQ 1'b1;
      if (rdlvl_start_dly_clkdiv_r[15])
        rdlvl_clkdiv_start <= #TCQ 1'b1;
      if (pd_cal_start_dly_r[15])
        pd_cal_start <= #TCQ 1'b1;        
    end

  // Constantly enable DQS while write leveling is enabled in the memory
  // This is more to get rid of warnings in simulation, can later change
  // this code to only enable WRLVL_ACTIVE when WRLVL_START is asserted
  always @ (posedge clk)
    if (rst)
      enable_wrlvl_cnt <= #TCQ 5'd0;
    else if (init_state_r == INIT_WRLVL_START)
      enable_wrlvl_cnt <= #TCQ 5'd20;
    else if (enable_wrlvl_cnt > 5'd0)
      enable_wrlvl_cnt <= #TCQ enable_wrlvl_cnt - 1;
  
  always @(posedge clk)
    if (rst || wrlvl_rank_done || wrlvl_done)
      wrlvl_active <= #TCQ 1'b0;
    else if ((enable_wrlvl_cnt == 5'd1) && !wrlvl_active)
      wrlvl_active <= #TCQ 1'b1;
      
  always @(posedge clk)
    if (rst || wrlvl_rank_done || wrlvl_done)
      wrlvl_odt <= #TCQ 1'b0;
    else if (enable_wrlvl_cnt == 5'd14)
      wrlvl_odt <= #TCQ 1'b1;
      
    always @(posedge clk) begin
      wrlvl_odt_r1  <= wrlvl_odt;
      wrlvl_done_r  <= #TCQ wrlvl_done;
      wrlvl_done_r1 <= #TCQ wrlvl_done_r;
      wrlvl_rank_done_r1 <= #TCQ wrlvl_rank_done;
      wrlvl_rank_done_r2 <= #TCQ wrlvl_rank_done_r1;
      wrlvl_rank_done_r3 <= #TCQ wrlvl_rank_done_r2;
    end
    
    always @ (posedge clk) begin
      if (rst)
        wrlvl_rank_cntr <= #TCQ 3'd0;
      else if (wrlvl_rank_done)
        wrlvl_rank_cntr <= #TCQ wrlvl_rank_cntr + 1'b1;
    end               
      
  //*****************************************************************
  // Precharge request logic - those calibration logic blocks
  // that require greater than tRAS(max) to finish must break up
  // their calibration into smaller units of time, with precharges
  // issued in between. This is done using the XXX_PRECH_REQ and
  // PRECH_DONE handshaking between PHY_INIT and those blocks
  //*****************************************************************

  // Shared request from multiple sources
  assign prech_req = rdlvl_prech_req | pd_prech_req;
  
  // Handshaking logic to force precharge during read leveling, and to
  // notify read leveling logic when precharge has been initiated and
  // it's okay to proceed with leveling again
  always @(posedge clk)
    if (rst) begin
      prech_req_r         <= #TCQ 1'b0;
      prech_req_posedge_r <= #TCQ 1'b0;
      prech_pending_r     <= #TCQ 1'b0;
    end else begin
      prech_req_r         <= #TCQ prech_req;
      prech_req_posedge_r <= #TCQ prech_req & ~prech_req_r;
      if (prech_req_posedge_r)
        prech_pending_r   <= #TCQ 1'b1;
      // Clear after we've finished with the precharge and have
      // returned to issuing read leveling calibration reads
      else if (prech_done_pre)
        prech_pending_r   <= #TCQ 1'b0;
    end

  //***************************************************************************
  // Various timing counters
  //***************************************************************************
  
  //*****************************************************************
  // Generic delay for various states that require it (e.g. for turnaround
  // between read and write). Make this a sufficiently large number of clock
  // cycles to cover all possible frequencies and memory components)
  // Requirements for this counter:
  //  1. Greater than tMRD
  //  2. tRFC (refresh-active) for DDR2
  //  3. (list the other requirements, slacker...)
  //*****************************************************************

  always @(posedge clk) begin
    case (init_state_r)
      INIT_LOAD_MR_WAIT,
      INIT_WRLVL_LOAD_MR_WAIT,
      INIT_WRLVL_LOAD_MR2_WAIT,
      INIT_RDLVL_ACT_WAIT,
      INIT_RDLVL_STG1_WRITE_READ,
      INIT_RDLVL_STG2_WRITE_READ,
      INIT_RDLVL_CLKDIV_WRITE_READ,
      INIT_RDLVL_STG2_READ_WAIT,
      INIT_PD_ACT_WAIT,
      INIT_PRECHARGE_PREWAIT,
      INIT_PRECHARGE_WAIT,
      INIT_DDR2_PRECHARGE_WAIT,
      INIT_REG_WRITE_WAIT,
      INIT_REFRESH_WAIT:
        cnt_cmd_r <= #TCQ cnt_cmd_r + 1;
      INIT_WRLVL_WAIT:
        cnt_cmd_r <= #TCQ 'b0;
      default:
        cnt_cmd_r <= #TCQ 'b0;
    endcase
  end

  // pulse when count reaches terminal count
  always @(posedge clk)
    cnt_cmd_done_r <= #TCQ (cnt_cmd_r == CNTNEXT_CMD);

  //*****************************************************************
  // Initial delay after power-on for RESET, CKE
  // NOTE: Could reduce power consumption by turning off these counters
  //       after initial power-up (at expense of more logic)
  // NOTE: Likely can combine multiple counters into single counter
  //*****************************************************************

  // Create divided by 1024 version of clock 
  always @(posedge clk)
    if (rst) begin
      cnt_pwron_ce_r <= #TCQ 10'h000;
      pwron_ce_r     <= #TCQ 1'b0;
    end else begin
      cnt_pwron_ce_r <= #TCQ cnt_pwron_ce_r + 1;
      pwron_ce_r     <= #TCQ (cnt_pwron_ce_r == 10'h3FF);
    end
  
  // "Main" power-on counter - ticks every CLKDIV/1024 cycles
  always @(posedge clk) 
    if (rst)
      cnt_pwron_r <= #TCQ 'b0;
    else if (pwron_ce_r)
      cnt_pwron_r <= #TCQ cnt_pwron_r + 1;

  always @(posedge clk)
    if (rst) begin
      cnt_pwron_reset_done_r <= #TCQ 1'b0;
      cnt_pwron_cke_done_r   <= #TCQ 1'b0;
    end else begin
      // skip power-up count for simulation purposes only
      if ((SIM_INIT_OPTION == "SKIP_PU_DLY") || 
          (SIM_INIT_OPTION == "SKIP_INIT")) begin
        cnt_pwron_reset_done_r <= #TCQ 1'b1;
        cnt_pwron_cke_done_r   <= #TCQ 1'b1;
      end else begin
        // otherwise, create latched version of done signal for RESET, CKE
        if (DRAM_TYPE == "DDR3") begin
           if (!cnt_pwron_reset_done_r)
             cnt_pwron_reset_done_r 
               <= #TCQ (cnt_pwron_r == PWRON_RESET_DELAY_CNT);
           if (!cnt_pwron_cke_done_r)
             cnt_pwron_cke_done_r   
               <= #TCQ (cnt_pwron_r == PWRON_CKE_DELAY_CNT);
           end else begin // DDR2
              cnt_pwron_reset_done_r <= #TCQ 1'b1; // not needed 
              if (!cnt_pwron_cke_done_r)
                 cnt_pwron_cke_done_r   
                   <= #TCQ (cnt_pwron_r == PWRON_CKE_DELAY_CNT);
           end        
      end
    end

  // Keep RESET asserted and CKE deasserted until after power-on delay
  always @(posedge clk) begin
    phy_reset_n <= #TCQ cnt_pwron_reset_done_r;
    phy_cke0    <= #TCQ {CKE_WIDTH{cnt_pwron_cke_done_r}};
    phy_cke1    <= #TCQ {CKE_WIDTH{cnt_pwron_cke_done_r}};
  end

  //*****************************************************************
  // Counter for tXPR (pronouned "Tax-Payer") - wait time after 
  // CKE deassertion before first MRS command can be asserted
  //*****************************************************************

  always @(posedge clk)
    if (!cnt_pwron_cke_done_r) begin
      cnt_txpr_r      <= #TCQ 'b0;
      cnt_txpr_done_r <= #TCQ 1'b0;
    end else begin
      cnt_txpr_r <= #TCQ cnt_txpr_r + 1;
      if (!cnt_txpr_done_r)
        cnt_txpr_done_r <= #TCQ (cnt_txpr_r == TXPR_DELAY_CNT);
    end

  //*****************************************************************
  // Counter for the initial 400ns wait for issuing precharge all
  // command after CKE assertion. Only for DDR2. 
  //*****************************************************************

  always @(posedge clk)
    if (!cnt_pwron_cke_done_r) begin
      cnt_init_pre_wait_r      <= #TCQ 'b0;
      cnt_init_pre_wait_done_r <= #TCQ 1'b0;
    end else begin
      cnt_init_pre_wait_r <= #TCQ cnt_init_pre_wait_r + 1;
      if (!cnt_init_pre_wait_done_r)
        cnt_init_pre_wait_done_r 
          <= #TCQ (cnt_init_pre_wait_r >= DDR2_INIT_PRE_CNT);
    end
    
  //*****************************************************************
  // Wait for both DLL to lock (tDLLK) and ZQ calibration to finish
  // (tZQINIT). Both take the same amount of time (512*tCK)
  //*****************************************************************

  always @(posedge clk)
    if (init_state_r == INIT_ZQCL) begin
      cnt_dllk_zqinit_r      <= #TCQ 'b0;
      cnt_dllk_zqinit_done_r <= #TCQ 1'b0;
    end else begin
      cnt_dllk_zqinit_r <= #TCQ cnt_dllk_zqinit_r + 1;
      if (!cnt_dllk_zqinit_done_r) 
        cnt_dllk_zqinit_done_r 
          <= #TCQ (cnt_dllk_zqinit_r == TDLLK_TZQINIT_DELAY_CNT);
    end

  //*****************************************************************  
  // Keep track of which MRS counter needs to be programmed during
  // memory initialization
  // The counter and the done signal are reset an additional time
  // for DDR2. The same signals are used for the additional DDR2
  // initialization sequence. 
  //*****************************************************************
  
  always @(posedge clk)
    if ((init_state_r == INIT_IDLE)||
        ((init_state_r == INIT_REFRESH)
          && (~mem_init_done_r1))) begin
      cnt_init_mr_r      <= #TCQ 'b0;
      cnt_init_mr_done_r <= #TCQ 1'b0;
    end else if (init_state_r == INIT_LOAD_MR) begin
      cnt_init_mr_r      <= #TCQ cnt_init_mr_r + 1;
      cnt_init_mr_done_r <= #TCQ (cnt_init_mr_r == INIT_CNT_MR_DONE);
    end

  
  //*****************************************************************  
  // Flag to tell if the first precharge for DDR2 init sequence is
  // done 
  //*****************************************************************
  
  always @(posedge clk)
    if (init_state_r == INIT_IDLE) 
      ddr2_pre_flag_r<= #TCQ 'b0;
    else if (init_state_r == INIT_LOAD_MR) 
      ddr2_pre_flag_r<= #TCQ 1'b1;
    // reset the flag for multi rank case 
    else if ((ddr2_refresh_flag_r) &&
             (init_state_r == INIT_LOAD_MR_WAIT)&&
             (cnt_cmd_done_r) && (cnt_init_mr_done_r))
      ddr2_pre_flag_r <= #TCQ 'b0;

  //*****************************************************************  
  // Flag to tell if the refresh stat  for DDR2 init sequence is
  // reached 
  //*****************************************************************
  
  always @(posedge clk)
    if (init_state_r == INIT_IDLE) 
      ddr2_refresh_flag_r<= #TCQ 'b0;
    else if ((init_state_r == INIT_REFRESH) && (~mem_init_done_r1)) 
      // reset the flag for multi rank case 
      ddr2_refresh_flag_r<= #TCQ 1'b1;
    else if ((ddr2_refresh_flag_r) &&
             (init_state_r == INIT_LOAD_MR_WAIT)&&
             (cnt_cmd_done_r) && (cnt_init_mr_done_r))
      ddr2_refresh_flag_r <= #TCQ 'b0;
   
  //*****************************************************************  
  // Keep track of the number of auto refreshes for DDR2 
  // initialization. The spec asks for a minimum of two refreshes.
  // Four refreshes are performed here. The two extra refreshes is to
  // account for the 200 clock cycle wait between step h and l.
  // Without the two extra refreshes we would have to have a
  // wait state. 
  //*****************************************************************
  
  always @(posedge clk)
    if (init_state_r == INIT_IDLE) begin
      cnt_init_af_r      <= #TCQ 'b0;
      cnt_init_af_done_r <= #TCQ 1'b0;
    end else if ((init_state_r == INIT_REFRESH) && (~mem_init_done_r1)) begin
      cnt_init_af_r      <= #TCQ cnt_init_af_r + 1;
      cnt_init_af_done_r <= #TCQ (cnt_init_af_r == 2'b11);
    end   

  //*****************************************************************  
  // Keep track of the register control word programming for
  // DDR3 RDIMM 
  //*****************************************************************
   
  always @(posedge clk)
    if (init_state_r == INIT_IDLE)
      reg_ctrl_cnt_r <= #TCQ 'b0;
    else if (init_state_r == INIT_REG_WRITE)
      reg_ctrl_cnt_r <= #TCQ reg_ctrl_cnt_r + 1;
   
  
  //***************************************************************************
  // Initialization state machine
  //***************************************************************************

  //*****************************************************************
  // Next-state logic 
  //*****************************************************************

  always @(posedge clk)
    if (rst)begin
      init_state_r  <= #TCQ INIT_IDLE;
      init_state_r1 <= #TCQ INIT_IDLE;
    end else begin
      init_state_r  <= #TCQ init_next_state;
      init_state_r1 <= #TCQ init_state_r;
    end 
  
  always @(burst_addr_r or chip_cnt_r or cnt_cmd_done_r
           or cnt_dllk_zqinit_done_r or cnt_init_af_done_r
           or cnt_init_mr_done_r
           or cnt_init_pre_wait_done_r or cnt_pwron_cke_done_r
           or cnt_txpr_done_r or ddr2_pre_flag_r
           or ddr2_refresh_flag_r or ddr3_lm_done_r
           or init_state_r or mem_init_done_r1
           or pd_cal_done or prech_req_posedge_r
           or rdlvl_done or rdlvl_clkdiv_done or rdlvl_resume 
           or rdlvl_start or rdlvl_clkdiv_start or rdpath_rdy
           or reg_ctrl_cnt_r or wrlvl_done_r1 or wrlvl_rank_done_r3) begin     
    init_next_state = init_state_r;
    (* full_case, parallel_case *) case (init_state_r)

      //*******************************************************
      // DRAM initialization
      //*******************************************************

      // Initial state - wait for:
      //   1. Power-on delays to pass
      //   2. Read path initialization to finish
      INIT_IDLE:
        if (cnt_pwron_cke_done_r && rdpath_rdy) begin
          // If skipping memory initialization (simulation only)
          if (SIM_INIT_OPTION == "SKIP_INIT")       
            if (WRLVL == "ON")      
              // Proceed to write leveling 
              init_next_state = INIT_WRLVL_START;
            else if (SIM_CAL_OPTION != "SKIP_CAL")            
              // Proceed to read leveling 
              init_next_state = INIT_RDLVL_ACT;
            else
              // Skip read leveling
              init_next_state = INIT_DONE;        
          else
            init_next_state = INIT_WAIT_CKE_EXIT;
        end
        
      // Wait minimum of Reset CKE exit time (tXPR = max(tXS, 
      INIT_WAIT_CKE_EXIT:
        if ((cnt_txpr_done_r) && (DRAM_TYPE == "DDR3")) begin
          if((REG_CTRL == "ON") && ((nCS_PER_RANK > 1) ||
             (CS_WIDTH > 1)))
          //register write for reg dimm. Some register chips
          // have the register chip in a pre-programmed state
          // in that case the nCS_PER_RANK == 1 && CS_WIDTH == 1 
            init_next_state = INIT_REG_WRITE;
          else
          // Load mode register - this state is repeated multiple times
          init_next_state = INIT_LOAD_MR;
        end else if ((cnt_init_pre_wait_done_r) && (DRAM_TYPE == "DDR2"))
          // DDR2 start with a precharge all command 
          init_next_state = INIT_DDR2_PRECHARGE;                             

      INIT_REG_WRITE:
        init_next_state = INIT_REG_WRITE_WAIT;

      INIT_REG_WRITE_WAIT:
        if (cnt_cmd_done_r) begin
           if(reg_ctrl_cnt_r == 3'd5)
             init_next_state = INIT_LOAD_MR;
           else
             init_next_state = INIT_REG_WRITE;
        end
        
      INIT_LOAD_MR:
        init_next_state = INIT_LOAD_MR_WAIT;
      // After loading MR, wait at least tMRD

      INIT_LOAD_MR_WAIT:
        if (cnt_cmd_done_r) begin
          // If finished loading all mode registers, proceed to next step
          if(&rdlvl_done)
           // for ddr3 when the correct burst length is writtern at end
            init_next_state = INIT_PRECHARGE;
          else if (cnt_init_mr_done_r)begin
             if(DRAM_TYPE == "DDR3")
                init_next_state = INIT_ZQCL;
             else begin //DDR2
                if(ddr2_refresh_flag_r)begin
                 // memory initialization per rank for multi-rank case
                  if (!mem_init_done_r1 && (chip_cnt_r <= CS_WIDTH-1))
                    init_next_state  = INIT_DDR2_MULTI_RANK;                     
                  else 
                     init_next_state = INIT_RDLVL_ACT;
                  // ddr2 initialization done.load mode state after refresh
                end else 
                  init_next_state = INIT_DDR2_PRECHARGE;
              end  
          end else      
            init_next_state = INIT_LOAD_MR;
        end // if (cnt_cmd_done_r)

       // DDR2 multi rank transition state
      INIT_DDR2_MULTI_RANK:
        init_next_state = INIT_DDR2_MULTI_RANK_WAIT;

      INIT_DDR2_MULTI_RANK_WAIT:
        init_next_state = INIT_DDR2_PRECHARGE;
 
      // Initial ZQ calibration 
      INIT_ZQCL:
        init_next_state = INIT_WAIT_DLLK_ZQINIT;

      // Wait until both DLL have locked, and ZQ calibration done
      INIT_WAIT_DLLK_ZQINIT:
        if (cnt_dllk_zqinit_done_r)
          // memory initialization per rank for multi-rank case
          if (!mem_init_done_r && (chip_cnt_r <= CS_WIDTH-1))
            init_next_state = INIT_LOAD_MR;
          else if (WRLVL == "ON")
            init_next_state = INIT_WRLVL_START;
          else
            // skip write-leveling (e.g. for component interface)
            init_next_state = INIT_RDLVL_ACT;

      // Initial precharge for DDR2
      INIT_DDR2_PRECHARGE: 
        init_next_state = INIT_DDR2_PRECHARGE_WAIT; 

      INIT_DDR2_PRECHARGE_WAIT: 
        if (cnt_cmd_done_r) begin
           if(ddr2_pre_flag_r)
             init_next_state = INIT_REFRESH;
           else// from precharge state initally go to load mode  
             init_next_state = INIT_LOAD_MR;
        end                                  

      INIT_REFRESH: 
        init_next_state = INIT_REFRESH_WAIT; 

      INIT_REFRESH_WAIT: 
        if (cnt_cmd_done_r)begin
          if(cnt_init_af_done_r && (~mem_init_done_r1))
            // go to lm state as part of DDR2 init sequence 
            init_next_state = INIT_LOAD_MR;
          else if (mem_init_done_r1)begin
            if(auto_cnt_r < (CS_WIDTH))
              init_next_state = INIT_REFRESH;
            else if ((&rdlvl_done) && (PHASE_DETECT == "ON"))
              init_next_state = INIT_PD_ACT;
            else
              init_next_state = INIT_RDLVL_ACT; 
          end else // to DDR2 init state as part of DDR2 init sequence  
            init_next_state = INIT_REFRESH;
        end
           
       //******************************************************
      // Write Leveling
      //*******************************************************

      // Enable write leveling in MR1 and start write leveling
      // for current rank
      INIT_WRLVL_START:
        init_next_state = INIT_WRLVL_WAIT;

      // Wait for both MR load and write leveling to complete
      // (write leveling should take much longer than MR load..)
      INIT_WRLVL_WAIT:
        if (wrlvl_rank_done_r3)
          init_next_state = INIT_WRLVL_LOAD_MR;

      // Disable write leveling in MR1 for current rank
      INIT_WRLVL_LOAD_MR:
        init_next_state = INIT_WRLVL_LOAD_MR_WAIT;
        
      INIT_WRLVL_LOAD_MR_WAIT:
        if (cnt_cmd_done_r)
        init_next_state = INIT_WRLVL_LOAD_MR2;
        
      // Load MR2 to set ODT: Dynamic ODT for single rank case
      // And ODTs for multi-rank case as well
      INIT_WRLVL_LOAD_MR2:
        init_next_state = INIT_WRLVL_LOAD_MR2_WAIT;    

      // Wait tMRD before proceeding
      INIT_WRLVL_LOAD_MR2_WAIT:
        if (cnt_cmd_done_r) begin
          if (~wrlvl_done_r1)
            init_next_state = INIT_WRLVL_START;
          else if (SIM_CAL_OPTION == "SKIP_CAL")
            // If skip rdlvl, then we're done
            init_next_state = INIT_DONE;
          else 
            // Otherwise, proceed to read leveling 
            init_next_state = INIT_RDLVL_ACT;
        end
          
      //*******************************************************
      // Read Leveling
      //*******************************************************      

      // single row activate. All subsequent read leveling writes and 
      // read will take place in this row      
      INIT_RDLVL_ACT:
        init_next_state = INIT_RDLVL_ACT_WAIT;

      // hang out for awhile before issuing subsequent column commands
      // it's also possible to reach this state at various points
      // during read leveling - determine what the current stage is 
      INIT_RDLVL_ACT_WAIT:
        if (cnt_cmd_done_r) begin
          // Just finished an activate. Now either write, read, or precharge 
          // depending on where we are in the training sequence
          if (!rdlvl_done[0] && !rdlvl_start[0])
            // Case 1: If in stage 1, and entering for first time, then
            //   write training pattern to memory
            init_next_state = INIT_IOCONFIG_WR;
          else if (!rdlvl_done[0] && rdlvl_start[0])
            // Case 2: If in stage 1, and just precharged after training
            //   previous byte, then continue reading
            init_next_state = INIT_IOCONFIG_RD;
          else if (!rdlvl_clkdiv_done && !rdlvl_clkdiv_start)
            // Case 3: If in CLKDIV cal, and entering for first time, then
            //   write training pattern to memory
            init_next_state = INIT_IOCONFIG_WR;
          else if (!rdlvl_clkdiv_done && rdlvl_clkdiv_start)
            // Case 4: If in CLKDIV cal, and just precharged after training
            //   previous byte, then continue reading              
            init_next_state = INIT_IOCONFIG_RD;
          else if (!rdlvl_done[1] && !rdlvl_start[1])
            // Case 5: If in stage 2, and entering for first time, then
            //   write training pattern to memory
            init_next_state = INIT_IOCONFIG_WR;
          else if (!rdlvl_done[1] && rdlvl_start[1])
            // Case 6: If in stage 2, and just precharged after training
            //   previous byte, then continue reading              
            init_next_state = INIT_IOCONFIG_RD;
          else
            // Otherwise, if we're finished with calibration, then precharge
            // the row - silly, because we just opened it - possible to take
            // this out by adding logic to avoid the ACT in first place. Make
            // sure that cnt_cmd_done will handle tRAS(min)
            init_next_state = INIT_PRECHARGE_PREWAIT;
        end

      //*********************************************      
      // Stage 1 read-leveling (write and continuous read)
      //*********************************************      

      // Write training pattern for stage 1
      INIT_RDLVL_STG1_WRITE:
        // Once we've issued enough commands for 16 words - proceed to reads
        // Note that 16 words are written even though the training pattern
        // is only 8 words (training pattern is written twice) because at
        // this point in the calibration process we may be generating the
        // DQS and DQ a few cycles early (that part of the write timing
        // adjustment doesn't happen until stage 2)
        if (burst_addr_r == 2'b11)
          init_next_state = INIT_RDLVL_STG1_WRITE_READ;

      // Write-read turnaround
      INIT_RDLVL_STG1_WRITE_READ: 
        if (cnt_cmd_done_r)
          init_next_state = INIT_IOCONFIG_RD;

      // Continuous read, where interruptible by precharge request from
      // calibration logic. Also precharges when stage 1 is complete
      INIT_RDLVL_STG1_READ:
        if (rdlvl_done[0] || prech_req_posedge_r)
          init_next_state = INIT_PRECHARGE_PREWAIT;

      //*********************************************      
      // CLKDIV calibration read-leveling (write and continuous read)
      //*********************************************      

      // Write training pattern for stage 1
      INIT_RDLVL_CLKDIV_WRITE:
        // Once we've issued enough commands for 16 words - proceed to reads
        // See comment for state RDLVL_STG1_WRITE
        if (burst_addr_r == 2'b11)
          init_next_state = INIT_RDLVL_CLKDIV_WRITE_READ;

      // Write-read turnaround
      INIT_RDLVL_CLKDIV_WRITE_READ: 
        if (cnt_cmd_done_r)
          init_next_state = INIT_IOCONFIG_RD;

      // Continuous read, where interruptible by precharge request from
      // calibration logic. Also precharges when stage 1 is complete
      INIT_RDLVL_CLKDIV_READ:
        if (rdlvl_clkdiv_done || prech_req_posedge_r)
          init_next_state = INIT_PRECHARGE_PREWAIT;
      
      //*********************************************      
      // Stage 2 read-leveling (write and continuous read)
      //*********************************************   

      // Write training pattern for stage 1
      INIT_RDLVL_STG2_WRITE:
        // Once we've issued enough commands for 16 words - proceed to reads
        // Write 8 extra words in order to prevent any previous data in
        // memory from skewing calibration results (write 8 words for
        // training pattern followed by 8 zeros)
        if (burst_addr_r == 2'b11)
          init_next_state = INIT_RDLVL_STG2_WRITE_READ;

      // Write-read turnaround
      INIT_RDLVL_STG2_WRITE_READ: 
        if (cnt_cmd_done_r) 
          init_next_state = INIT_IOCONFIG_RD;

      // Read of training data. Note that Stage 2 is not a constant read, 
      // instead there is a large gap between each read
      INIT_RDLVL_STG2_READ:
        // Keep reading for 8 words
        if (burst_addr_r == 2'b01)
          init_next_state = INIT_RDLVL_STG2_READ_WAIT;

      // Wait before issuing the next read. If a precharge request comes in
      // then handle it                                 
      INIT_RDLVL_STG2_READ_WAIT:
        if (rdlvl_resume)
          init_next_state = INIT_IOCONFIG_WR;
        else if (rdlvl_done[1] || prech_req_posedge_r)
          init_next_state = INIT_PRECHARGE_PREWAIT;
        else if (cnt_cmd_done_r)
            init_next_state = INIT_RDLVL_STG2_READ;
       
        
      //*********************************************      
      // Phase detector initial calibration                                  
      //*********************************************

      // single row activate. All subsequent PD calibration takes place
      // using this row      
      INIT_PD_ACT:
        init_next_state = INIT_PD_ACT_WAIT;

      // hang out for awhile before issuing subsequent column command
      INIT_PD_ACT_WAIT:
        if (cnt_cmd_done_r)
          init_next_state = INIT_IOCONFIG_RD;

      // Read of training data - constant reads. Note that for PD 
      // calibration, data is not important - only DQS is used.
      // PD calibration is interruptible by precharge request from 
      // calibration logic. Also precharges a final time when PD cal done
      INIT_PD_READ:
        if (pd_cal_done || prech_req_posedge_r)
          init_next_state = INIT_PRECHARGE_PREWAIT;        

      //*********************************************      
      // Handling of precharge during and in between read-level stages
      //*********************************************   

      // Make sure we aren't violating any timing specs by precharging
      //  immediately
      INIT_PRECHARGE_PREWAIT:
        if (cnt_cmd_done_r)
          init_next_state = INIT_PRECHARGE;                
                                     
      // Initiate precharge
      INIT_PRECHARGE: 
        init_next_state = INIT_PRECHARGE_WAIT; 

      INIT_PRECHARGE_WAIT: 
        if (cnt_cmd_done_r) begin
          if ((pd_cal_done || (PHASE_DETECT != "ON")) && (&rdlvl_done)
             && ( (ddr3_lm_done_r)|| (DRAM_TYPE == "DDR2")))
            // If read leveling and phase detection calibration complete, 
            // and programing the correct burst length then we're finished
            init_next_state = INIT_DONE;          
          else if ((pd_cal_done || (PHASE_DETECT != "ON")) && (&rdlvl_done)) 
           // after all calibration program the correct burst length
            init_next_state = INIT_LOAD_MR; 
          else
            // Otherwise, open row for read-leveling purposes
            init_next_state = INIT_REFRESH;
        end
        
      //*******************************************************
      // Wait a cycle before switching commands to pulse the IOCONFIG
      // Time is needed to turn around the IODELAY. Wait state is
      // added because IOCONFIG must be asserted 2 clock cycles before
      // before corresponding command/address (probably a less logic-
      // intensive way of doing this, that doesn't involve extra states)
      //*******************************************************

      INIT_IOCONFIG_WR:
        init_next_state = INIT_IOCONFIG_WR_WAIT;

      INIT_IOCONFIG_WR_WAIT:    
        if (!rdlvl_done[0])
          // Write Stage 1 training pattern to memory
          init_next_state = INIT_RDLVL_STG1_WRITE;
        else if (!rdlvl_clkdiv_done)
           // Write CLKDIV cal training pattern to memory
          init_next_state = INIT_RDLVL_CLKDIV_WRITE;
        else
          // Write Stage 2 training pattern to memory
          init_next_state = INIT_RDLVL_STG2_WRITE;
                                     
      INIT_IOCONFIG_RD:
        init_next_state = INIT_IOCONFIG_RD_WAIT;

      INIT_IOCONFIG_RD_WAIT:
        if (!rdlvl_done[0])
          // Read Stage 1 training pattern from memory
          init_next_state = INIT_RDLVL_STG1_READ;
        else if (!rdlvl_clkdiv_done)
          // Read CLKDIV cal training pattern from memory
          init_next_state = INIT_RDLVL_CLKDIV_READ;
        else if (!rdlvl_done[1])
          // Read Stage 2 training pattern from memory
          init_next_state = INIT_RDLVL_STG2_READ;
        else
          // Phase Detector read
          init_next_state = INIT_PD_READ;
      
      //*******************************************************
      // Initialization/Calibration done. Take a long rest, relax
      //*******************************************************

      INIT_DONE:
        init_next_state = INIT_DONE;

    endcase
  end
      
  //*****************************************************************
  // Initialization done signal - asserted before leveling starts
  //*****************************************************************

 
  always @(posedge clk)
    if (rst)
      mem_init_done_r <= #TCQ 1'b0;
    else if ((!cnt_dllk_zqinit_done_r && 
             (cnt_dllk_zqinit_r == TDLLK_TZQINIT_DELAY_CNT) &&
             (chip_cnt_r == CS_WIDTH-1) && (DRAM_TYPE == "DDR3"))
              || ( (init_state_r == INIT_LOAD_MR_WAIT) &&
             (ddr2_refresh_flag_r) && (chip_cnt_r == CS_WIDTH-1)
             && (cnt_init_mr_done_r) && (DRAM_TYPE == "DDR2")))
      mem_init_done_r <= #TCQ 1'b1;

  // registered for timing. mem_init_done_r1 will be used in the
  // design. The design can tolerate the extra cycle of latency. 
  always @(posedge clk)
    mem_init_done_r1 <= #TCQ mem_init_done_r;

  //*****************************************************************
  // DDR3 final burst length programming done. For DDR3 during
  // calibration the burst length is fixed to BL8. After calibration
  // the correct burst length is programmed. 
  //*****************************************************************

 
  always @(posedge clk)
    if (rst)
      ddr3_lm_done_r <= #TCQ 1'b0;
    else if ((init_state_r == INIT_LOAD_MR_WAIT) &&
            (chip_cnt_r == CS_WIDTH-1) && (&rdlvl_done))
      ddr3_lm_done_r <= #TCQ 1'b1;

  
  //***************************************************************************
  // Logic for deep memory (multi-rank) configurations
  // 
  //***************************************************************************

  // For DDR3 asserted when  
  always @(posedge clk)
    if (rst || (wrlvl_done_r &&
                (init_state_r==INIT_WRLVL_LOAD_MR2_WAIT))
        || ((mem_init_done_r & (~mem_init_done_r1))
            && (DRAM_TYPE == "DDR2"))) begin 
      chip_cnt_r <= #TCQ 2'b00;
    end else if (((init_state_r1 == INIT_REFRESH) &&
                  mem_init_done_r1) )begin
      if (chip_cnt_r < CS_WIDTH-1)
        chip_cnt_r <= #TCQ chip_cnt_r + 1;
      else
        chip_cnt_r <= #TCQ 2'b00;
    end else if ((((init_state_r == INIT_WAIT_DLLK_ZQINIT) &&
                   (cnt_dllk_zqinit_r == TDLLK_TZQINIT_DELAY_CNT)) ||
                  ((init_state_r!=INIT_WRLVL_LOAD_MR2_WAIT) && 
                   (init_next_state==INIT_WRLVL_LOAD_MR2_WAIT)) && 
                  (DRAM_TYPE == "DDR3")) || 
                 ((init_state_r == INIT_DDR2_MULTI_RANK)
                  && (DRAM_TYPE == "DDR2")) ||
                 // condition to increment chip_cnt during
                 // final burst length programming for DDR3 
                 ((init_state_r == INIT_LOAD_MR_WAIT) && 
                  (cnt_cmd_done_r)&& (&rdlvl_done))) 
      begin
        if (((~mem_init_done_r1 || (&rdlvl_done)) && 
             (chip_cnt_r != CS_WIDTH-1)) || 
            (mem_init_done_r1 && ~(&rdlvl_done) && 
             (chip_cnt_r != calib_width -1)))
          chip_cnt_r <= #TCQ chip_cnt_r + 1;
        else
          chip_cnt_r <= #TCQ 2'b00;
      end

  // keep track of which chip selects got auto-refreshed (avoid auto-refreshing
  // all CS's at once to avoid current spike)
  always @(posedge clk)begin
    if (rst || init_state_r == INIT_PRECHARGE)
      auto_cnt_r <= #TCQ 'd0;
    else if (init_state_r == INIT_REFRESH && mem_init_done_r1) begin
      if (auto_cnt_r < CS_WIDTH)
        auto_cnt_r <= #TCQ auto_cnt_r + 1;
    end
  end

  always @(posedge clk)
    if (rst) begin
      phy_cs_n0 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
      phy_cs_n1 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
    end else begin
      phy_cs_n0 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
      phy_cs_n1 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
      if (init_state_r == INIT_REG_WRITE) begin
        phy_cs_n0 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
        phy_cs_n1 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
      end else if (wrlvl_odt) begin
        // Component interface without fly-by topology
        // must have all CS# outputs asserted simultaneously
        // since it is a wide not deep interface
        if ((REG_CTRL == "OFF") && (nCS_PER_RANK > 1))
          phy_cs_n0 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
        // For single and dual rank RDIMMS and UDIMMs only
        // CS# of the selected rank must be asserted
        else begin
          phy_cs_n0 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
          phy_cs_n0[chip_cnt_r] <= #TCQ 1'd0;
        end
        phy_cs_n1 <= #TCQ phy_tmp_cs1_r;        
      end else if ((init_state_r == INIT_LOAD_MR) ||
          (init_state_r  == INIT_ZQCL) ||
          (init_state_r == INIT_WRLVL_START) ||
          (init_state_r == INIT_WRLVL_LOAD_MR) ||
          (init_state_r == INIT_WRLVL_LOAD_MR2) ||
          (init_state_r == INIT_RDLVL_ACT) ||
          (init_state_r == INIT_RDLVL_STG1_WRITE) ||
          (init_state_r == INIT_RDLVL_STG1_READ) ||
          (init_state_r == INIT_PRECHARGE) ||
          (init_state_r == INIT_RDLVL_STG2_READ) ||
          (init_state_r == INIT_RDLVL_STG2_WRITE) ||
          (init_state_r == INIT_RDLVL_CLKDIV_READ) ||
          (init_state_r == INIT_RDLVL_CLKDIV_WRITE) ||
          (init_state_r == INIT_PD_ACT) ||
          (init_state_r == INIT_PD_READ) || 
          (init_state_r == INIT_DDR2_PRECHARGE) ||
          (init_state_r == INIT_REFRESH)) begin
        phy_cs_n0 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
        phy_cs_n1 <= #TCQ phy_tmp_cs1_r;
      end       
    end

                 
  //***************************************************************************
  // Write/read burst logic for calibration
  //***************************************************************************

  assign rdlvl_wr = (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                    (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                    (init_state_r == INIT_RDLVL_CLKDIV_WRITE);
  assign rdlvl_rd = (init_state_r == INIT_RDLVL_STG1_READ) ||
                    (init_state_r == INIT_RDLVL_STG2_READ) ||
                    (init_state_r == INIT_RDLVL_CLKDIV_READ) ||             
                    (init_state_r == INIT_PD_READ);
  assign rdlvl_wr_rd = rdlvl_wr | rdlvl_rd;

  // Determine current DRAM address (lower bits of address) when writing or
  // reading from memory during calibration (to access training patterns):
  //  (1) address must be initialized to 0 before entering all write/read
  //      states
  //  (2) for writes, the maximum address is = {2 * length of calibration
  //      training pattern}
  //  (3) for reads, the maximum address is = {length of calibration
  //      training pattern}, therefore it will need to be reinitialized
  //      while we remain in a read state since reads can occur continuously
  // NOTE: For a training pattern length of 8, burst_addr is used to 
  // such that the lower order bits of the address are given by = 
  // {burst_addr, 2'b00}. This can be expanded for more bits if the training 
  // sequence is longer than 8 words  
  always @(posedge clk)
    if (rdlvl_rd)
      // Reads only access first 8 words of memory, and the access can
      // occur continously (i.e. w/o leaving the read state)
      burst_addr_r <= #TCQ {1'b0, ~burst_addr_r[0]};
    else if (rdlvl_wr)
      // Writes will access first 16 words fo memory, and the access is
      // only one-time (before leaving the write state)
      burst_addr_r <= #TCQ burst_addr_r + 1;
    else
      // Otherwise, during any other states, reset address to 0
      burst_addr_r <= #TCQ 2'b00;
  
  // determine how often to issue row command during read leveling writes
  // and reads
  always @(posedge clk)
    if (rdlvl_wr_rd) begin
      if (BURST4_FLAG)
        new_burst_r <= #TCQ 1'b1;
      else
        new_burst_r <= #TCQ ~new_burst_r;
    end else
      new_burst_r <= #TCQ 1'b1;
  
// indicate when a write is occurring. PHY_WRDATA_EN must be asserted
// simultaneous with the corresponding command/address for CWL = 5,6
  always @(posedge clk) begin
    rdlvl_wr_r    <= #TCQ rdlvl_wr;
  end
  
// As per the tPHY_WRLAT spec phy_wrdata_en should be delayed
// for CWL >= 7    
  always @(posedge clk) begin
    if (CWL_M <= 4) begin
      phy_wrdata_en <= #TCQ rdlvl_wr;
    end else if (CWL_M == 5) begin
      phy_wrdata_en <= #TCQ rdlvl_wr;
    end else if (CWL_M == 6) begin
      phy_wrdata_en <= #TCQ rdlvl_wr;
    end else if (CWL_M == 7) begin
      phy_wrdata_en <= #TCQ rdlvl_wr_r;      
    end else if (CWL_M == 8) begin
      phy_wrdata_en <= #TCQ rdlvl_wr_r;
    end else if (CWL_M == 9) begin
      phy_wrdata_en <= #TCQ rdlvl_wr_r;
    end
  end
  
  // generate the sideband signal to indicate when the bus turns around 
  // from a write to a read, or vice versa. Used asserting signals related
  // to the bus turnaround (e.g. IODELAY delay value)
  always @(posedge clk) begin
    if (init_state_r == INIT_IOCONFIG_WR) begin
      // Transition for writes 
      phy_ioconfig_en   <= #TCQ 1'b1;
      phy_ioconfig[0]   <= #TCQ 1'b1;
    end else if (init_state_r == INIT_IOCONFIG_RD) begin
      //Transition for reads      
      phy_ioconfig_en   <= #TCQ 1'b1;
      phy_ioconfig[0]   <= #TCQ 1'b0;
    end else
      // Keep PHY_IOCONFIG at whatever value it currently is
      // Only assert strobe when a new value appears 
      phy_ioconfig_en   <= #TCQ 1'b0;
  end

  // indicate when a write is occurring. PHY_RDDATA_EN must be asserted
  // simultaneous with the corresponding command/address. PHY_RDDATA_EN
  // is used during read-leveling to determine read latency
  always @(posedge clk)
    phy_rddata_en <= #TCQ rdlvl_rd;

  //***************************************************************************
  // Generate training data written at start of each read-leveling stage
  // For every stage of read leveling, 8 words are written into memory
  // The format is as follows (shown as {rise,fall}):
  //   Stage 1:    0xF, 0x0, 0xF, 0x0, 0xF, 0x0, 0xF, 0x0
  //   CLKDIV cal: 0xF, 0xF, 0xF. 0xF, 0x0, 0x0, 0x0, 0x0 
  //   Stage 2:    0xF, 0x0, 0xA, 0x5, 0x5, 0xA, 0x9, 0x6
  //***************************************************************************

  always @(posedge clk)
    // NOTE: No need to initialize cnt_init_data_r except possibly for
    //  simulation purposes (to prevent excessive warnings) since first
    //  state encountered before its use is RDLVL_STG1_WRITE 
    if (phy_wrdata_en)      
      cnt_init_data_r <= #TCQ cnt_init_data_r + 1;
    else if ((init_state_r == INIT_IDLE) || 
             (init_state_r == INIT_RDLVL_STG1_WRITE))
      cnt_init_data_r <= #TCQ 4'b0000;
    else if (init_state_r == INIT_RDLVL_CLKDIV_WRITE)
      cnt_init_data_r <= #TCQ 4'b0100;
    else if (init_state_r == INIT_RDLVL_STG2_WRITE)
      cnt_init_data_r <= #TCQ 4'b1000;

  always @(posedge clk)
    (* full_case, parallel_case *) case (cnt_init_data_r)
      // Stage 1 calibration pattern (all 4 writes have same data)
      4'b0000, 4'b0001, 4'b0010, 4'b0011:
        phy_wrdata <= #TCQ {{DQ_WIDTH{1'b0}},{DQ_WIDTH{1'b1}},
                            {DQ_WIDTH{1'b0}},{DQ_WIDTH{1'b1}}};
      // Stage 3 calibration pattern (repeat twice)
      4'b0100, 4'b0110:
        phy_wrdata <= #TCQ {{DQ_WIDTH{1'b1}},{DQ_WIDTH{1'b1}},
                            {DQ_WIDTH{1'b1}},{DQ_WIDTH{1'b1}}};
      4'b0101, 4'b0111:
        phy_wrdata <= #TCQ {{DQ_WIDTH{1'b0}},{DQ_WIDTH{1'b0}},
                            {DQ_WIDTH{1'b0}},{DQ_WIDTH{1'b0}}};
      // Stage 2 calibration pattern (2 different sets of writes, each 8
      // 2 different sets of writes, each 8words long
      4'b1000:
        phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h5}},{DQ_WIDTH/4{4'hA}},
                            {DQ_WIDTH/4{4'h0}},{DQ_WIDTH/4{4'hF}}};
      4'b1001: 
        phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h6}},{DQ_WIDTH/4{4'h9}},
                            {DQ_WIDTH/4{4'hA}},{DQ_WIDTH/4{4'h5}}};
      4'b1010, 4'b1011:
        phy_wrdata <= #TCQ {{DQ_WIDTH/4{4'h0}},{DQ_WIDTH/4{4'h0}},
                            {DQ_WIDTH/4{4'h0}},{DQ_WIDTH/4{4'h0}}};
    endcase
          
  //***************************************************************************
  // Memory control/address
  //***************************************************************************

  // Assert RAS when: (1) Loading MRS, (2) Activating Row, (3) Precharging
  // (4) auto refresh
  always @(posedge clk) begin
    if ((init_state_r == INIT_LOAD_MR) ||
        (init_state_r == INIT_REG_WRITE) ||
        (init_state_r == INIT_WRLVL_START) ||
        (init_state_r == INIT_WRLVL_LOAD_MR) ||
        (init_state_r == INIT_WRLVL_LOAD_MR2) ||
        (init_state_r == INIT_RDLVL_ACT) ||
        (init_state_r == INIT_PD_ACT) ||
        (init_state_r == INIT_PRECHARGE) ||
        (init_state_r == INIT_DDR2_PRECHARGE) ||
        (init_state_r == INIT_REFRESH))begin
      phy_ras_n1 <= #TCQ 1'b0;
      phy_ras_n0 <= #TCQ 1'b0;
    end else begin
      phy_ras_n1 <= #TCQ 1'b1;
      phy_ras_n0 <= #TCQ 1'b1;
    end
  end

  // Assert CAS when: (1) Loading MRS, (2) Issuing Read/Write command
  // (3) auto refresh
  always @(posedge clk) begin
    if ((init_state_r == INIT_LOAD_MR) ||
        (init_state_r == INIT_REG_WRITE) ||
        (init_state_r == INIT_WRLVL_START) ||
        (init_state_r == INIT_WRLVL_LOAD_MR) ||
        (init_state_r == INIT_WRLVL_LOAD_MR2) ||
        (init_state_r == INIT_REFRESH) ||
        (rdlvl_wr_rd && new_burst_r))begin
      phy_cas_n1 <= #TCQ 1'b0;
      phy_cas_n0 <= #TCQ 1'b0;
    end else begin
      phy_cas_n1 <= #TCQ 1'b1;
      phy_cas_n0 <= #TCQ 1'b1;
    end
  end

  // Assert WE when: (1) Loading MRS, (2) Issuing Write command (only
  // occur during read leveling), (3) Issuing ZQ Long Calib command,
  // (4) Precharge
  always @(posedge clk) begin
    if ((init_state_r == INIT_LOAD_MR) ||
        (init_state_r == INIT_REG_WRITE) ||
        (init_state_r == INIT_ZQCL) ||
        (init_state_r == INIT_WRLVL_START) ||
        (init_state_r == INIT_WRLVL_LOAD_MR) ||
        (init_state_r == INIT_WRLVL_LOAD_MR2) ||
        (init_state_r == INIT_PRECHARGE) ||
        (init_state_r == INIT_DDR2_PRECHARGE)||
        (rdlvl_wr && new_burst_r))begin
      phy_we_n1 <= #TCQ 1'b0;
      phy_we_n0 <= #TCQ 1'b0;
    end else begin
      phy_we_n1 <= #TCQ 1'b1;
      phy_we_n0 <= #TCQ 1'b1;
    end
  end


   generate
   genvar rnk_i;
     for (rnk_i = 0; rnk_i < 4; rnk_i = rnk_i + 1) begin: gen_rnk
       always @(posedge clk) begin
         if (rst) begin
           mr2_r[rnk_i]  <= #TCQ 2'b00;
           mr1_r[rnk_i]  <= #TCQ 3'b000;
         end else begin
           mr2_r[rnk_i]  <= #TCQ tmp_mr2_r[rnk_i];
           mr1_r[rnk_i]  <= #TCQ tmp_mr1_r[rnk_i];
         end
       end
     end
   endgenerate

  
  // ODT assignment based on slot config and slot present
  // Assuming CS_WIDTH equals number of ranks configured
  // For single slot systems slot_1_present input will be ignored
  // Assuming component interfaces to be single slot systems
  generate
    if (nSLOTS == 1) begin: gen_single_slot_odt
      always @(posedge clk) begin
        tmp_mr2_r[1]   <= #TCQ 2'b00;
        tmp_mr2_r[2]   <= #TCQ 2'b00;
        tmp_mr2_r[3]   <= #TCQ 2'b00;
        tmp_mr1_r[1]   <= #TCQ 3'b000;
        tmp_mr1_r[2]   <= #TCQ 3'b000;
        tmp_mr1_r[3]   <= #TCQ 3'b000;
        phy_tmp_cs1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
        phy_tmp_odt0_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
        phy_tmp_odt1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
        phy_tmp_odt0_r1 <= #TCQ phy_tmp_odt0_r;
        phy_tmp_odt1_r1 <= #TCQ phy_tmp_odt1_r;
        
        case ({slot_0_present[0],slot_0_present[1],
               slot_0_present[2],slot_0_present[3]})
          // Single slot configuration with quad rank
          // Assuming same behavior as single slot dual rank for now
          // DDR2 does not have quad rank parts 
          4'b1111: begin    
            if ((RTT_WR == "OFF") || 
                ((WRLVL=="ON") && ~wrlvl_done &&
                 (wrlvl_rank_cntr==3'd0))) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM
              tmp_mr1_r[0] <= #TCQ 3'b000;
            end
            phy_tmp_odt0_r[nCS_PER_RANK-1:0] <= #TCQ {nCS_PER_RANK{1'b1}};
            phy_tmp_odt1_r[nCS_PER_RANK-1:0] <= #TCQ {nCS_PER_RANK{1'b1}};
            // Chip Select assignments
            phy_tmp_cs1_r[((chip_cnt_r*nCS_PER_RANK)
                           ) +: nCS_PER_RANK] <= #TCQ 'b0;
          end 
        
          // Single slot configuration with single rank
          4'b1000: begin    
            phy_tmp_odt0_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
            phy_tmp_odt1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
            if ((REG_CTRL == "ON") && (nCS_PER_RANK > 1)) begin
              phy_tmp_cs1_r[chip_cnt_r] <= #TCQ 1'b0;
            end else begin
              phy_tmp_cs1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
            end
            if ((RTT_WR == "OFF") || 
                ((WRLVL=="ON") && ~wrlvl_done)) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM
              tmp_mr1_r[0] <= #TCQ 3'b000;
            end
          end 
          
          // Single slot configuration with dual rank
          4'b1100: begin
            phy_tmp_odt0_r[nCS_PER_RANK-1:0] <= #TCQ {nCS_PER_RANK{1'b1}};
            phy_tmp_odt1_r[nCS_PER_RANK-1:0] <= #TCQ {nCS_PER_RANK{1'b1}};
            // Chip Select assignments            
            phy_tmp_cs1_r[((chip_cnt_r*nCS_PER_RANK)
                           ) +: nCS_PER_RANK] <= #TCQ 'b0;
            if ((RTT_WR == "OFF") || 
                ((WRLVL=="ON") && ~wrlvl_done &&
                 (wrlvl_rank_cntr==3'd0))) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM
              tmp_mr1_r[0] <= #TCQ 3'b000;
            end
          end 
          
          default: begin    
            phy_tmp_odt0_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
            phy_tmp_odt1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
            phy_tmp_cs1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
            if ((RTT_WR == "OFF") || 
                ((WRLVL=="ON") && ~wrlvl_done)) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM
              tmp_mr1_r[0] <= #TCQ 3'b000;
            end
          end       
        endcase
      end
    end else if (nSLOTS == 2) begin: gen_dual_slot_odt
      always @ (posedge clk) begin
        tmp_mr2_r[1]   <= #TCQ 2'b00;
        tmp_mr2_r[2]   <= #TCQ 2'b00;
        tmp_mr2_r[3]   <= #TCQ 2'b00;
        tmp_mr1_r[1]   <= #TCQ 3'b000;
        tmp_mr1_r[2]   <= #TCQ 3'b000;
        tmp_mr1_r[3]   <= #TCQ 3'b000;
        phy_tmp_odt0_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
        phy_tmp_odt1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
        phy_tmp_cs1_r <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b1}};
        phy_tmp_odt0_r1 <= #TCQ phy_tmp_odt0_r;
        phy_tmp_odt1_r1 <= #TCQ phy_tmp_odt1_r;
        
        case ({slot_0_present[0],slot_0_present[1],
               slot_1_present[0],slot_1_present[1]})       
          // Two slot configuration, one slot present, single rank
          4'b10_00: begin
            if (wrlvl_odt || (init_state_r == INIT_IOCONFIG_WR_WAIT) ||
                (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                (init_state_r == INIT_RDLVL_CLKDIV_WRITE)) begin
              // odt turned on only during write 
              phy_tmp_odt0_r <= #TCQ {nCS_PER_RANK{1'b1}};
              phy_tmp_odt1_r <= #TCQ {nCS_PER_RANK{1'b1}};
            end
            phy_tmp_cs1_r <= #TCQ {nCS_PER_RANK{1'b0}};
            if ((RTT_WR == "OFF") || 
                ((WRLVL=="ON") && ~wrlvl_done)) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM
              tmp_mr1_r[0] <= #TCQ 3'b000;
            end
          end
          4'b00_10: begin          
            //Rank1 ODT enabled
            if (wrlvl_odt || (init_state_r == INIT_IOCONFIG_WR_WAIT) ||
                (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                (init_state_r == INIT_RDLVL_CLKDIV_WRITE)) begin
              // odt turned on only during write
              phy_tmp_odt0_r <= #TCQ {nCS_PER_RANK{1'b1}};
              phy_tmp_odt1_r <= #TCQ {nCS_PER_RANK{1'b1}};                   
            end
            phy_tmp_cs1_r <= #TCQ {nCS_PER_RANK{1'b0}};
            if ((RTT_WR == "OFF") || 
                ((WRLVL=="ON") && ~wrlvl_done)) begin
              //Rank1 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank1 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank1 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank1 Rtt_NOM
              tmp_mr1_r[0] <= #TCQ 3'b000;
            end
          end
          // Two slot configuration, one slot present, dual rank
          4'b00_11: begin
            if (wrlvl_odt || (init_state_r == INIT_IOCONFIG_WR_WAIT) ||
                (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                (init_state_r == INIT_RDLVL_CLKDIV_WRITE)) begin
              // odt turned on only during write
              phy_tmp_odt0_r[nCS_PER_RANK-1:0]  
                <= #TCQ {nCS_PER_RANK{1'b1}};
              phy_tmp_odt1_r[nCS_PER_RANK-1:0]  
                <= #TCQ {nCS_PER_RANK{1'b1}};
            end         
            // Chip Select assignments
            phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
              <= #TCQ {nCS_PER_RANK{1'b0}};
            if ((RTT_WR == "OFF") ||
                ((WRLVL=="ON") && ~wrlvl_done &&
                 (wrlvl_rank_cntr==3'd0))) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM
              tmp_mr1_r[0] <= #TCQ 3'b000;
            end
          end
          4'b11_00: begin
            if (wrlvl_odt || (init_state_r == INIT_IOCONFIG_WR_WAIT) ||
                (init_state_r == INIT_RDLVL_STG1_WRITE) || 
                (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                (init_state_r == INIT_RDLVL_CLKDIV_WRITE)) begin    
              // odt turned on only during write
              phy_tmp_odt0_r[nCS_PER_RANK-1] <= #TCQ {nCS_PER_RANK{1'b1}};
              phy_tmp_odt1_r[nCS_PER_RANK-1] <= #TCQ {nCS_PER_RANK{1'b1}};
            end          
            // Chip Select assignments
            phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
              <= #TCQ {nCS_PER_RANK{1'b0}};
            if ((RTT_WR == "OFF") ||
                ((WRLVL=="ON") && ~wrlvl_done &&
                 (wrlvl_rank_cntr==3'd0))) begin
              //Rank1 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank1 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank1 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank1 Rtt_NOM
              tmp_mr1_r[0] <= #TCQ 3'b000;
            end
          end
          // Two slot configuration, one rank per slot
          4'b10_10: begin
            if (DRAM_TYPE == "DDR2")begin
              if (chip_cnt_r == 2'b00)begin
                phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b0}};
                phy_tmp_odt0_r[(1*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b0}};
                phy_tmp_odt1_r[(1*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b1}};
              end else begin
                phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt0_r[(1*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b0}};
                phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt1_r[(1*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b0}};
              end
            end else begin                       
              if (wrlvl_odt || (init_state_r == INIT_IOCONFIG_WR_WAIT) ||
                  (init_state_r == INIT_RDLVL_STG1_WRITE) || 
                  (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                  (init_state_r == INIT_RDLVL_CLKDIV_WRITE)) begin
                phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt0_r[(1*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt1_r[(1*nCS_PER_RANK) +: nCS_PER_RANK]
                  <= #TCQ {nCS_PER_RANK{1'b1}};
              end else if ((init_state_r == INIT_IOCONFIG_RD_WAIT) ||
                           (init_state_r == INIT_RDLVL_STG1_READ) || 
                           (init_state_r == INIT_RDLVL_STG2_READ) ||
                           (init_state_r == INIT_RDLVL_CLKDIV_READ)) begin
                if (chip_cnt_r == 2'b00) begin
                  phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK]
                    <= #TCQ {nCS_PER_RANK{1'b0}};
                  phy_tmp_odt0_r[(1*nCS_PER_RANK) +: nCS_PER_RANK]
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK]
                    <= #TCQ {nCS_PER_RANK{1'b0}};
                  phy_tmp_odt1_r[(1*nCS_PER_RANK) +: nCS_PER_RANK]
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                end else if (chip_cnt_r == 2'b01) begin 
                  phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK]
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt0_r[(1*nCS_PER_RANK) +: nCS_PER_RANK]
                    <= #TCQ {nCS_PER_RANK{1'b0}};
                  phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK]
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(1*nCS_PER_RANK) +: nCS_PER_RANK]
                    <= #TCQ {nCS_PER_RANK{1'b0}};
                end
              end
            end          
            // Chip Select assignments
            phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
              <= #TCQ {nCS_PER_RANK{1'b0}};
            
            if ((RTT_WR == "OFF") ||
                ((WRLVL=="ON") && ~wrlvl_done &&
                 (wrlvl_rank_cntr==3'd0))) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
              //Rank1 Dynamic ODT disabled
              tmp_mr2_r[1] <= #TCQ 2'b00;
              //Rank1 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[1] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM defaults to 40 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "60") ? 3'b001 :
                              (RTT_NOM == "120") ? 3'b010 :
                              (RTT_NOM == "20") ? 3'b100 :
                              (RTT_NOM == "30") ? 3'b101 :
                              3'b011;
              //Rank1 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank1 Rtt_NOM defaults to 40 ohms
              tmp_mr1_r[1] <= #TCQ (RTT_NOM == "60") ? 3'b001 :
                              (RTT_NOM == "120") ? 3'b010 :
                              (RTT_NOM == "20") ? 3'b100 :
                              (RTT_NOM == "30") ? 3'b101 :
                              3'b011;
            end
          end
          // Two Slots - One slot with dual rank and the other with single rank
          4'b10_11: begin         
            //Rank3 Rtt_NOM defaults to 40 ohms
            tmp_mr1_r[2] <= #TCQ (RTT_NOM3 == "60") ? 3'b001 :
                            (RTT_NOM3 == "120") ? 3'b010 :
                            (RTT_NOM3 == "20") ? 3'b100 :
                            (RTT_NOM3 == "30") ? 3'b101 :
                            3'b011;
            tmp_mr2_r[2] <= #TCQ 2'b00;
            if ((RTT_WR == "OFF") ||
                ((WRLVL=="ON") && ~wrlvl_done &&
                 (wrlvl_rank_cntr==3'd0))) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
              //Rank1 Dynamic ODT disabled
              tmp_mr2_r[1] <= #TCQ 2'b00;
              //Rank1 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[1] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM defaults to 40 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "60") ? 3'b001 :
                              (RTT_NOM == "120") ? 3'b010 :
                              (RTT_NOM == "20") ? 3'b100 :
                              (RTT_NOM == "30") ? 3'b101 :
                              3'b011;
              //Rank1 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank1 Rtt_NOM
              tmp_mr1_r[1] <= #TCQ 3'b000;
            end
            //Slot1 Rank1 or Rank3 is being written
            if (DRAM_TYPE == "DDR2")begin
              if (chip_cnt_r == 2'b00)begin
                phy_tmp_odt0_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt1_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
              end else begin
                phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
              end
            end else begin               
              if (wrlvl_odt || (init_state_r == INIT_IOCONFIG_WR_WAIT) ||
                  (init_state_r == INIT_RDLVL_STG1_WRITE) || 
                  (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                  (init_state_r == INIT_RDLVL_CLKDIV_WRITE)) begin
                if (chip_cnt_r[0] == 1'b1) begin
                  phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt0_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  //Slot0 Rank0 is being written
                end else begin
                  phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt0_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                end
              end else if ((init_state_r == INIT_IOCONFIG_RD_WAIT) ||
                           (init_state_r == INIT_RDLVL_STG1_READ) || 
                           (init_state_r == INIT_RDLVL_STG2_READ) ||
                           (init_state_r == INIT_RDLVL_CLKDIV_READ)) begin
                if (chip_cnt_r == 2'b00) begin
                  phy_tmp_odt0_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                end else begin
                  phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                end
              end
            end 
            
            // Chip Select assignments
            phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
              <= #TCQ {nCS_PER_RANK{1'b0}};             
          end
          // Two Slots - One slot with dual rank and the other with single rank
          4'b11_10: begin   
            //Rank2 Rtt_NOM defaults to 40 ohms
            tmp_mr1_r[2] <= #TCQ (RTT_NOM2 == "60") ? 3'b001 :
                            (RTT_NOM2 == "120") ? 3'b010 :
                            (RTT_NOM2 == "20") ? 3'b100 :
                            (RTT_NOM2 == "30") ? 3'b101 :
                            3'b011;
            tmp_mr2_r[2] <= #TCQ 2'b00;
            if ((RTT_WR == "OFF") ||
                ((WRLVL=="ON") && ~wrlvl_done &&
                 (wrlvl_rank_cntr==3'd0))) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
              //Rank1 Dynamic ODT disabled
              tmp_mr2_r[1] <= #TCQ 2'b00;
              //Rank1 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[1] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank1 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank1 Rtt_NOM defaults to 40 ohms
              tmp_mr1_r[1] <= #TCQ (RTT_NOM == "60") ? 3'b001 :
                              (RTT_NOM == "120") ? 3'b010 :
                              (RTT_NOM == "20") ? 3'b100 :
                              (RTT_NOM == "30") ? 3'b101 :
                              3'b011;
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM
              tmp_mr1_r[0] <= #TCQ 3'b000;
            end
            
            if (DRAM_TYPE == "DDR2")begin
              if (chip_cnt_r[1] == 1'b1)begin
                phy_tmp_odt0_r[nCS_PER_RANK-1:0] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt1_r[nCS_PER_RANK-1:0] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
              end else begin
                phy_tmp_odt0_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt1_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
              end
            end else begin 
              if (wrlvl_odt || (init_state_r == INIT_IOCONFIG_WR_WAIT) ||
                  (init_state_r == INIT_RDLVL_STG1_WRITE) || 
                  (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                  (init_state_r == INIT_RDLVL_CLKDIV_WRITE)) begin
                if (chip_cnt_r[1] == 1'b1) begin
                  phy_tmp_odt0_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt0_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  
                end else begin
                  phy_tmp_odt0_r[nCS_PER_RANK-1:0] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[nCS_PER_RANK-1:0] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt0_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                end
              end else if ((init_state_r == INIT_IOCONFIG_RD_WAIT) ||
                           (init_state_r == INIT_RDLVL_STG1_READ) ||
                           (init_state_r == INIT_RDLVL_STG2_READ) ||
                           (init_state_r == INIT_RDLVL_CLKDIV_READ)) begin
                if (chip_cnt_r[1] == 1'b1) begin
                  phy_tmp_odt0_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};                  
                end else begin
                  phy_tmp_odt0_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                end
              end
            end
    
            // Chip Select assignments
            phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
              <= #TCQ {nCS_PER_RANK{1'b0}};
          end
          // Two Slots - two ranks per slot
          4'b11_11: begin
            //Rank2 Rtt_NOM defaults to 40 ohms
            tmp_mr1_r[2] <= #TCQ (RTT_NOM2 == "60") ? 3'b001 :
                            (RTT_NOM2 == "120") ? 3'b010 :
                            (RTT_NOM2 == "20") ? 3'b100 :
                            (RTT_NOM2 == "30") ? 3'b101 :
                            3'b011;
            //Rank3 Rtt_NOM defaults to 40 ohms
            tmp_mr1_r[3] <= #TCQ (RTT_NOM3 == "60") ? 3'b001 :
                            (RTT_NOM3 == "120") ? 3'b010 :
                            (RTT_NOM3 == "20") ? 3'b100 :
                            (RTT_NOM3 == "30") ? 3'b101 :
                            3'b011;
            tmp_mr2_r[2] <= #TCQ 2'b00;
            tmp_mr2_r[3] <= #TCQ 2'b00;
            if ((RTT_WR == "OFF") ||
                ((WRLVL=="ON") && ~wrlvl_done &&
                 (wrlvl_rank_cntr==3'd0))) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
              //Rank1 Dynamic ODT disabled
              tmp_mr2_r[1] <= #TCQ 2'b00;
              //Rank1 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[1] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank1 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank1 Rtt_NOM
              tmp_mr1_r[1] <= #TCQ 3'b000;
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM
              tmp_mr1_r[0] <= #TCQ 3'b000;
            end // else: !if((RTT_WR == "OFF") ||...
            
            if(DRAM_TYPE == "DDR2")begin
              if(chip_cnt_r[1] == 1'b1)begin
                phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
              end else begin
                phy_tmp_odt0_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
                phy_tmp_odt1_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                  <= #TCQ {nCS_PER_RANK{1'b1}};
              end
            end else begin
              if (wrlvl_odt || (init_state_r == INIT_IOCONFIG_WR_WAIT) ||
                  (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                  (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                  (init_state_r == INIT_RDLVL_CLKDIV_WRITE)) begin
                //Slot1 Rank1 or Rank3 is being written
                if (chip_cnt_r[0] == 1'b1) begin
                  phy_tmp_odt0_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(1*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt0_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  //Slot0 Rank0 or Rank2 is being written
                end else begin
                  phy_tmp_odt0_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(0*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt0_r[(3*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(3*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                end
              end else if ((init_state_r == INIT_IOCONFIG_RD_WAIT) ||
                           (init_state_r == INIT_RDLVL_STG1_READ) || 
                           (init_state_r == INIT_RDLVL_STG2_READ) ||
                           (init_state_r == INIT_RDLVL_CLKDIV_READ)) begin
                //Slot1 Rank1 or Rank3 is being read
                if (chip_cnt_r[0] == 1'b1) begin
                  phy_tmp_odt0_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(2*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  //Slot0 Rank0 or Rank2 is being read
                end else begin
                  phy_tmp_odt0_r[(3*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                  phy_tmp_odt1_r[(3*nCS_PER_RANK) +: nCS_PER_RANK] 
                    <= #TCQ {nCS_PER_RANK{1'b1}};
                end
              end // if (init_state_r == INIT_IOCONFIG_RD)
            end // else: !if(DRAM_TYPE == "DDR2")
            
            // Chip Select assignments
            phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
              <= #TCQ {nCS_PER_RANK{1'b0}};
          end
          default: begin
            phy_tmp_odt0_r <= #TCQ {nCS_PER_RANK*CS_WIDTH{1'b1}};
            phy_tmp_odt1_r <= #TCQ {nCS_PER_RANK*CS_WIDTH{1'b1}};
            // Chip Select assignments
            phy_tmp_cs1_r[(chip_cnt_r*nCS_PER_RANK) +: nCS_PER_RANK] 
              <= #TCQ {nCS_PER_RANK{1'b0}};
            if ((RTT_WR == "OFF") ||
                ((WRLVL=="ON") && ~wrlvl_done)) begin
              //Rank0 Dynamic ODT disabled
              tmp_mr2_r[0] <= #TCQ 2'b00;
              //Rank0 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
              //Rank1 Dynamic ODT disabled
              tmp_mr2_r[1] <= #TCQ 2'b00;
              //Rank1 Rtt_NOM defaults to 120 ohms
              tmp_mr1_r[1] <= #TCQ (RTT_NOM == "40") ? 3'b011 :
                              (RTT_NOM == "60") ? 3'b001 :
                              3'b010;
            end else begin
              //Rank0 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[0] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank0 Rtt_NOM defaults to 40 ohms
              tmp_mr1_r[0] <= #TCQ (RTT_NOM == "60") ? 3'b001 :
                              (RTT_NOM == "120") ? 3'b010 :
                              (RTT_NOM == "20") ? 3'b100 :
                              (RTT_NOM == "30") ? 3'b101 :
                              3'b011;
              //Rank1 Dynamic ODT defaults to 120 ohms
              tmp_mr2_r[1] <= #TCQ (RTT_WR == "60") ? 2'b01 :
                              2'b10;
              //Rank1 Rtt_NOM defaults to 40 ohms
              tmp_mr1_r[1] <= #TCQ (RTT_NOM == "60") ? 3'b001 :
                              (RTT_NOM == "120") ? 3'b010 :
                              (RTT_NOM == "20") ? 3'b100 :
                              (RTT_NOM == "30") ? 3'b101 :
                              3'b011;
            end
          end
        endcase
      end
    end
  endgenerate


    
  // Assert ODT when: (1) Write Leveling, (2) Issuing Write command
  // Timing of ODT is not particularly precise (i.e. does not turn
  // on right before write data, and turn off immediately after
  // write is finished), but it doesn't have to be
  generate
    if (nSLOTS == 1) begin
      always @(posedge clk)
        if ((((RTT_NOM == "DISABLED") && (RTT_WR == "OFF")) ||
             (wrlvl_done && !wrlvl_done_r)) && (DRAM_TYPE == "DDR3"))begin
          phy_odt0 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
          phy_odt1 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
        end    
        else if  (((DRAM_TYPE == "DDR3") 
                   ||((RTT_NOM != "DISABLED") && (DRAM_TYPE == "DDR2")))
                  && ((wrlvl_odt) ||
                      (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                      (init_state_r == INIT_RDLVL_STG1_WRITE_READ) ||
                      (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                      (init_state_r == INIT_RDLVL_STG2_WRITE_READ) ||
                      (init_state_r == INIT_RDLVL_CLKDIV_WRITE) ||
                      (init_state_r == INIT_RDLVL_CLKDIV_WRITE_READ))) begin
          phy_odt0 <= #TCQ phy_tmp_odt0_r;
          phy_odt1 <= #TCQ phy_tmp_odt1_r;
        end else begin
          phy_odt0 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
          phy_odt1 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
        end
    end else if (nSLOTS == 2) begin
      always @(posedge clk)
        if (((RTT_NOM == "DISABLED") && (RTT_WR == "OFF")) ||
            wrlvl_rank_done || wrlvl_rank_done_r1 ||
            (wrlvl_done && !wrlvl_done_r)) begin
          phy_odt0 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
          phy_odt1 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
        end    
        else if  (((DRAM_TYPE == "DDR3") 
                   ||((RTT_NOM != "DISABLED") && (DRAM_TYPE == "DDR2"))) 
                  && ((wrlvl_odt_r1) || 
                      (init_state_r == INIT_RDLVL_STG1_WRITE) ||
                      (init_state_r == INIT_RDLVL_STG1_WRITE_READ) ||
                      (init_state_r == INIT_RDLVL_STG1_READ) ||
                      (init_state_r == INIT_RDLVL_CLKDIV_WRITE) ||
                      (init_state_r == INIT_RDLVL_CLKDIV_WRITE_READ) ||
                      (init_state_r == INIT_RDLVL_CLKDIV_READ) ||       
                      (init_state_r == INIT_RDLVL_STG2_WRITE) ||
                      (init_state_r == INIT_RDLVL_STG2_WRITE_READ) ||
                      (init_state_r == INIT_RDLVL_STG2_READ) ||
                      (init_state_r == INIT_RDLVL_STG2_READ_WAIT) ||
                      (init_state_r == INIT_PRECHARGE_PREWAIT))) begin
          phy_odt0 <= #TCQ phy_tmp_odt0_r | phy_tmp_odt0_r1;
          phy_odt1 <= #TCQ phy_tmp_odt1_r | phy_tmp_odt1_r1 ;
        end else begin
          phy_odt0 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
          phy_odt1 <= #TCQ {CS_WIDTH*nCS_PER_RANK{1'b0}};
        end
    end
  endgenerate
   
  //*****************************************************************
  // memory address during init
  //*****************************************************************

  always @(burst_addr_r or cnt_init_mr_r or chip_cnt_r
           or ddr2_refresh_flag_r or init_state_r or load_mr0
           or load_mr1 or load_mr2 or load_mr3 or mr1_r[chip_cnt_r][0]
           or mr1_r[chip_cnt_r][1] or mr1_r[chip_cnt_r][2] or mr2_r[chip_cnt_r]
           or rdlvl_done or rdlvl_wr_rd or reg_ctrl_cnt_r)begin
    // Bus 0 for address/bank never used
    address_w = 'b0;
    bank_w   = 'b0;
    if ((init_state_r == INIT_PRECHARGE) ||
        (init_state_r == INIT_ZQCL) ||
        (init_state_r == INIT_DDR2_PRECHARGE)) begin
      // Set A10=1 for ZQ long calibration or Precharge All
      address_w     = 'b0;
      address_w[10] = 1'b1;
      bank_w        = 'b0;
    end else if (init_state_r == INIT_WRLVL_START) begin
      // Enable wrlvl in MR1
      bank_w[1:0]   = 2'b01;
      address_w     = load_mr1[ROW_WIDTH-1:0];
      address_w[7]  = 1'b1;
    end else if (init_state_r == INIT_WRLVL_LOAD_MR) begin
      // Finished with write leveling, disable wrlvl in MR1
      // For single rank disable Rtt_Nom
      bank_w[1:0]   = 2'b01;
      address_w     = load_mr1[ROW_WIDTH-1:0];
      address_w[2]  = mr1_r[chip_cnt_r][0];
      address_w[6]  = mr1_r[chip_cnt_r][1];
      address_w[9]  = mr1_r[chip_cnt_r][2];
    end else if (init_state_r == INIT_WRLVL_LOAD_MR2) begin
      // Set RTT_WR in MR2 after write leveling disabled
      bank_w[1:0]     = 2'b10;
      address_w       = load_mr2[ROW_WIDTH-1:0];
      address_w[10:9] = mr2_r[chip_cnt_r];
    end else if ((init_state_r == INIT_REG_WRITE)&
             (DRAM_TYPE == "DDR3"))begin
      // bank_w is assigned a 3 bit value. In some
      // DDR2 cases there will be only two bank bits.
      //Qualifying the condition with DDR3
      bank_w        = 'b0;
      address_w     = 'b0;
      case (reg_ctrl_cnt_r)
        REG_RC0[2:0]: address_w[4:0] = REG_RC0[4:0];
        REG_RC1[2:0]:begin
          address_w[4:0] = REG_RC1[4:0];
          bank_w         = REG_RC1[7:5];
        end
        REG_RC2[2:0]: address_w[4:0] = REG_RC2[4:0];
        REG_RC3[2:0]: address_w[4:0] = REG_RC3[4:0];
        REG_RC4[2:0]: address_w[4:0] = REG_RC4[4:0];
        REG_RC5[2:0]: address_w[4:0] = REG_RC5[4:0];
      endcase
    end else if (init_state_r == INIT_LOAD_MR) begin
      // If loading mode register, look at cnt_init_mr to determine
      // which MR is currently being programmed
      address_w     = 'b0;
      bank_w        = 'b0;
      if(DRAM_TYPE == "DDR3")begin
        if(&rdlvl_done)begin
          // end of the calibration programming correct
          // burst length
          bank_w[1:0] = 2'b00;
          address_w   = load_mr0[ROW_WIDTH-1:0];
          address_w[8]= 1'b0; //Don't reset DLL
        end else begin
         case (cnt_init_mr_r)
           INIT_CNT_MR2: begin
             bank_w[1:0] = 2'b10;
             address_w   = load_mr2[ROW_WIDTH-1:0];
             address_w[10:9] = mr2_r[chip_cnt_r];
           end
           INIT_CNT_MR3: begin
             bank_w[1:0] = 2'b11;
             address_w   = load_mr3[ROW_WIDTH-1:0];
           end
           INIT_CNT_MR1: begin
             bank_w[1:0] = 2'b01;
             address_w   = load_mr1[ROW_WIDTH-1:0];
             address_w[2] = mr1_r[chip_cnt_r][0];
             address_w[6] = mr1_r[chip_cnt_r][1];
             address_w[9] = mr1_r[chip_cnt_r][2];
           end
           INIT_CNT_MR0: begin
             bank_w[1:0] = 2'b00;
             address_w   = load_mr0[ROW_WIDTH-1:0];
             // fixing it to BL8 for calibration
             address_w[1:0] = 2'b00;
           end
           default: begin
             bank_w      = {BANK_WIDTH{1'bx}};
             address_w   = {ROW_WIDTH{1'bx}};
           end
          endcase // case(cnt_init_mr_r)
         end // else: !if(&rdlvl_done)
        end else begin // DDR2
         case (cnt_init_mr_r)
           INIT_CNT_MR2: begin
             if(~ddr2_refresh_flag_r)begin
                bank_w[1:0] = 2'b10;
                address_w   = load_mr2[ROW_WIDTH-1:0];
             end else begin // second set of lm commands
                bank_w[1:0] = 2'b00;
                address_w   = load_mr0[ROW_WIDTH-1:0];
                address_w[8]= 1'b0;
                //MRS command without resetting DLL
             end
          end
           INIT_CNT_MR3: begin
             if(~ddr2_refresh_flag_r)begin
               bank_w[1:0] = 2'b11;
               address_w   = load_mr3[ROW_WIDTH-1:0];
             end else begin // second set of lm commands
               bank_w[1:0] = 2'b00;
               address_w   = load_mr0[ROW_WIDTH-1:0];
               address_w[8]= 1'b0;
               //MRS command without resetting DLL. Repeted again
               // because there is an extra state.
            end
           end
           INIT_CNT_MR1: begin
             bank_w[1:0] = 2'b01;            
             if(~ddr2_refresh_flag_r)begin               
               address_w   = load_mr1[ROW_WIDTH-1:0];  
             end else begin // second set of lm commands
               address_w   = load_mr1[ROW_WIDTH-1:0];
               address_w[9:7] = 3'b111;
               //OCD default state
             end
           end
           INIT_CNT_MR0: begin
             if(~ddr2_refresh_flag_r)begin
               bank_w[1:0] = 2'b00;
               address_w   = load_mr0[ROW_WIDTH-1:0];
             end else begin // second set of lm commands
               bank_w[1:0] = 2'b01;
               address_w   = load_mr1[ROW_WIDTH-1:0];
               if((chip_cnt_r == 2'd1) || (chip_cnt_r == 2'd3))begin
               // always disable odt for rank 1 and rank 3 as per SPEC
                 address_w[2] = 'b0;
                 address_w[6] = 'b0;
               end 
                //OCD exit
             end
           end
           default: begin
             bank_w      = {BANK_WIDTH{1'bx}};
             address_w   = {ROW_WIDTH{1'bx}};
           end
         endcase // case(cnt_init_mr_r)
       end
    end else if (rdlvl_wr_rd) begin
      // when writing or reading back training pattern for read leveling
      // need to support both burst length of 4 or 8. This may mean issuing
      // multiple commands to cover the entire range of addresses accessed
      // during read leveling.
      // Hard coding A[12] to 1 so that it will always be burst length of 8
      // for DDR3. Does not have any effect on DDR2. 
      bank_w    = CALIB_BA_ADD[BANK_WIDTH-1:0];
      address_w[ROW_WIDTH-1:COL_WIDTH] = {ROW_WIDTH-COL_WIDTH{1'b0}};
      address_w[COL_WIDTH-1:0] = 
                {CALIB_COL_ADD[COL_WIDTH-1:4],burst_addr_r, 2'b00};
      address_w[12]            =  1'b1;
    end else if ((init_state_r == INIT_RDLVL_ACT) ||
                 (init_state_r == INIT_PD_ACT)) begin

      bank_w    = CALIB_BA_ADD[BANK_WIDTH-1:0];
      address_w = CALIB_ROW_ADD[ROW_WIDTH-1:0];
    end else begin
      bank_w    = {BANK_WIDTH{1'bx}};
      address_w = {ROW_WIDTH{1'bx}};
    end
  end      

  // registring before sending out
  always @(posedge clk) begin
     phy_bank0     <= #TCQ bank_w;
     phy_address0  <= #TCQ address_w;
     phy_bank1     <= #TCQ bank_w;
     phy_address1  <= #TCQ address_w;
  end
        
endmodule
