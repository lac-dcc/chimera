// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

// --------------------------------------------------------------------------------------------
// © 2002 Xilinx, Inc. All rights reserved. All Xilinx trademarks, registered trademarks, 
// patents, and further disclaimers are as listed at http://www.xilinx.com/legal.htm. All 
// other trademarks and registered trademarks are the property of their respective owners. 
// All specifications are subject to change without notice.
// --------------------------------------------------------------------------------------------
// NOTICE OF DISCLAIMER: Xilinx is providing this design, code, or information "as is." 
// By providing the design, code, or information as one possible implementation of this 
// feature, application, or standard, Xilinx makes no representation that this implementation
// is free from any claims of infringement. You are responsible for obtaining any rights
// you may require for your implementation. Xilinx expressly disclaims any warranty whatsoever
// with respect to the adequacy of the implementation, including but not limited to any 
// warranties or representations that this implementation is free from claims of infringement
// and any implied warranties of merchantability or fitness for a particular purpose. 
// --------------------------------------------------------------------------------------------
// 
// 
// Color Space Converter (top-level)
//
// Benoit Payette, Xilinx AE, Montreal 
// July 09, 2002
// 
// SynplifyPRO v7.1 for synthesis
// MTI v5.6 for simulation
//
// This file is the Verilog csc_top 
//
// Description: This is the TOP module.  It replicates the real design environement.
//
// Assumptions:
//  (a) R,G,B are 8-bit gamma-corrected values with full 0-255 range
//  (b) ITU-R BT.601-2 component video standards (SDTV), 4:4:4 encoding
//  (c) possible YCbCr range is 0-255, but ITU specifies:
//      Y  has a range of 16-235, 8-bit
//      Cb has a range of 16-240, 8-bit
//      Cr has a range of 16-240, 8-bit
//  (d) code 0 and 255 are used for synchronization when 4:2:2
//  
//  
// Simple Test vectors (100% RGB Color Bars):
//   white:   R=255, G=255, B=255   |  Y=235, Cb=128, Cr=128
//   yellow:  R=255, G=255, B=  0   |  Y=210, Cb= 16, Cr=146
//   cyan:    R=  0, G=255, B=255   |  Y=170, Cb=166, Cr= 16
//   green:   R=  0, G=255, B=  0   |  Y=145, Cb= 54, Cr= 34
//   magenta: R=255, G=  0, B=255   |  Y=107, Cb=202, Cr=222
//   red:     R=255, G=  0, B=  0   |  Y= 82, Cb= 90, Cr=240
//   blue:    R=  0, G=  0, B=255   |  Y= 41, Cb=240, Cr=110
//   black:   R=  0, G=  0, B=  0   |  Y= 16, Cb=128, Cr=128
// 
// Simple Test vectors ( 75% RGB Color Bars):
//   white:   R=191, G=191, B=191   |  Y=180, Cb=128, Cr=128
//   yellow:  R=191, G=191, B=  0   |  Y=161, Cb= 44, Cr=142
//   cyan:    R=  0, G=191, B=191   |  Y=131, Cb=156, Cr= 44
//   green:   R=  0, G=191, B=  0   |  Y=112, Cb= 72, Cr= 58
//   magenta: R=191, G=  0, B=191   |  Y= 84, Cb=184, Cr=198
//   red:     R=191, G=  0, B=  0   |  Y= 65, Cb=100, Cr=212
//   blue:    R=  0, G=  0, B=191   |  Y= 35, Cb=212, Cr=114
//   black:   R=  0, G=  0, B=  0   |  Y= 16, Cb=128, Cr=128
// 
// Simple Test vectors (50% RGB Color Bars):
//   white:   R=128, G=128, B=128   |  Y=126, Cb=128, Cr=128
//   yellow:  R=128, G=128, B=  0   |  Y=113, Cb= 72, Cr=137
//   cyan:    R=  0, G=128, B=128   |  Y= 93, Cb=147, Cr= 72
//   green:   R=  0, G=128, B=  0   |  Y= 81, Cb= 91, Cr= 81
//   magenta: R=128, G=  0, B=128   |  Y= 61, Cb=165, Cr=175
//   red:     R=128, G=  0, B=  0   |  Y= 49, Cb=109, Cr=184
//   blue:    R=  0, G=  0, B=128   |  Y= 29, Cb=184, Cr=119
//   black:   R=  0, G=  0, B=  0   |  Y= 16, Cb=128, Cr=128
// 
// Simple Test vectors (25% RGB Color Bars):
//   white:   R= 64, G= 64, B= 64   |  Y= 71, Cb=128, Cr=128
//   yellow:  R= 64, G= 64, B=  0   |  Y= 65, Cb=100, Cr=133
//   cyan:    R=  0, G= 64, B= 64   |  Y= 55, Cb=137, Cr=100
//   green:   R=  0, G= 64, B=  0   |  Y= 48, Cb=109, Cr=104
//   magenta: R= 64, G=  0, B= 64   |  Y= 39, Cb=147, Cr=152
//   red:     R= 64, G=  0, B=  0   |  Y= 32, Cb=119, Cr=156
//   blue:    R=  0, G=  0, B= 64   |  Y= 22, Cb=156, Cr=123
//   black:   R=  0, G=  0, B=  0   |  Y= 16, Cb=128, Cr=128
// 
//
//

