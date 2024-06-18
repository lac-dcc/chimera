// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

`timescale 1ns / 1ps  

/*Project Oberon, Revised Edition 2013

Book copyright (C)2013 Niklaus Wirth and Juerg Gutknecht;
software copyright (C)2013 Niklaus Wirth (NW), Juerg Gutknecht (JG), Paul
Reed (PR/PDR).

Permission to use, copy, modify, and/or distribute this software and its
accompanying documentation (the "Software") for any purpose with or
without fee is hereby granted, provided that the above copyright notice
and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHORS DISCLAIM ALL WARRANTIES
WITH REGARD TO THE SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY, FITNESS AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS BE LIABLE FOR ANY CLAIM, SPECIAL, DIRECT, INDIRECT, OR
CONSEQUENTIAL DAMAGES OR ANY DAMAGES OR LIABILITY WHATSOEVER, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE DEALINGS IN OR USE OR PERFORMANCE OF THE SOFTWARE.*/

// PS/2 mouse PDR 14.10.2013 / 03.09.2015 / 01.10.2015
// with Microsoft 3rd (scroll) button init magic

// EMARD added z-axis (wheel) 10.05.2019
// https://isdaman.com/alsos/hardware/mouse/ps2interface.htm

module mousem
#(
  parameter c_x_bits = 11,   // >= 8
  parameter c_y_bits = 11,   // >= 8
  parameter c_z_bits = 11,   // >= 4
  parameter c_z_ena  = 1,    // 1:yes wheel, 0:not wheel
  parameter c_hotplug = 1
)
(
  input clk, clk_ena,
  input ps2m_reset,
  inout ps2m_clk, ps2m_dat,
  output reg update,
  output reg [c_x_bits-1:0] x,
  output reg [c_y_bits-1:0] y,
  output reg [c_z_bits-1:0] z,
  output reg [2:0] btn
);
  reg [2:0] sent;
  localparam c_rx_bits = c_z_ena ? 42 : 31;
  reg [c_rx_bits-1:0] rx;
  reg [9:0] tx;
  reg [14:0] count;
  reg [5:0] filter;
  reg req;
  wire shift, endbit, endcount, done, run;
  wire [8:0] cmd;  //including odd tx parity bit
  wire [c_x_bits-1:0] dx;
  wire [c_y_bits-1:0] dy;
  wire [c_z_bits-1:0] dz;

// 322222222221111111111 (scroll mouse z and rx parity p ignored)
// 0987654321098765432109876543210   X, Y = overflow
// -------------------------------   s, t = x, y sign bits
// yyyyyyyy01pxxxxxxxx01pYXts1MRL0   normal report
// p--ack---0Ap--cmd---01111111111   cmd + ack bit (A) & byte

  // bytes to be sent
  parameter [7:0] send0     = 8'hF4;  // 8'hF4 enable reporting
  parameter [7:0] send2     = 8'd200; //   200
  parameter [7:0] send4     = 8'd100; //   100
  parameter [7:0] send6     = 8'd80;  //    80
  parameter [7:0] send135   = 8'hF3;  // 8'hF3 set sample rate
  // odd-parity bit prepended to each byte
  parameter [8:0] psend0    = {~^send0,send0};
  parameter [8:0] psend2    = {~^send2,send2};
  parameter [8:0] psend4    = {~^send4,send4};
  parameter [8:0] psend6    = {~^send6,send6};
  parameter [8:0] psend135  = {~^send135,send135};

  assign cmd = (sent == 0) ? psend0 :   // init sequence
               (sent == 2) ? psend2 :
               (sent == 4) ? psend4 :
               (sent == 6) ? psend6 : 
                             psend135;
  assign run = (sent == 7);
  assign endcount = (count[14:12] == 3'b111);  // more than 11*100uS @25MHz
  assign shift = ~req & (filter == 6'b100000);  //low for 200nS @25MHz
  // first bit that enters rx at MSB is 1 and it is shifted to the right
  // when this bit reaches the position in rx, it indicates end of transmission
  assign endbit = run ? ~rx[0] : ~rx[$bits(rx)-21];
  assign done = endbit & endcount & ~req;
  assign dx = {{($bits(dx)-8){rx[5]}}, rx[7] ? 8'b0 : rx[19:12]};  //sign+overfl
  assign dy = {{($bits(dy)-8){rx[6]}}, rx[8] ? 8'b0 : rx[30:23]};  //sign+overfl
  generate
    if(c_z_ena)
      assign dz = {{($bits(dz)-3){rx[37]}}, rx[37:34]};  //sign,wheel
  endgenerate
//  assign out = {run,  // full debug
//    run ? {rx[25:0], endbit} : {rx[30:10], endbit, sent, tx[0], ~req}};
//  assign out = {run,  // debug then normal
//    run ? {btns, 2'b0, y, 2'b0, x} : {rx[30:10], sent, endbit, tx[0], ~req}};
  assign ps2m_clk = req ? 1'b0 : 1'bz;  //bidir clk/request
  assign ps2m_dat = ~tx[0] ? 1'b0 : 1'bz;  //bidir data

  always @ (posedge clk) begin
    filter <= {filter[$bits(filter)-2:0], ps2m_clk};
    count <= (ps2m_reset | shift | endcount) ? 0 : count+1;
    req <= ~ps2m_reset & ~run & (req ^ endcount);
    sent <= ps2m_reset ? 0 : (done & ~run) ? sent+1 : sent;
    tx <= (ps2m_reset | run) ? {$bits(tx){1'b1}} : req ? {cmd, 1'b0} : shift ? {1'b1, tx[$bits(tx)-1:1]} : tx;
    rx <= (ps2m_reset | done) ? {$bits(rx){1'b1}} : (shift & ~endbit) ? {ps2m_dat, rx[$bits(rx)-1:1]} : rx;
    x <= ~run ? 0 : done ? x + dx : x;
    y <= ~run ? 0 : done ? y - dy : y;
    z <= ~run ? 0 : done ? z + dz : z;
    btn <= ~run ? 0 : done ? rx[3:1] : btn;
    update <= done;
  end

endmodule
