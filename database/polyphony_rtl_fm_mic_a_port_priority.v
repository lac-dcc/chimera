// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_port_priority.v
//
// Abstract:
//   Memory Interconnect priority decision
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
// 4-port version
//`define USE_THREAD
module a_port_priority (
  clk_core,
  rst_x,
  // port0 side Read/Write
  i_req0,
  i_we0,
  i_add0,
  i_len0,
  i_be0,
  o_cack0,
  i_strw0,
  i_dbw0,
  i_wdata_read_end0,
  o_wdata_ack0,
  o_strr0,
  o_dbr0,
  // port1 side Read/Write
  i_req1,
  i_we1,
  i_add1,
  i_len1,
  i_be1,
  o_cack1,
  i_strw1,
  i_dbw1,
  i_wdata_read_end1,
  o_wdata_ack1,
  o_strr1,
  o_dbr1,
  // port2 side Read Only
  i_req2,
  i_add2,
  i_len2,
  o_cack2,
  o_strr2,
  o_dbr2,
  // port3 side Write Only
  i_req3,
  i_add3,
  i_len3,
  i_be3,
  o_cack3,
  i_strw3,
  i_dbw3,
  i_wdata_read_end3,
  o_wdata_ack3,
  // output to bus bridge or
  // memory bus arbiter far
  o_breq,
  o_bwe,
  o_bid,
  o_badd,
  o_blen,
  i_back,
  o_bstrw,
  o_bbe,
  o_bdbw,
  i_backw,
  i_bstrr,
  i_blast,
  i_brid,
  i_bdbr
);
`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
parameter P_SIDLE  = 1'b0;
parameter P_SDIN   = 1'b1;
////////////////////////////
// I/O definition
////////////////////////////
// port 0
input         i_req0;         // command request
input         i_we0;          // write/read flag
input  [P_IB_ADDR_WIDTH-1:0]
              i_add0;         // address
input  [P_IB_LEN_WIDTH-1:0]
              i_len0;         // burst length
input  [P_IB_BE_WIDTH-1:0]
              i_be0;          // byte enable
output        o_cack0;        // command acknowledge
input         i_strw0;        // write data strobe
input  [P_IB_DATA_WIDTH-1:0]
              i_dbw0;         // write data
input         i_wdata_read_end0;
                              // write data end flag
output        o_wdata_ack0;   // write data acknowledge
output        o_strr0;        // read data strobe
output [P_IB_DATA_WIDTH-1:0]
              o_dbr0;         // read data
// port 1
input         i_req1;         // command request
input         i_we1;          // write/read flag
input  [P_IB_ADDR_WIDTH-1:0]
              i_add1;         // address
input  [P_IB_LEN_WIDTH-1:0]
              i_len1;         // burst length
input  [P_IB_BE_WIDTH-1:0]
              i_be1;          // byte enable
output        o_cack1;        // command acknowledge
input         i_strw1;        // write data strobe
input  [P_IB_DATA_WIDTH-1:0]
              i_dbw1;         // write data
input         i_wdata_read_end1;
                              // write data end flag
output        o_wdata_ack1;   // write data acknowledge
output        o_strr1;        // read data strobe
output [P_IB_DATA_WIDTH-1:0]
              o_dbr1;         // read data
// port 2
input         i_req2;         // command request
input  [P_IB_ADDR_WIDTH-1:0]
              i_add2;         // address
input  [P_IB_LEN_WIDTH-1:0]
              i_len2;         // burst length
output        o_cack2;        // command acknowledge
output        o_strr2;        // read data strobe
output [P_IB_DATA_WIDTH-1:0]
              o_dbr2;         // read data
// port 3
input         i_req3;         // command request
input  [P_IB_ADDR_WIDTH-1:0]
              i_add3;         // address
input  [P_IB_LEN_WIDTH-1:0]
              i_len3;         // burst length
input  [P_IB_BE_WIDTH-1:0]
              i_be3;          // byte enable
output        o_cack3;        // command acknowledge
input         i_strw3;        // write data strobe
input  [P_IB_DATA_WIDTH-1:0]
              i_dbw3;         // write data
input         i_wdata_read_end3;
                              // write data end flag
output        o_wdata_ack3;   // write data acknowledge
// output to bus bridge or
// memory bus arbiter far
output        o_breq;         // command request
output        o_bwe;          // write/read flag
output [1:0]  o_bid;
output [P_IB_ADDR_WIDTH-1:0]
              o_badd;         // address
output [P_IB_LEN_WIDTH-1:0]
              o_blen;         // burst length
output [P_IB_BE_WIDTH-1:0]
              o_bbe;          // byte enable
input         i_back;         // command acknowledge
output        o_bstrw;        // write data strobe
output [P_IB_DATA_WIDTH-1:0]
              o_bdbw;         // write data
input         i_backw;        // write data acknowledge
input         i_bstrr;        // read data strobe
input         i_blast;
input  [1:0]  i_brid;
input  [P_IB_DATA_WIDTH-1:0]
              i_bdbr;         // read data

input         clk_core;        // system clock
input         rst_x;          // system reset

/////////////////////////
//  register definition
/////////////////////////
reg        r_breq;
reg        r_bwe;
reg [1:0]  r_bid;
reg [P_IB_ADDR_WIDTH-1:0] r_badd;
reg [P_IB_LEN_WIDTH-1:0]  r_blen;
reg [P_IB_BE_WIDTH-1:0]   r_bbe;
reg        r_back;
reg        r_bstrw;
reg [P_IB_DATA_WIDTH-1:0] r_bdbw;
reg        r_backw;
reg        r_bstrr;
reg [1:0]  r_brid;
reg [P_IB_DATA_WIDTH-1:0] r_bdbr;
// current priority
reg [1:0]  r_current_priority;  // 0 - 3

// read data counter
reg [P_IB_LEN_WIDTH-1:0]  r_read_cnt;

// write data state machine
reg        r_wstate;
// read data final out
reg        r_strr2;
reg [P_IB_DATA_WIDTH-1:0] r_dbr2;

/////////////////////////
//  wire definition
/////////////////////////
// current port
wire        w_req;
wire        w_we;
wire [P_IB_ADDR_WIDTH-1:0] w_add;
wire [P_IB_LEN_WIDTH-1:0]  w_len;
wire [P_IB_BE_WIDTH-1:0]   w_be;
wire        w_strw;
wire [P_IB_DATA_WIDTH-1:0] w_dbw;
wire        w_wdata_read_end;
wire        w_wdata_read;
wire        w_write_burst;
wire        w_wdata_idle;
wire        w_rfifo_ok;

// masked back
wire      w_back;

// bridge port
wire      w_breq;
wire      w_bstrw;

wire [3:0] w_sreq;
wire [1:0] w_decide_port;
wire       w_wstate_idle;
wire       w_wstate_din;

// fifo port
wire       w_fifo_full;
wire [2+P_IB_LEN_WIDTH-1:0]
           w_fifo_din;
wire [2+P_IB_LEN_WIDTH-1:0]
           w_fifo_dout;
wire       w_fifo_write;
wire [P_IB_LEN_WIDTH-1:0]
           w_current_read_len;
wire [1:0] w_current_read_pr;
wire       w_read_end;
wire       w_set_priority;
wire [1:0] w_wdata_port;

// read data final out
wire        w_strr2;
wire [P_IB_DATA_WIDTH-1:0] w_dbr2;

/////////////////////////
//  assign statement
/////////////////////////
// masked back
assign w_back = r_back;

assign w_sreq = {i_req3,i_req2,i_req1,i_req0};
assign w_decide_port = f_decide_port(w_sreq,r_current_priority);
assign w_wstate_idle = (r_wstate == P_SIDLE);
assign w_wstate_din = (r_wstate == P_SDIN);
assign w_wdata_idle = (w_we) ?  r_backw & w_wstate_idle :  w_wstate_idle;
assign w_wdata_port = (w_wstate_idle) ? w_decide_port : r_current_priority;
assign w_wdata_read = w_wstate_din | (w_req & w_we & w_back);
`ifdef USE_THREAD
assign w_rfifo_ok = 1'b1;
`else
assign w_rfifo_ok = (!w_we) ?  !w_fifo_full :  1'b1;
`endif
// command end cycle flag
assign w_set_priority = w_req & w_back & w_wdata_idle;

