//=======================================================================
// Project Polyphony
//
// File:
//   fm_mu.v
//
// Abstract:
//   Memory interconnect in 3d core
//
//  Created:
//    27 August 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
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
//  Revision History
// 2008/10/9  remove input side F/F module
// 2008/10/30 add cache module

`define USE_CACHE_MODULE
module fm_3d_mu (
    clk_core,
    rst_x,
    // system configuration
    i_cache_init,
    i_cache_flush,
    o_flush_done,
    // texture unit
    i_req_tu,
    i_adrs_tu,
    o_ack_tu,
    i_len_tu,
    o_strr_tu,
    o_dbr_tu,
    // color
    i_req_cb,
    i_wr_cb,
    i_adrs_cb,
    o_ack_cb,
    i_len_cb,
    i_be_cb,
    i_strw_cb,
    i_dbw_cb,
    o_ackw_cb,
    o_strr_cb,
    o_dbr_cb,
    // depth
    i_req_db,
    i_wr_db,
    i_adrs_db,
    o_ack_db,
    i_len_db,
    i_be_db,
    i_strw_db,
    i_dbw_db,
    o_ackw_db,
    o_strr_db,
    o_dbr_db,
    // system memory interconnect
    o_req_m,
    o_wr_m,
    o_adrs_m,
    i_ack_m,
    o_len_m,
    o_be_m,
    o_strw_m,
    o_dbw_m,
    i_ackw_m,
    i_strr_m,
    i_dbr_m
);
`include "polyphony_params.v"
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // system configuration
    input         i_cache_init;
    input         i_cache_flush;
    output        o_flush_done;
    // texture unit
    input         i_req_tu;
    input  [P_IB_ADDR_WIDTH-1:0]
                  i_adrs_tu;
    output        o_ack_tu;
    input  [P_IB_LEN_WIDTH-1:0]
                  i_len_tu;
    output        o_strr_tu;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dbr_tu;
    // color
    input         i_req_cb;
    input         i_wr_cb;
    input  [P_IB_ADDR_WIDTH-1:0]
                  i_adrs_cb;
    output        o_ack_cb;
    input  [P_IB_LEN_WIDTH-1:0]
                  i_len_cb;
    input  [P_IB_BE_WIDTH-1:0]
                  i_be_cb;
    input         i_strw_cb;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dbw_cb;
    output        o_ackw_cb;
    output        o_strr_cb;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dbr_cb;
    // depth
    input         i_req_db;
    input         i_wr_db;
    input  [P_IB_ADDR_WIDTH-1:0]
                  i_adrs_db;
    output        o_ack_db;
    input  [P_IB_LEN_WIDTH-1:0]
                  i_len_db;
    input  [P_IB_BE_WIDTH-1:0]
                  i_be_db;
    input         i_strw_db;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dbw_db;
    output        o_ackw_db;
    output        o_strr_db;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dbr_db;
    // system memory interconnect
    output        o_req_m;
    output        o_wr_m;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_adrs_m;
    input         i_ack_m;
    output [P_IB_LEN_WIDTH-1:0]
                  o_len_m;
    output [P_IB_BE_WIDTH-1:0]
                  o_be_m;
    output        o_strw_m;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dbw_m;
    input         i_ackw_m;
    input         i_strr_m;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dbr_m;
