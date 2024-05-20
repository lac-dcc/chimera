// This program was cloned from: https://github.com/cis5710/cis5710-homework
// License: MIT License

`default_nettype none

// file: clk_wiz_0.v
// (c) Copyright 2017-2018, 2023 Advanced Micro Devices, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary_________100.000____________0.010

`timescale 1ps/1ps


// TODO: set your desired clock frequency here. ONLY ONE should be defined at a time.
//`define CLOCK_5_MHZ
`define CLOCK_5_5_MHZ
//`define CLOCK_6_MHZ
//`define CLOCK_6_5_MHZ
//`define CLOCK_7_MHZ
//`define CLOCK_7_5_MHZ
//`define CLOCK_8_MHZ
//`define CLOCK_8_5_MHZ
//`define CLOCK_9_MHZ
//`define CLOCK_9_5_MHZ
//`define CLOCK_10_MHZ
//`define CLOCK_11_MHZ
//`define CLOCK_12_MHZ
//`define CLOCK_13_MHZ
//`define CLOCK_14_MHZ
//`define CLOCK_15_MHZ
//`define CLOCK_16_MHZ
//`define CLOCK_20_MHZ
//`define CLOCK_25_MHZ
//`define CLOCK_30_MHZ
//`define CLOCK_32_MHZ
//`define CLOCK_35_MHZ
//`define CLOCK_40_MHZ
//`define CLOCK_45_MHZ
//`define CLOCK_50_MHZ
//`define CLOCK_55_MHZ
//`define CLOCK_60_MHZ
//`define CLOCK_65_MHZ
//`define CLOCK_70_MHZ
//`define CLOCK_75_MHZ
//`define CLOCK_80_MHZ
//`define CLOCK_85_MHZ
//`define CLOCK_90_MHZ
//`define CLOCK_95_MHZ
//`define CLOCK_100_MHZ
//`define CLOCK_105_MHZ

module clk_wiz_0_clk_wiz 

 (// Clock in ports
  // Clock out ports
  output wire       clk_proc,
  output wire       clk_mem,
  // Status and control signals
  input wire        reset,
  output wire       locked,
  input wire        clk_in1
 );
  // Input buffering
  //------------------------------------