// port0
assign o_cack0 = w_set_priority & w_rfifo_ok & (w_decide_port == 2'd0);
assign o_wdata_ack0 = r_backw & w_wdata_read & (w_wdata_port == 2'd0);
`ifdef USE_THREAD
assign o_strr0 = r_bstrr & (r_brid == 2'd0);
`else
assign o_strr0 = r_bstrr & (w_current_read_pr == 2'd0);
`endif
assign o_dbr0 = r_bdbr;

// port1
assign o_cack1 = w_set_priority & w_rfifo_ok & (w_decide_port == 2'd1);
assign o_wdata_ack1 = r_backw & w_wdata_read & (w_wdata_port == 2'd1);
`ifdef USE_THREAD
assign o_strr1 = r_bstrr & (r_brid == 2'd1);
`else
assign o_strr1 = r_bstrr & (w_current_read_pr == 2'd1);
`endif
assign o_dbr1 = r_bdbr;

// port2
assign o_cack2 = w_set_priority & w_rfifo_ok & (w_decide_port == 2'd2);
`ifdef USE_THREAD
assign w_strr2 = r_bstrr & (r_brid == 2'd2);
`else
assign w_strr2 = r_bstrr & (w_current_read_pr == 2'd2);
`endif
assign w_dbr2 = r_bdbr;
assign o_strr2 = r_strr2;
assign o_dbr2 = r_dbr2;

// port3
assign o_cack3 = w_set_priority & w_rfifo_ok & (w_decide_port == 2'd3);
assign o_wdata_ack3 = r_backw & w_wdata_read & (w_wdata_port == 2'd3);

// current port
assign w_req = (w_decide_port == 2'd0) ? i_req0 :
               (w_decide_port == 2'd1) ? i_req1 :
               (w_decide_port == 2'd2) ? i_req2 : i_req3;
assign w_we  = (w_decide_port == 2'd0) ? i_we0 :
               (w_decide_port == 2'd1) ? i_we1 :
               (w_decide_port == 2'd2) ? 1'b0 : 1'b1;
assign w_add = (w_decide_port == 2'd0) ? i_add0 :
               (w_decide_port == 2'd1) ? i_add1 :
               (w_decide_port == 2'd2) ? i_add2 :i_add3;
assign w_len = (w_decide_port == 2'd0) ? i_len0 :
               (w_decide_port == 2'd1) ? i_len1 :
               (w_decide_port == 2'd2) ? i_len2 : i_len3;
assign w_be  = (w_wdata_port == 2'd0) ? i_be0 :
               (w_wdata_port == 2'd1) ? i_be1 :
               (w_wdata_port == 2'd2) ? 8'h00 : i_be3;
assign w_dbw = (w_wdata_port == 2'd0) ? i_dbw0 :
               (w_wdata_port == 2'd1) ? i_dbw1 :
               (w_wdata_port == 2'd2) ?  32'h0000_0000 : i_dbw3;
assign w_strw = (w_wdata_port == 2'd0) ? i_strw0 :
                (w_wdata_port == 2'd1) ? i_strw1 :
                (w_wdata_port == 2'd2) ? 1'b0 : i_strw3;
assign w_wdata_read_end = (w_wdata_port == 2'd0) ? (i_wdata_read_end0 & r_backw) :
                          (w_wdata_port == 2'd1) ? (i_wdata_read_end1 & r_backw) :
                          (w_wdata_port == 2'd3) ? (i_wdata_read_end3 & r_backw) : 1'b0;

assign w_write_burst = w_req & w_we & (w_len != 1) & w_back & r_backw;


// bridge port
//assign w_breq = w_req & w_back & w_wdata_idle;
// 2004/11/27
  assign w_breq = w_req & w_back & w_wdata_idle & w_rfifo_ok;

assign w_bstrw =  w_strw & w_wdata_read & r_backw;
// bridge port output connection
assign o_breq = r_breq;
assign o_bwe = r_bwe;
assign o_bid = r_bid;
assign o_badd = r_badd;
assign o_blen = r_blen;
assign o_bstrw = r_bstrw;
assign o_bbe = r_bbe;
assign o_bdbw = r_bdbw;

// fifo port
assign w_fifo_din = {w_decide_port,w_len};
assign w_fifo_write = w_req & w_back & !w_we & w_set_priority;
assign {w_current_read_pr,w_current_read_len} = w_fifo_dout;
assign w_read_end = (r_read_cnt == w_current_read_len) & r_bstrr;

// debug
wire w_wrong_id;
assign w_wrong_id = r_bstrr & (w_current_read_pr != r_brid);

/////////////////////////
//  function statement
/////////////////////////
function [1:0] f_decide_port;
  input [3:0] req;
  input [1:0] cp;
  begin
    case (req)
      4'b0000: begin
        // no request
        f_decide_port = cp;
      end
      4'b0001: begin
        // only port0 request
        f_decide_port = 2'd0;
      end
      4'b0010: begin
        // only port1 request
        f_decide_port = 2'b1;
      end
      4'b0011: begin
        // simultaneous request port 1 & 0
        case (cp)
          2'b00 : f_decide_port = 2'd1;
          default : f_decide_port = 2'd0;
        endcase
      end
      4'b0100: begin
        // only port2 request
        f_decide_port = 2'd2;
      end
      4'b0101: begin
        // simultaneous request port 2 & 0
        case (cp)
          2'b00,
          2'b01 : f_decide_port = 2'd2;
          default : f_decide_port = 2'd0;
        endcase
      end
      4'b0110: begin
        // simultaneous request port 2 & 1
        case (cp)
          2'b01 : f_decide_port = 2'd2;
          default : f_decide_port = 2'd1;
        endcase
      end
      4'b0111: begin
        // simultaneous request port 2 & 1 & 0
        case (cp)
          2'b00 : f_decide_port = 2'd1;
          2'b01 : f_decide_port = 2'd2;
          default : f_decide_port = 2'd0;
        endcase
      end
      4'b1000: begin
        // port 3 request
        f_decide_port = 2'd3;
      end
      4'b1001: begin
        // only port3&0 request
        case (cp)
          2'd0,
          2'd1,
          2'd2 : f_decide_port = 2'd3;
          default : f_decide_port = 2'd0;
        endcase
      end
      4'b1010: begin
        // only port 3 & 1 request
        case (cp)
          2'd1,
          2'd2 : f_decide_port = 2'd3;
          default : f_decide_port = 2'd1;
        endcase
      end
      4'b1011: begin
        // simultaneous request port 3 & 1 & 0
        case (cp)
          2'd0 : f_decide_port = 2'd1;
          2'd1,
          2'd2 : f_decide_port = 2'd3;
          default : f_decide_port = 2'd0;
        endcase
      end
      4'b1100: begin
        // simultaneous request port 3 & 2
        case (cp)
          2'd2 : f_decide_port = 2'd3;
          default : f_decide_port = 2'd2;
        endcase
      end
      4'b1101: begin
        // simultaneous request port 3 & 2 & 0
        case (cp)
          2'd0,
          2'd1 : f_decide_port = 2'd2;
          2'd2 : f_decide_port = 2'd3;
          default : f_decide_port = 2'd0;
        endcase
      end
      4'b1110: begin
        // simultaneous request port 3 & 2 & 1
        case (cp)
          2'd1 : f_decide_port = 2'd2;
          2'd2 : f_decide_port = 2'd3;
          default : f_decide_port = 2'd1;
        endcase
      end
      4'b1111: begin
        // simultaneous request port 3 & 2 & 1 & 0
        case (cp)
          2'd0 : f_decide_port = 2'd1;
          2'd1 : f_decide_port = 2'd2;
          2'd2 : f_decide_port = 2'd3;
          2'd3 : f_decide_port = 2'd0;
          default : f_decide_port = 2'd0;
        endcase
      end
      default : f_decide_port = 2'd0;
    endcase
    // test : port2 always has top priority
    if (req[2]) f_decide_port = 2'd2;
  end
endfunction

/////////////////////////
//  always statement
/////////////////////////
// write data state machine
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_wstate <= P_SIDLE;
  end else begin
    case (r_wstate)
      P_SIDLE :  // Idle
        begin
          if (w_write_burst) begin
            r_wstate <= P_SDIN;
          end
        end
      P_SDIN :   // Getting write data & be
        begin
          if (w_wdata_read_end) begin
            r_wstate <= P_SIDLE;
          end
        end
      default : r_wstate <= r_wstate;
    endcase
  end
end


// current priority
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_current_priority <= 2'd3;   // lowest priority port number
  end else begin
    if (w_set_priority) begin
      r_current_priority <= w_decide_port;
    end
  end
end
// read data counter
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_read_cnt <= 1;
  end else begin
    if (w_read_end) begin
      r_read_cnt <= 1;
    end else if (r_bstrr) begin
      r_read_cnt <= r_read_cnt + 1'b1;
    end
  end
end

// bus bridge (or memory arbiter far) port
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_breq <= 1'b0;
  end else begin
    r_breq <= w_breq;
  end
end

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_bstrw <= 1'b0;
  end else begin
    r_bstrw <= w_bstrw;
  end
end

always @(posedge clk_core) begin
`ifdef USE_THREAD
  r_bid <= (w_decide_port == 2'd0) ? 2'd0 :
           (w_decide_port == 2'd1) ? 2'd1 :
           (w_decide_port == 2'd2) ? 2'd2 : 2'd3;
`else
  r_bid <= 2'd0;
`endif
  r_bwe <= w_we;
  r_badd <= w_add;
  r_blen <= w_len;
  r_bbe <= w_be;
  r_bdbw <= w_dbw;
end

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_bstrr <= 1'b0;
  end else begin
    r_bstrr <= i_bstrr;
  end
end

always @(posedge clk_core) begin
  r_brid <= i_brid;
  r_bdbr <= i_bdbr;
end

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_back <= 1'b0;
    r_backw <= 1'b0;
  end else begin
    r_back <= i_back;
    r_backw <= i_backw;
  end
end

// read data strobe & outout (Read Only Port)
always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_strr2 <= 1'b0;
  end else begin
    r_strr2 <= w_strr2;
  end
end

always @(posedge clk_core) begin
  r_dbr2 <= w_dbr2;
end

/////////////////////////
//  module instantiation
/////////////////////////
// read data priority fifo
// contain port number + burst length
wire [7:0] w_dnum;
wire       w_empty;
`ifdef USE_THREAD
`else
fm_cmn_bfifo #(2+P_IB_LEN_WIDTH,7) fifo (
  .clk_core(clk_core),
  .rst_x(rst_x),
  .i_wstrobe(w_fifo_write),
  .i_dt(w_fifo_din),
  .o_full(w_fifo_full),
  .i_renable(w_read_end),
  .o_dt(w_fifo_dout),
  .o_empty(w_empty),
  .o_dnum(w_dnum)
);
`endif


wire    w_error;
assign w_error = w_empty & r_bstrr;

reg [15:0]    r_req_cnt;
reg [15:0]    r_acc_cnt;

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_req_cnt <= 'd0;
    r_acc_cnt <= 'd0;
  end else begin
    if (w_fifo_write) r_req_cnt <= r_req_cnt + w_len;
   if (i_bstrr) r_acc_cnt <= r_acc_cnt + 1'b1;
     
  end
end
`ifdef RTL_DEBUG
`else  
/*
wire [35:0] CONTROL0;
wire [132:0] TRIG0;
wire [667:0] DATA;
chipscope_icon_v1_06_a_0 u_icon (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila_v1_05_a_0 u_chipscope (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(clk_core), // IN
    .TRIG0(TRIG0),
    .DATA(DATA)
);

assign DATA[0] = i_req0;
assign DATA[29:1] =  i_add0[28:0];
assign DATA[35:30] =  i_len0[5:0];
assign DATA[36] = o_cack0;
assign DATA[37] = o_strr0;
assign DATA[101:38] = o_dbr0[63:0];
// read/write port 1 (3D read/write)
assign DATA[102] = i_req1;
assign DATA[103] = i_we1;
assign DATA[132:104] = i_add1[28:0];
assign DATA[138:133] = i_len1[5:0];
assign DATA[139] =  o_cack1;
assign DATA[140] = i_strw1;
assign DATA[144:141] = i_be1[3:0];
assign DATA[208:145] = i_dbw1[63:0];
assign DATA[209] =  o_wdata_ack1;
assign DATA[210] = o_strr1;
assign DATA[274:211] = o_dbr1[63:0];
// read port 2 (ctr controller)
assign DATA[275] = i_req2;
assign DATA[304:276] = i_add2[28:0];
assign DATA[310:305] = i_len2[5:0];
assign DATA[311] = o_cack2;
assign DATA[312] =  o_strr2;
assign DATA[376:313] =  o_dbr2[63:0];
// write port 3 (DMA write)
assign DATA[377] = i_req3;
assign DATA[406:378] = i_add3[28:0];
assign DATA[412:407] = i_len3[5:0];
assign DATA[413] = o_cack3;
assign DATA[414] = i_strw3;
assign DATA[418:415] = i_be3[3:0];
assign DATA[482:419] = i_dbw3[63:0];
assign DATA[483] = o_wdata_ack3;
// DIMM Bridge Interface
assign DATA[484] = o_breq;
assign DATA[485] = o_bwe;
assign DATA[514:486] = o_badd[28:0];
assign DATA[520:515] = o_blen[5:0];
assign DATA[521] = i_back;
assign DATA[522] = o_bstrw;
assign DATA[526:523] = o_bbe[3:0];
assign DATA[590:527] = o_bdbw[63:0];
assign DATA[591] = i_backw;
assign DATA[592] = i_bstrr;
assign DATA[656:593] = i_bdbr[63:0];
assign DATA[657] = w_fifo_write;
assign DATA[659:658] = w_decide_port[1:0];
assign DATA[665:660] = w_len[5:0];
assign DATA[666] = w_fifo_full;
assign DATA[667] = w_read_end;
	 
assign TRIG0[0] = i_req0;
assign TRIG0[29:1] =  i_add0[28:0];
assign TRIG0[30] = o_cack0;
assign TRIG0[31] = o_strr0;
// read/write port 1 (3D read/write)
assign TRIG0[32] = i_req1;
assign TRIG0[33] = i_we1;
assign TRIG0[62:34] = i_add1[28:0];
assign TRIG0[63] = o_cack1;
assign TRIG0[64] = i_strw1;
assign TRIG0[65] = o_wdata_ack1;
assign TRIG0[66] = o_strr1;
// read port 2 (ctr controller)
assign TRIG0[67] =  i_req2;
assign TRIG0[96:68] = i_add2[28:0];
assign TRIG0[97] = o_cack2;
assign TRIG0[98] = o_strr2;
// DIMM Bridge Interface
assign TRIG0[99] = o_breq;
assign TRIG0[100] = o_bwe;
assign TRIG0[129:101] = o_badd[28:0];
assign TRIG0[130] = i_back;
assign TRIG0[131] = i_bstrr;
assign TRIG0[132] =  w_error;
*/
`endif
endmodule
