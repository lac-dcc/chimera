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
  11/08/2011
    fixed the wb_ack to be 0 when nothing is selected
*/

/*
    Thanks Rudolf Usselmann yours was a better implementation than mine

    Copyright (C) 2000-2002
    Rudolf Usselmann
    www.asics.ws
    rudi@asics.ws
*/
`timescale 1ns/1ps

module wishbone_interconnect (
  clk,
  rst,

  i_m_we,
  i_m_cyc,
  i_m_sel,
  i_m_stb,
  o_m_ack,
  i_m_dat,
  o_m_dat,
  i_m_adr,
  o_m_int,

  //virtual slave master 0
  o_s0_we,
  o_s0_cyc,
  o_s0_sel,
  o_s0_stb,
  i_s0_ack,
  o_s0_dat,
  i_s0_dat,
  o_s0_adr,
  i_s0_int,

  //virtual slave master 0
  o_s1_we,
  o_s1_cyc,
  o_s1_sel,
  o_s1_stb,
  i_s1_ack,
  o_s1_dat,
  i_s1_dat,
  o_s1_adr,
  i_s1_int
);


parameter ADDR_0    =   8'h00;
parameter ADDR_1    =   8'h01;

parameter ADDR_FF = 8'hFF;

//state

//control signals
input         clk;
input         rst;

//wishbone slave signals
input                    i_m_we;
input                    i_m_stb;
input                    i_m_cyc;
input   [3:0]            i_m_sel;
input   [31:0]           i_m_adr;
input     [31:0]         i_m_dat;
output reg  [31:0]       o_m_dat = 32'h0;
output reg               o_m_ack = 1'h0;
output                   o_m_int;

output                   o_s0_we;
output                   o_s0_stb;
output                   o_s0_cyc;
output    [3:0]          o_s0_sel;
output      [31:0]       o_s0_adr;
output      [31:0]       o_s0_dat;
input       [31:0]       i_s0_dat;
input                    i_s0_ack;
input                    i_s0_int;

output                   o_s1_we;
output                   o_s1_stb;
output                   o_s1_cyc;
output    [3:0]          o_s1_sel;
output      [31:0]       o_s1_adr;
output      [31:0]       o_s1_dat;
input       [31:0]       i_s1_dat;
input                    i_s1_ack;
input                    i_s1_int;

//this should be parameterized
wire [7:0]slave_select;
assign slave_select =   i_m_adr[31:24];


wire [31:0] interrupts;


/*
initial begin
    $monitor("%t, int: %h, i_s0_int: %h, s1_int: %h", $time, interrupts, s0_int, s1_int);
    $monitor ("%t adr: %h, stb: %h, ack: %h", $time, i_m_adr, i_m_stb, o_m_ack);
end
*/


//data
always @ (slave_select or i_s0_dat or i_s1_dat or interrupts) begin
    case (slave_select)
        ADDR_0: begin
            o_m_dat <= i_s0_dat;
        end
        ADDR_1: begin
            o_m_dat <= i_s1_dat;
        end
        default: begin
        //$display("WBI: interrupt address selected");
            o_m_dat <= interrupts;
        end
    endcase
end

//ack
always @ (slave_select or i_s0_ack or i_s1_ack) begin
    case (slave_select)
        ADDR_0: begin
            o_m_ack <= i_s0_ack;
        end
        ADDR_1: begin
            o_m_ack <= i_s1_ack;
        end
    default: begin
            o_m_ack <= 1'h0;
        end
    endcase
end

//int
//set up the interrupts flags
assign interrupts[0]  = i_s0_int;
assign interrupts[1]  = i_s1_int;
//set all other interrupts to zero
assign interrupts[31:2] = 0;

assign o_m_int  = (interrupts != 0);



assign o_s0_we    = (slave_select == ADDR_0) ? i_m_we: 0;
assign o_s0_stb   = (slave_select == ADDR_0) ? i_m_stb: 0;
assign o_s0_sel   = (slave_select == ADDR_0) ? i_m_sel: 0;
assign o_s0_cyc   = (slave_select == ADDR_0) ? i_m_cyc: 0;
assign o_s0_adr   = (slave_select == ADDR_0) ? {8'h0 , i_m_adr[23:0]}: 0;
assign o_s0_dat   = (slave_select == ADDR_0) ? i_m_dat: 0;

assign o_s1_we    = (slave_select == ADDR_1) ? i_m_we: 0;
assign o_s1_stb   = (slave_select == ADDR_1) ? i_m_stb: 0;
assign o_s1_sel   = (slave_select == ADDR_1) ? i_m_sel: 0;
assign o_s1_cyc   = (slave_select == ADDR_1) ? i_m_cyc: 0;
assign o_s1_adr   = (slave_select == ADDR_1) ? {8'h0 , i_m_adr[23:0]}: 0;
assign o_s1_dat   = (slave_select == ADDR_1) ? i_m_dat: 0;


endmodule