//////////////////////////////////
// wire 
//////////////////////////////////
    // port0 command/data fifo (write/read)
    wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1-1:0]
                   w_fifo_cin0;
    wire   [P_IB_BE_WIDTH+P_IB_DATA_WIDTH-1:0]
                   w_fifo_din0;   // write data bus + be
    wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1-1:0]
                   w_fifo_cout0;
    wire   [P_IB_BE_WIDTH+P_IB_DATA_WIDTH-1:0]
                   w_fifo_dout0;
    wire           w_cfifo_ack0;
    wire           w_dfifo_ack0;
    // port1 command/data fifo (read/write)
    wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1-1:0]
                   w_fifo_cin1;
    wire   [P_IB_BE_WIDTH+P_IB_DATA_WIDTH-1:0]
                   w_fifo_din1;   // write data bus + be
    wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1-1:0]
                   w_fifo_cout1;
    wire   [P_IB_BE_WIDTH+P_IB_DATA_WIDTH-1:0]
                   w_fifo_dout1;
    wire           w_cfifo_ack1;
    wire           w_dfifo_ack1;
    // port2 command/data fifo (read only)
    wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH-1:0]
                   w_fifo_cin2;
    wire   [P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH-1:0]
                   w_fifo_cout2;
    wire           w_cfifo_ack2;
    // port 0
    wire           w_req0;
    wire           w_we0;
    wire   [P_IB_ADDR_WIDTH-1:0]
                   w_add0;
    wire   [P_IB_LEN_WIDTH-1:0]
                   w_len0;
    wire   [P_IB_BE_WIDTH-1:0]
                   w_be0;
    wire           w_cack0;
    wire           w_strw0;
    wire   [P_IB_DATA_WIDTH-1:0]
                   w_dbw0;
    wire           w_wdata_read_end0;
    wire           w_wdata_ack0;
    wire           w_strr0;
    wire   [P_IB_DATA_WIDTH-1:0]
                   w_dbr0;
    // port 1
    wire           w_req1;
    wire           w_we1;
    wire   [P_IB_ADDR_WIDTH-1:0]
                   w_add1;
    wire   [P_IB_LEN_WIDTH-1:0]
                   w_len1;
    wire   [P_IB_BE_WIDTH-1:0]
                   w_be1;
    wire           w_cack1;
    wire           w_strw1;
    wire   [P_IB_DATA_WIDTH-1:0]
                   w_dbw1;
    wire           w_wdata_read_end1;
    wire           w_wdata_ack1;
    wire           w_strr1;
    wire   [P_IB_DATA_WIDTH-1:0]
                   w_dbr1;
    // port 2
    wire           w_req2;
    wire   [P_IB_ADDR_WIDTH-1:0]
                   w_add2;
    wire   [P_IB_LEN_WIDTH-1:0]
                   w_len2;
    wire           w_cack2;

    // color
    wire          w_req_cb;
    wire          w_wr_cb;
    wire   [P_IB_ADDR_WIDTH-1:0]
                  w_adrs_cb;
    wire          w_ack_cb;
    wire   [P_IB_LEN_WIDTH-1:0]
                  w_len_cb;
    wire   [P_IB_BE_WIDTH-1:0]
                  w_be_cb;
    wire          w_strw_cb;
    wire   [P_IB_DATA_WIDTH-1:0]
                  w_dbw_cb;
    wire          w_ackw_cb;
    wire          w_strr_cb;
    wire   [P_IB_DATA_WIDTH-1:0] 
                  w_dbr_cb;
    // depth
    wire          w_req_db;
    wire          w_wr_db;
    wire   [P_IB_ADDR_WIDTH-1:0]
                  w_adrs_db;
    wire          w_ack_db;
    wire   [P_IB_LEN_WIDTH-1:0]
                  w_len_db;
    wire   [P_IB_BE_WIDTH-1:0]
                  w_be_db;
    wire          w_strw_db;
    wire   [P_IB_DATA_WIDTH-1:0]
                  w_dbw_db;
    wire          w_ackw_db;
    wire          w_strr_db;
    wire   [P_IB_DATA_WIDTH-1:0]
                  w_dbr_db;
    // texture
    wire          w_req_tu;
    wire   [P_IB_ADDR_WIDTH-1:0]
                  w_adrs_tu;
    wire          w_ack_tu;
    wire   [P_IB_LEN_WIDTH-1:0]
                  w_len_tu;
    wire          w_strr_tu;
    wire   [P_IB_DATA_WIDTH-1:0]
                  w_dbr_tu;

