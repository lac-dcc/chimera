// This program was cloned from: https://github.com/amm-efabless/my_sram_test_chip1
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2024 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

// This is a simple example of some custom logic which enables Wishbone bus
// access to a single 4kByte (1024x32b) SRAM macro, on condition that the bus
// master is trying to access addresses in the range 0x8000..0xBFFF
// (i.e. when wbs_adr_i[15:14]==2'b10).

// Note that because the SRAM macro only has a 10-bit address bus, this memory
// is mirrored 16 times within this range (i.e. for any combination of wb_adr_i[13:10]).

// This could be used as the basis for making a more-sophisticated Wishbone mux.

// `ifdef USE_POWER_PINS
//   `define USE_PG_PIN 
// `endif

module wishbone_sram (
`ifdef USE_POWER_PINS
  inout         vccd1,	// User area 1 1.8V supply
  inout         vssd1,	// User area 1 digital ground
`endif

  // Wishbone slave connections from Caravel SoC:
  input         wb_clk_i,
  input         wb_rst_i,
  input         wbs_stb_i,
  input         wbs_cyc_i,
  input         wbs_we_i,
  input [3:0]   wbs_sel_i,
  input [31:0]  wbs_dat_i,
  input [31:0]  wbs_adr_i,
  output        wbs_ack_o,
  output [31:0] wbs_dat_o,
  // GPIO out; debug when SRAM is selected:
  output        sram_selected

);

  // When Wishbone address is 16'b_10xxxxxxxxxxxxxx,
  // the SoC has selected our SRAM wrapper:
  assign        sram_selected = (wbs_adr_i[15:14] == 2'b10);

  // Normally we'd mux the Wishbone bus to support multiple devices.
  // In this example case, we're simply gating the SRAM connection:
  wire          sram_wbs_cycle = sram_selected ? wbs_cyc_i : 1'b0;

  // Outputs from the SRAM block, that could go back onto Wishbone:
  wire          sram_wbs_ack;
  wire [31:0]   sram_wbs_data_out;

  // Gate our SRAM block's outputs to the Wishbone bus:
  assign        wbs_ack_o = sram_selected ? sram_wbs_ack      :  1'b0;
  assign        wbs_dat_o = sram_selected ? sram_wbs_data_out : 32'b0;
  // To mux multiple devices, instead of ternary (x?y:z) expressions
  // we'd probably specify the "wbs_*_o" outputs & various devices'
  // "*_wbs_cycle" inputs using an "always @(*)" block with a case
  // statement sensitive to various bit patterns on wbs_adr_i.

  // The code below is MOSTLY as-is from the Efabless
  // ip/EFSRAM_01024x32_008_18/hdl/SRAM_1024x32.v reference design...

  // RAM ports that connect between ram_controller and SRAM_0:
  wire [31:0]   DO;
  wire [31:0]   DI;
  wire [31:0]   BEN;
  wire  [9:0]   AD;
  wire          EN;
  wire          R_WB;
  wire          CLKin;

  // Wishbone-to-SRAM controller interface:
  ram_controller #(.AW(10)) ram_controller(
    // These are "gated" (or muxed) Wishbone signals specifically
    // for THIS device on the Wishbone bus:
    .wbs_cyc_i  (sram_wbs_cycle),
    .wbs_ack_o  (sram_wbs_ack),
    .wbs_dat_o  (sram_wbs_data_out),
    // These are the common Wishbone signals that can go to all Wishbone
    // devices and don't need to be gated or muxed:
    .wb_clk_i   (wb_clk_i),
    .wb_rst_i   (wb_rst_i),
    .wbs_stb_i  (wbs_stb_i),
    .wbs_we_i   (wbs_we_i),
    .wbs_sel_i  (wbs_sel_i),
    .wbs_dat_i  (wbs_dat_i),
    .wbs_adr_i  (wbs_adr_i),
    // These are the signals that bridge to the SRAM_0 macro:
    .DO         (DO),
    .DI         (DI),
    .BEN        (BEN),
    .AD         (AD),
    .EN         (EN),
    .R_WB       (R_WB),
    .CLKin      (CLKin)
  );

  // Wrapper for the EFSRAM hard IP macro, instantiated as "SRAM_0":
  EFSRAM_1024x32_wrapper SRAM_0 (
  `ifdef USE_POWER_PINS
    .vgnd       (vssd1),
    .vnb        (vssd1),
    .vpb        (vccd1),
    .vpwra      (vccd1),
    .vpwrm      (vccd1),
    .vpwrp      (vccd1),
  `endif
    .vpwrac     (1'b1),
    .vpwrpc     (1'b1),
    // access ports
    .DO         (DO),
    .DI         (DI),
    .BEN        (BEN),
    .AD         (AD),
    .EN         (EN),
    .R_WB       (R_WB),
    .CLKin      (CLKin),
    // scan ports
    .TM         (1'b0),
    .SM         (1'b0),
    .ScanInCC   (1'b0),
    .ScanInDL   (1'b0),
    .ScanInDR   (1'b0),
    .ScanOutCC  (),
    .WLBI       (1'b0),
    .WLOFF      (1'b0)
  );

endmodule
