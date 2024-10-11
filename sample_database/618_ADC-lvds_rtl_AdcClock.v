// This program was cloned from: https://github.com/cjhonlyone/ADC-lvds
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/21 18:36:01
// Design Name: 
// Module Name: AdcClock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module AdcClock #(
    parameter AdcDCLKFrequency = 84,
    parameter AdcFCLKFrequency = 12,
    parameter CLKFBOUT_MULT_F = 12,
    parameter CLKOUT1_DIVIDE = 84
)
(
  output        clk_out1,
  output        clk_out2,
  output        clk_out1b,
  output        clk_out2b,
  output        clk_out3,
  output        clk_out4,
  // Status and control signals
  input         reset,
  output        locked,
  input         clk_in1_p,
  input         clk_in1_n
);

localparam CLKIN1_PERIOD = 1000/AdcDCLKFrequency;
// localparam CLKFBOUT_MULT_F;
// generate
//     genvar i;
//     if (AdcDCLKFrequency/AdcFCLKFrequency)
//     for (i = 0;i<20;i=i+1) begin
//         if ((AdcDCLKFrequency*i < 1150) && (AdcDCLKFrequency*i > 850)) begin
//             CLKFBOUT_MULT_F = i;
//         end
//     end
// endgenerate

localparam CLKOUT0_DIVIDE_F = CLKFBOUT_MULT_F;
// localparam CLKOUT1_DIVIDE = CLKFBOUT_MULT_F*AdcDCLKFrequency/AdcFCLKFrequency;
localparam CLKOUT2_DIVIDE = CLKOUT1_DIVIDE;
localparam CLKOUT3_DIVIDE = CLKOUT1_DIVIDE/2;
  // Input buffering
  //------------------------------------
wire clk_in1_clk_wiz_0;
wire clk_in2_clk_wiz_0;
  IBUFDS clkin1_ibufgds
   (.O  (clk_in1_clk_wiz_0),
    .I  (clk_in1_p),
    .IB (clk_in1_n));


  // Clocking PRIMITIVE
  //------------------------------------

  // Instantiation of the MMCM PRIMITIVE
  //    * Unused inputs are tied off
  //    * Unused outputs are labeled unused

  wire        clk_out1_clk_wiz_0;
  wire        clk_out2_clk_wiz_0;
  wire        clk_out1_clk_wiz_0b;
  wire        clk_out2_clk_wiz_0b;
  wire        clk_out3_clk_wiz_0;
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

  MMCME2_ADV
  #(.BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"),
    .COMPENSATION         ("ZHOLD"),
    .STARTUP_WAIT         ("FALSE"),
    .DIVCLK_DIVIDE        (1),
    .CLKFBOUT_MULT_F      (CLKFBOUT_MULT_F),
    .CLKFBOUT_PHASE       (0.000),
    .CLKFBOUT_USE_FINE_PS ("FALSE"),
    .CLKOUT0_DIVIDE_F     (CLKOUT0_DIVIDE_F),
    .CLKOUT0_PHASE        (0.000),
    .CLKOUT0_DUTY_CYCLE   (0.500),
    .CLKOUT0_USE_FINE_PS  ("FALSE"),
    .CLKOUT1_DIVIDE       (CLKOUT1_DIVIDE),
    .CLKOUT1_PHASE        (00.000),
    .CLKOUT1_DUTY_CYCLE   (0.500),
    .CLKOUT1_USE_FINE_PS  ("FALSE"),
    .CLKOUT2_DIVIDE       (CLKOUT2_DIVIDE),
    .CLKOUT2_PHASE        (00.000),
    .CLKOUT2_DUTY_CYCLE   (0.500),
    .CLKOUT2_USE_FINE_PS  ("FALSE"),
    .CLKOUT3_DIVIDE       (CLKOUT3_DIVIDE),
    .CLKOUT3_PHASE        (00.000),
    .CLKOUT3_DUTY_CYCLE   (0.500),
    .CLKOUT3_USE_FINE_PS  ("FALSE"),
    .CLKIN1_PERIOD        (CLKIN1_PERIOD))
  mmcm_adv_inst
    // Output clocks
   (
    .CLKFBOUT            (clkfbout_clk_wiz_0),
    .CLKFBOUTB           (clkfboutb_unused),
    .CLKOUT0             (clk_out1_clk_wiz_0),
    .CLKOUT0B            (clk_out1_clk_wiz_0b),
    .CLKOUT1             (clk_out2_clk_wiz_0),
    .CLKOUT1B            (clk_out2_clk_wiz_0b),
    .CLKOUT2             (clk_out3_clk_wiz_0),
    .CLKOUT2B            (clk_out3_clk_wiz_0b),
    .CLKOUT3             (clk_out4_clk_wiz_0),
    .CLKOUT3B            (clk_out4_clk_wiz_0b),
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

  BUFG clkout1_buf
   (.O   (clk_out1),
    .I   (clk_out1_clk_wiz_0));


  BUFG clkout2_buf
   (.O   (clk_out2),
    .I   (clk_out2_clk_wiz_0));


  BUFG clkout1_bufb
   (.O   (clk_out1b),
    .I   (clk_out1_clk_wiz_0b));


  BUFG clkout2_bufb
   (.O   (clk_out2b),
    .I   (clk_out2_clk_wiz_0b));

  BUFG clkout3_buf
   (.O   (clk_out3),
    .I   (clk_out3_clk_wiz_0));

  BUFG clkout4_buf
   (.O   (clk_out4),
    .I   (clk_out4_clk_wiz_0));
    
endmodule
