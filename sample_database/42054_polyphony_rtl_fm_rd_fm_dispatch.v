// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_dispatch.v
//
// Abstract:
//   shave access dispatcher
//
//  Created:
//    3 November 2008
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
// memory mapping
//
//  address(byte)                      address(/32bit)
//
//  0x0000_03ff +------------------+ 0x0080_0ff
//              |  3D vtx  (8MB)   |         
//  0x0000_0300 +------------------+ 0x0080_0c0
//              |  3D ras  (8MB)   |         
//  0x0000_0200 +------------------+ 0x0000_080
//              |  I2C     (8MB)   |
//  0x0000_0100 +------------------+ 0x0000_040
//              |  System  (8MB)   |
//  0x0000_0000 +------------------+ 0x0000_000
//

module fm_dispatch (
    clk_core,
    rst_x,
    // local interface
    i_req,
    i_wr,
    i_adrs,
    o_ack,
    i_be,
    i_wd,
    o_rstr,
    o_rd,
    // internal side
    o_req_sys,
    o_req_3d,
    o_wr,
    o_adrs,
    i_ack_sys,
    i_ack_3d,
    o_be,
    o_wd,
    i_rstr_sys,
    i_rstr_3d,
    i_rd_sys,
    i_rd_3d,
    // I2C wishbone
    o_wb_adr,
    o_wb_dat,
    i_wb_dat,
    o_wb_we,
    o_wb_stb,
    o_wb_cyc,
    i_wb_ack
);
//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input           clk_core;
    input           rst_x;
    // sh4 local interface
    input           i_req;
    input           i_wr;
    input  [23:0]   i_adrs;
    output          o_ack;
    input  [3:0]    i_be;
    input  [31:0]   i_wd;
    output          o_rstr;
    output [31:0]   o_rd;
    // internal side
    output          o_req_sys;
    output          o_req_3d;
    output          o_wr;
    output [21:0]   o_adrs;
    input           i_ack_sys;
    input           i_ack_3d;
    output [3:0]    o_be;
    output [31:0]   o_wd;
    input           i_rstr_sys;
    input           i_rstr_3d;
    input  [31:0]   i_rd_sys;
    input  [31:0]   i_rd_3d;
    // wishbone signals
    output [2:0] o_wb_adr;     // lower address bits
    output [7:0] o_wb_dat;     // databus input
    input  [7:0] i_wb_dat;     // databus output
    output       o_wb_we;      // write enable input
    output       o_wb_stb;     // stobe/core select signal
    output       o_wb_cyc;     // valid bus cycle input
    input        i_wb_ack;     // bus cycle acknowledge output
//////////////////////////////////
// reg
//////////////////////////////////
//////////////////////////////////
// wire
//////////////////////////////////
    wire            w_sys_hit;
    wire            w_3d_hit;
    wire            w_i2c_hit;

    wire   [23:0]   w_adrs;
    wire            w_req;

    wire            w_rstr_i2c;
//////////////////////////////////
// assign
//////////////////////////////////
    assign     w_adrs = i_adrs;
    assign     w_req = i_req;

    assign     w_sys_hit = (w_adrs[9:8] == 2'b00);  // byte address
    assign     w_i2c_hit = (w_adrs[9:8] == 2'b01);
    assign     w_3d_hit = (w_adrs[9] == 1'b1);

    assign     o_ack = (w_sys_hit & i_ack_sys)|
                       (w_i2c_hit & i_wb_ack)|
                       (w_3d_hit &i_ack_3d);
    assign     o_rstr = i_rstr_sys | i_rstr_3d | w_rstr_i2c;
    assign     o_rd = (i_rstr_sys) ? i_rd_sys :
                      (i_rstr_3d)  ? i_rd_3d :
                      (w_rstr_i2c) ? {24'h0,i_wb_dat} :
                                     32'h0;
    assign     o_req_sys = w_req & w_sys_hit;
    assign     o_req_3d = w_req & w_3d_hit;
    assign     o_adrs = w_adrs[21:0];
    assign     o_wr = i_wr;
    assign     o_be = i_be;
    assign     o_wd = i_wd;

    assign o_wb_adr[2:0] = i_adrs[4:2];
    assign o_wb_dat = i_wd[7:0];
    assign o_wb_we = i_wr;
    assign o_wb_stb = w_req & w_i2c_hit;
    assign o_wb_cyc = o_wb_stb;
    assign w_rstr_i2c = o_wb_stb & (!o_wb_we) & i_wb_ack;

endmodule
