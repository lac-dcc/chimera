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
// Module Name: pll_sync
// Description: Synchronize PLL with PPS input
// 

`timescale 1ns / 1ps
`default_nettype none

module pll_sync(
  input wire 	    clk128,
  input wire 	    areset, // active high reset
  input wire 	    PPS_IN, // Async PPS input
  input wire 	    PPS_PRE, // Calculated PPS out on next clock edge
  output wire 	    PPS_OUT, // PPS out
  output wire 	    PPS_RESET, // Synch pulse to counters
  input wire 	    pll_locked,
  output wire 	    pll_psclk,
  output wire 	    pll_psen,
  output wire 	    pll_psincdec,
  input wire 	    pll_psdone,
  output wire       SYNC_OK,
  output wire [9:0] SYNC_STATUS
  );

  reg [5:0] 	   pps_in_sync; // Sync ffs for PPS_IN
  reg [5:0] 	   pps_ref_del; // Del PPS_OUT to match PPS_IN

  // Synchronize PPS_IN and delay PPS_REF to match
  always @(posedge clk128, posedge areset) begin
    if (areset == 1'b1) begin
      pps_in_sync <= 6'b0;
      pps_ref_del <= 6'b0;
    end else begin
      pps_in_sync[5:1] <= pps_in_sync[4:0];
      pps_in_sync[0]   <= PPS_IN;
      pps_ref_del[5:1] <= pps_ref_del[4:0];
      pps_ref_del[0]   <= PPS_PRE;
    end 
  end

  wire   pps_edge0;
  wire   pps_edge1;
  wire   ref_edge0;
  wire   ref_edge1;
  
  assign pps_edge0  = pps_in_sync[3] & ~pps_in_sync[4]; 
  assign pps_edge1  = pps_in_sync[4] & ~pps_in_sync[5]; 
  assign ref_edge0  = pps_ref_del[3] & ~pps_ref_del[4]; 
  assign ref_edge1  = pps_ref_del[4] & ~pps_ref_del[5]; 
  
  assign pll_psclk  = clk128;

  localparam S_Idle = 2'd0;
  localparam S_Inc  = 2'd1;
  localparam S_Dec  = 2'd2;
  localparam S_Wait = 2'd3;

  wire early;
  wire late;

  assign early = pps_edge0 & ref_edge1; // Our PPS is earlier then PPS_IN
  assign late  = pps_edge0 & ref_edge0; // Our PPS is later then PPS_IN
                
  reg [1:0] State;
  reg [9:0] Meter;   // XXXXXXX keep track of number of incs decs and use it as a metric of sync. ????

  always @(posedge clk128, posedge areset, negedge pll_locked) begin
    if (areset == 1'b1 || pll_locked == 1'b0) begin
      State <= S_Idle;
      Meter <= 10'h200;
    end else begin
      case (State)
        S_Idle : 
          if (early == 1'b1) begin
            State <= S_Inc;  // Let go
            if (Meter != 10'h3FF) Meter <= Meter + 1;
          end
          else if (late == 1'b1) begin
            State <= S_Dec;  // Pull in
            if (Meter != 10'h000) Meter <= Meter - 1;
          end
        S_Inc,S_Dec:
          State <= S_Wait;
        S_Wait :
          if (pll_psdone == 1'b1)
            State <= S_Idle;
      endcase
    end 
  end

  assign pll_psen     = (State == S_Inc || State == S_Dec);
  assign pll_psincdec = (State == S_Inc);

  // pipeline the sync pulse since the counters will probably be somewhere close to PCIe if.
  reg pps_reset_reg;
  always @(posedge clk128, posedge areset, negedge pll_locked) begin
    if (areset == 1'b1 || pll_locked == 1'b0) begin
      pps_reset_reg <= 1'b0;
    end else begin
      pps_reset_reg <= pps_edge0 & ~ref_edge0 & ~ref_edge1;
    end 
  end

  reg sync_ok;
  always @(posedge clk128, posedge areset, negedge pll_locked) begin
    if (areset == 1'b1 || pll_locked == 1'b0) begin
      sync_ok <= 1'b0;
    end else begin
      if (ref_edge1 == 1'b1) begin
	sync_ok <= pps_edge0 | pps_edge1;
      end
    end
  end

  assign PPS_OUT     = pps_ref_del[0];
  assign PPS_RESET   = pps_reset_reg;
  assign SYNC_OK     = sync_ok;
  assign SYNC_STATUS = Meter;
  
endmodule
`default_nettype wire
