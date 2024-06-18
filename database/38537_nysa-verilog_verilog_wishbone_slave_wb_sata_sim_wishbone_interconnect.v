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

  //Slave 0
  output              o_s0_we,
  output              o_s0_cyc,
  output              o_s0_stb,
  output    [3:0]     o_s0_sel,
  input               i_s0_ack,
  output    [31:0]    o_s0_dat,
  input     [31:0]    i_s0_dat,
  output    [31:0]    o_s0_adr,
  input               i_s0_int,

  //Slave 1
  output              o_s1_we,
  output              o_s1_cyc,
  output              o_s1_stb,
  output    [3:0]     o_s1_sel,
  input               i_s1_ack,
  output    [31:0]    o_s1_dat,
  input     [31:0]    i_s1_dat,
  output    [31:0]    o_s1_adr,
  input               i_s1_int,

  //Slave 2
  output              o_s2_we,
  output              o_s2_cyc,
  output              o_s2_stb,
  output    [3:0]     o_s2_sel,
  input               i_s2_ack,
  output    [31:0]    o_s2_dat,
  input     [31:0]    i_s2_dat,
  output    [31:0]    o_s2_adr,
  input               i_s2_int


);


parameter ADDR_0 = 0;
parameter ADDR_1 = 1;
parameter ADDR_2 = 2;


parameter ADDR_FF = 8'hFF;

//state

//wishbone slave signals

//this should be parameterized
wire [7:0]slave_select;
wire [31:0] interrupts;

assign slave_select =   i_m_adr[31:24];

//data in from slave
always @ (slave_select or i_s0_dat or i_s1_dat or i_s2_dat or interrupts) begin
  case (slave_select)
    ADDR_0: begin
      o_m_dat <= i_s0_dat;
    end
    ADDR_1: begin
      o_m_dat <= i_s1_dat;
    end
    ADDR_2: begin
      o_m_dat <= i_s2_dat;
    end
    default: begin
      o_m_dat <= interrupts;
    end
  endcase
end



//ack in from slave

always @ (slave_select or i_s0_ack or i_s1_ack or i_s2_ack) begin
  case (slave_select)
    ADDR_0: begin
      o_m_ack <= i_s0_ack;
    end
    ADDR_1: begin
      o_m_ack <= i_s1_ack;
    end
    ADDR_2: begin
      o_m_ack <= i_s2_ack;
    end
    default: begin
      o_m_ack <= 1'h0;
    end
  endcase
end



//int in from slave
assign interrupts[0]    = i_s0_int;
assign interrupts[1]    = i_s1_int;
assign interrupts[2]    = i_s2_int;
assign interrupts[31:3]   = 0;


assign o_m_int  =   (interrupts != 0);

assign o_s0_we   =  (slave_select == ADDR_0) ? i_m_we: 1'b0;
assign o_s0_stb  =  (slave_select == ADDR_0) ? i_m_stb: 1'b0;
assign o_s0_sel  =  (slave_select == ADDR_0) ? i_m_sel: 4'h0;
assign o_s0_cyc  =  (slave_select == ADDR_0) ? i_m_cyc: 1'b0;
assign o_s0_adr  =  (slave_select == ADDR_0) ? {8'h0, i_m_adr[23:0]}: 32'h0;
assign o_s0_dat  =  (slave_select == ADDR_0) ? i_m_dat: 32'h0;

assign o_s1_we   =  (slave_select == ADDR_1) ? i_m_we: 1'b0;
assign o_s1_stb  =  (slave_select == ADDR_1) ? i_m_stb: 1'b0;
assign o_s1_sel  =  (slave_select == ADDR_1) ? i_m_sel: 4'h0;
assign o_s1_cyc  =  (slave_select == ADDR_1) ? i_m_cyc: 1'b0;
assign o_s1_adr  =  (slave_select == ADDR_1) ? {8'h0, i_m_adr[23:0]}: 32'h0;
assign o_s1_dat  =  (slave_select == ADDR_1) ? i_m_dat: 32'h0;

assign o_s2_we   =  (slave_select == ADDR_2) ? i_m_we: 1'b0;
assign o_s2_stb  =  (slave_select == ADDR_2) ? i_m_stb: 1'b0;
assign o_s2_sel  =  (slave_select == ADDR_2) ? i_m_sel: 4'h0;
assign o_s2_cyc  =  (slave_select == ADDR_2) ? i_m_cyc: 1'b0;
assign o_s2_adr  =  (slave_select == ADDR_2) ? {8'h0, i_m_adr[23:0]}: 32'h0;
assign o_s2_dat  =  (slave_select == ADDR_2) ? i_m_dat: 32'h0;



endmodule
