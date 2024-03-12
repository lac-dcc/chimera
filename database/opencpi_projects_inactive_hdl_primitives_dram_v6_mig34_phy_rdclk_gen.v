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
//  /   /         Filename: phy_rdclk_gen.v
// /___/   /\     Date Last Modified: $Date: 2010/02/26 08:58:34 $
// \   \  /  \    Date Created: Mon Jun 23 2008
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//   Generation and distribution of capture clock. One of the forwarded
//   CK/CK# clocks to memory is fed back into the FPGA. From there it is
//   forwarded to a PLL, where it drives a BUFO, then drives multiple
//   IODELAY + BUFIO sites, one for each DQS group (capture clocks). An
//   additional IODELAY and BUFIO is driven to create the resynchronization
//   clock for capture read data into the FPGA fabric.
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_rdclk_gen.v,v 1.6 2010/02/26 08:58:34 pboya Exp $
**$Date: 2010/02/26 08:58:34 $
**$Author: pboya $
**$Revision: 1.6 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/M/mig_v3_4/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_rdclk_gen.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_rdclk_gen #
  (
   parameter TCQ         = 100,   // clk->out delay (sim only)
   parameter nCK_PER_CLK = 2,     // # of memory clocks per CLK
   parameter CLK_PERIOD  = 3333,  // Internal clock period (in ps)
   parameter REFCLK_FREQ = 300.0, // IODELAY Reference Clock freq (MHz)
   parameter DQS_WIDTH   = 1,     // # of DQS (strobe),
   parameter nDQS_COL0   = 4,     // # DQS groups in I/O column #1
   parameter nDQS_COL1   = 4,     // # DQS groups in I/O column #2
   parameter nDQS_COL2   = 0,     // # DQS groups in I/O column #3
   parameter nDQS_COL3   = 0,     // # DQS groups in I/O column #4
   parameter IODELAY_GRP = "IODELAY_MIG"  // May be assigned unique name
                                          // when mult IP cores in design
   )
  (
   input                    clk_mem,       // Memory clock
   input                    clk,           // Internal (logic) half-rate clock
   input                    clk_rd_base,   // Base capture clock
   input                    rst,           // Logic reset
   input                    dlyrst_cpt,    // Capture clock IDELAY shared reset
   input [DQS_WIDTH-1:0]    dlyce_cpt,     // Capture clock IDELAY enable
   input [DQS_WIDTH-1:0]    dlyinc_cpt,    // Capture clock IDELAY inc/dec
   input                    dlyrst_rsync,  // Resync clock IDELAY reset
   input [3:0]              dlyce_rsync,   // Resync clock IDELAY enable
   input [3:0]              dlyinc_rsync,  // Resync clock IDELAY inc/dec
   output [DQS_WIDTH-1:0]   clk_cpt,       // Data capture clock
   output [3:0]             clk_rsync,     // Resynchronization clock
   output reg [3:0]         rst_rsync,     // Resync clock domain reset
   // debug control signals 
   output [5*DQS_WIDTH-1:0] dbg_cpt_tap_cnt,   // CPT IODELAY tap count 
   output [19:0]            dbg_rsync_tap_cnt  // RSYNC IODELAY tap count
   );

  // # cycles after deassertion of master reset when OSERDES used to
  // forward CPT and RSYNC clocks are taken out of reset
  localparam RST_OSERDES_SYNC_NUM = 9;

  // NOTE: All these parameters must be <= 8, otherwise, you'll need to
  //  individually change the width of the respective counter
  localparam EN_CLK_ON_CNT      = 8;
  localparam EN_CLK_OFF_CNT     = 8;
  localparam RST_OFF_CNT        = 8;
  localparam WC_OSERDES_RST_CNT = 8;

  // Calculate appropriate MMCM multiplication factor to keep VCO frequency
  // in allowable range, and at the same time as high as possible in order
  // to keep output jitter as low as possible
  //   VCO frequency = CLKIN frequency * CLKFBOUT_MULT_F / DIVCLK_DIVIDE
  //   NOTES:
  //     1. DIVCLK_DIVIDE can be 1 or 2 depending on the input frequency
  //        and assumed speedgrade (change starting with MIG 3.3 - before
  //        DIVCLK_DIVIDE was always set to 1 - this exceeded the allowable
  //        PFD clock period when using a -2 part at higher than 533MHz freq.
  //     2. Period of the input clock provided by the user is assumed to
  //        be = CLK_PERIOD / nCK_PER_CLK
  localparam CLKIN_PERIOD   = CLK_PERIOD/nCK_PER_CLK;

  // Maximum skew between BUFR and BUFIO networks across 3 banks in ps.
  // Includes all skew starting from when the base clock exits read MMCM
  localparam CLK_CPT_SKEW_PS = 200;
  // Amount to shift BUFR (in ps) by in order to accomodate all possibilites
  // of BUFIO-BUFR skew after read calibration
  //  = T/2 + CLK_CPT_SKEW, where T = memory clock period
  localparam RSYNC_SHIFT_PS = ((CLK_PERIOD / nCK_PER_CLK)/2) + CLK_CPT_SKEW_PS;
  // Amount to shift in RSYNC_SHIFT_PS in # of IODELAY taps. Cap at 31.
  localparam RSYNC_SHIFT_TAPS
             = (((RSYNC_SHIFT_PS + (1000000/(REFCLK_FREQ*64)) - 1)/
                 (1000000/(REFCLK_FREQ*64))) > 31 ? 31 :
                ((RSYNC_SHIFT_PS + (1000000/(REFCLK_FREQ*64)) - 1)/
                 (1000000/(REFCLK_FREQ*64))));

  // States for reset deassertion and clock generation state machine
  localparam RESET_IDLE         = 3'b000;
  localparam RESET_PULSE_WC     = 3'b001;
  localparam RESET_ENABLE_CLK   = 3'b010;
  localparam RESET_DISABLE_CLK  = 3'b011;
  localparam RESET_DEASSERT_RST = 3'b100;
  localparam RESET_PULSE_CLK    = 3'b101;
  localparam RESET_DONE         = 3'b110;

  wire [DQS_WIDTH-1:0]           clk_cpt_tmp;
  wire [DQS_WIDTH-1:0]           cpt_odelay;
  wire [DQS_WIDTH-1:0]           cpt_oserdes;
  reg [3:0]                      en_clk_off_cnt_r;
  reg [3:0]                      en_clk_on_cnt_r;
  reg [DQS_WIDTH-1:0]            en_clk_cpt_even_r;
  reg [DQS_WIDTH-1:0]            en_clk_cpt_odd_r;
  reg [3:0]                      en_clk_rsync_even_r;
  reg [3:0]                      en_clk_rsync_odd_r;
  wire [DQS_WIDTH-1:0]           ocbextend_cpt;
  reg [DQS_WIDTH-1:0]            ocbextend_cpt_r;
  wire [3:0]                     ocbextend_rsync;
  reg [3:0]                      ocbextend_rsync_r;
  reg [2:0]                      reset_state_r;
  reg [3:0]                      rst_off_cnt_r;
  wire                           rst_oserdes;
  reg [RST_OSERDES_SYNC_NUM-1:0] rst_oserdes_sync_r;
  reg                            rst_rsync_pre_r;
  wire [3:0]                     rsync_bufr;
  wire [3:0]                     rsync_odelay;
  wire [3:0]                     rsync_oserdes;
  reg [3:0]                      wc_oserdes_cnt_r;
  reg                            wc_oserdes_r;

  reg [DQS_WIDTH-1:0]            dlyrst_cpt_r;  
  reg [3:0]                      dlyrst_rsync_r;
  reg [DQS_WIDTH-1:0]            rst_oserdes_cpt_r;
  reg [3:0]                      rst_oserdes_rsync_r;
  // XST attributes for local reset trees - prohibit equivalent register 
  // removal to prevent "sharing" w/ other local reset trees
  // synthesis attribute shreg_extract of dlyrst_cpt_r is "no";  
  // synthesis attribute equivalent_register_removal of dlyrst_cpt_r is "no"
  // synthesis attribute shreg_extract of dlyrst_rsync_r is "no";  
  // synthesis attribute equivalent_register_removal of dlyrst_rsync_r is "no"
  // synthesis attribute shreg_extract of rst_oserdes_cpt_r is "no";  
  // synthesis attribute equivalent_register_removal of rst_oserdes_cpt_r is "no"
  // synthesis attribute shreg_extract of rst_oserdes_rsync_r is "no";  
  // synthesis attribute equivalent_register_removal of rst_oserdes_rsync_r is "no"

  //***************************************************************************
  // RESET GENERATION AND SYNCHRONIZATION:
  // Reset and clock assertion must be carefully done in order to ensure that
  // the ISERDES internal CLK-divide-by-2 element of all DQ/DQS bits are phase
  // aligned prior to adjustment of individual CPT clocks. This allows us to
  // synchronize data capture to the BUFR domain using a single BUFR -
  // otherwise, if some CLK-div-by-2 clocks are 180 degrees phase shifted
  // from others, then it becomes impossible to provide meeting timing for
  // the BUFIO-BUFR capture across all bits. 
  //  1. The various stages required to generate the forwarded capture and
  //     resynchronization clocks (both PERF and BUFG clocks are involved)
  //  2. The need to ensure that the divide-by-2 elements in all ISERDES and
  //     BUFR blocks power up in the "same state" (e.g. on the first clock
  //     edge that they receive, they should drive out logic high). Otherwise
  //     these clocks can be either 0 or 180 degrees out of phase, which makes
  //     it hard to synchronize data going from the ISERDES CLK-div-2 domain
  //     to the BUFR domain.
  //  3. On a related note, the OSERDES blocks are used to generate clocks
  //     for the ISERDES and BUFR elements. Because the OSERDES OCB feature
  //     is used to synchronize from the BUFG to PERF domain (and provide the
  //     ability to gate these clocks), we have to account for the possibility
  //     that the latency across different OCB blocks can vary (by 1 clock
  //     cycle). This means that if the same control is provided to all
  //     clock-forwaring OSERDES, there can be an extra clock pulse produced
  //     by some OSERDES blocks compared to others - this in turn will also
  //     cause the ISERDES and BUFR divide-by-2 outputs to go out of phase.
  //     Therefore, the OSERDES.OCBEXTEND pins of all these clock-forwarding
  //     OSERDES must be monitored. If there is a difference in the OCBEXTEND
  //     values across all the OSERDES, some OSERDES must have a clock pulse
  //     removed in order to ensure phase matching across all the ISERDES and
  //     BUFR divide-by-2 elements
  // Reset sequence:
  //  1. Initially all resets are asserted
  //  2. Once both MMCMs lock, deassert reset for OSERDESs responsible for
  //     clock forwarding for CPT and RSYNC clocks. Deassertion is
  //     synchronous to clk.
  //  3. Pulse WC for the CPT and RSYNC clock OSERDESs. WC must be
  //     synchronous to clk, and is initially deasserted, then pulsed
  //     8 clock cycles after OSERDES reset deassertion. Keep en_clk = 1
  //     to enable the OSERDES outputs.
  //    - At this point the CPT/RSYNC clocks are active
  //  4. Disable CPT and RSYNC clocks (en_clk=0). Keep rst_rsync asserted
  //    - At this point the CPT/RSYNC clocks are flatlined
  //  5. Deassert rst_rsync. This is done to ensure that the divide-by-2
  //     circuits in all the ISERDES and BURFs will be in the same "state"
  //     when the clock is once again restored. Otherwise, if rst_rsync were
  //     deasserted while the CPT clocks were active, it's not possible to
  //     guarantee that the reset will be deasserted synchronously with
  //     respect to the capture clock for all ISERDES.
  //  6. Observe the OCBEXTEND for each of the CPT and RSYNC OSERDES. For
  //     those that have an OCBEXTEND value of 1, drive a single clock
  //     pulse out prior to the next step where the clocks are permanently
  //     reenabled. This will "equalize" the phases of all the ISERDES and
  //     BUFR divide-by-2 elements.
  //  7. Permanently re-enable CPT and RSYNC clocks.
  // NOTES:
  //  1. May need to revisit reenabling of CPT and RSYNC clocks - may be
  //     fair amount of ISI on the first few edges of the clock. Could
  //     instead drive out a slower rate clock initially after re-enabling
  //     the clocks.
  //  2. May need to revisit formula for positioning of RSYNC clock so that
  //     a single RSYNC clock can resynchronize data for all CPT blocks. This
  //     can either be a "static" calculation, or a dynamic calibration step.
  //***************************************************************************

  //*****************************************************************
  // Keep all logic driven by PLL performance path in reset until master
  // logic reset deasserted
  //*****************************************************************

  always @(posedge clk)
    if (rst)
      rst_oserdes_sync_r <= #TCQ {(RST_OSERDES_SYNC_NUM){1'b1}};
    else
      rst_oserdes_sync_r <= #TCQ rst_oserdes_sync_r << 1;

  assign rst_oserdes = rst_oserdes_sync_r[RST_OSERDES_SYNC_NUM-1];

  always @(posedge clk) begin
    if (rst_oserdes) begin
      en_clk_off_cnt_r    <= #TCQ 'b0;
      en_clk_on_cnt_r     <= #TCQ 'b0;
      en_clk_cpt_even_r   <= #TCQ 'b0;
      en_clk_cpt_odd_r    <= #TCQ 'b0;
      en_clk_rsync_even_r <= #TCQ 'b0;
      en_clk_rsync_odd_r  <= #TCQ 'b0;
      rst_off_cnt_r       <= #TCQ 'b0;
      rst_rsync_pre_r     <= #TCQ 1'b1;
      reset_state_r       <= #TCQ RESET_IDLE;
      wc_oserdes_cnt_r    <= #TCQ 'b0;
      wc_oserdes_r        <= #TCQ 1'b0;
    end else begin
      // Default assignments
      en_clk_cpt_even_r   <= #TCQ 'b0;
      en_clk_cpt_odd_r    <= #TCQ 'b0;
      en_clk_rsync_even_r <= #TCQ 'b0;
      en_clk_rsync_odd_r  <= #TCQ 'b0;
      rst_rsync_pre_r     <= #TCQ 1'b1;
      wc_oserdes_r        <= #TCQ 1'b0;

      (* full_case, parallel_case *) case (reset_state_r)
        // Wait for both MMCM's to lock
        RESET_IDLE: begin
          wc_oserdes_cnt_r <= #TCQ 3'b000;
          reset_state_r    <= #TCQ RESET_PULSE_WC;
        end

        // Pulse WC some time after reset to OSERDES is deasserted
        RESET_PULSE_WC: begin
          wc_oserdes_cnt_r <= #TCQ wc_oserdes_cnt_r + 1;
          if (wc_oserdes_cnt_r == WC_OSERDES_RST_CNT-1) begin
            wc_oserdes_r   <= #TCQ 1'b1;
            reset_state_r  <= #TCQ RESET_ENABLE_CLK;
          end
        end

        // Drive out a few clocks to make sure reset is recognized for
        // those circuits that require a synchronous reset
        RESET_ENABLE_CLK: begin
          en_clk_cpt_even_r   <= #TCQ {DQS_WIDTH{1'b1}};
          en_clk_cpt_odd_r    <= #TCQ {DQS_WIDTH{1'b1}};
          en_clk_rsync_even_r <= #TCQ 4'b1111;
          en_clk_rsync_odd_r  <= #TCQ 4'b1111;
          en_clk_on_cnt_r     <= #TCQ en_clk_on_cnt_r + 1;
          if (en_clk_on_cnt_r == EN_CLK_ON_CNT-1)
            reset_state_r     <= #TCQ RESET_DISABLE_CLK;
        end

        // Disable clocks in preparation for disabling reset
        RESET_DISABLE_CLK: begin
          en_clk_off_cnt_r <= #TCQ en_clk_off_cnt_r + 1;
          if (en_clk_off_cnt_r == EN_CLK_OFF_CNT-1)
            reset_state_r  <= #TCQ RESET_DEASSERT_RST;
        end

        // Deassert reset while clocks are inactive
        RESET_DEASSERT_RST: begin
          rst_rsync_pre_r <= #TCQ 1'b0;
          rst_off_cnt_r   <= #TCQ rst_off_cnt_r + 1;
          if (rst_off_cnt_r == RST_OFF_CNT-1)
            reset_state_r <= #TCQ RESET_PULSE_CLK;
        end

        // Pulse extra clock to those CPT/RSYNC OSERDES that need it
        RESET_PULSE_CLK: begin
          en_clk_cpt_even_r   <= #TCQ ocbextend_cpt_r;
          en_clk_cpt_odd_r    <= #TCQ 'b0;
          en_clk_rsync_even_r <= #TCQ ocbextend_rsync_r;
          en_clk_rsync_odd_r  <= #TCQ 'b0;
          rst_rsync_pre_r     <= #TCQ 1'b0;
          reset_state_r       <= #TCQ RESET_DONE;
        end

        // Permanently enable clocks
        RESET_DONE: begin
          en_clk_cpt_even_r   <= #TCQ {DQS_WIDTH{1'b1}};
          en_clk_cpt_odd_r    <= #TCQ {DQS_WIDTH{1'b1}};
          en_clk_rsync_even_r <= #TCQ 4'b1111;
          en_clk_rsync_odd_r  <= #TCQ 4'b1111;
          rst_rsync_pre_r     <= #TCQ 1'b0;
        end
      endcase
    end
  end

  //*****************************************************************
  // Reset pipelining - register reset signals to prevent large (and long)
  // fanouts during physical compilation of the design - in particular when
  // the design spans multiple I/O columns. Create one for every CPT and 
  // RSYNC clock OSERDES - might be overkill (one per I/O column may be 
  // enough). Note this adds a one cycle delay between when the FSM below
  // is taken out of reset, and when the OSERDES are taken out of reset -
  // this should be accounted for by the FSM logic
  //*****************************************************************

  always @(posedge clk) begin 
    dlyrst_cpt_r        <= #TCQ {DQS_WIDTH{dlyrst_cpt}};
    dlyrst_rsync_r      <= #TCQ {4{dlyrst_rsync}};
    rst_oserdes_cpt_r   <= #TCQ {DQS_WIDTH{rst_oserdes}};
    rst_oserdes_rsync_r <= #TCQ {4{rst_oserdes}};
  end
  
  //*****************************************************************
  // Miscellaneous signals
  //*****************************************************************

  // NOTE: Deassertion of RST_RSYNC does not have to be synchronous
  //  w/r/t CLK_RSYNC[x] - because CLK_RSYNC[x] is inactive when
  //  reset is deasserted. Note all RST_RSYNC bits will be used -
  //  depends on # of I/O columns used
  always @(posedge clk)
    rst_rsync <= #TCQ {4{rst_rsync_pre_r}};

  // Register OCBEXTEND from CPT and RSYNC OSERDES - although these will
  // be static signals by the time they're used by the state machine
  always @(posedge clk) begin
    ocbextend_cpt_r   <= #TCQ ocbextend_cpt;
    ocbextend_rsync_r <= #TCQ ocbextend_rsync;
  end

  //***************************************************************************
  // Generation for each of the individual DQS group clocks. Also generate
  // resynchronization clock.
  // NOTES:
  //   1. BUFO drives OSERDES which in turn drives corresponding IODELAY
  //   2. Another mechanism may exist where BUFO drives the IODELAY input
  //      combinationally (bypassing the last stage flip-flop in OSERDES)
  //***************************************************************************
  
   //*****************************************************************
  // Clock forwarding:
  // Use OSERDES to forward clock even though only basic ODDR
  // functionality is needed - use case for ODDR connected to
  // performance path may not be supported, and may later want
  // to add clock-gating capability to CPT clock to decrease
  // IODELAY loading time when switching ranks
  //*****************************************************************

  //*******************************************************
  // Capture clocks
  //*******************************************************

  generate
    genvar ck_i;
    for (ck_i = 0; ck_i < DQS_WIDTH; ck_i = ck_i+1) begin: gen_ck_cpt

      OSERDESE1 #
        (
         .DATA_RATE_OQ   ("DDR"),
         .DATA_RATE_TQ   ("DDR"),
         .DATA_WIDTH     (4),
         .DDR3_DATA      (0),
         .INIT_OQ        (1'b0),
         .INIT_TQ        (1'b0),
         .INTERFACE_TYPE ("MEMORY_DDR3"),
         .ODELAY_USED    (0),
         .SERDES_MODE    ("MASTER"),
         .SRVAL_OQ       (1'b0),
         .SRVAL_TQ       (1'b0),
         .TRISTATE_WIDTH (4)
         )
        u_oserdes_cpt
          (
           .OCBEXTEND    (ocbextend_cpt[ck_i]),
           .OFB          (cpt_oserdes[ck_i]),
           .OQ           (),
           .SHIFTOUT1    (),
           .SHIFTOUT2    (),
           .TQ           (),
           .CLK          (clk_mem),
           .CLKDIV       (clk),
           .CLKPERF      (clk_rd_base),
           .CLKPERFDELAY (),
           .D1           (en_clk_cpt_odd_r[ck_i]),  // Gating of fwd'ed clock
           .D2           (1'b0),
           .D3           (en_clk_cpt_even_r[ck_i]), // Gating of fwd'ed clock
           .D4           (1'b0),
           .D5           (),
           .D6           (),
           .ODV          (1'b0),
           .OCE          (1'b1),
           .SHIFTIN1     (),
           .SHIFTIN2     (),
           .RST          (rst_oserdes_cpt_r[ck_i]),
           .T1           (1'b0),
           .T2           (1'b0),
           .T3           (1'b0),
           .T4           (1'b0),
           .TFB          (),
           .TCE          (1'b1),
           .WC           (wc_oserdes_r)
           );

      (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
        (
         .CINVCTRL_SEL          ("FALSE"),
         .DELAY_SRC             ("O"),
         .HIGH_PERFORMANCE_MODE ("TRUE"),
         .IDELAY_TYPE           ("FIXED"),
         .IDELAY_VALUE          (0),      
         .ODELAY_TYPE           ("VARIABLE"),
         .ODELAY_VALUE          (0),
         .REFCLK_FREQUENCY      (REFCLK_FREQ),
         .SIGNAL_PATTERN        ("CLOCK")
         )
        u_odelay_cpt
          (
           .DATAOUT     (cpt_odelay[ck_i]),
           .C           (clk),
           .CE          (dlyce_cpt[ck_i]),
           .DATAIN      (),
           .IDATAIN     (),
           .INC         (dlyinc_cpt[ck_i]),
           .ODATAIN     (cpt_oserdes[ck_i]),
           .RST         (dlyrst_cpt_r[ck_i]),
           .T           (),
           .CNTVALUEIN  (),
           .CNTVALUEOUT (dbg_cpt_tap_cnt[5*ck_i+4:5*ck_i]),
           .CLKIN       (),
           .CINVCTRL    (1'b0)
           );

      BUFIO u_bufio_cpt
        (
         .I  (cpt_odelay[ck_i]),
         .O  (clk_cpt_tmp[ck_i])
         );

      // Use for simulation purposes only
      assign #0.1 clk_cpt[ck_i] = clk_cpt_tmp[ck_i];

    end
  endgenerate

  //*******************************************************
  // Resynchronization clock
  //*******************************************************

  generate
    // I/O column #1
    if (nDQS_COL0 > 0) begin: gen_loop_col0
      OSERDESE1 #
        (
         .DATA_RATE_OQ   ("DDR"),
         .DATA_RATE_TQ   ("DDR"),
         .DATA_WIDTH     (4),
         .DDR3_DATA      (0),
         .INIT_OQ        (1'b0),
         .INIT_TQ        (1'b0),
         .INTERFACE_TYPE ("MEMORY_DDR3"),
         .ODELAY_USED    (0),
         .SERDES_MODE    ("MASTER"),
         .SRVAL_OQ       (1'b0),
         .SRVAL_TQ       (1'b0),
         .TRISTATE_WIDTH (4)
         )
        u_oserdes_rsync
          (
           .OCBEXTEND    (ocbextend_rsync[0]),
           .OFB          (rsync_oserdes[0]),
           .OQ           (),
           .SHIFTOUT1    (),
           .SHIFTOUT2    (),
           .TQ           (),
           .CLK          (clk_mem),
           .CLKDIV       (clk),
           .CLKPERF      (clk_rd_base),
           .CLKPERFDELAY (),
           .D1           (en_clk_rsync_odd_r[0]), // Gating of fwd'ed clock
           .D2           (1'b0),
           .D3           (en_clk_rsync_even_r[0]),// Gating of fwd'ed clock
           .D4           (1'b0),
           .D5           (),
           .D6           (),
           .ODV          (1'b0),
           .OCE          (1'b1),
           .SHIFTIN1     (),
           .SHIFTIN2     (),
           .RST          (rst_oserdes_rsync_r[0]),
           .T1           (1'b0),
           .T2           (1'b0),
           .T3           (1'b0),
           .T4           (1'b0),
           .TFB          (),
           .TCE          (1'b1),
           .WC           (wc_oserdes_r)
           );

      (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
        (
         .CINVCTRL_SEL          ("FALSE"),
         .DELAY_SRC             ("O"),
         .HIGH_PERFORMANCE_MODE ("TRUE"),
         .IDELAY_TYPE           ("FIXED"),
         .IDELAY_VALUE          (0),       
         .ODELAY_TYPE           ("VARIABLE"),
         .ODELAY_VALUE          (RSYNC_SHIFT_TAPS),
         .REFCLK_FREQUENCY      (REFCLK_FREQ),
         .SIGNAL_PATTERN        ("CLOCK")
         )
        u_odelay_rsync
          (
           .DATAOUT     (rsync_odelay[0]),
           .C           (clk),
           .CE          (dlyce_rsync[0]),
           .DATAIN      (),
           .IDATAIN     (),
           .INC         (dlyinc_rsync[0]),
           .ODATAIN     (rsync_oserdes[0]),
           .RST         (dlyrst_rsync_r[0]),
           .T           (),
           .CNTVALUEIN  (),
           .CNTVALUEOUT (dbg_rsync_tap_cnt[4:0]),          
           .CLKIN       (),
           .CINVCTRL    (1'b0)
           );

      BUFR #
        (
         .BUFR_DIVIDE ("2"),
         .SIM_DEVICE  ("VIRTEX6")
         )
        u_bufr_rsync
          (
           .I   (rsync_odelay[0]),
           .O   (rsync_bufr[0]),
           .CE  (1'b1),
           .CLR (rst_rsync[0])
           );
    end

    // I/O column #2
    if (nDQS_COL1 > 0) begin: gen_loop_col1
      OSERDESE1 #
        (
         .DATA_RATE_OQ   ("DDR"),
         .DATA_RATE_TQ   ("DDR"),
         .DATA_WIDTH     (4),
         .DDR3_DATA      (0),
         .INIT_OQ        (1'b0),
         .INIT_TQ        (1'b0),
         .INTERFACE_TYPE ("MEMORY_DDR3"),
         .ODELAY_USED    (0),
         .SERDES_MODE    ("MASTER"),
         .SRVAL_OQ       (1'b0),
         .SRVAL_TQ       (1'b0),
         .TRISTATE_WIDTH (4)
         )
        u_oserdes_rsync
          (
           .OCBEXTEND    (ocbextend_rsync[1]),
           .OFB          (rsync_oserdes[1]),
           .OQ           (),
           .SHIFTOUT1    (),
           .SHIFTOUT2    (),
           .TQ           (),
           .CLK          (clk_mem),
           .CLKDIV       (clk),
           .CLKPERF      (clk_rd_base),
           .CLKPERFDELAY (),
           .D1           (en_clk_rsync_odd_r[1]), // Gating of fwd'ed clock
           .D2           (1'b0),
           .D3           (en_clk_rsync_even_r[1]),// Gating of fwd'ed clock
           .D4           (1'b0),
           .D5           (),
           .D6           (),
           .ODV          (1'b0),
           .OCE          (1'b1),
           .SHIFTIN1     (),
           .SHIFTIN2     (),
           .RST          (rst_oserdes_rsync_r[1]),
           .T1           (1'b0),
           .T2           (1'b0),
           .T3           (1'b0),
           .T4           (1'b0),
           .TFB          (),
           .TCE          (1'b1),
           .WC           (wc_oserdes_r)
           );

      (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
        (
         .CINVCTRL_SEL          ("FALSE"),
         .DELAY_SRC             ("O"),
         .HIGH_PERFORMANCE_MODE ("TRUE"),
         .IDELAY_TYPE           ("FIXED"), 
         .IDELAY_VALUE          (0),       
         .ODELAY_TYPE           ("VARIABLE"),
         .ODELAY_VALUE          (RSYNC_SHIFT_TAPS),
         .REFCLK_FREQUENCY      (REFCLK_FREQ),
         .SIGNAL_PATTERN        ("CLOCK")
         )
        u_odelay_rsync
          (
           .DATAOUT     (rsync_odelay[1]),
           .C           (clk),
           .CE          (dlyce_rsync[1]),
           .DATAIN      (),
           .IDATAIN     (),
           .INC         (dlyinc_rsync[1]),
           .ODATAIN     (rsync_oserdes[1]),
           .RST         (dlyrst_rsync_r[1]),
           .T           (),
           .CNTVALUEIN  (),
           .CNTVALUEOUT (dbg_rsync_tap_cnt[9:5]),
           .CLKIN       (),
           .CINVCTRL    (1'b0)
           );

      BUFR #
        (
         .BUFR_DIVIDE ("2"),
         .SIM_DEVICE  ("VIRTEX6")
         )
        u_bufr_rsync
          (
           .I   (rsync_odelay[1]),
           .O   (rsync_bufr[1]),
           .CE  (1'b1),
           .CLR (rst_rsync[1])
           );
    end

    // I/O column #3
    if (nDQS_COL2 > 0) begin: gen_loop_col2
      OSERDESE1 #
        (
         .DATA_RATE_OQ   ("DDR"),
         .DATA_RATE_TQ   ("DDR"),
         .DATA_WIDTH     (4),
         .DDR3_DATA      (0),
         .INIT_OQ        (1'b0),
         .INIT_TQ        (1'b0),
         .INTERFACE_TYPE ("MEMORY_DDR3"),
         .ODELAY_USED    (0),
         .SERDES_MODE    ("MASTER"),
         .SRVAL_OQ       (1'b0),
         .SRVAL_TQ       (1'b0),
         .TRISTATE_WIDTH (4)
         )
        u_oserdes_rsync
          (
           .OCBEXTEND    (ocbextend_rsync[2]),
           .OFB          (rsync_oserdes[2]),
           .OQ           (),
           .SHIFTOUT1    (),
           .SHIFTOUT2    (),
           .TQ           (),
           .CLK          (clk_mem),
           .CLKDIV       (clk),
           .CLKPERF      (clk_rd_base),
           .CLKPERFDELAY (),
           .D1           (en_clk_rsync_odd_r[2]), // Gating of fwd'ed clock
           .D2           (1'b0),
           .D3           (en_clk_rsync_even_r[2]),// Gating of fwd'ed clock
           .D4           (1'b0),
           .D5           (),
           .D6           (),
           .ODV          (1'b0),
           .OCE          (1'b1),
           .SHIFTIN1     (),
           .SHIFTIN2     (),
           .RST          (rst_oserdes_rsync_r[2]),
           .T1           (1'b0),
           .T2           (1'b0),
           .T3           (1'b0),
           .T4           (1'b0),
           .TFB          (),
           .TCE          (1'b1),
           .WC           (wc_oserdes_r)
           );

      (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
        (
         .CINVCTRL_SEL          ("FALSE"),
         .DELAY_SRC             ("O"),
         .HIGH_PERFORMANCE_MODE ("TRUE"),
         .IDELAY_TYPE           ("FIXED"), 
         .IDELAY_VALUE          (0),       
         .ODELAY_TYPE           ("VARIABLE"), 
         .ODELAY_VALUE          (RSYNC_SHIFT_TAPS),
         .REFCLK_FREQUENCY      (REFCLK_FREQ),
         .SIGNAL_PATTERN        ("CLOCK")
         )
        u_odelay_rsync
          (
           .DATAOUT     (rsync_odelay[2]),
           .C           (clk),
           .CE          (dlyce_rsync[2]),
           .DATAIN      (),
           .IDATAIN     (),
           .INC         (dlyinc_rsync[2]),
           .ODATAIN     (rsync_oserdes[2]),
           .RST         (dlyrst_rsync_r[2]),
           .T           (),
           .CNTVALUEIN  (),
           .CNTVALUEOUT (dbg_rsync_tap_cnt[14:10]),
           .CLKIN       (),
           .CINVCTRL    (1'b0)
           );

      BUFR #
        (
         .BUFR_DIVIDE ("2"),
         .SIM_DEVICE  ("VIRTEX6")
         )
        u_bufr_rsync
          (
           .I   (rsync_odelay[2]),
           .O   (rsync_bufr[2]),
           .CE  (1'b1),
           .CLR (rst_rsync[2])
           );
    end

    // I/O column #4
    if (nDQS_COL3 > 0) begin: gen_loop_col3
      OSERDESE1 #
        (
         .DATA_RATE_OQ   ("DDR"),
         .DATA_RATE_TQ   ("DDR"),
         .DATA_WIDTH     (4),
         .DDR3_DATA      (0),
         .INIT_OQ        (1'b0),
         .INIT_TQ        (1'b0),
         .INTERFACE_TYPE ("MEMORY_DDR3"),
         .ODELAY_USED    (0),
         .SERDES_MODE    ("MASTER"),
         .SRVAL_OQ       (1'b0),
         .SRVAL_TQ       (1'b0),
         .TRISTATE_WIDTH (4)
         )
        u_oserdes_rsync
          (
           .OCBEXTEND    (ocbextend_rsync[3]),
           .OFB          (rsync_oserdes[3]),
           .OQ           (),
           .SHIFTOUT1    (),
           .SHIFTOUT2    (),
           .TQ           (),
           .CLK          (clk_mem),
           .CLKDIV       (clk),
           .CLKPERF      (clk_rd_base),
           .CLKPERFDELAY (),
           .D1           (en_clk_rsync_odd_r[3]), // Gating of fwd'ed clock
           .D2           (1'b0),
           .D3           (en_clk_rsync_even_r[3]),// Gating of fwd'ed clock
           .D4           (1'b0),
           .D5           (),
           .D6           (),
           .ODV          (1'b0),
           .OCE          (1'b1),
           .SHIFTIN1     (),
           .SHIFTIN2     (),
           .RST          (rst_oserdes_rsync_r[3]),
           .T1           (1'b0),
           .T2           (1'b0),
           .T3           (1'b0),
           .T4           (1'b0),
           .TFB          (),
           .TCE          (1'b1),
           .WC           (wc_oserdes_r)
           );

      (* IODELAY_GROUP = IODELAY_GRP *) IODELAYE1 #
        (
         .CINVCTRL_SEL          ("FALSE"),
         .DELAY_SRC             ("O"),
         .HIGH_PERFORMANCE_MODE ("TRUE"),
         .IDELAY_TYPE           ("FIXED"), // See CR 511257
         .IDELAY_VALUE          (0),       // See CR 511257
         .ODELAY_TYPE           ("VARIABLE"),    
         .ODELAY_VALUE          (RSYNC_SHIFT_TAPS),
         .REFCLK_FREQUENCY      (REFCLK_FREQ),
         .SIGNAL_PATTERN        ("CLOCK")
         )
        u_odelay_rsync
          (
           .DATAOUT     (rsync_odelay[3]),
           .C           (clk),
           .CE          (dlyce_rsync[3]),
           .DATAIN      (),
           .IDATAIN     (),
           .INC         (dlyinc_rsync[3]),
           .ODATAIN     (rsync_oserdes[3]),
           .RST         (dlyrst_rsync_r[3]),
           .T           (),
           .CNTVALUEIN  (),
           .CNTVALUEOUT (dbg_rsync_tap_cnt[19:15]),
           .CLKIN       (),
           .CINVCTRL    (1'b0)
           );

      BUFR #
        (
         .BUFR_DIVIDE ("2"),
         .SIM_DEVICE  ("VIRTEX6")
         )
        u_bufr_rsync
          (
           .I   (rsync_odelay[3]),
           .O   (rsync_bufr[3]),
           .CE  (1'b1),
           .CLR (rst_rsync[3])
           );
    end
  endgenerate

  assign clk_rsync = rsync_bufr;

endmodule