wire clk_in1_clk_wiz_0;
wire clk_in2_clk_wiz_0;
  IBUF clkin1_ibufg
   (.O (clk_in1_clk_wiz_0),
    .I (clk_in1));




  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        clk_proc_clk_wiz_0;
  wire        clk_mem_clk_wiz_0;
  wire        clk_oled_clk_wiz_0;
  wire        clk_out4_clk_wiz_0;
  wire        clk_out5_clk_wiz_0;
  wire        clk_out6_clk_wiz_0;
  wire        clk_out7_clk_wiz_0;

  wire [15:0] do_unused;
  wire        drdy_unused;
  wire        psdone_unused;
  wire        locked_int;
  wire        clkfbout_clk_wiz_0;
  wire        clkfbout_buf_clk_wiz_0;
  wire        clkfboutb_unused;
    wire clkout0b_unused;
   wire clkout1b_unused;
   wire clkout2_unused;
   wire clkout2b_unused;
   wire clkout3_unused;
   wire clkout3b_unused;
   wire clkout4_unused;
  wire        clkout5_unused;
  wire        clkout6_unused;
  wire        clkfbstopped_unused;
  wire        clkinstopped_unused;
  wire        reset_high;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg  [7 :0] seq_reg1 = 0;
  (* KEEP = "TRUE" *) 
  (* ASYNC_REG = "TRUE" *)
  reg  [7 :0] seq_reg2 = 0;

  // Translate desired clock frequency into mmcm parameters for our ZedBoard. 
  // These values were extracted from the Vivado Clocking Wizard.
  `ifdef CLOCK_5_MHZ
  `define CLKFBOUT_MULT_F 32.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 128
  `elsif CLOCK_5_5_MHZ
  `define CLKFBOUT_MULT_F 6.875
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 125
  `elsif CLOCK_6_MHZ
  `define CLKFBOUT_MULT_F 7.500
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 125
  `elsif CLOCK_6_5_MHZ
  `define CLKFBOUT_MULT_F 8.125
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 125
  `elsif CLOCK_7_MHZ
  `define CLKFBOUT_MULT_F 8.750
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 125
  `elsif CLOCK_7_5_MHZ
  `define CLKFBOUT_MULT_F 48.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 128
  `elsif CLOCK_8_MHZ
  `define CLKFBOUT_MULT_F 10.000
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 125
  `elsif CLOCK_8_5_MHZ
  `define CLKFBOUT_MULT_F 51.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 120
  `elsif CLOCK_9_MHZ
  `define CLKFBOUT_MULT_F 49.500
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 110
  `elsif CLOCK_9_5_MHZ
  `define CLKFBOUT_MULT_F 49.875
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 105
  `elsif CLOCK_10_MHZ
  `define CLKFBOUT_MULT_F 10.000
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 100
  `elsif CLOCK_11_MHZ
  `define CLKFBOUT_MULT_F 49.500
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 90
  `elsif CLOCK_12_MHZ
  `define CLKFBOUT_MULT_F 51.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 85
  `elsif CLOCK_13_MHZ
  `define CLKFBOUT_MULT_F 9.750
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 75
  `elsif CLOCK_14_MHZ
  `define CLKFBOUT_MULT_F 49.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 70
  `elsif CLOCK_15_MHZ
  `define CLKFBOUT_MULT_F 50.250
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 67
  `elsif CLOCK_16_MHZ
  `define CLKFBOUT_MULT_F 48.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 60
  `elsif CLOCK_20_MHZ
  `define CLKFBOUT_MULT_F 10.000
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 50
  `elsif CLOCK_25_MHZ
  `define CLKFBOUT_MULT_F 10.000
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 40
  `elsif CLOCK_30_MHZ
  `define CLKFBOUT_MULT_F 49.500
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 33
  `elsif CLOCK_32_MHZ
  `define CLKFBOUT_MULT_F 48.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 30
  `elsif CLOCK_35_MHZ
  `define CLKFBOUT_MULT_F 50.750
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 29
  `elsif CLOCK_40_MHZ
  `define CLKFBOUT_MULT_F 10.000
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 25
  `elsif CLOCK_45_MHZ
  `define CLKFBOUT_MULT_F 49.500
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 22
  `elsif CLOCK_50_MHZ
  `define CLKFBOUT_MULT_F 10.000
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 20
  `elsif CLOCK_55_MHZ
  `define CLKFBOUT_MULT_F 49.500
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 18
  `elsif CLOCK_60_MHZ
  `define CLKFBOUT_MULT_F 51.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 17
  `elsif CLOCK_65_MHZ
  `define CLKFBOUT_MULT_F 9.750
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 15
  `elsif CLOCK_70_MHZ
  `define CLKFBOUT_MULT_F 49.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 14
  `elsif CLOCK_75_MHZ
  `define CLKFBOUT_MULT_F 9.750
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 13
  `elsif CLOCK_80_MHZ
  `define CLKFBOUT_MULT_F 48.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 12
  `elsif CLOCK_85_MHZ
  `define CLKFBOUT_MULT_F 51.000
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 12
  `elsif CLOCK_90_MHZ
  `define CLKFBOUT_MULT_F 49.500
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 11
  `elsif CLOCK_95_MHZ
  `define CLKFBOUT_MULT_F 52.250
  `define DIVCLK_DIVIDE 5
  `define CLKOUT_DIVIDE_F 11
  `elsif CLOCK_100_MHZ
  `define CLKFBOUT_MULT_F 10.000
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 10
  `elsif CLOCK_105_MHZ
  `define CLKFBOUT_MULT_F 10.500
  `define DIVCLK_DIVIDE 1
  `define CLKOUT_DIVIDE_F 10

  // template for additional frequencies
  `elsif CLOCK_?_MHZ
  `define CLKFBOUT_MULT_F ?.000
  `define DIVCLK_DIVIDE ?
  `define CLKOUT_DIVIDE_F ?

  // if no frequency was specified, trigger a compiler error
  `else
  `define CLKFBOUT_MULT_F must_specify_a_clock_frequency
  `define DIVCLK_DIVIDE must_specify_a_clock_frequency
  `define CLKOUT_DIVIDE_F must_specify_a_clock_frequency
  `endif

  MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (`DIVCLK_DIVIDE),
    .CLKFBOUT_MULT_F      (`CLKFBOUT_MULT_F),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (`CLKOUT_DIVIDE_F),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKOUT1_DIVIDE       (`CLKOUT_DIVIDE_F),
    .CLKOUT1_PHASE        (90.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (10.000))
  mmcm_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_clk_wiz_0),
    .CLKFBOUTB           (clkfboutb_unused),
    .CLKOUT0             (clk_proc_clk_wiz_0),
    .CLKOUT0B            (clkout0b_unused),
    .CLKOUT1             (clk_mem_clk_wiz_0),
    .CLKOUT1B            (clkout1b_unused),
    .CLKOUT2             (clkout2_unused),
    .CLKOUT2B            (clkout2b_unused),
    .CLKOUT3             (clkout3_unused),
    .CLKOUT3B            (clkout3b_unused),
    .CLKOUT4             (clkout4_unused),
    .CLKOUT5             (clkout5_unused),
    .CLKOUT6             (clkout6_unused),
     // Input clock control
    .CLKFBIN             (clkfbout_buf_clk_wiz_0),
    .CLKIN1              (clk_in1_clk_wiz_0),
    .CLKIN2              (1'b0),
     // Tied to always select the primary input clock
    .CLKINSEL            (1'b1),
    // Ports for dynamic reconfiguration
    .DADDR               (7'h0),
    .DCLK                (1'b0),
    .DEN                 (1'b0),
    .DI                  (16'h0),
    .DO                  (do_unused),
    .DRDY                (drdy_unused),
    .DWE                 (1'b0),
    // Ports for dynamic phase shift
    .PSCLK               (1'b0),
    .PSEN                (1'b0),
    .PSINCDEC            (1'b0),
    .PSDONE              (psdone_unused),
    // Other control and status signals
    .LOCKED              (locked_int),
    .CLKINSTOPPED        (clkinstopped_unused),
    .CLKFBSTOPPED        (clkfbstopped_unused),
    .PWRDWN              (1'b0),
    .RST                 (reset_high));
  assign reset_high = reset; 

  assign locked = locked_int;
// Clock Monitor clock assigning
//--------------------------------------
 // Output buffering
  //-----------------------------------

  BUFG clkf_buf
   (.O (clkfbout_buf_clk_wiz_0),
    .I (clkfbout_clk_wiz_0));







  BUFGCE clkout1_buf
   (.O   (clk_proc),
    .CE  (seq_reg1[7]),
    .I   (clk_proc_clk_wiz_0));

  wire clk_proc_clk_wiz_0_en_clk;
  BUFH clkout1_buf_en
   (.O   (clk_proc_clk_wiz_0_en_clk),
    .I   (clk_proc_clk_wiz_0));
  always @(posedge clk_proc_clk_wiz_0_en_clk or posedge reset_high) begin
    if(reset_high == 1'b1) begin
	    seq_reg1 <= 8'h00;
    end
    else begin
        seq_reg1 <= {seq_reg1[6:0],locked_int};
  
    end
  end


  BUFGCE clkout2_buf
   (.O   (clk_mem),
    .CE  (seq_reg2[7]),
    .I   (clk_mem_clk_wiz_0));
 
  wire clk_mem_clk_wiz_0_en_clk;
  BUFH clkout2_buf_en
   (.O   (clk_mem_clk_wiz_0_en_clk),
    .I   (clk_mem_clk_wiz_0));
 
  always @(posedge clk_mem_clk_wiz_0_en_clk or posedge reset_high) begin
    if(reset_high == 1'b1) begin
	  seq_reg2 <= 8'h00;
    end
    else begin
        seq_reg2 <= {seq_reg2[6:0],locked_int};
  
    end
  end





endmodule
