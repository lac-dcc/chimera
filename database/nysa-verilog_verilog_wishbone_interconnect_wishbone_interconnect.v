// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wishbone_interconnect.v
/*
Distributed under the MIT licesnse.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in 
the Software without restriction, including without limitation the rights to 
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
of the Software, and to permit persons to whom the Software is furnished to do 
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.
*/


/* 
    Thanks Rudolf Usselmann yours was a better implementation than mine

    Copyright (C) 2000-2002
    Rudolf Usselmann
    www.asics.ws
    rudi@asics.ws
*/
`timescale 1 ns/1 ps

module wishbone_interconnect (

  //control signals
  input               clk,
  input               rst,

  //wishbone master signals
  input               i_m_we,
  input               i_m_stb,
  input               i_m_cyc,
  input       [3:0]   i_m_sel,
  input       [31:0]  i_m_adr,
  input       [31:0]  i_m_dat,
  output reg  [31:0]  o_m_dat,
  output reg          o_m_ack,
  output              o_m_int,

${PORTS}

);


${ADDRESSES}

parameter ADDR_FF = 8'hFF;

//state

//wishbone slave signals

//this should be parameterized
wire [7:0]slave_select;
wire [31:0] interrupts;

assign slave_select =   i_m_adr[31:24];

${DATA}

${ACK}

${INT}
assign o_m_int  =   (interrupts != 0);

${ASSIGN}

endmodule
