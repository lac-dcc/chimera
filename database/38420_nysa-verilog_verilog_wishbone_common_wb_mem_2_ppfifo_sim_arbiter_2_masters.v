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

module arbiter_2_masters (
  //control signals
  input           clk,
  input           rst,

  //wishbone master ports
  input           i_m0_we,
  input           i_m0_cyc,
  input           i_m0_stb,
  input   [3:0]   i_m0_sel,
  output          o_m0_ack,
  input   [31:0]  i_m0_dat,
  output  [31:0]  o_m0_dat,
  input   [31:0]  i_m0_adr,
  output          o_m0_int,

  input           i_m1_we,
  input           i_m1_cyc,
  input           i_m1_stb,
  input   [3:0]   i_m1_sel,
  output          o_m1_ack,
  input   [31:0]  i_m1_dat,
  output  [31:0]  o_m1_dat,
  input   [31:0]  i_m1_adr,
  output          o_m1_int,


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

localparam        MASTER_COUNT = 2;

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


//master select block
localparam        MASTER_NO_SEL   = 8'hFF;
localparam        MASTER_0     = 0;
localparam        MASTER_1     = 1;


always @ (posedge clk) begin
  if (rst) begin
    master_select <= MASTER_NO_SEL;
  end
  else begin
    case (master_select)
      MASTER_0: begin
        if (~i_m0_cyc && ~i_s_ack) begin
          master_select <= MASTER_NO_SEL;
        end
      end
      MASTER_1: begin
        if (~i_m1_cyc && ~i_s_ack) begin
          master_select <= MASTER_NO_SEL;
        end
      end
      default: begin
        //nothing selected
        if (i_m0_cyc) begin
          master_select <= MASTER_0;
        end
        else if (i_m1_cyc) begin
          master_select <= MASTER_1;
        end
      end
    endcase
    if ((master_select != MASTER_NO_SEL) && (priority_select < master_select) && (!o_s_stb && !i_s_ack))begin
      master_select  <=  MASTER_NO_SEL;
    end
  end
end


//priority select




always @ (posedge clk) begin
  if (rst) begin
    priority_select <= MASTER_NO_SEL;
  end
  else begin
    //find the highest priority
    if (i_m0_cyc) begin
      priority_select  <= MASTER_0;
    end
    else if (i_m1_cyc) begin
      priority_select  <= MASTER_1;
    end
    else begin
      priority_select  <= MASTER_NO_SEL;
    end
  end
end




//slave assignments
assign  o_s_we  = (master_select != MASTER_NO_SEL) ? o_master_we[master_select]  : 0;
assign  o_s_stb = (master_select != MASTER_NO_SEL) ? o_master_stb[master_select] : 0;
assign  o_s_cyc = (master_select != MASTER_NO_SEL) ? o_master_cyc[master_select] : 0;
assign  o_s_sel = (master_select != MASTER_NO_SEL) ? o_master_sel[master_select] : 0;
assign  o_s_adr = (master_select != MASTER_NO_SEL) ? o_master_adr[master_select] : 0;
assign  o_s_dat = (master_select != MASTER_NO_SEL) ? o_master_dat[master_select] : 0;


//write select block
assign o_master_we[MASTER_0] = i_m0_we;
assign o_master_we[MASTER_1] = i_m1_we;



//strobe select block
assign o_master_stb[MASTER_0] = i_m0_stb;
assign o_master_stb[MASTER_1] = i_m1_stb;



//cycle select block
assign o_master_cyc[MASTER_0] = i_m0_cyc;
assign o_master_cyc[MASTER_1] = i_m1_cyc;



//select select block
assign o_master_sel[MASTER_0] = i_m0_sel;
assign o_master_sel[MASTER_1] = i_m1_sel;



//address seelct block
assign o_master_adr[MASTER_0] = i_m0_adr;
assign o_master_adr[MASTER_1] = i_m1_adr;



//data select block
assign o_master_dat[MASTER_0] = i_m0_dat;
assign o_master_dat[MASTER_1] = i_m1_dat;




//assign block
assign o_m0_ack = (master_select == MASTER_0) ? i_s_ack : 0;
assign o_m0_dat = i_s_dat;
assign o_m0_int = (master_select == MASTER_0) ? i_s_int : 0;

assign o_m1_ack = (master_select == MASTER_1) ? i_s_ack : 0;
assign o_m1_dat = i_s_dat;
assign o_m1_int = (master_select == MASTER_1) ? i_s_int : 0;



endmodule