//////////////////////////////////
// assign
//////////////////////////////////
`ifdef USE_CACHE_MODULE
`else
    assign o_flush_done = 1'b1;
    assign w_req_cb = i_req_cb;
    assign w_wr_cb = i_wr_cb;
    assign w_adrs_cb = i_adrs_cb;
    assign o_ack_cb = w_ack_cb;
    assign w_len_cb = i_len_cb;
    assign w_be_cb = i_be_cb;
    assign w_strw_cb = i_strw_cb;
    assign w_dbw_cb = i_dbw_cb;
    assign o_ackw_cb = w_ackw_cb;
    assign o_strr_cb = w_strr_cb;
    assign o_dbr_cb = w_dbr_cb;
    // depth
    assign w_req_db = i_req_db;
    assign w_wr_db = i_wr_db;
    assign w_adrs_db = i_adrs_db;
    assign o_ack_db = w_ack_db;
    assign w_len_db = i_len_db;
    assign w_be_db = i_be_db;
    assign w_strw_db = i_strw_db;
    assign w_dbw_db = i_dbw_db;
    assign o_ackw_db = w_ackw_db;
    assign o_strr_db = w_strr_db;
    assign o_dbr_db = w_dbr_db;
    // texture
    assign w_req_tu = i_req_tu;
    assign w_adrs_tu = i_adrs_tu;
    assign o_ack_tu = w_ack_tu;
    assign w_len_tu = i_len_tu;
    assign o_strr_tu = w_strr_tu;
    assign o_dbr_tu = w_dbr_tu;

