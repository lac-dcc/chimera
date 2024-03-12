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
//  /   /         Filename: phy_pd.v
// /___/   /\     Date Last Modified: $Date: 2010/10/05 16:43:09 $
// \   \  /  \    Date Created: Aug 03 2009
//  \___\/\___\
//
//Device: Virtex-6
//Design Name: DDR3 SDRAM
//Purpose:
//   This module is replicated in phy_pd_top for each DQS signal.  This module
//   contains the logic that calibrates PD (moves DQS such that clk_cpt rising
//   edge is aligned with DQS rising edge) and maintains this phase relationship
//   by moving clk_cpt as necessary.
//
//Reference:
//Revision History:
//*****************************************************************************

/******************************************************************************
**$Id: phy_pd.v,v 1.1 2010/10/05 16:43:09 mishra Exp $
**$Date: 2010/10/05 16:43:09 $
**$Author: mishra $
**$Revision: 1.1 $
**$Source: /devl/xcs/repo/env/Databases/ip/src2/O/mig_v3_7/data/dlib/virtex6/ddr3_sdram/verilog/rtl/phy/phy_pd.v,v $
******************************************************************************/

`timescale 1ps/1ps

module phy_pd #
  (
   parameter TCQ             = 100,
   parameter SIM_CAL_OPTION  = "NONE", // "NONE", "FAST_CAL", "SKIP_CAL" 
                                       // (same as "NONE")
   parameter PD_LHC_WIDTH    = 16      // synth low & high cntr physical width
   )
  (
   output [99:0] dbg_pd,              // debug signals
   input [4:0]   dqs_dly_val_in,
   output [4:0]  dqs_dly_val,
   output reg    pd_en_maintain,      // maintenance enable
   output reg    pd_incdec_maintain,  // maintenance inc/dec
   output        pd_cal_done,         // calibration done (level)
   input         pd_cal_start,        // calibration start (pulse or level)
   input         dfi_init_complete,
   input         pd_read_valid,       // advance cntrs only when true
   input [1:0]   trip_points,         // the 2 rising clock samples of the 
                                      // nibble   
   // debug
   input         dbg_pd_off,
   input         dbg_pd_maintain_off,
   input         dbg_pd_inc_cpt,      // one clk period pulse
   input         dbg_pd_dec_cpt,      // one clk period pulse
   input         dbg_pd_inc_dqs,      // one clk period pulse
   input         dbg_pd_dec_dqs,      // one clk period pulse
   input         dbg_pd_disab_hyst,
   input [3:0]   dbg_pd_msb_sel,      // selects effective msb of high & 
                                      // low cntrs
   input         clk,                 // clkmem/2
   input         rst                  //
   );

  //***************************************************************************
  // Local parameters (other than state assignments)
  //***************************************************************************

  // merge two SIM_CAL_OPTION values into new localparam
  localparam FAST_SIM  = ((SIM_CAL_OPTION == "FAST_CAL") | (SIM_CAL_OPTION == "FAST_WIN_DETECT")) ? "YES" : "NO";

  // width of low and high counters
  localparam LHC_WIDTH    = (FAST_SIM == "YES") ? 6 : PD_LHC_WIDTH;

  // width of calibration done counter (6 for synthesis, less for simulation)
  localparam CDC_WIDTH   = (FAST_SIM == "YES") ? 3 : 6;

  localparam RVPLS_WIDTH = 1; // this controls the pipeline delay of pd_read_valid
                              // set to 1 for normal operation

  //***************************************************************************
  // Internal signals
  //***************************************************************************

  wire                  pd_en_maintain_d;
  wire                  pd_incdec_maintain_d;
  wire [LHC_WIDTH-1:0]  low_d;
  wire [LHC_WIDTH-1:0]  high_d;

  reg                   ld_dqs_dly_val_r;    // combinatorial
  reg  [4:0]            dqs_dly_val_r;
  wire                  pd_cal_done_i;       // pd_cal_done internal

  reg                   first_calib_sample;
  reg                   rev_direction;
  wire                  rev_direction_ce;

  wire                  pd_en_calib;         // calibration enable
  wire                  pd_incdec_calib;     // calibration inc/dec

  reg                   pd_en;
  wire                  pd_incdec;

  reg                   reset;               // rst is synchronized to clk
  reg [2:0]             pd_state_r;
  reg [2:0]             pd_next_state;       // combinatorial
  reg [LHC_WIDTH-1:0]   low;                 // low counter
  reg [LHC_WIDTH-1:0]   high;                // high counter
  wire                  samples_done;
  reg [2:0]             samples_done_pl;
  wire                  inc_cntrs;
  wire                  clr_low_high;
  wire                  low_high_ce;
  wire                  update_phase;
  reg [CDC_WIDTH-1:0]   calib_done_cntr;
  wire                  calib_done_cntr_inc;
  wire                  calib_done_cntr_ce;
  wire                  high_ge_low;
  reg [1:0]             l_addend;
  reg [1:0]             h_addend;
  wire                  read_valid_pl;
  wire                  enab_maintenance;

  reg [3:0]             pd_done_state_r;
  reg [3:0]             pd_done_next_state;
  reg                   pd_incdec_done;      // combinatorial
  reg                   pd_incdec_done_next; // combinatorial

  wire                  block_change;
  reg                   low_nearly_done;
  reg                   high_nearly_done;

  reg                   low_done;
  reg                   high_done;
  wire [3:0]            hyst_mux_sel;
  wire [3:0]            mux_sel;
  reg                   low_mux;             // combinatorial
  reg                   high_mux;            // combinatorial
  reg                   low_nearly_done_r;
  reg                   high_nearly_done_r;

  //***************************************************************************
  // low_done and high_done
  //***************************************************************************
  
  // select MSB during calibration - during maintanence,
  // determined by dbg_pd_msb_sel. Add case to handle
  // fast simulation to prevent overflow of counter
  // since LHC_WIDTH is set to small value for fast sim
  assign mux_sel = pd_cal_done_i ? 
                   ((FAST_SIM == "YES") ? (LHC_WIDTH-1) : dbg_pd_msb_sel) :
                   (LHC_WIDTH-1); 

  always @(mux_sel or low)  low_mux  = low[mux_sel];

  always @(mux_sel or high) high_mux = high[mux_sel];

  always @(posedge clk)
  begin
    if (clr_low_high)
    begin
      low_done  <= #TCQ 1'b0;
      high_done <= #TCQ 1'b0;
    end
    else
    begin
      low_done  <= #TCQ low_mux;
      high_done <= #TCQ high_mux;
    end
  end

  //***************************************************************************
  // block_change (hysteresis) logic
  //***************************************************************************

  // select MSB used to determine hysteresis level. Add case to handle
  // fast simulation to prevent out-of-bounds index since LHC_WIDTH is set 
  // to small value for fast sim. If DEBUG PORT is disabled, dbg_pd_msb_sel
  // must be hardcoded to appropriate value in upper-level module. 
  assign hyst_mux_sel = (FAST_SIM == "YES") ? 
                        (LHC_WIDTH-2) : dbg_pd_msb_sel - 1;
  
  always @(hyst_mux_sel or low)  low_nearly_done  = low[hyst_mux_sel];
  always @(hyst_mux_sel or high) high_nearly_done = high[hyst_mux_sel];

  always @(posedge clk) // pipeline low_nearly_done and high_nearly_done
  begin
    if (reset | (dbg_pd_disab_hyst))
    begin
      low_nearly_done_r  <= #TCQ 1'b0;
      high_nearly_done_r <= #TCQ 1'b0;
    end
    else
    begin
      low_nearly_done_r  <= #TCQ low_nearly_done;
      high_nearly_done_r <= #TCQ high_nearly_done;
    end
  end

  assign block_change = ((high_done & low_done)
                      | (high_done ? low_nearly_done_r : high_nearly_done_r));

  //***************************************************************************
  // samples_done and high_ge_low
  //***************************************************************************

  assign samples_done = (low_done | high_done) & ~clr_low_high;  // ~clr_low_high makes samples_done de-assert one cycle sooner

  assign high_ge_low  = high_done;

  //***************************************************************************
  // Debug
  //***************************************************************************

  // Temporary debug assignments and logic - remove for release code.

  // Disabling of PD is allowed either before or after calibration
  // Usage: dbg_pd_off = 1 to disable PD. If disabled prior to initialization
  //  it should remain off - turning it on later will result in bad behavior
  //  since the DQS early/late tap delays will not have been properly initialized.
  //  If disabled after initial calibration, it can later be re-enabled
  //  without reseting the system.

  reg pd_incdec_tp;     // debug test point
  always @(posedge clk)
    if (reset)     pd_incdec_tp <= #TCQ 1'b0;
    else if(pd_en) pd_incdec_tp <= #TCQ pd_incdec;

  assign dbg_pd[0]     = pd_en;
  assign dbg_pd[1]     = pd_incdec;
  assign dbg_pd[2]     = pd_cal_done_i;
  assign dbg_pd[3]     = pd_cal_start;
  assign dbg_pd[4]     = samples_done;
  assign dbg_pd[5]     = inc_cntrs;
  assign dbg_pd[6]     = clr_low_high;
  assign dbg_pd[7]     = low_high_ce;
  assign dbg_pd[8]     = update_phase;
  assign dbg_pd[9]     = calib_done_cntr_inc;
  assign dbg_pd[10]    = calib_done_cntr_ce;
  assign dbg_pd[11]    = first_calib_sample;
  assign dbg_pd[12]    = rev_direction;
  assign dbg_pd[13]    = rev_direction_ce;
  assign dbg_pd[14]    = pd_en_calib;
  assign dbg_pd[15]    = pd_incdec_calib;
  assign dbg_pd[16]    = read_valid_pl;
  assign dbg_pd[17]    = pd_read_valid;
  assign dbg_pd[18]    = pd_incdec_tp;
  assign dbg_pd[19]    = block_change;
  assign dbg_pd[20]    = low_nearly_done_r;
  assign dbg_pd[21]    = high_nearly_done_r;
  assign dbg_pd[23:22] = 'b0;                                    // spare scalor bits
  assign dbg_pd[29:24] = {1'b0, dqs_dly_val_r};                  // 1 spare bit
  assign dbg_pd[33:30] = {1'b0, pd_state_r};                     // 1 spare bit
  assign dbg_pd[37:34] = {1'b0, pd_next_state};                  // 1 spare bit
  assign dbg_pd[53:38] =  high;                                  // 16 bits max
  assign dbg_pd[69:54] = low;                                    // 16 bits max
  assign dbg_pd[73:70] = pd_done_state_r;
  assign dbg_pd[81:74] = {{8-CDC_WIDTH{1'b0}}, calib_done_cntr}; //  8 bits max
  assign dbg_pd[83:82] = l_addend;
  assign dbg_pd[85:84] = h_addend;
  assign dbg_pd[87:86] = trip_points;
  assign dbg_pd[99:88] = 'b0;                                    // spare

  //***************************************************************************
  // pd_read_valid pipeline shifter
  //***************************************************************************

  generate
    begin: gen_rvpls

      if(RVPLS_WIDTH == 0)
      begin
        assign read_valid_pl = pd_read_valid;
      end
      else if(RVPLS_WIDTH == 1)
      begin
        reg [RVPLS_WIDTH-1:0] read_valid_shftr;

        always @(posedge clk)
        if (reset) read_valid_shftr <= #TCQ 'b0;
        else       read_valid_shftr <= #TCQ pd_read_valid;

        assign read_valid_pl = read_valid_shftr[RVPLS_WIDTH-1];
      end
      else
      begin
        reg [RVPLS_WIDTH-1:0] read_valid_shftr;

        always @(posedge clk)
        if (reset) read_valid_shftr <= #TCQ 'b0;
        else       read_valid_shftr <= #TCQ {read_valid_shftr[RVPLS_WIDTH-2:0], pd_read_valid};

        assign read_valid_pl = read_valid_shftr[RVPLS_WIDTH-1];
      end
    end
  endgenerate

  //***************************************************************************
  // phase shift interface
  //***************************************************************************

  always @(posedge clk)
    if (reset) pd_en <= #TCQ 1'b0;
    else       pd_en <= #TCQ update_phase;

  assign pd_incdec = high_ge_low;

  //***************************************************************************
  // inc/dec control
  //***************************************************************************

  assign rev_direction_ce = first_calib_sample & pd_en & (pd_incdec ~^ dqs_dly_val_r[4]);

  always @(posedge clk)
  begin
    if (reset)
    begin
      first_calib_sample <= #TCQ 1'b1;
      rev_direction      <= #TCQ 1'b0;
    end
    else
    begin
      if(pd_en)            first_calib_sample <= #TCQ 1'b0;
      if(rev_direction_ce) rev_direction      <= #TCQ 1'b1;
    end
  end

  assign pd_en_calib          = (pd_en & ~pd_cal_done_i & ~first_calib_sample) | dbg_pd_inc_dqs | dbg_pd_dec_dqs;
  assign pd_incdec_calib      = (pd_incdec ^ rev_direction) | dbg_pd_inc_dqs;

  assign enab_maintenance     = dfi_init_complete & ~dbg_pd_maintain_off;
  assign pd_en_maintain_d     = (pd_en &  pd_cal_done_i & enab_maintenance & ~block_change) | dbg_pd_inc_cpt | dbg_pd_dec_cpt;
  assign pd_incdec_maintain_d = (~pd_incdec_calib | dbg_pd_inc_cpt) & ~dbg_pd_dec_cpt;

  always @(posedge clk)  // pipeline maintenance control signals
  begin
    if (reset)
    begin
      pd_en_maintain     <= #TCQ 1'b0;
      pd_incdec_maintain <= #TCQ 1'b0;
    end
    else
    begin
      pd_en_maintain     <= #TCQ pd_en_maintain_d;
      pd_incdec_maintain <= #TCQ pd_incdec_maintain_d;
    end
  end

  //***************************************************************************
  // dqs delay value counter
  //***************************************************************************

  always @(posedge clk)
  begin
    if (rst)
    begin
      dqs_dly_val_r <= #TCQ 5'b0_0000;
    end
    else if(ld_dqs_dly_val_r)
    begin
      dqs_dly_val_r <= #TCQ dqs_dly_val_in;
    end
    else
    begin
      if(pd_en_calib)
      begin
        if(pd_incdec_calib) dqs_dly_val_r <= #TCQ dqs_dly_val_r + 1;
        else                dqs_dly_val_r <= #TCQ dqs_dly_val_r - 1;
      end
    end
  end

  assign dqs_dly_val = dqs_dly_val_r;

  //***************************************************************************
  // reset synchronization
  //***************************************************************************

  always @(posedge clk or posedge rst)
    if (rst) reset <= #TCQ 1'b1;
    else     reset <= #TCQ 1'b0;

  //***************************************************************************
  // pd state assignments
  //***************************************************************************

  localparam PD_IDLE         = 3'h0;
  localparam PD_CLR_CNTRS    = 3'h1;
  localparam PD_INC_CNTRS    = 3'h2;
  localparam PD_UPDATE       = 3'h3;
  localparam PD_WAIT         = 3'h4;

  //***************************************************************************
  // State register
  //***************************************************************************

  always @(posedge clk)
    if (reset) pd_state_r <= #TCQ 'b0;
    else       pd_state_r <= #TCQ pd_next_state;

  //***************************************************************************
  // Next pd state
  //***************************************************************************

  always @(pd_state_r or pd_cal_start or dbg_pd_off or samples_done_pl[2] or pd_incdec_done)
  begin
    pd_next_state    = PD_IDLE; // default state is idle
    ld_dqs_dly_val_r = 1'b0;
    case (pd_state_r)
      PD_IDLE         : begin // (0) wait for pd_cal_start
                          if(pd_cal_start)
                          begin
                            pd_next_state    = PD_CLR_CNTRS;
                            ld_dqs_dly_val_r = 1'b1;
                          end
                        end
      PD_CLR_CNTRS    : begin // (1) clr low and high counters
                          if(~dbg_pd_off) pd_next_state = PD_INC_CNTRS;
                          else            pd_next_state = PD_CLR_CNTRS;
                        end
      PD_INC_CNTRS    : begin // (2) conditionally inc low and high counters
                          if(samples_done_pl[2]) pd_next_state = PD_UPDATE;
                          else                   pd_next_state = PD_INC_CNTRS;
                        end
      PD_UPDATE       : begin // (3) pulse pd_en
                          pd_next_state = PD_WAIT;
                        end
      PD_WAIT         : begin // (4) wait for pd_incdec_done
                          if(pd_incdec_done) pd_next_state = PD_CLR_CNTRS;
                          else               pd_next_state = PD_WAIT;
                        end
    endcase
  end

  //***************************************************************************
  // pd state translations
  //***************************************************************************

  assign inc_cntrs    = (pd_state_r == PD_INC_CNTRS) & read_valid_pl & ~samples_done;
  assign clr_low_high = reset | (pd_state_r == PD_CLR_CNTRS);
  assign low_high_ce  = inc_cntrs;
  assign update_phase = (pd_state_r == PD_UPDATE);

  //***************************************************************************
  // pd_cal_done generator
  //***************************************************************************

  assign calib_done_cntr_inc = high_ge_low ~^ calib_done_cntr[0];
  assign calib_done_cntr_ce  = update_phase & ~calib_done_cntr[CDC_WIDTH-1] & ~first_calib_sample;

  always @(posedge clk)
    if (reset)                  calib_done_cntr <= #TCQ 'b0;
    else if(calib_done_cntr_ce) calib_done_cntr <= #TCQ calib_done_cntr + calib_done_cntr_inc;

  assign pd_cal_done_i = calib_done_cntr[CDC_WIDTH-1] | dbg_pd_off;
  assign pd_cal_done   = pd_cal_done_i;

  //***************************************************************************
  // addemd gemerators (pipelined)
  //***************************************************************************

  // trip_points  h_addend  l_addend
  // -----------  --------  --------
  //     00          00        10
  //     01          01        01
  //     10          01        01
  //     11          10        00

  always @(posedge clk)
  begin
    if (reset)
    begin
      l_addend <= #TCQ 'b0;
      h_addend <= #TCQ 'b0;
    end
    else
    begin
      l_addend <= #TCQ {~trip_points[1] & ~trip_points[0], trip_points[1] ^ trip_points[0]};
      h_addend <= #TCQ { trip_points[1] &  trip_points[0], trip_points[1] ^ trip_points[0]};
    end
  end

  //***************************************************************************
  // low counter
  //***************************************************************************

  assign low_d = low + {{LHC_WIDTH-2{1'b0}}, l_addend};

  always @(posedge clk)
    if (clr_low_high)    low <= #TCQ 'b0;
    else if(low_high_ce) low <= #TCQ low_d;

  //***************************************************************************
  // high counter
  //***************************************************************************

  assign high_d = high + {{LHC_WIDTH-2{1'b0}}, h_addend};

  always @(posedge clk)
    if (clr_low_high)    high <= #TCQ 'b0;
    else if(low_high_ce) high <= #TCQ high_d;

  //***************************************************************************
  // samples_done pipeline shifter
  //***************************************************************************

  // This shifter delays samples_done rising edge until the nearly_done logic has completed
  // the pass through its pipeline.

  always @(posedge clk)
    if (reset) samples_done_pl <= #TCQ 'b0;
    else       samples_done_pl <= #TCQ {samples_done_pl[1] & samples_done,
                                        samples_done_pl[0] & samples_done, samples_done};

  //***************************************************************************
  // pd_done logic
  //***************************************************************************

  // This logic adds a delay after pd_en is pulsed.  This delay is necessary
  // to allow the effect of the delay tap change to cycle through to the addends,
  // where it can then be sampled in the low and high counters.

  localparam PD_DONE_IDLE    = 4'd0;
  localparam PD_DONE_MAX     = 4'd10;

  // pd_done registers
  always @(posedge clk)
  begin
    if (reset)
    begin
      pd_done_state_r <= #TCQ  'b0;
      pd_incdec_done  <= #TCQ 1'b0;
    end
    else
    begin
      pd_done_state_r <= #TCQ pd_done_next_state;
      pd_incdec_done  <= #TCQ pd_incdec_done_next;
    end
  end

  // pd_done next generator
  always @(pd_done_state_r or pd_en)
  begin
    pd_done_next_state  = pd_done_state_r + 1; // dflt pd_done_next_state is + 1
    pd_incdec_done_next = 1'b0;                // dflt pd_incdec_done is false

    case (pd_done_state_r)
      PD_DONE_IDLE : begin // (0) wait for pd_en
                       if(~pd_en) pd_done_next_state = PD_DONE_IDLE;
                     end
      PD_DONE_MAX  : begin // (10)
                       pd_done_next_state  = PD_DONE_IDLE;
                       pd_incdec_done_next = 1'b1;
                     end
    endcase
  end

endmodule
