// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

// file: relojes.v
// 
// (c) Copyright 2008 - 2010 Xilinx, Inc. All rights reserved.
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
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
// Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
// Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// CLK_OUT1    12.000      0.000      50.0      360.161    213.839
// CLK_OUT2     6.000      0.000      50.0      411.982    213.839
// CLK_OUT3     8.000      0.000      50.0      389.784    213.839
//
//----------------------------------------------------------------------------
// Input Clock   Input Freq (MHz)   Input Jitter (UI)
//----------------------------------------------------------------------------
// primary              50            0.010

`timescale 1ps/1ps
`default_nettype none

(* CORE_GENERATION_INFO = "relojes,clk_wiz_v1_8,{component_name=relojes,use_phase_alignment=false,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,feedback_source=FDBK_AUTO,primtype_sel=PLL_BASE,num_out_clk=3,clkin1_period=20.0,clkin2_period=20.0,use_power_down=false,use_reset=false,use_locked=false,use_inclk_stopped=false,use_status=false,use_freeze=false,use_clk_valid=false,feedback_type=SINGLE,clock_mgr_type=AUTO,manual_override=false}" *)
module relojes
 (// Clock in ports
  input wire        CLK_IN1,
  // Clock out ports
  output wire       CLK_OUT1,
  output wire       CLK_OUT2,
  output wire       CLK_OUT3,
  output wire       CLK_OUT4,
  output wire       CLK_OUT5);

  wire clkin1, clkout0, clkout1_unused, clkout2_unused, clkout3_unused, clkout4_unused, clkout5_unused;

  // Input buffering
  //------------------------------------
  IBUFG clkin1_buf
   (.O (clkin1),
    .I (CLK_IN1));


  // Clocking primitive
  //------------------------------------
  // Instantiation of the PLL primitive
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused
  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        locked_unused;
  wire        clkfbout;
  // wire        clkout4_unused;
//   wire        clkout5_unused;

  PLL_BASE
  #(.BANDWIDTH              ("OPTIMIZED"),
    .CLK_FEEDBACK           ("CLKFBOUT"),
    .COMPENSATION           ("SYSTEM_SYNCHRONOUS"),
    .DIVCLK_DIVIDE          (2),
    .CLKFBOUT_MULT          (25),
    .CLKFBOUT_PHASE         (0.000),
    .CLKOUT0_DIVIDE         (13),
    .CLKOUT0_PHASE          (0.000),
    .CLKOUT0_DUTY_CYCLE     (0.500),
    .CLKIN_PERIOD           (20.0),
    .REF_JITTER             (0.010))
  pll_base_inst
//     Output clocks
   (.CLKFBOUT              (clkfbout),
    .CLKOUT0               (clkout0),
    .CLKOUT1               (clkout1_unused),
    .CLKOUT2               (clkout2_unused),
    .CLKOUT3               (clkout3_unused),
    .CLKOUT4               (clkout4_unused),
    .CLKOUT5               (clkout5_unused),
    .LOCKED                (locked_unused),
    .RST                   (1'b0),
//      Input clock control
    .CLKFBIN               (clkfbout),
    .CLKIN                 (clkin1));

// DCM_SP #(
//   .CLKDV_DIVIDE(2.0),
//   .CLKFX_DIVIDE(25),
//   .CLKFX_MULTIPLY(24),
//   .CLKIN_DIVIDE_BY_2("FALSE"),
//   .CLKIN_PERIOD(20.0),
//   .CLKOUT_PHASE_SHIFT("NONE"),
//   .CLK_FEEDBACK("1X"),
//   .DESKEW_ADJUST("SYSTEM_SYNCHRONOUS"),
//   .DFS_FREQUENCY_MODE("LOW"),
//   .DLL_FREQUENCY_MODE("LOW"),
//   .DSS_MODE("NONE"),
//   .DUTY_CYCLE_CORRECTION("TRUE"),
//   .FACTORY_JF(16'hc080),
//   .PHASE_SHIFT(0),
//   .STARTUP_WAIT("FALSE")
// ) DCM_SP_inst (
//   .CLKFX(clkout0),
//   .CLKIN(clkin1),
//   .PSEN(1'b0)
// );

  // Output buffering
  //-----------------------------------


  wire clk48;
  BUFG clkout1_buf
   (.O   (clk48),
    .I   (clkout0));
//     
  reg clk8 = 1'b0;
  reg clk24 = 1'b0;
  reg clk12 = 1'b0;
  reg clk6 = 1'b0;


  reg[2:0] clkcounter = 0;
  assign CLK_OUT1 = clkcounter[0];
  assign CLK_OUT2 = clkcounter[1];
  assign CLK_OUT3 = clkcounter[2];
  assign CLK_OUT4 = clk8;
  assign CLK_OUT5 = clk48;

  reg[3:0] clk8ct = 1'b0;
  
  always @(posedge clk48) begin
    clk8 <= 1'b0;
    clk24 <= 1'b0;
    clk12 <= 1'b0;
    clk6 <= 1'b0;

    clkcounter <= clkcounter + 1;
    if (clkcounter[0] == 1'b1) clk24 <= 1'b1;
    if (clkcounter[1:0] == 1'b11) clk12 <= 1'b1;
    if (clkcounter[2:0] == 1'b111) clk6 <= 1'b1;

    if (clk8ct == 5) begin 
      clk8 <= 1'b1;
      clk8ct <= 1'b0;
    end else clk8ct <= clk8ct + 1;
  end

endmodule