`endif

    //  port0 (color r/w)
    assign w_fifo_cin0 = {w_wr_cb,w_adrs_cb,w_len_cb};
    assign w_fifo_din0 = {w_be_cb,w_dbw_cb};
    assign {w_we0,w_add0,w_len0} = w_fifo_cout0;
    assign {w_be0,w_dbw0} = w_fifo_dout0;
    //  port1 (depth r/w)
    assign w_fifo_cin1 = {w_wr_db,w_adrs_db,w_len_db};
    assign w_fifo_din1 = {w_be_db,w_dbw_db};
    assign {w_we1,w_add1,w_len1} = w_fifo_cout1;
    assign {w_be1,w_dbw1} = w_fifo_dout1;
    //  port2 (rexture r0)
    assign w_fifo_cin2 = {w_adrs_tu,w_len_tu};
    assign {w_add2,w_len2} = w_fifo_cout2;

////////////////////////////
// module instance
////////////////////////////
    // port 0
    fm_3d_mu_cif #(P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1) mu_cif0 (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // bus side port
        .i_bstr(w_req_cb),
        .i_bdata(w_fifo_cin0),
        .o_back(w_ack_cb),
        // internal port
        .o_istr(w_req0),
        .o_idata(w_fifo_cout0),
        .i_iack(w_cfifo_ack0)
    );

    fm_3d_mu_dif #(P_IB_BE_WIDTH+P_IB_DATA_WIDTH) mu_dif0 (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // bus side port
        .i_bstr(w_strw_cb),
        .i_bdata(w_fifo_din0),
        .o_back(w_ackw_cb),
        // internal port
        .o_istr(w_strw0),
        .o_idata(w_fifo_dout0),
        .i_iack(w_dfifo_ack0)
    );

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
        .o_strr(w_strr_cb),
        .o_dbr(w_dbr_cb),
        // internal
        .i_cack(w_cack0),
        .o_wdata_read_end(w_wdata_read_end0),
        .i_wdata_ack(w_wdata_ack0),
        .i_strr(w_strr0),
        .i_dbr(w_dbr0)
    );

    // port1
    fm_3d_mu_cif #(P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH+1) mu_cif1 (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // bus side port
        .i_bstr(w_req_db),
        .i_bdata(w_fifo_cin1),
        .o_back(w_ack_db),
        // internal port
        .o_istr(w_req1),
        .o_idata(w_fifo_cout1),
        .i_iack(w_cfifo_ack1)
    );

    fm_3d_mu_dif #(P_IB_BE_WIDTH+P_IB_DATA_WIDTH) mu_dif1 (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // bus side port
        .i_bstr(w_strw_db),
        .i_bdata(w_fifo_din1),
        .o_back(w_ackw_db),
        // internal port
        .o_istr(w_strw1),
        .o_idata(w_fifo_dout1),
        .i_iack(w_dfifo_ack1)
    );

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
        .o_strr(w_strr_db),
        .o_dbr(w_dbr_db),
        // internal
        .i_cack(w_cack1),
        .o_wdata_read_end(w_wdata_read_end1),
        .i_wdata_ack(w_wdata_ack1),
        .i_strr(w_strr1),
        .i_dbr(w_dbr1)
    );

    // port2
    fm_3d_mu_cif #(P_IB_ADDR_WIDTH+P_IB_LEN_WIDTH) mu_cif2 (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // bus side port
        .i_bstr(w_req_tu),
        .i_bdata(w_fifo_cin2),
        .o_back(w_ack_tu),
        // internal port
        .o_istr(w_req2),
        .o_idata(w_fifo_cout2),
        .i_iack(w_cfifo_ack2)
    );
    assign w_cfifo_ack2 = (w_req2) ? w_cack2 : 1'b1;

    fm_3d_mu_priority mu_priority (
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
        .i_req2(w_req2),
        .i_add2(w_add2),
        .i_len2(w_len2),
        .o_cack2(w_cack2),
        .o_strr2(w_strr_tu),
        .o_dbr2(w_dbr_tu),
        // to system arbiter
        .o_breq(o_req_m),
        .o_bwe(o_wr_m),
        .o_badd(o_adrs_m),
        .o_blen(o_len_m),
        .i_back(i_ack_m),
        .o_bstrw(o_strw_m),
        .o_bbe(o_be_m),
        .o_bdbw(o_dbw_m),
        .i_backw(i_ackw_m),
        .i_bstrr(i_strr_m),
        .i_bdbr(i_dbr_m)
    );

`ifdef USE_CACHE_MODULE
    fm_3d_mu_cache mu_cache_color (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // system configuration
        .i_cache_init(i_cache_init),
        .i_cache_flush(i_cache_flush),
        .o_flush_done(o_flush_done),
        // cache in
        .i_req_ci(i_req_cb),
        .i_wr_ci(i_wr_cb),
        .i_adrs_ci(i_adrs_cb),
        .o_ack_ci(o_ack_cb),
        .i_len_ci(i_len_cb),
        .i_be_ci(i_be_cb),
        .i_strw_ci(i_strw_cb),
        .i_dbw_ci(i_dbw_cb),
        .o_ackw_ci(o_ackw_cb),
        .o_strr_ci(o_strr_cb),
        .o_dbr_ci(o_dbr_cb),
        // cache out
        .o_req_co(w_req_cb),
        .o_wr_co(w_wr_cb),
        .o_adrs_co(w_adrs_cb),
        .i_ack_co(w_ack_cb),
        .o_len_co(w_len_cb),
        .o_be_co(w_be_cb),
        .o_strw_co(w_strw_cb),
        .o_dbw_co(w_dbw_cb),
        .i_ackw_co(w_ackw_cb),
        .i_strr_co(w_strr_cb),
        .i_dbr_co(w_dbr_cb)
    );

    fm_3d_mu_cache mu_cache_depth (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // system configuration
        .i_cache_init(i_cache_init),
        .i_cache_flush(1'b0),
        .o_flush_done(),
        // cache in
        .i_req_ci(i_req_db),
        .i_wr_ci(i_wr_db),
        .i_adrs_ci(i_adrs_db),
        .o_ack_ci(o_ack_db),
        .i_len_ci(i_len_db),
        .i_be_ci(i_be_db),
        .i_strw_ci(i_strw_db),
        .i_dbw_ci(i_dbw_db),
        .o_ackw_ci(o_ackw_db),
        .o_strr_ci(o_strr_db),
        .o_dbr_ci(o_dbr_db),
        // cache out
        .o_req_co(w_req_db),
        .o_wr_co(w_wr_db),
        .o_adrs_co(w_adrs_db),
        .i_ack_co(w_ack_db),
        .o_len_co(w_len_db),
        .o_be_co(w_be_db),
        .o_strw_co(w_strw_db),
        .o_dbw_co(w_dbw_db),
        .i_ackw_co(w_ackw_db),
        .i_strr_co(w_strr_db),
        .i_dbr_co(w_dbr_db)
    );

    fm_3d_mu_cache_ro mu_cache_tex (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // system configuration
        .i_cache_init(i_cache_init),
        // cache in
        .i_req_ci(i_req_tu),
        .i_adrs_ci(i_adrs_tu),
        .o_ack_ci(o_ack_tu),
        .i_len_ci(i_len_tu),
        .o_strr_ci(o_strr_tu),
        .o_dbr_ci(o_dbr_tu),
        // cache out
        .o_req_co(w_req_tu),
        .o_adrs_co(w_adrs_tu),
        .i_ack_co(w_ack_tu),
        .o_len_co(w_len_tu),
        .i_strr_co(w_strr_tu),
        .i_dbr_co(w_dbr_tu)
    );

`endif

endmodule
