//======================================================================
//
// time_sel_sync.v
// ---------------
// Select clock source and handle clock domain crossing.
//
//
// Author: Rolf Andersson (rolf@mechanicalmen.se)
//
// Copyright 2016-2021 Netnod Internet Exchange i Sverige AB
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived
//    from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`timescale 1ps / 1ps
`default_nettype none

module time_sel_sync (
  input  wire         areset,
  input  wire         clk,
  input  wire         sel,
  input  wire [63:0]  ntp_time_a,
  input  wire         ntp_time_upd_a,
  input  wire [63:0]  ntp_time_b,
  input  wire         ntp_time_upd_b,
  output wire [63:0]  ntp_time
);

  (* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *) reg [2:0] time_a_sync_reg = 3'b0;
  (* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *) reg [2:0] time_b_sync_reg = 3'b0;

  always @(posedge clk) time_a_sync_reg[0] <= ntp_time_upd_a;
  always @(negedge clk) time_a_sync_reg[1] <= time_a_sync_reg[0];
  always @(posedge clk) time_a_sync_reg[2] <= time_a_sync_reg[1];

  reg [63:0] ntp_time_a_sync;
  wire       load_a_sync;
  assign load_a_sync = time_a_sync_reg[1] != time_a_sync_reg[2];
  always @(posedge clk) begin
    if (load_a_sync) begin
      ntp_time_a_sync <= ntp_time_a;
    end
  end

  always @(posedge clk) time_b_sync_reg[0] <= ntp_time_upd_b;
  always @(negedge clk) time_b_sync_reg[1] <= time_b_sync_reg[0];
  always @(posedge clk) time_b_sync_reg[2] <= time_b_sync_reg[1];

  reg [63:0] ntp_time_b_sync;
  wire       load_b_sync;
  assign load_b_sync = time_b_sync_reg[1] != time_b_sync_reg[2];
  always @(posedge clk) begin
    if (load_b_sync) begin
      ntp_time_b_sync <= ntp_time_b;
    end
  end

  (* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *) reg [1:0] sel_sync_reg = 2'b0;

  always @(posedge clk) begin
    sel_sync_reg[0] <= sel;
    sel_sync_reg[1] <= sel_sync_reg[0];
  end

  assign ntp_time = sel_sync_reg[1] == 1'b0 ? ntp_time_a_sync : ntp_time_b_sync;

  specify
    $setup(ntp_time_a, negedge load_a_sync, 5000);
    $setup(ntp_time_b, negedge load_b_sync, 5000);
    $hold(negedge load_a_sync, ntp_time_a, 2500);
    $hold(negedge load_a_sync, ntp_time_b, 2500);
  endspecify

endmodule // time_sel_sync

`default_nettype wire

//======================================================================
// EOF time_sel_sync.v
//======================================================================
