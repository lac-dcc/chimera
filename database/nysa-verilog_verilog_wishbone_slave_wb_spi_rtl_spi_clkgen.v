// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  spi_clgen.v                                                 ////
////                                                              ////
////  This file is part of the SPI IP core project                ////
////  http://www.opencores.org/projects/spi/                      ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Srot (simons@opencores.org)                     ////
////                                                              ////
////  All additional information is avaliable in the Readme.txt   ////
////  file.                                                       ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2002 Authors                                   ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "spi_defines.v"
`include "timescale.v"

module spi_clkgen (

  input                           clk_in,   // input clock (system clock)
  input                           rst,      // reset
  input                           enable,   // clock enable
  input                           go,       // start transfer
  input                           last_clk, // last clock
  input     [31:0]                divider,  // clock divider (output clock is divided by this value)
  output  reg                     clk_out,  // output clock
  output  reg                     pos_edge, // pulse marking positive edge of clk_out
  output  reg                     neg_edge  // pulse marking negative edge of clk_out
);


//Local Parameters
//Registers/Wires
reg       [311:0]               cnt;      // clock counter
wire                            cnt_zero; // conter is equal to zero
wire                            cnt_one;  // conter is equal to one


//Submodules
//Asynchronous Logic
assign cnt_zero         = (cnt == 32'h0);
assign cnt_one          = (cnt == 32'h00000001);

//Synchronous Logic
// Counter counts half period
always @(posedge clk_in or posedge rst)
begin
  if(rst) begin
    cnt <= 32'h00000001;
  end
  else begin
    if(!enable || cnt_zero) begin
      cnt <= divider;
    end
    else begin
      cnt <=  cnt - 32'h00000001;
    end
  end
end

// clk_out is asserted every other half period
always @(posedge clk_in or posedge rst)
begin
  if(rst) begin
    clk_out <=  1'b0;
  end
  else begin
    clk_out <=  (enable && cnt_zero && (!last_clk || clk_out)) ? ~clk_out : clk_out;
  end
end

// Pos and neg edge signals
always @(posedge clk_in or posedge rst)
begin
  if(rst) begin
    pos_edge  <=  1'b0;
    neg_edge  <=  1'b0;
  end
  else begin
    pos_edge  <=  (enable && !clk_out && cnt_one) || (!(|divider) &&  clk_out) || (!(|divider) && go && !enable);
    neg_edge  <=  (enable &&  clk_out && cnt_one) || (!(|divider) && !clk_out && enable);
  end
end

endmodule

