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
// Module Name: ntp_counters
// Description: counters for keeping the NTP time
// 

`timescale 1ps / 1ps
`default_nettype none


// NOTE that counter will run 1 clock step ahead due to pipeline register on the output
module ntp_counters #(
  parameter PLL_SYNC_LATENCY = 6,    // Delay in PLL sync
  parameter PPS_LENGTH       = 1000  // clock periods
 )(
  input wire         ntp_clk,
  input wire         areset,
  input wire         pps_reset,
  input wire [31:0]  new_second,
  input wire         second_set,
  output wire        second_set_done,
  input wire [31:0]  leap_second,
  input wire         leap_set,
  output wire        leap_set_done,
  input wire         leap_inc,
  output wire [63:0] ntp_time,
  output wire        ntp_time_upd,  // Toggle everytime ntp_time changes
  output wire        pps_pre
 );

  reg [31:0] seconds;
  reg [26:0] fractions;
  reg        pps_reg;

  reg        sec_set_done_reg;
  reg        leap_set_done_reg;
  
  // Synchronizers since control signals comes from AXI clock  domain. Note write second registers before setting.
  wire       second_set_sync;
  wire       leap_set_sync;
  wire       leap_inc_sync;
  
  synchronizer_simple #(.DATA_WIDTH(1)) s_sync_second_set (.data_in(second_set), .new_clk(ntp_clk), .data_out(second_set_sync));
  synchronizer_simple #(.DATA_WIDTH(1)) s_sync_leap_set   (.data_in(leap_set),   .new_clk(ntp_clk), .data_out(leap_set_sync));
  synchronizer_simple #(.DATA_WIDTH(1)) s_sync_leap_inc   (.data_in(leap_inc),   .new_clk(ntp_clk), .data_out(leap_inc_sync));

  always @(posedge ntp_clk, posedge areset) begin
    if (areset == 1'b1) begin
      seconds           <= 32'b0;
      fractions         <= 27'b0;
      sec_set_done_reg  <= 1'b0;
      leap_set_done_reg <= 1'b0;
    end else begin

      if (pps_reset == 1'b1) begin
        // resync
        fractions <= PLL_SYNC_LATENCY;
      end else if (fractions == 27'd127_999_999) begin
        fractions <= 27'b0;
        if (second_set_sync == 1'b1) begin
          seconds <= new_second;
          sec_set_done_reg <= 1'b1;
        end else if (leap_set_sync == 1'b1) begin
          if ((leap_inc_sync == 1'b1) && (seconds == leap_second)) begin
            seconds <= seconds + 0; // double this 
            leap_set_done_reg <= 1'b1;
          end else if ((leap_inc_sync == 1'b0) && (seconds == leap_second - 1)) begin
            seconds <= seconds + 2; // skip "leap second"
            leap_set_done_reg <= 1'b1;
          end else begin
            seconds <= seconds + 1; // Normal
          end
        end else begin
          seconds <= seconds + 1; // Normal
        end
      end else begin
        fractions <= fractions + 1;
      end // else: !if(fractions == 27'd127_999_999)

      // Two way hand shake becuase of clock domain crossings
      if (second_set_sync == 1'b0) begin
        sec_set_done_reg  <= 1'b0;
      end
      if (leap_set_sync == 1'b0) begin
        leap_set_done_reg <= 1'b0;
      end

    end // else: !if(areset == 1'b1)
  end // always @ (posedge ntp_clk, posedge areset)

  
  // Create an "early" pps signal that will be delayed in the pps sync module
  reg pps_pre_reg;
  always @(posedge ntp_clk, posedge areset) begin
    if (areset == 1'b1) begin
      pps_pre_reg <= 1'b0;
    end else begin
      pps_pre_reg <= (fractions >= 27'd127_999_999 || fractions < PPS_LENGTH-1);
    end
  end

  // Convert our mod 128000000 fraction into 32 bit binary
  localparam SCALE =  38'd144115188076; // 2**64/128000000
  assign pps_pre = pps_pre_reg;
  wire [64:0] tmp_prod;
  assign tmp_prod = (fractions * SCALE) + 32'h8000_0000;

  reg [63:0] ntp_time_reg;
  reg        ntp_time_upd_reg;

  always @(posedge ntp_clk, posedge areset) begin
    if (areset == 1'b1) begin
      ntp_time_reg     <= 64'b0;
      ntp_time_upd_reg <= 1'b0;
    end else begin
      ntp_time_reg     <=  {seconds, tmp_prod[63:32]};
      ntp_time_upd_reg <= fractions[0];
    end
  end

  assign ntp_time     = ntp_time_reg;
  assign ntp_time_upd = ntp_time_upd_reg;

  assign second_set_done = sec_set_done_reg;
  assign leap_set_done   = leap_set_done_reg;

endmodule

`default_nettype wire
