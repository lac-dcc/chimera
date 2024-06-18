// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//////////////////////////////////////////////////////////////////////
////                                                              ////
////  spi_shift.v                                                 ////
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

module spi_shift #(
  parameter SPI_CHAR_LEN_BITS = 10
)(

  input                           clk,          // system clock
  input                           rst,          // reset
  input       [31:0]              len,          // data len in bits (minus one)
  input                           lsb,          // lbs first on the line
  input                           go,           // start stansfer
  input                           pos_edge,     // recognize posedge of sclk
  input                           neg_edge,     // recognize negedge of sclk
  input                           rx_negedge,   // s_in is sampled on negative edge
  input                           tx_negedge,   // s_out is driven on negative edge
  output  reg                     tip,          // transfer in progress
  output                          last,         // last bit
  input                           s_clk,        // serial clock
  input                           s_in,         // serial in
  output  reg                     s_out,        // serial out
  output  reg [SPI_MAX_CHAR-1:0]  miso_data,    // parallel out
  input       [SPI_MAX_CHAR-1:0]  mosi_data     // parallel out
);

localparam  SPI_MAX_CHAR        = 2 ** SPI_CHAR_LEN_BITS;


//Local Parameters

//Registers/Wires
reg     [31:0]                  cnt;          // data bit count
reg     [SPI_MAX_CHAR-1:0]      data;         // shift register
wire                            rx_clk;       // rx clock enable
wire                            tx_clk;       // tx clock enable


//Submodules

//Asynchronous Logic
assign last = !(|cnt);

assign rx_clk = (rx_negedge ? neg_edge : pos_edge) && (!last || s_clk);
assign tx_clk = (tx_negedge ? neg_edge : pos_edge) && !last;

//Synchronous Logic

// Character bit counter
always @(posedge clk) begin
  if(rst) begin
    cnt <=  0;
  end
  else begin
    if(tip) begin
      cnt <=  pos_edge ? (cnt - 1) : cnt;
    end
    else begin
      //if len is zero then we put in the max
      //else put in the number specified
      cnt <=  !(|len) ? {1'b1, {SPI_CHAR_LEN_BITS{1'b0}}} : len;
    end
  end
end

// Transfer in progress
always @(posedge clk) begin
  if(rst) begin
    tip <=  1'b0;
  end
  else begin
    if(go && ~tip) begin
      tip <=  1'b1;
    end
    else if(tip && last && pos_edge) begin
      tip <=  1'b0;
    end
  end
end

// Sending bits to the line
always @(posedge clk) begin
  if (rst) begin
    s_out   <=  1'b0;
    data    <=  0;
  end
  else begin
    if (tx_clk && tip) begin
      if (!lsb) begin
        s_out         <=  data[(SPI_MAX_CHAR - 1)];
        data     <=  {data[(SPI_MAX_CHAR - 2):0], 1'b1};
      end
      else begin
        s_out         <=  data[0];
        data     <=  {1'b1, data[(SPI_MAX_CHAR - 1):1]};
      end
    end
    if (!tip) begin
      data            <=  mosi_data;
    end
  end
end

// Receiving bits from the line
always @(posedge clk) begin
  if (rst) begin
    miso_data     <=  0;
  end
  else begin
    if (rx_clk) begin
      //Clock data in on the receive clock
      miso_data <=  {miso_data[(SPI_MAX_CHAR - 2):0], s_in};
    end
  end
end

endmodule

