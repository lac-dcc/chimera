// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_mic.v
//
// Abstract:
//   Memory Interconnect
//
//  Created:
//    8 October 2013
//
// Copyright (c) 2013  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// 2014/02/24 4-port version

module fm_mic (
    clk_core,
    rst_x,
    // write/read port 0 (vertex fetch)
    i_wr_req0,
    i_wr_wr0,
    i_wr_adrs0,
    i_wr_len0,
    o_wr_ack0,
    i_wr_wstr0,
    i_wr_be0,
    i_wr_wdata0,
    o_wr_wack0,
    o_wr_rstr0,
    o_wr_rdata0,
    // read/write port 1 (3D read/write)
    i_wr_req1,
    i_wr_wr1,
    i_wr_adrs1,
    i_wr_len1,
    o_wr_ack1,
    i_wr_wstr1,
    i_wr_be1,
    i_wr_wdata1,
    o_wr_wack1,
    o_wr_rstr1,
    o_wr_rdata1,
    // read port 2 (ctr controller)
    i_r_req2,
    i_r_adrs2,
    i_r_len2,
    o_r_ack2,
    o_r_rstr2,
    o_r_rdata2,
    // write port 3 (DMA write)
    i_wr_req3,
    i_wr_adrs3,
    i_wr_len3,
    o_wr_ack3,
    i_wr_wstr3,
    i_wr_be3,
    i_wr_wdata3,
    o_wr_wack3,
    // DIMM Bridge Interface
    o_brg_req,
    o_brg_wr,
    o_brg_id,
    o_brg_adrs,
    o_brg_len,
    i_brg_ack,
    o_brg_wstr,
    o_brg_be,
    o_brg_wdata,
    i_brg_wack,
    i_brg_rstr,
    i_brg_rlast,
    i_brg_rid,
    i_brg_rdata
);
`include "polyphony_params.v"
//////////////////////////////////
// I/O port definition
//////////////////////////////////
input          clk_core;
input          rst_x;
// write/read port 0
input          i_wr_req0;
input          i_wr_wr0;
input  [P_IB_ADDR_WIDTH-1:0]  i_wr_adrs0;
input  [P_IB_LEN_WIDTH-1:0]   i_wr_len0;
output         o_wr_ack0;
input          i_wr_wstr0;
input  [P_IB_BE_WIDTH-1:0]    i_wr_be0;
input  [P_IB_DATA_WIDTH-1:0]  i_wr_wdata0;
output         o_wr_wack0;
output         o_wr_rstr0;
output [P_IB_DATA_WIDTH-1:0]  o_wr_rdata0;
// write/read port 1
input          i_wr_req1;
input          i_wr_wr1;
input  [P_IB_ADDR_WIDTH-1:0]  i_wr_adrs1;
input  [P_IB_LEN_WIDTH-1:0]   i_wr_len1;
output         o_wr_ack1;
input          i_wr_wstr1;
input  [P_IB_BE_WIDTH-1:0]    i_wr_be1;
input  [P_IB_DATA_WIDTH-1:0]  i_wr_wdata1;
output         o_wr_wack1;
output         o_wr_rstr1;
output [P_IB_DATA_WIDTH-1:0]  o_wr_rdata1;
// read port 2
input          i_r_req2;
input  [P_IB_ADDR_WIDTH-1:0]  i_r_adrs2;
input  [P_IB_LEN_WIDTH-1:0]   i_r_len2;
output         o_r_ack2;
output         o_r_rstr2;
output [P_IB_DATA_WIDTH-1:0]  o_r_rdata2;
// write port 3
input          i_wr_req3;
input  [P_IB_ADDR_WIDTH-1:0]  i_wr_adrs3;
input  [P_IB_LEN_WIDTH-1:0]   i_wr_len3;
output         o_wr_ack3;
input          i_wr_wstr3;
input  [P_IB_BE_WIDTH-1:0]    i_wr_be3;
input  [P_IB_DATA_WIDTH-1:0]  i_wr_wdata3;
output         o_wr_wack3;
// DIMM Bridge Interface
output         o_brg_req;
output         o_brg_wr;
output [1:0]   o_brg_id;
output [P_IB_ADDR_WIDTH-1:0]  o_brg_adrs;
output [P_IB_LEN_WIDTH-1:0]   o_brg_len;
input          i_brg_ack;
output         o_brg_wstr;
output [P_IB_BE_WIDTH-1:0]    o_brg_be;
output [P_IB_DATA_WIDTH-1:0]  o_brg_wdata;
input          i_brg_wack;
input          i_brg_rstr;
input          i_brg_rlast;
input  [1:0]   i_brg_rid;
input  [P_IB_DATA_WIDTH-1:0]  i_brg_rdata;
//////////////////////////////////
// regs 
//////////////////////////////////
//////////////////////////////////
// wires 
//////////////////////////////////
// port0 command/data fifo (write/read)
wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1-1:0]
               w_fifo_cin0;
wire   [P_IB_DATA_WIDTH+P_IB_BE_WIDTH-1:0]
               w_fifo_din0;   // write data bus + be
wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1-1:0]
               w_fifo_cout0;
wire   [P_IB_DATA_WIDTH+P_IB_BE_WIDTH-1:0]
               w_fifo_dout0;
wire           w_cfifo_ack0;
wire           w_dfifo_ack0;
// port1 command/data fifo (read/write)
wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1-1:0]
               w_fifo_cin1;
wire   [P_IB_DATA_WIDTH+P_IB_BE_WIDTH-1:0]
               w_fifo_din1;   // write data bus + be
wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1-1:0]
               w_fifo_cout1;
wire   [P_IB_DATA_WIDTH+P_IB_BE_WIDTH-1:0]
               w_fifo_dout1;
wire           w_cfifo_ack1;
wire           w_dfifo_ack1;
// port3 command/data fifo
wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH-1:0]
               w_fifo_cin3;
wire   [P_IB_DATA_WIDTH+P_IB_BE_WIDTH-1:0]
               w_fifo_din3;   // write data bus + be
wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH-1:0]
               w_fifo_cout3;
wire   [P_IB_DATA_WIDTH+P_IB_BE_WIDTH-1:0]
               w_fifo_dout3;
wire           w_cfifo_ack3;
wire           w_dfifo_ack3;
// port 0
wire           w_req0;
wire           w_we0;
wire   [P_IB_ADDR_WIDTH-1:0]  w_add0;
wire   [P_IB_LEN_WIDTH-1:0]   w_len0;
wire   [P_IB_BE_WIDTH-1:0]    w_be0;
wire           w_cack0;
wire           w_strw0;
wire   [P_IB_DATA_WIDTH-1:0]  w_dbw0;
wire           w_wdata_read_end0;
wire           w_wdata_ack0;
wire           w_strr0;
wire   [P_IB_DATA_WIDTH-1:0]  w_dbr0;
// port 1
wire           w_req1;
wire           w_we1;
wire   [P_IB_ADDR_WIDTH-1:0]  w_add1;
wire   [P_IB_LEN_WIDTH-1:0]   w_len1;
wire   [P_IB_BE_WIDTH-1:0]    w_be1;
wire           w_cack1;
wire           w_strw1;
wire   [P_IB_DATA_WIDTH-1:0]  w_dbw1;
wire           w_wdata_read_end1;
wire           w_wdata_ack1;
wire           w_strr1;
wire   [P_IB_DATA_WIDTH-1:0]  w_dbr1;
// port 2
wire           w_cack2;
// port 3
wire           w_req3;
wire   [P_IB_ADDR_WIDTH-1:0]  w_add3;
wire   [P_IB_LEN_WIDTH-1:0]   w_len3;
wire   [P_IB_BE_WIDTH-1:0]    w_be3;
wire           w_cack3;
wire           w_strw3;
wire   [P_IB_DATA_WIDTH-1:0]  w_dbw3;
wire           w_wdata_read_end3;
wire           w_wdata_ack3;

//////////////////////////////////
// assign statement 
//////////////////////////////////
//  port0 (r/w)
    assign w_fifo_cin0 = {i_wr_wr0,i_wr_adrs0,i_wr_len0};
    assign w_fifo_din0 = {i_wr_be0,i_wr_wdata0};
    assign {w_we0,w_add0,w_len0} = w_fifo_cout0;
    assign {w_be0,w_dbw0} = w_fifo_dout0;
//  port1 (r/w)
    assign w_fifo_cin1 = {i_wr_wr1,i_wr_adrs1,i_wr_len1};
    assign w_fifo_din1 = {i_wr_be1,i_wr_wdata1};
    assign {w_we1,w_add1,w_len1} = w_fifo_cout1;
    assign {w_be1,w_dbw1} = w_fifo_dout1;
//  port3 (w)
    assign w_fifo_cin3 = {i_wr_adrs3,i_wr_len3};
    assign w_fifo_din3 = {i_wr_be3,i_wr_wdata3};
    assign {w_add3,w_len3} = w_fifo_cout3;
    assign {w_be3,w_dbw3} = w_fifo_dout3;

//////////////////////////////////
// module instantiation
//////////////////////////////////

// port0
// command interface
fm_cmn_cinterface #(P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1) u_cinterface0 (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // bus side port
  .i_bstr(i_wr_req0),
  .i_bdata(w_fifo_cin0),
  .o_back(o_wr_ack0),
  // internal port
  .o_istr(w_req0),
  .o_idata(w_fifo_cout0),
  .i_iack(w_cfifo_ack0)
);

// port0
// wtite data interface
fm_cmn_dinterface #(P_IB_BE_WIDTH+P_IB_DATA_WIDTH) u_dinterface0 (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // bus side port
  .i_bstr(i_wr_wstr0),
  .i_bdata(w_fifo_din0),
  .o_back(o_wr_wack0),
  // internal port
  .o_istr(w_strw0),
  .o_idata(w_fifo_dout0),
  .i_iack(w_dfifo_ack0)
);

// port0
// controller
a_port_unit a_port_unit0 (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // port side
  .i_req(w_req0),
  .i_we(w_we0),
  .i_len(w_len0),
  .o_ack(w_cfifo_ack0),
  .i_strw(w_strw0),
  .o_ackw(w_dfifo_ack0),
  .o_strr(o_wr_rstr0),
  .o_dbr(o_wr_rdata0),
  // internal
  .i_cack(w_cack0),
  .o_wdata_read_end(w_wdata_read_end0),
  .i_wdata_ack(w_wdata_ack0),
  .i_strr(w_strr0),
  .i_dbr(w_dbr0)
);

// port1
// command interface
fm_cmn_cinterface #(P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1) u_cinterface1 (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // bus side port
  .i_bstr(i_wr_req1),
  .i_bdata(w_fifo_cin1),
  .o_back(o_wr_ack1),
  // internal port
  .o_istr(w_req1),
  .o_idata(w_fifo_cout1),
  .i_iack(w_cfifo_ack1)
);

// port1
// wtite data interface
fm_cmn_dinterface #(P_IB_BE_WIDTH+P_IB_DATA_WIDTH) u_dinterface1 (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // bus side port
  .i_bstr(i_wr_wstr1),
  .i_bdata(w_fifo_din1),
  .o_back(o_wr_wack1),
  // internal port
  .o_istr(w_strw1),
  .o_idata(w_fifo_dout1),
  .i_iack(w_dfifo_ack1)
);

// port1
// controller
a_port_unit a_port_unit1 (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // port side
  .i_req(w_req1),
  .i_we(w_we1),
  .i_len(w_len1),
  .o_ack(w_cfifo_ack1),
  .i_strw(w_strw1),
  .o_ackw(w_dfifo_ack1),
  .o_strr(o_wr_rstr1),
  .o_dbr(o_wr_rdata1),
  // internal
  .i_cack(w_cack1),
  .o_wdata_read_end(w_wdata_read_end1),
  .i_wdata_ack(w_wdata_ack1),
  .i_strr(w_strr1),
  .i_dbr(w_dbr1)
);


assign o_r_ack2 = (i_r_req2) ? w_cack2 : 1'b1;

// port3
// command interface
fm_cmn_cinterface #(P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH) u_cinterface3 (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // bus side port
  .i_bstr(i_wr_req3),
  .i_bdata(w_fifo_cin3),
  .o_back(o_wr_ack3),
  // internal port
  .o_istr(w_req3),
  .o_idata(w_fifo_cout3),
  .i_iack(w_cfifo_ack3)
);

// port3
// wtite data interface
fm_cmn_dinterface #(P_IB_BE_WIDTH+P_IB_DATA_WIDTH) u_dinterface3 (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // bus side port
  .i_bstr(i_wr_wstr3),
  .i_bdata(w_fifo_din3),
  .o_back(o_wr_wack3),
  // internal port
  .o_istr(w_strw3),
  .o_idata(w_fifo_dout3),
  .i_iack(w_dfifo_ack3)
);

// port1
// controller
a_port_unit a_port_unit3 (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // port side
  .i_req(w_req3),
  .i_we(1'b1),
  .i_len(w_len3),
  .o_ack(w_cfifo_ack3),
  .i_strw(w_strw3),
  .o_ackw(w_dfifo_ack3),
  .o_strr(),
  .o_dbr(),
  // internal
  .i_cack(w_cack3),
  .o_wdata_read_end(w_wdata_read_end3),
  .i_wdata_ack(w_wdata_ack3),
  .i_strr(1'b0),
  .i_dbr(32'h0)
);

a_port_priority a_port_priority (
  .clk_core(clk_core),
  .rst_x(rst_x),
  // port0 side Read/Write
  .i_req0(w_req0),
  .i_we0(w_we0),
  .i_add0(w_add0),
  .i_len0(w_len0),
  .i_be0(w_be0),
  .o_cack0(w_cack0),
  .i_strw0(w_strw0),
  .i_dbw0(w_dbw0),
  .i_wdata_read_end0(w_wdata_read_end0),
  .o_wdata_ack0(w_wdata_ack0),
  .o_strr0(w_strr0),
  .o_dbr0(w_dbr0),
  // port1 side Read/Write
  .i_req1(w_req1),
  .i_we1(w_we1),
  .i_add1(w_add1),
  .i_len1(w_len1),
  .i_be1(w_be1),
  .o_cack1(w_cack1),
  .i_strw1(w_strw1),
  .i_dbw1(w_dbw1),
  .i_wdata_read_end1(w_wdata_read_end1),
  .o_wdata_ack1(w_wdata_ack1),
  .o_strr1(w_strr1),
  .o_dbr1(w_dbr1),
  // port2 side Read Only
  .i_req2(i_r_req2),
  .i_add2(i_r_adrs2),
  .i_len2(i_r_len2),
  .o_cack2(w_cack2),
  .o_strr2(o_r_rstr2),
  .o_dbr2(o_r_rdata2),
  // port3 Write
  .i_req3(w_req3),
  .i_add3(w_add3),
  .i_len3(w_len3),
  .i_be3(w_be3),
  .o_cack3(w_cack3),
  .i_strw3(w_strw3),
  .i_dbw3(w_dbw3),
  .i_wdata_read_end3(w_wdata_read_end3),
  .o_wdata_ack3(w_wdata_ack3),
  // output to bus bridge or
  // memory bus arbiter far
  .o_breq(o_brg_req),
  .o_bwe(o_brg_wr),
  .o_bid(o_brg_id),
  .o_badd(o_brg_adrs),
  .o_blen(o_brg_len),
  .i_back(i_brg_ack),
  .o_bstrw(o_brg_wstr),
  .o_bbe(o_brg_be),
  .o_bdbw(o_brg_wdata),
  .i_backw(i_brg_wack),
  .i_bstrr(i_brg_rstr),
  .i_blast(i_brg_rlast),
  .i_brid(i_brg_rid),
  .i_bdbr(i_brg_rdata)
);

endmodule
