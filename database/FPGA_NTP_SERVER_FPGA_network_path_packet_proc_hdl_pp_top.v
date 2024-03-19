//
// Copyright 2017-2021 Netnod Internet Exchange i Sverige AB
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
// Module Name: pp_top
// Description: Top level for the complete packet processing
//

`default_nettype none

module pp_top (
  input wire           areset, // async reset
  input wire           clk,

  input wire           api_cs,
  input wire           api_we,
  input wire  [11 : 0] api_address,
  input wire  [31 : 0] api_write_data,
  output wire [31 : 0] api_read_data,
  output wire          api_ready,

  // From clock
  input wire [63:0]    ntp_time,

  // MAC
  input  wire [7:0]  rx_data_valid,
  input  wire [63:0] rx_data,
  input  wire        rx_bad_frame,
  input  wire        rx_good_frame,

  output wire        tx_start,
  input  wire        tx_ack,
  output wire [7:0]  tx_data_valid,
  output wire [63:0] tx_data
);


  //--------------------------------------------------------------
  // Stub assignments. Now we kill off the pp-functionality.
  //--------------------------------------------------------------
  assign tx_start      = 1'h0;
  assign tx_data_valid = 64'h0;
  assign tx_data       = 8'h0;


  //--------------------------------------------------------------
  // pp_api_inst.
  // Keeping the pp_api for now to make SW happy.
  //--------------------------------------------------------------
  pp_api pp_api_inst(
              .clk        (clk),
              .areset     (areset),
              .cs         (api_cs),
              .we         (api_we),
              .address    (api_address),
              .write_data (api_write_data),
              .read_data  (api_read_data),
              .ready      (api_ready)
             );

endmodule // pp_top
