//======================================================================
//
// pp_mac_top.v
// ------------
// Top level for the complete packet processing
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

`default_nettype none

module pp_mac_top (
  input wire         areset, // async reset
  input wire         clk,

  // New style API
  input wire           api_cs,
  input wire           api_we,
  input wire  [11 : 0] api_address,
  input wire  [31 : 0] api_write_data,
  output wire [31 : 0] api_read_data,
  output wire          api_ready,

  // Gen config
  input wire [23:0]  gen_config,

  // NTP Config
  input wire [31:0]  ntp_config,     // LI | VN | Mode | Stratum | Poll | Precision
  input wire [31:0]  ntp_root_delay, // Root Delay
  input wire [31:0]  ntp_root_disp,  // Root Dispersion
  input wire [31:0]  ntp_ref_id,     // Reference ID
  input wire [63:0]  ntp_ref_ts,     // Reference Timestamp
  input wire [31:0]  ntp_rx_ofs,     // RX time stamp offset
  input wire [31:0]  ntp_tx_ofs,     // TX time stamp offset

  // From clock
  input wire [63:0]  ntp_time,

  // MAC
  input wire [63:0]  xgmii_rxd,
  input wire [7:0]   xgmii_rxc,
  output wire [63:0] xgmii_txd,
  output wire [7:0]  xgmii_txc
);


  //----------------------------------------------------------------
  // swap_bytes
  // Swap and mask bytes within a long word.
  //----------------------------------------------------------------
  function [63:0] swap_bytes;
    input [63:0] data;
    input [7:0]  mask; // Avoid Xs
    begin
      swap_bytes[ 0+:8] = data[56+:8] & {8{mask[7]}};
      swap_bytes[ 8+:8] = data[48+:8] & {8{mask[6]}};
      swap_bytes[16+:8] = data[40+:8] & {8{mask[5]}};
      swap_bytes[24+:8] = data[32+:8] & {8{mask[4]}};
      swap_bytes[32+:8] = data[24+:8] & {8{mask[3]}};
      swap_bytes[40+:8] = data[16+:8] & {8{mask[2]}};
      swap_bytes[48+:8] = data[ 8+:8] & {8{mask[1]}};
      swap_bytes[56+:8] = data[ 0+:8] & {8{mask[0]}};
    end
  endfunction


  //----------------------------------------------------------------
  //----------------------------------------------------------------
  wire             aresetn;
  wire [7:0]       rx_mac_data_valid;
  wire [63:0]      rx_mac_data;
  wire             tx_mac_start;
  wire             tx_mac_ack;
  wire [7:0]       tx_mac_data_valid;
  wire [63:0]      tx_mac_data;
  wire             rx_mac_bad_frame;
  wire             rx_mac_good_frame;

  //----------------------------------------------------------------
  //----------------------------------------------------------------
  assign aresetn = ~areset;


  //----------------------------------------------------------------
  // 10GbMAC
  // Note: mask in swap_bytes doesn't work here since it is already
  // swapped (is not needed anyway).
  //----------------------------------------------------------------
  oc_mac mac(
    .res_n         (aresetn),
    .tx_clk        (clk),
    .tx_start      (tx_mac_start),
    .tx_data       (swap_bytes(tx_mac_data, 8'hff)),
    .tx_data_valid (tx_mac_data_valid),
    .xgmii_rxd     (xgmii_rxd),
    .xgmii_rxc     (xgmii_rxc),
    .tx_ack        (tx_mac_ack),
    .rx_clk        (clk),
    .rx_bad_frame  (rx_mac_bad_frame),
    .rx_good_frame (rx_mac_good_frame),
    .rx_data       (rx_mac_data),
    .rx_data_valid (rx_mac_data_valid),
    .xgmii_txc     (xgmii_txc),
    .xgmii_txd     (xgmii_txd)
  );


  //----------------------------------------------------------------
  // Packet processing
  // Soon it will be gone.
  //----------------------------------------------------------------
  pp_top pp(
    .areset         (areset),
    .clk            (clk),

    .api_cs         (api_cs),
    .api_we         (api_we),
    .api_address    (api_address),
    .api_write_data (api_write_data),
    .api_read_data  (api_read_data),
    .api_ready      (api_ready),

    .ntp_time       (ntp_time),

    .rx_data_valid  (rx_mac_data_valid),
    .rx_data        (swap_bytes(rx_mac_data, rx_mac_data_valid)),
    .rx_bad_frame   (rx_mac_bad_frame),
    .rx_good_frame  (rx_mac_good_frame),

    .tx_start       (tx_mac_start),
    .tx_ack         (tx_mac_ack),
    .tx_data_valid  (tx_mac_data_valid),
    .tx_data        (tx_mac_data)
  );

endmodule // pp_mac_top

`default_nettype wire

//======================================================================
// EOF pp_mac_top.v
//======================================================================
