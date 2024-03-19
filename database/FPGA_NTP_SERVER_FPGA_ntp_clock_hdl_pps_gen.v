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
// Module Name: pps_gen
// Description: Generate PPS an 10MHz internally in FPGA. For testing purposes
// 
// 

`timescale 1ns / 1ps
`default_nettype none

module pps_gen(
    input  wire areset,
    input  wire clk10MHz,
    input  wire clk100MHz,
    output wire PPS_OUT
    );

  reg      outp_ff;

  reg [23:0] divider;

  always @(posedge clk10MHz, posedge areset) begin
    if (areset == 1'b1) begin
      divider <= 24'b0;
    end else begin
      if (divider != 24'b0) begin
        divider <= divider - 1;
      end else begin
        divider <= 9999999;
        //divider <= 999;
      end
    end
  end // always @ (posedge clk10MHz, posedge areset)
  
  always @(negedge clk100MHz, posedge areset) begin
    if (areset == 1'b1) begin
      outp_ff <= 1'b0;
    end else begin
      if (divider < 24'd999) begin
        outp_ff <= 1'b1;
      end else begin
        outp_ff <= 1'b0;
      end
    end
  end // always @ (negedge clk100MHz, posedge areset)
  
  assign PPS_OUT = outp_ff;
  
endmodule

`default_nettype wire
