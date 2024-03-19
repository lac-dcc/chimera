//
// Copyright 2016 Netnod Internet Exchange i Sverige AB
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
//
// Author: Rolf Andersson (rolf@mechanicalmen.se)
//
// Design Name: FPGA NTP Server
// Module Name: tb_time_sel_sync
// Description: Test bench
// 

`timescale 1ps / 1ps
`default_nettype none

module tb_time_sel_sync;

  reg clk_128 = 1'b0;
  reg clk_156 = 1'b1;

  always begin
    #6400 clk_156 <= ~clk_156;
  end
  always begin
    #7812 clk_128 <= ~clk_128;
  end

  reg [63:0]  ntp_time_a = '1;
  reg         ntp_time_upd_a = 1'b0;
  reg [63:0]  ntp_time_b = '1;
  reg         ntp_time_upd_b = 1'b0;

  wire [63:0]  ntp_time;
  
       
  always @(posedge clk_128) begin
    ntp_time_a = ntp_time_a + 1;
    ntp_time_upd_a = ~ntp_time_upd_a;
    ntp_time_b = ntp_time_b + 1;
    ntp_time_upd_b = ~ntp_time_upd_b;
  end

  time_sel_sync tss (
    .areset          (1'b0),
    .clk             (clk_156),
    .sel             (1'b0),
    .ntp_time_a      (ntp_time_a),
    .ntp_time_upd_a  (ntp_time_upd_a),
    .ntp_time_b      (ntp_time_b),
    .ntp_time_upd_b  (ntp_time_upd_b),
    .ntp_time        (ntp_time)
  );

endmodule

`default_nettype wire