`timescale 1ns / 10ps

module csc_top
(
  Clock,
  ClockEnable,
  Reset,
  Red,
  Green,
  Blue,
  Y,
  Cb,
  Cr
);

  parameter TOP_OUT_SIZE  =  8; // uncomment to get  8-bit input & output...
//  parameter TOP_OUT_SIZE  = 10; // uncomment to get 10-bit input & output...

  input  Clock; 
  input  ClockEnable; 
  input  Reset; 
  input  [(TOP_OUT_SIZE - 1):0] Red; 
  input  [(TOP_OUT_SIZE - 1):0] Green; 
  input  [(TOP_OUT_SIZE - 1):0] Blue; 
  output [(TOP_OUT_SIZE - 1):0] Y; 
  output [(TOP_OUT_SIZE - 1):0] Cb; 
  output [(TOP_OUT_SIZE - 1):0] Cr; 

  reg [(TOP_OUT_SIZE - 1):0] Y;
  reg [(TOP_OUT_SIZE - 1):0] Cb;
  reg [(TOP_OUT_SIZE - 1):0] Cr;

  // Define internal signals
  reg [(TOP_OUT_SIZE - 1):0] R; 
  reg [(TOP_OUT_SIZE - 1):0] G; 
  reg [(TOP_OUT_SIZE - 1):0] B; 

  wire [(TOP_OUT_SIZE - 1):0] Y_sig; 
  wire [(TOP_OUT_SIZE - 1):0] Cb_sig; 
  wire [(TOP_OUT_SIZE - 1):0] Cr_sig; 

  // Input registers (should be pushed into IOBs)
  always @(posedge Clock or posedge Reset)
  begin : In_Reg
    if (Reset)
    begin
      R <= 0;
      G <= 0;
      B <= 0;
    end
    else if (ClockEnable)
    begin
      R <= Red ; 
      G <= Green ; 
      B <= Blue ; 
    end 
  end 

  // Output registers (should be pushed into IOBs)
  always @(posedge Clock or posedge Reset)
  begin : Out_Reg
    if (Reset)
    begin
      Y  <= 0;
      Cb <= 0;
      Cr <= 0;
    end
    else if (ClockEnable)
    begin
      Y  <= Y_sig ; 
      Cb <= Cb_sig ; 
      Cr <= Cr_sig ; 
    end 
  end 


  // CSC instantiation
  csc  #(TOP_OUT_SIZE) CSC_module
  (
    .Clock(Clock),
    .ClockEnable(ClockEnable),
    .Reset(Reset),
    .R(R),
    .G(G),
    .B(B),
    .Y(Y_sig),
    .Cb(Cb_sig),
    .Cr(Cr_sig)
  );


endmodule
