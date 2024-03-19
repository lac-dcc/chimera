//======================================================================
//
// network_path.v
// --------------
// Module Name: network_path
// Description: Wrap complete network path from including
// actual NTP server.
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

module network_path #(parameter integer INSTANTIATE_ROSC = 1)
  (
  input wire [1 : 0]    api_ext_command,
  input wire [31 : 0]   api_ext_address,
  input wire [31 : 0]   api_ext_write_data,
  output wire [1 : 0]   api_ext_status,
  output wire [31 : 0]  api_ext_read_data,

  input wire [63:0]     ntp_time,

  input wire [63 : 0]   xgmii_rxd,
  input wire [7  : 0]   xgmii_rxc,
  output wire [63  : 0] xgmii_txd,
  output wire [7   : 0] xgmii_txc,

  input wire 	        clk156,
  input wire 	        areset_clk156,
  input wire 	        sys_reset
);

  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  wire          pp_api_cs;
  wire          pp_api_we;
  wire [11 : 0] pp_api_address;
  wire [31 : 0] pp_api_write_data;
  wire [31 : 0] pp_api_read_data;
  wire          pp_api_ready;

  wire          rosc_cs;
  wire          rosc_we;
  wire [7 : 0]  rosc_address;
  wire [31 : 0] rosc_write_data;
  wire [31 : 0] rosc_read_data;


  //----------------------------------------------------------------
  // Packet processing including MAC
  //----------------------------------------------------------------
  pp_mac_top pp(
    .areset         (sys_reset),
    .clk            (clk156),

    .api_cs         (pp_api_cs),
    .api_we         (pp_api_we),
    .api_address    (pp_api_address),
    .api_write_data (pp_api_write_data),
    .api_read_data  (pp_api_read_data),
    .api_ready      (pp_api_ready),
    .ntp_time       (ntp_time),
    .xgmii_rxd      (xgmii_rxd),
    .xgmii_rxc      (xgmii_rxc),
    .xgmii_txd      (xgmii_txd),
    .xgmii_txc      (xgmii_txc)
  );


  //----------------------------------------------------------------
  // api_extension0
  //----------------------------------------------------------------
   api_extension api_extension0 (
    .clk(clk156),
    .reset(areset_clk156),

    // I/O port.
    .command(api_ext_command),
    .status(api_ext_status),
    .address(api_ext_address),
    .write_data(api_ext_write_data),
    .read_data(api_ext_read_data),

    // Access ports to extensions.
    .nts_cs(),
    .nts_we(),
    .nts_address(),
    .nts_write_data(),
    .nts_read_data(32'haaaa5555),
    .nts_ready(1'h1),

    .pp_cs(pp_api_cs),
    .pp_we(pp_api_we),
    .pp_address(pp_api_address),
    .pp_write_data(pp_api_write_data),
    .pp_read_data(pp_api_read_data),
    .pp_ready(pp_api_ready),

    .merge_cs(),
    .merge_we(),
    .merge_address(),
    .merge_write_data(),
    .merge_read_data(32'hdeaddead),
    .merge_ready(1'h1),

    .rosc_cs(rosc_cs),
    .rosc_we(rosc_we),
    .rosc_address(rosc_address),
    .rosc_write_data(rosc_write_data),
    .rosc_read_data(rosc_read_data),
    .rosc_ready(1'h1)
  );


  //----------------------------------------------------------------
  // rosc
  // Ring Oscillator based entropy source. Used by SW to seed
  // the system level random generator. Only instatiated if
  // INSTANTIATE_ROSC != 0.
  //----------------------------------------------------------------
  generate
    if (INSTANTIATE_ROSC)
      begin
        rosc_entropy rosc(
                          .clk(clk156),
                          .reset(areset_clk156),
                          .cs(rosc_cs),
                          .we(rosc_we),
                          .address(rosc_address[7 : 0]),
                          .write_data(rosc_write_data),
                          .read_data(rosc_read_data)
                          );
      end
    else
      begin
        assign rosc_read_data = 32'hdeadbeef;
      end
  endgenerate

endmodule

`default_nettype wire

//======================================================================
// EOF network_path.v
//======================================================================
