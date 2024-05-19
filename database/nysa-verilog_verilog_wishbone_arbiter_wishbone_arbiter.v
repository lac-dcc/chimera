// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wishbone_arbiter.v
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


`timescale 1 ns/1 ps

module ${ARBITER_NAME} (
  //control signals
  input           clk,
  input           rst,

  //wishbone master ports
${PORTS}
  //wishbone slave signals
  output          o_s_we,
  output          o_s_stb,
  output          o_s_cyc,
  output  [3:0]   o_s_sel,
  output  [31:0]  o_s_adr,
  output  [31:0]  o_s_dat,
  input   [31:0]  i_s_dat,
  input           i_s_ack,
  input           i_s_int
);

localparam        MASTER_COUNT = ${NUM_MASTERS};

//registers/wires
//this should be parameterized
reg [7:0]         master_select;
reg [7:0]         priority_select;


wire              o_master_we  [MASTER_COUNT - 1:0];
wire              o_master_stb [MASTER_COUNT - 1:0];
wire              o_master_cyc [MASTER_COUNT - 1:0];
wire  [3:0]       o_master_sel [MASTER_COUNT - 1:0];
wire  [31:0]      o_master_adr [MASTER_COUNT - 1:0];
wire  [31:0]      o_master_dat [MASTER_COUNT - 1:0];


${MASTER_SELECT}

//priority select
${PRIORITY_SELECT}



//slave assignments
assign  o_s_we  = (master_select != MASTER_NO_SEL) ? o_master_we[master_select]  : 0;
assign  o_s_stb = (master_select != MASTER_NO_SEL) ? o_master_stb[master_select] : 0;
assign  o_s_cyc = (master_select != MASTER_NO_SEL) ? o_master_cyc[master_select] : 0;
assign  o_s_sel = (master_select != MASTER_NO_SEL) ? o_master_sel[master_select] : 0;
assign  o_s_adr = (master_select != MASTER_NO_SEL) ? o_master_adr[master_select] : 0;
assign  o_s_dat = (master_select != MASTER_NO_SEL) ? o_master_dat[master_select] : 0;


${WRITE}

${STROBE}

${CYCLE}

${SELECT}

${ADDRESS}

${DATA}

${ASSIGN}

endmodule
