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
// \   \   \/     Version: 3.4
//  \   \         Application: MIG
//  /   /         Filename: phy_control_io.v
// /___/   /\     Date Last Modified: $Date: 2010/03/17 22:18:47 $
// \   \  /  \    Date Created: Mon Jun 23 2008
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//  Instantiates IOB blocks for output-only control/address signals to DRAM
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_control_io.v,v 1.6.4.1 2010/03/17 22:18:47 mgeorge Exp $
**$Date: 2010/03/17 22:18:47 $
**$Author: mgeorge $
**$Revision: 1.6.4.1 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_control_io.v,v $
******************************************************************************/

`timescale 1ps/1ps


module phy_control_io #
  (
   parameter TCQ          = 100,     // clk->out delay (sim only)
   parameter BANK_WIDTH   = 2,       // # of bank bits
   parameter RANK_WIDTH   = 1,       // log2(CS_WIDTH)
   parameter nCS_PER_RANK = 1,       // # of unique CS outputs per rank
   parameter CS_WIDTH     = 1,       // # of DRAM ranks
   parameter CKE_WIDTH    = 1,       // # of cke outputs 
   parameter ROW_WIDTH    = 14,      // DRAM address bus width
   parameter WRLVL        = "OFF",   // Enable write leveling
   parameter nCWL         = 5,       // Write Latency
   parameter DRAM_TYPE    = "DDR3",  // Memory I/F type: "DDR3", "DDR2"
   parameter REG_CTRL     = "ON",    // "ON" for registered DIMM
   parameter REFCLK_FREQ  = 300.0,   // IODELAY Reference Clock freq (MHz)
   parameter IODELAY_HP_MODE = "ON",   // IODELAY High Performance Mode
   parameter IODELAY_GRP     = "IODELAY_MIG"  // May be assigned unique name
                                              // when mult IP cores in design
   )
  (
   input                   clk_mem,        // full rate core clock
   input                   clk,            // half rate core clock
   input                   rst,            // half rate core clk reset
   input                   mc_data_sel,    // =1 for MC control, =0 for PHY
   // DFI address/control
   input [ROW_WIDTH-1:0]              dfi_address0,
   input [ROW_WIDTH-1:0]              dfi_address1,
   input [BANK_WIDTH-1:0]             dfi_bank0,
   input [BANK_WIDTH-1:0]             dfi_bank1,
   input                              dfi_cas_n0,
   input                              dfi_cas_n1,
   input [CKE_WIDTH-1:0]              dfi_cke0,
   input [CKE_WIDTH-1:0]              dfi_cke1,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  dfi_cs_n0,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  dfi_cs_n1,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  dfi_odt0,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  dfi_odt1,
   input                              dfi_ras_n0,
   input                              dfi_ras_n1,
   input                              dfi_reset_n,
   input                              dfi_we_n0,
   input                              dfi_we_n1,
   // PHY address/control
   input [ROW_WIDTH-1:0]              phy_address0,
   input [ROW_WIDTH-1:0]              phy_address1,
   input [BANK_WIDTH-1:0]             phy_bank0,
   input [BANK_WIDTH-1:0]             phy_bank1,
   input                              phy_cas_n0,
   input                              phy_cas_n1,
   input [CKE_WIDTH-1:0]              phy_cke0,
   input [CKE_WIDTH-1:0]              phy_cke1,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  phy_cs_n0,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  phy_cs_n1,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  phy_odt0,
   input [CS_WIDTH*nCS_PER_RANK-1:0]  phy_odt1,
   input                              phy_ras_n0,
   input                              phy_ras_n1,
   input                              phy_reset_n,
   input                              phy_we_n0,
   input                              phy_we_n1,
   // DDR3-side address/control
   output [ROW_WIDTH-1:0]             ddr_addr,
   output [BANK_WIDTH-1:0]            ddr_ba,
   output                             ddr_ras_n,
   output                             ddr_cas_n,
   output                             ddr_we_n,
   output [CKE_WIDTH-1:0]             ddr_cke,
   output [CS_WIDTH*nCS_PER_RANK-1:0] ddr_cs_n,
   output [CS_WIDTH*nCS_PER_RANK-1:0] ddr_odt,
   output                             ddr_parity,
   output                             ddr_reset_n
   );

  // Set performance mode for IODELAY (power vs. performance tradeoff)
  // COMMENTED, 022009, RICHC. This is temporary pending IR 509123
  localparam HIGH_PERFORMANCE_MODE
             = (IODELAY_HP_MODE == "OFF") ? "FALSE" :
             ((IODELAY_HP_MODE == "ON")  ? "TRUE" : "ILLEGAL");

  // local parameter for the single rank DDR3 dimm case. This parameter will be
  // set when the number of chip selects is == 2 for a single rank registered 
  // dimm.
  localparam SINGLE_RANK_CS_REG 
             = ((REG_CTRL == "ON") && (DRAM_TYPE == "DDR3")
                && (CS_WIDTH  == 1) && (nCS_PER_RANK == 2));

  wire [ROW_WIDTH-1:0]             mux_addr0;
  wire [ROW_WIDTH-1:0]             mux_addr1;
  wire [BANK_WIDTH-1:0]            mux_ba0;
  wire [BANK_WIDTH-1:0]            mux_ba1;
  wire                             mux_cas_n0;
  wire                             mux_cas_n1;
  wire [CKE_WIDTH-1:0]             mux_cke0;
  wire [CKE_WIDTH-1:0]             mux_cke1;
  reg  [CS_WIDTH*nCS_PER_RANK-1:0] mux_cs_n0;
  reg  [CS_WIDTH*nCS_PER_RANK-1:0] mux_cs_n1;
  reg [0:0]                        mux_ioconfig;
  reg                              mux_ioconfig_en;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] mux_odt0;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] mux_odt1;
  wire                             mux_ras_n0;
  wire                             mux_ras_n1;
  wire                             mux_reset_n;
  wire                             mux_we_n0;
  wire                             mux_we_n1;
  wire                             oce_temp;  
  reg                              parity0;
  reg                              parity1;
  reg [3:0]                        rst_delayed;

  wire [ROW_WIDTH-1:0]             addr_odelay;
  wire [ROW_WIDTH-1:0]             addr_oq;
  wire [BANK_WIDTH-1:0]            ba_odelay;
  wire [BANK_WIDTH-1:0]            ba_oq;
  wire                             cas_n_odelay;
  wire                             cas_n_oq;
  wire [CKE_WIDTH-1:0]             cke_odelay;
  wire [CKE_WIDTH-1:0]             cke_oq;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] cs_n_odelay;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] cs_n_oq;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] odt_odelay;
  wire [CS_WIDTH*nCS_PER_RANK-1:0] odt_oq;
  wire                             parity_odelay;  
  wire                             parity_oq;  
  wire                             ras_n_odelay;
  wire                             ras_n_oq;
  wire                             rst_cke_odt;  
  reg                              rst_r;
  reg                              oce_hack_r;
  reg                              oce_hack_r1;
  reg                              oce_hack_r2;
  reg                              oce_hack_r3;
  reg                              oce_hack_r4;
  reg                              oce_hack_r5
                                   /* synthesis syn_keep = 1 */;
  wire                             we_n_odelay;
  wire                             we_n_oq;

  // XST attributes for local reset tree RST_R - prohibit equivalent 
  // register removal on RST_R to prevent "sharing" w/ other local reset trees
  // synthesis attribute shreg_extract of rst_r is "no";  
  // synthesis attribute equivalent_register_removal of rst_r is "no"

  //***************************************************************************
  // Reset pipelining - register reset signals to prevent large (and long)
  // fanouts during physical compilation of the design. Create one local reset
  // for most control/address OSERDES blocks - note that user may need to 
  // change this if control/address are more "spread out" through FPGA
  //***************************************************************************

  always @(posedge clk)
    rst_r <= #TCQ rst;
  
  //***************************************************************************
  // Generate delayed version of global reset. 
  //***************************************************************************
    
  always @(posedge clk) begin
    rst_delayed[0] <= #TCQ rst; 
    rst_delayed[1] <= #TCQ rst_delayed[0];
    rst_delayed[2] <= #TCQ rst_delayed[1];
    rst_delayed[3] <= #TCQ rst_delayed[2];
  end

  // Drive ODT and CKE OSERDES with these resets in order to ensure that 
  // they remain low until after DDR_RESET_N is deasserted. This is done for
  // simulation reasons only, as some memory models will issue an error if
  // ODT/CKE are asserted prior to deassertion of RESET_N
  assign rst_cke_odt = rst_delayed[3];  
  
  //***************************************************************************

  // The following logic is only required to support DDR2 simulation, and is
  // done to prevent glitching on the ODT and CKE signals after "power-up".
  // Certain models will flag glitches on these lines as errors. 
  // To fix this, the OCE for OSERDES is used to prevent glitches. However, 
  // this may lead to setup time issues when running this design through
  // ISE - because the OCE setup is w/r/t to CLK (i.e. the "fast" clock).
  // It can be problematic to meet timing - therefore this path should be
  // marked as a false path (TIG) because it will be asserted long before
  // the OSERDES outputs need to be valid. This logic is disabled for the
  // DDR3 case because it is not required
  // LOGIC DESCRIPTION: 
  // Generating OCE for DDR2 ODT & CKE. The output of the OSERDES model toggles
  // when it comes out of reset. This causes issues in simulation. Controlling 
  // it OCE until there is a library fix. OCE will be asserted after 10 clks 
  // after reset de-assertion

  always @(posedge clk) begin
    oce_hack_r  <= #TCQ ~rst_delayed[3];
    oce_hack_r1 <= #TCQ oce_hack_r;
    oce_hack_r2 <= #TCQ oce_hack_r1;
    oce_hack_r3 <= #TCQ oce_hack_r2;
    oce_hack_r4 <= #TCQ oce_hack_r3;
    oce_hack_r5 <= #TCQ oce_hack_r4;
  end

  // Only use for DDR2. For DDR3, drive to constant high
  assign oce_temp = (DRAM_TYPE == "DDR2") ? oce_hack_r5 : 1'b1;
  
  //***************************************************************************
  // MUX to choose from either PHY or controller for DRAM control
  // NOTE: May need to add pipeline register to meet timing
  //***************************************************************************
  
  assign mux_addr0  = (mc_data_sel) ? dfi_address0 : phy_address0;
  assign mux_addr1  = (mc_data_sel) ? dfi_address1 : phy_address1;
  assign mux_ba0    = (mc_data_sel) ? dfi_bank0 : phy_bank0;
  assign mux_ba1    = (mc_data_sel) ? dfi_bank1 : phy_bank1;
  assign mux_cas_n0 = (mc_data_sel) ? dfi_cas_n0 : phy_cas_n0;
  assign mux_cas_n1 = (mc_data_sel) ? dfi_cas_n1 : phy_cas_n1;
  assign mux_cke0   = (mc_data_sel) ? dfi_cke0 : phy_cke0;
  assign mux_cke1   = (mc_data_sel) ? dfi_cke1 : phy_cke1;
  assign mux_odt0   = (mc_data_sel) ? dfi_odt0 : phy_odt0;
  assign mux_odt1   = (mc_data_sel) ? dfi_odt1 : phy_odt1;
  assign mux_ras_n0 = (mc_data_sel) ? dfi_ras_n0 : phy_ras_n0;
  assign mux_ras_n1 = (mc_data_sel) ? dfi_ras_n1 : phy_ras_n1;
  assign mux_reset_n= (mc_data_sel) ? dfi_reset_n : phy_reset_n;
  assign mux_we_n0  = (mc_data_sel) ? dfi_we_n0 : phy_we_n0;
  assign mux_we_n1  = (mc_data_sel) ? dfi_we_n1 : phy_we_n1;

  //***************************************************************************
  // assigning chip select values.
  // For DDR3 Registered dimm's the chip select pins are toggled in a unique 
  // way to differentiate between register programming and regular DIMM access.
  // For a single rank registered dimm with two chip selects the chip select 
  // will be toggled in the following manner:
  // cs[0] =0, cs[1] = 0 the access is to the registered chip. On the 
  // remaining combinations the access is to the DIMM. The SINGLE_RANK_CS_REG 
  // parameter will be set for the above configurations and the chip select 
  // pins will be toggled as per the DDR3 registered DIMM requirements. The 
  // phy takes care of the register programming, and handles the chip 
  // select's correctly for calibration and initialization. But the controller
  // does not know about this mode, the controller cs[1] bits will be tied to 
  // 1'b1; All the controller access will be to the DIMM and none to the 
  // register chip. Rest of the DDR3 register dimm configurations are 
  // handled well by the controller.
  //***************************************************************************

  generate
    if (SINGLE_RANK_CS_REG) begin: gen_single_rank
      always @(mc_data_sel or dfi_cs_n0[0] or dfi_cs_n1[0] or
               phy_cs_n0[0] or phy_cs_n1[0] or
               phy_cs_n0[1] or phy_cs_n1[1])begin
        if (mc_data_sel) begin
          mux_cs_n0[0] = dfi_cs_n0[0];
          mux_cs_n1[0] = dfi_cs_n1[0];
          mux_cs_n0[1] = 1'b1;
          mux_cs_n1[1] = 1'b1;
        end else begin
          mux_cs_n0[0] = phy_cs_n0[0];
          mux_cs_n1[0] = phy_cs_n1[0];
          mux_cs_n0[1] = phy_cs_n0[1];
          mux_cs_n1[1] = phy_cs_n1[1];
        end
      end
    end else begin: gen_mult_rank
      always @(mc_data_sel or dfi_cs_n0 or dfi_cs_n1 or
               phy_cs_n0 or phy_cs_n1) begin
        if (mc_data_sel)begin
          mux_cs_n0 = dfi_cs_n0;
          mux_cs_n1 = dfi_cs_n1;
        end else begin
          mux_cs_n0 = phy_cs_n0;
          mux_cs_n1 = phy_cs_n1;
        end
      end
    end
  endgenerate

  // parity for reg dimm. Have to check the timing impact.
  // Generate only for DDR3 RDIMM. 
  generate
    if ((DRAM_TYPE == "DDR3") && (REG_CTRL == "ON")) begin: gen_ddr3_parity
      always @(posedge clk) begin
        parity0 <= #TCQ(^{mux_addr0, mux_ba0, mux_cas_n0, 
                          mux_ras_n0, mux_we_n0});
        parity1 <= #TCQ(^{mux_addr1, mux_ba1, mux_cas_n1, 
                          mux_ras_n1, mux_we_n1});
      end
    end else begin: gen_ddr3_noparity
      always @(posedge clk) begin
        parity0 <= #TCQ 1'b0;
        parity1 <= #TCQ 1'b0;
      end
    end
  endgenerate
     
  //*****************************************************************
  // DDR3 reset: Note that this output is generated with an ODDR clocked
  // by the internal div-by-2 clock. It can be generated using the same
  // OSERDES structure as for the other control/address signals. However
  // there are no specific setup/hold requirements on reset_n w/r/t CK.
  // In addition, this an ODDR was used to prevent any glitching on reset_n
  // during startup. This was done for simulation considerations only -
  // the glitch causes warnings with the Denali DDR3 model (but will not
  // cause any issues in hardware).
  //*****************************************************************

  ODDR #
    (
     .DDR_CLK_EDGE ("SAME_EDGE"),
     .INIT         (1'b0),
     .SRTYPE       ("ASYNC")
     )
    u_out_reset_n
      (
       .Q  (ddr_reset_n),
       .C  (clk),
       .CE (1'b1),
       .D1 (mux_reset_n),
       .D2 (mux_reset_n),
       .R  (rst_r),
       .S  (1'b0)
       );

  //*****************************************************************
  // Note on generation of Control/Address signals - there are
  // several possible configurations that affect the configuration
  // of the OSERDES and possible ODELAY for each output (this will
  // also affect the CK/CK# outputs as well
  //   1. DDR3, write-leveling: This is the simplest case. Use
  //      OSERDES without the ODELAY. Initially clock/control/address
  //      will be offset coming out of FPGA from DQ/DQS, but DQ/DQS
  //      will be adjusted so that DQS-CK alignment is established
  //   2. DDR2 or DDR3 (no write-leveling): Both DQS and DQ will use 
  //      ODELAY to delay output of OSERDES. To match this, 
  //      CK/control/address must also delay their outputs using ODELAY 
  //      (with delay = 0)
  //*****************************************************************

  //*****************************************************************
  // RAS: = 1 at reset
  //*****************************************************************

  generate
    if ((DRAM_TYPE == "DDR3") && (WRLVL == "ON")) begin: gen_ras_n_wrlvl

      //*******************************************************
      // CASE1: DDR3, write-leveling
      //*******************************************************
      
      assign ddr_ras_n = ras_n_oq;

    end else begin: gen_ras_n_nowrlvl      
      
      //*******************************************************
      // CASE2: DDR3, no write-leveling
      //*******************************************************
        
      assign ddr_ras_n = ras_n_oq;

      (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
        (
         .CINVCTRL_SEL          ("FALSE"),
         .DELAY_SRC             ("O"),
         .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
         .IDELAY_TYPE           ("FIXED"), 
         .IDELAY_VALUE          (0),       
         .ODELAY_TYPE           ("FIXED"),
         .ODELAY_VALUE          (0),
         .REFCLK_FREQUENCY      (REFCLK_FREQ),
         .SIGNAL_PATTERN        ("DATA")
         )
        u_iodelay_ras_n
          (
           .DATAOUT     (ras_n_odelay),
           .C           (1'b0),
           .CE          (1'b0),
           .DATAIN      (),
           .IDATAIN     (),
           .INC         (1'b0),
           .ODATAIN     (ras_n_oq),
           .RST         (1'b0),
           .T           (),
           .CNTVALUEIN  (),
           .CNTVALUEOUT (),
           .CLKIN       (),
           .CINVCTRL    (1'b0)
           ); 
    end
  endgenerate 
  
  OSERDESE1 #
    (
     .DATA_RATE_OQ   ("DDR"),
     .DATA_RATE_TQ   ("DDR"),
     .DATA_WIDTH     (4),
     .DDR3_DATA      (0),    
     .INIT_OQ        (1'b1), // 1 at reset
     .INIT_TQ        (1'b0),
     .INTERFACE_TYPE ("DEFAULT"),
     .ODELAY_USED    (0),
     .SERDES_MODE    ("MASTER"),
     .SRVAL_OQ       (1'b0),
     .SRVAL_TQ       (1'b0),
     .TRISTATE_WIDTH (4)
     )
    u_out_ras_n
      (
       .OCBEXTEND    (),
       .OFB          (),
       .OQ           (ras_n_oq),
       .SHIFTOUT1    (),
       .SHIFTOUT2    (),
       .TQ           (),
       .CLK          (clk_mem),
       .CLKDIV       (clk),
       .CLKPERF      (),       
       .CLKPERFDELAY (),
       .D1           (mux_ras_n0),
       .D2           (mux_ras_n0),
       .D3           (mux_ras_n1),
       .D4           (mux_ras_n1),
       .D5           (),
       .D6           (),
       .ODV          (1'b0),
       .OCE          (1'b1),
       // Connect SHIFTIN1, SHIFTIN2 to 0 for simulation purposes
       // ensures that ras_n output is not X on reset de-assertion
       .SHIFTIN1     (1'b0),
       .SHIFTIN2     (1'b0),
       .RST          (rst_r),
       .T1           (1'b0),
       .T2           (1'b0),
       .T3           (1'b0),
       .T4           (1'b0),
       .TFB          (),
       .TCE          (1'b1),
       .WC           (1'b0)       
       );

  //*****************************************************************
  // CAS: = 1 at reset
  //*****************************************************************

  generate
    if ((DRAM_TYPE == "DDR3") && (WRLVL == "ON")) begin: gen_cas_n_wrlvl      

      assign ddr_cas_n = cas_n_oq;

    end else begin: gen_cas_n_nowrlvl            

      assign ddr_cas_n = cas_n_odelay;
      
      (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
        (
         .CINVCTRL_SEL          ("FALSE"),
         .DELAY_SRC             ("O"),
         .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
         .IDELAY_TYPE           ("FIXED"), 
         .IDELAY_VALUE          (0),       
         .ODELAY_TYPE           ("FIXED"),
         .ODELAY_VALUE          (0),
         .REFCLK_FREQUENCY      (REFCLK_FREQ),
         .SIGNAL_PATTERN        ("DATA")
         )
        u_iodelay_cas_n
          (
           .DATAOUT     (cas_n_odelay),
           .C           (1'b0),
           .CE          (1'b0),
           .DATAIN      (),
           .IDATAIN     (),
           .INC         (1'b0),
           .ODATAIN     (cas_n_oq),
           .RST         (1'b0),
           .T           (),
           .CNTVALUEIN  (),
           .CNTVALUEOUT (),
           .CLKIN       (),
           .CINVCTRL    (1'b0)
           );      
    end
  endgenerate

  OSERDESE1 #
    (
     .DATA_RATE_OQ   ("DDR"),
     .DATA_RATE_TQ   ("DDR"),
     .DATA_WIDTH     (4),
     .DDR3_DATA      (0),    
     .INIT_OQ        (1'b1), // 1 at reset
     .INIT_TQ        (1'b0),
     .INTERFACE_TYPE ("DEFAULT"),
     .ODELAY_USED    (0),
     .SERDES_MODE    ("MASTER"),
     .SRVAL_OQ       (1'b0),
     .SRVAL_TQ       (1'b0),
     .TRISTATE_WIDTH (4)
     )
    u_out_cas_n
      (
       .OCBEXTEND    (),
       .OFB          (),
       .OQ           (cas_n_oq),
       .SHIFTOUT1    (),
       .SHIFTOUT2    (),
       .TQ           (),
       .CLK          (clk_mem),
       .CLKDIV       (clk),
       .CLKPERF      (),       
       .CLKPERFDELAY (),
       .D1           (mux_cas_n0),
       .D2           (mux_cas_n0),
       .D3           (mux_cas_n1),
       .D4           (mux_cas_n1),
       .D5           (),
       .D6           (),
       .ODV          (1'b0),
       .OCE          (1'b1),
       // Connect SHIFTIN1, SHIFTIN2 to 0 for simulation purposes
       // ensures that cas_n output is not X on reset de-assertion
       .SHIFTIN1     (1'b0),
       .SHIFTIN2     (1'b0),
       .RST          (rst_r),
       .T1           (1'b0),
       .T2           (1'b0),
       .T3           (1'b0),
       .T4           (1'b0),
       .TFB          (),
       .TCE          (1'b1),
       .WC           (1'b0)       
       );

  //*****************************************************************
  // WE: = 1 at reset
  //*****************************************************************

  generate
    if ((DRAM_TYPE == "DDR3") && (WRLVL == "ON")) begin: gen_we_n_wrlvl

      assign ddr_we_n = we_n_oq;
      
    end else begin: gen_we_n_nowrlvl      

      assign ddr_we_n = we_n_odelay;

      (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
        (
         .CINVCTRL_SEL          ("FALSE"),
         .DELAY_SRC             ("O"),
         .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
         .IDELAY_TYPE           ("FIXED"), 
         .IDELAY_VALUE          (0),      
         .ODELAY_TYPE           ("FIXED"),
         .ODELAY_VALUE          (0),
         .REFCLK_FREQUENCY      (REFCLK_FREQ),
         .SIGNAL_PATTERN        ("DATA")
         )
        u_iodelay_we_n
          (
           .DATAOUT     (we_n_odelay),
           .C           (1'b0),
           .CE          (1'b0),
           .DATAIN      (),
           .IDATAIN     (),
           .INC         (1'b0),
           .ODATAIN     (we_n_oq),
           .RST         (1'b0),
           .T           (),
           .CNTVALUEIN  (),
           .CNTVALUEOUT (),
           .CLKIN       (),
           .CINVCTRL    (1'b0)
           );
    end
  endgenerate

  OSERDESE1 #
    (
     .DATA_RATE_OQ   ("DDR"),
     .DATA_RATE_TQ   ("DDR"),
     .DATA_WIDTH     (4),
     .DDR3_DATA      (0),    
     .INIT_OQ        (1'b1), // 1 at reset
     .INIT_TQ        (1'b0),
     .INTERFACE_TYPE ("DEFAULT"),     
     .ODELAY_USED    (0),
     .SERDES_MODE    ("MASTER"),
     .SRVAL_OQ       (1'b0),
     .SRVAL_TQ       (1'b0),
     .TRISTATE_WIDTH (4)
     )
    u_out_we_n
      (
       .OCBEXTEND    (),
       .OFB          (),
       .OQ           (we_n_oq),
       .SHIFTOUT1    (),
       .SHIFTOUT2    (),
       .TQ           (),
       .CLK          (clk_mem),
       .CLKDIV       (clk),
       .CLKPERF      (),
       .CLKPERFDELAY (),
       .D1           (mux_we_n0),
       .D2           (mux_we_n0),
       .D3           (mux_we_n1),
       .D4           (mux_we_n1),
       .D5           (),
       .D6           (),
       .ODV          (1'b0),
       .OCE          (1'b1),
       // Connect SHIFTIN1, SHIFTIN2 to 0 for simulation purposes
       // ensures that we_n output is not X on reset de-assertion
       .SHIFTIN1     (1'b0),
       .SHIFTIN2     (1'b0),
       .RST          (rst_r),
       .T1           (1'b0),
       .T2           (1'b0),
       .T3           (1'b0),
       .T4           (1'b0),
       .TFB          (),
       .TCE          (1'b1),
       .WC           (1'b0)          
       );

  //*****************************************************************
  // CKE: = 0 at reset
  //*****************************************************************

  generate
    genvar cke_i;
    for (cke_i = 0; cke_i < CKE_WIDTH; cke_i = cke_i + 1) begin: gen_cke

      if ((DRAM_TYPE == "DDR3") && (WRLVL == "ON")) begin: gen_cke_wrlvl

        assign ddr_cke[cke_i] = cke_oq[cke_i];

      end else begin: gen_cke_nowrlvl     

        assign ddr_cke[cke_i] = cke_odelay[cke_i];
          
        (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
          (
           .CINVCTRL_SEL          ("FALSE"),
           .DELAY_SRC             ("O"),
           .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
           .IDELAY_TYPE           ("FIXED"), 
           .IDELAY_VALUE          (0),       
           .ODELAY_TYPE           ("FIXED"),
           .ODELAY_VALUE          (0),
           .REFCLK_FREQUENCY      (REFCLK_FREQ),
           .SIGNAL_PATTERN        ("DATA")
           )
          u_iodelay_cke
            (
             .DATAOUT     (cke_odelay[cke_i]),
             .C           (1'b0),
             .CE          (1'b0),
             .DATAIN      (),
             .IDATAIN     (),
             .INC         (1'b0),
             .ODATAIN     (cke_oq[cke_i]),
             .RST         (1'b0),
             .T           (),
             .CNTVALUEIN  (),
             .CNTVALUEOUT (),
             .CLKIN       (),
             .CINVCTRL    (1'b0)
             );
      end

      OSERDESE1 #
        (
         .DATA_RATE_OQ   ("DDR"),
         .DATA_RATE_TQ   ("DDR"),
         .DATA_WIDTH     (4),
         .DDR3_DATA      (0),
         .INIT_OQ        (1'b0), // 0 at reset
         .INIT_TQ        (1'b0),
         .INTERFACE_TYPE ("DEFAULT"),
         .ODELAY_USED    (0),
         .SERDES_MODE    ("MASTER"),
         .SRVAL_OQ       (1'b0),
         .SRVAL_TQ       (1'b0),
         .TRISTATE_WIDTH (4)
         )
        u_out_cke
          (
           .OCBEXTEND    (),
           .OFB          (),
           .OQ           (cke_oq[cke_i]),
           .SHIFTOUT1    (),
           .SHIFTOUT2    (),
           .TQ           (),
           .CLK          (clk_mem),
           .CLKDIV       (clk),
           .CLKPERF      (),
           .CLKPERFDELAY (),
           .D1           (mux_cke0[cke_i]),
           .D2           (mux_cke0[cke_i]),
           .D3           (mux_cke1[cke_i]),
           .D4           (mux_cke1[cke_i]),
           .D5           (),
           .D6           (),
           .ODV          (1'b0),
           .OCE          (oce_temp),
           // Connect SHIFTIN1, SHIFTIN2 to 0 for simulation purposes
           // (for all other OSERDES used in design, these are no-connects):
           // ensures that CKE outputs are not X at start of simulation
           // Certain DDR2 memory models may require that CK/CK# be valid
           // throughout simulation
           .SHIFTIN1     (1'b0),
           .SHIFTIN2     (1'b0),
           .RST          (rst_cke_odt),
           .T1           (1'b0),
           .T2           (1'b0),
           .T3           (1'b0),
           .T4           (1'b0),
           .TFB          (),
           .TCE          (1'b1),
           .WC           (1'b0)
           );
      
    end
  endgenerate
  
  //*****************************************************************
  // chip select = 1 at reset
  //*****************************************************************

  generate
    genvar cs_i;
    for (cs_i = 0; cs_i < CS_WIDTH*nCS_PER_RANK;
         cs_i = cs_i + 1) begin: gen_cs_n

      if ((DRAM_TYPE == "DDR3") && (WRLVL == "ON")) begin: gen_cs_n_wrlvl

        assign ddr_cs_n[cs_i] = cs_n_oq[cs_i];

      end else begin: gen_cs_n_nowrlvl      

        assign ddr_cs_n[cs_i] = cs_n_odelay[cs_i];
          
        (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
          (
           .CINVCTRL_SEL          ("FALSE"),
           .DELAY_SRC             ("O"),
           .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
           .IDELAY_TYPE           ("FIXED"), 
           .IDELAY_VALUE          (0),      
           .ODELAY_TYPE           ("FIXED"),
           .ODELAY_VALUE          (0),
           .REFCLK_FREQUENCY      (REFCLK_FREQ),
           .SIGNAL_PATTERN        ("DATA")
           )
          u_iodelay_cs_n
            (
             .DATAOUT     (cs_n_odelay[cs_i]),
             .C           (1'b0),
             .CE          (1'b0),
             .DATAIN      (),
             .IDATAIN     (),
             .INC         (1'b0),
             .ODATAIN     (cs_n_oq[cs_i]),
             .RST         (1'b0),
             .T           (),
             .CNTVALUEIN  (),
             .CNTVALUEOUT (),
             .CLKIN       (),
             .CINVCTRL    (1'b0)
             );
      end
        
      OSERDESE1 #
        (
         .DATA_RATE_OQ   ("DDR"),
         .DATA_RATE_TQ   ("DDR"),
         .DATA_WIDTH     (4),
         .DDR3_DATA      (0),    
         .INIT_OQ        (1'b1), // 1 at reset
         .INIT_TQ        (1'b0),
         .INTERFACE_TYPE ("DEFAULT"),
         .ODELAY_USED    (0),
         .SERDES_MODE    ("MASTER"),
         .SRVAL_OQ       (1'b0),
         .SRVAL_TQ       (1'b0),
         .TRISTATE_WIDTH (4)
         )
        u_out_cs_n
          (
           .OCBEXTEND    (),
           .OFB          (),
           .OQ           (cs_n_oq[cs_i]),
           .SHIFTOUT1    (),
           .SHIFTOUT2    (),
           .TQ           (),
           .CLK          (clk_mem),
           .CLKDIV       (clk),
           .CLKPERF      (),       
           .CLKPERFDELAY (),
           .D1           (mux_cs_n0[cs_i]),
           .D2           (mux_cs_n0[cs_i]),
           .D3           (mux_cs_n1[cs_i]),
           .D4           (mux_cs_n1[cs_i]),
           .D5           (),
           .D6           (),
           .ODV          (1'b0),
           .OCE          (1'b1),
           // Connect SHIFTIN1, SHIFTIN2 to 0 for simulation purposes
           // ensures that cs_n outputs are not X on reset de-assertion
           .SHIFTIN1     (1'b0),
           .SHIFTIN2     (1'b0),
           .RST          (rst_r),
           .T1           (1'b0),
           .T2           (1'b0),
           .T3           (1'b0),
           .T4           (1'b0),
           .TFB          (),
           .TCE          (1'b1),
           .WC           (1'b0)            
           ); 
    end
  endgenerate
 
  //*****************************************************************
  // address: = X at reset
  //*****************************************************************

  generate
    genvar addr_i;
    for (addr_i = 0; addr_i < ROW_WIDTH; addr_i = addr_i + 1) begin: gen_addr

      if ((DRAM_TYPE == "DDR3") && (WRLVL == "ON")) begin: gen_addr_wrlvl

         assign ddr_addr[addr_i] = addr_oq[addr_i];

      end else begin: gen_addr_nowrlvl     

        assign ddr_addr[addr_i] = addr_odelay[addr_i];
          
        (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
          (
           .CINVCTRL_SEL          ("FALSE"),
           .DELAY_SRC             ("O"),
           .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
           .IDELAY_TYPE           ("FIXED"), 
           .IDELAY_VALUE          (0),       
           .ODELAY_TYPE           ("FIXED"),
           .ODELAY_VALUE          (0),
           .REFCLK_FREQUENCY      (REFCLK_FREQ),
           .SIGNAL_PATTERN        ("DATA")
           )
          u_iodelay_addr
            (
             .DATAOUT     (addr_odelay[addr_i]),
             .C           (1'b0),
             .CE          (1'b0),
             .DATAIN      (),
             .IDATAIN     (),
             .INC         (1'b0),
             .ODATAIN     (addr_oq[addr_i]),
             .RST         (1'b0),
             .T           (),
             .CNTVALUEIN  (),
             .CNTVALUEOUT (),
             .CLKIN       (),
             .CINVCTRL    (1'b0)
             );
      end

      OSERDESE1 #
        (
         .DATA_RATE_OQ   ("DDR"),
         .DATA_RATE_TQ   ("DDR"),
         .DATA_WIDTH     (4),
         .DDR3_DATA      (0),    
         .INIT_OQ        (1'b0), // 0 at reset
         .INIT_TQ        (1'b0),
         .INTERFACE_TYPE ("DEFAULT"),
         .ODELAY_USED    (0),
         .SERDES_MODE    ("MASTER"),
         .SRVAL_OQ       (1'b0),
         .SRVAL_TQ       (1'b0),
         .TRISTATE_WIDTH (4)
         )
        u_out_addr
          (
           .OCBEXTEND    (),
           .OFB          (),
           .OQ           (addr_oq[addr_i]),
           .SHIFTOUT1    (),
           .SHIFTOUT2    (),
           .TQ           (),
           .CLK          (clk_mem),
           .CLKDIV       (clk),
           .CLKPERF      (),
           .CLKPERFDELAY (),
           .D1           (mux_addr0[addr_i]),
           .D2           (mux_addr0[addr_i]),
           .D3           (mux_addr1[addr_i]),
           .D4           (mux_addr1[addr_i]),
           .D5           (),
           .D6           (),
           .ODV          (1'b0),
           .OCE          (1'b1),
           // Connect SHIFTIN1, SHIFTIN2 to 0 for simulation purposes
           // ensures that addr outputs are not X on reset de-assertion
           .SHIFTIN1     (1'b0),
           .SHIFTIN2     (1'b0),
           .RST          (rst_r),
           .T1           (1'b0),
           .T2           (1'b0),
           .T3           (1'b0),
           .T4           (1'b0),
           .TFB          (),
           .TCE          (1'b1),
           .WC           (1'b0)    
           );
    end
  endgenerate
      
  //*****************************************************************
  // bank address = X at reset
  //*****************************************************************

  generate
    genvar ba_i;
    for (ba_i = 0; ba_i < BANK_WIDTH; ba_i = ba_i + 1) begin: gen_ba

      if ((DRAM_TYPE == "DDR3") && (WRLVL == "ON")) begin: gen_ba_wrlvl

        assign ddr_ba[ba_i] = ba_oq[ba_i];

      end else begin: gen_ba_nowrlvl            

        assign ddr_ba[ba_i] = ba_odelay[ba_i];
          
        (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
          (
           .CINVCTRL_SEL          ("FALSE"),
           .DELAY_SRC             ("O"),
           .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
           .IDELAY_TYPE           ("FIXED"),
           .IDELAY_VALUE          (0),       
           .ODELAY_TYPE           ("FIXED"),
           .ODELAY_VALUE          (0),
           .REFCLK_FREQUENCY      (REFCLK_FREQ),
           .SIGNAL_PATTERN        ("DATA")
           )
          u_iodelay_ba
            (
             .DATAOUT     (ba_odelay[ba_i]),
             .C           (1'b0),
             .CE          (1'b0),
             .DATAIN      (),
             .IDATAIN     (),
             .INC         (1'b0),
             .ODATAIN     (ba_oq[ba_i]),
             .RST         (1'b0),
             .T           (),
             .CNTVALUEIN  (),
             .CNTVALUEOUT (),
             .CLKIN       (),
             .CINVCTRL    (1'b0)
             ); 
      end

      OSERDESE1 #
        (
         .DATA_RATE_OQ   ("DDR"),
         .DATA_RATE_TQ   ("DDR"),
         .DATA_WIDTH     (4),
         .DDR3_DATA      (0),
         .INIT_OQ        (1'b0), // 0 at reset
         .INIT_TQ        (1'b0),
         .INTERFACE_TYPE ("DEFAULT"),  
         .ODELAY_USED    (0),
         .SERDES_MODE    ("MASTER"),
         .SRVAL_OQ       (1'b0),
         .SRVAL_TQ       (1'b0),
         .TRISTATE_WIDTH (4)
         )
        u_out_ba
          (
           .OCBEXTEND    (),
           .OFB          (),
           .OQ           (ba_oq[ba_i]),
           .SHIFTOUT1    (),
           .SHIFTOUT2    (),
           .TQ           (),
           .CLK          (clk_mem),
           .CLKDIV       (clk),
           .CLKPERF      (),
           .CLKPERFDELAY (),
           .D1           (mux_ba0[ba_i]),
           .D2           (mux_ba0[ba_i]),
           .D3           (mux_ba1[ba_i]),
           .D4           (mux_ba1[ba_i]),
           .D5           (),
           .D6           (),
           .ODV          (1'b0),
           .OCE          (1'b1),
           // Connect SHIFTIN1, SHIFTIN2 to 0 for simulation purposes
           // ensures that ba outputs are not X on reset de-assertion
           .SHIFTIN1     (1'b0),
           .SHIFTIN2     (1'b0),
           .RST          (rst_r),          
           .T1           (1'b0),
           .T2           (1'b0),
           .T3           (1'b0),
           .T4           (1'b0),
           .TFB          (),
           .TCE          (1'b1),
           .WC           (1'b0)            
           );
    end
  endgenerate

  //*****************************************************************
  // ODT control = 0 at reset
  //*****************************************************************

  generate
    genvar odt_i;    
    for (odt_i = 0; odt_i < CS_WIDTH*nCS_PER_RANK;
         odt_i = odt_i + 1) begin: gen_odt

      if ((DRAM_TYPE == "DDR3") && (WRLVL == "ON")) begin: gen_odt_wrlvl

        assign ddr_odt[odt_i] = odt_oq[odt_i];

      end else begin: gen_odt_nowrlvl   

        assign ddr_odt[odt_i] = odt_odelay[odt_i];
          
        (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
          (
           .CINVCTRL_SEL          ("FALSE"),
           .DELAY_SRC             ("O"),
           .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
           .IDELAY_TYPE           ("FIXED"), 
           .IDELAY_VALUE          (0),      
           .ODELAY_TYPE           ("FIXED"),
           .ODELAY_VALUE          (0),
           .REFCLK_FREQUENCY      (REFCLK_FREQ),
           .SIGNAL_PATTERN        ("DATA")
           )
          u_iodelay_odt
            (
             .DATAOUT     (odt_odelay[odt_i]),
             .C           (1'b0),
             .CE          (1'b0),
             .DATAIN      (),
             .IDATAIN     (),
             .INC         (1'b0),
             .ODATAIN     (odt_oq[odt_i]),
             .RST         (1'b0),
             .T           (),
             .CNTVALUEIN  (),
             .CNTVALUEOUT (),
             .CLKIN       (),
             .CINVCTRL    (1'b0)
             );
      end

      OSERDESE1 #
        (
         .DATA_RATE_OQ   ("DDR"),
         .DATA_RATE_TQ   ("DDR"),
         .DATA_WIDTH     (4),
         .DDR3_DATA      (0),
         .INIT_OQ        (1'b0), // 0 at reset
         .INIT_TQ        (1'b0),
         .INTERFACE_TYPE ("DEFAULT"),    
         .ODELAY_USED    (0),
         .SERDES_MODE    ("MASTER"),
         .SRVAL_OQ       (1'b0),
         .SRVAL_TQ       (1'b0),
         .TRISTATE_WIDTH (4)
         )
        u_out_odt
          (
           .OCBEXTEND    (),
           .OFB          (),
           .OQ           (odt_oq[odt_i]),
           .SHIFTOUT1    (),
           .SHIFTOUT2    (),
           .TQ           (),
           .CLK          (clk_mem),
           .CLKDIV       (clk),
           .CLKPERF      (),
           .CLKPERFDELAY (),
           .D1           (mux_odt0[odt_i]),
           .D2           (mux_odt0[odt_i]),
           .D3           (mux_odt1[odt_i]),
           .D4           (mux_odt1[odt_i]),
           .D5           (),
           .D6           (),
           .ODV          (1'b0),
           .OCE          (oce_temp),
           // Connect SHIFTIN1, SHIFTIN2 to 0 for simulation purposes
           // (for all other OSERDES used in design, these are no-connects):
           // ensures that ODT outputs are not X at start of simulation
           // Certain DDR2 memory models may require that CK/CK# be valid
           // throughout simulation
           .SHIFTIN1     (1'b0),
           .SHIFTIN2     (1'b0),
           .RST          (rst_cke_odt),
           .T1           (1'b0),
           .T2           (1'b0),
           .T3           (1'b0),
           .T4           (1'b0),
           .TFB          (),
           .TCE          (1'b1),
           .WC           (1'b0)    
           );
    end
  endgenerate

  //*****************************************************************
  // Parity for reg dimm. Parity output one cycle after the cs assertion
  //*****************************************************************

  generate  
    if ((DRAM_TYPE == "DDR3") && (WRLVL == "ON")) begin: gen_parity_wrlvl

      assign ddr_parity = parity_oq;

    end else begin: gen_parity_nowrlvl     
      
      assign ddr_parity = parity_odelay;
          
      (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
        (
         .CINVCTRL_SEL          ("FALSE"),
         .DELAY_SRC             ("O"),
         .HIGH_PERFORMANCE_MODE (HIGH_PERFORMANCE_MODE),
         .IDELAY_TYPE           ("FIXED"), 
         .IDELAY_VALUE          (0),       
         .ODELAY_TYPE           ("FIXED"),
         .ODELAY_VALUE          (0),
         .REFCLK_FREQUENCY      (REFCLK_FREQ),
         .SIGNAL_PATTERN        ("DATA")
         )
        u_iodelay_parity
          (
           .DATAOUT     (parity_odelay),
           .C           (1'b0),
           .CE          (1'b0),
           .DATAIN      (),
           .IDATAIN     (),
           .INC         (1'b0),
           .ODATAIN     (parity_oq),
           .RST         (1'b0),
           .T           (),
           .CNTVALUEIN  (),
           .CNTVALUEOUT (),
           .CLKIN       (),
           .CINVCTRL    (1'b0)
           );
    end
  endgenerate
  
  OSERDESE1 #
    (
     .DATA_RATE_OQ   ("DDR"),
     .DATA_RATE_TQ   ("DDR"),
     .DATA_WIDTH     (4),
     .DDR3_DATA      (0),
     .INIT_OQ        (1'b1), // 1 at reset
     .INIT_TQ        (1'b0),
     .INTERFACE_TYPE ("DEFAULT"),
     .ODELAY_USED    (0),
     .SERDES_MODE    ("MASTER"),
     .SRVAL_OQ       (1'b0),
     .SRVAL_TQ       (1'b0),
     .TRISTATE_WIDTH (4)
     )
   u_out_parity
    (
     .OCBEXTEND    (),
     .OFB          (),
     .OQ           (parity_oq),
     .SHIFTOUT1    (),
     .SHIFTOUT2    (),
     .TQ           (),
     .CLK          (clk_mem),
     .CLKDIV       (clk),
     .CLKPERF      (),
     .CLKPERFDELAY (),
     .D1           (parity1),
     .D2           (parity1),
     .D3           (parity0),
     .D4           (parity0),
     .D5           (),
     .D6           (),
     .ODV          (1'b0),
     .OCE          (1'b1),
     // Connect SHIFTIN1, SHIFTIN2 to 0 for simulation purposes
     // ensures that parity outputs are not X on reset de-assertion
     .SHIFTIN1     (1'b0),
     .SHIFTIN2     (1'b0),
     .RST          (rst_r),
     .T1           (1'b0),
     .T2           (1'b0),
     .T3           (1'b0),
     .T4           (1'b0),
     .TFB          (),
     .TCE          (1'b1),
     .WC           (1'b0) 
     );

endmodule
