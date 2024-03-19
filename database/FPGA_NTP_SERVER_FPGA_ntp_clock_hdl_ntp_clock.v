//======================================================================
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
// Author: Rolf Andersson (rolf@mechanicalmen.se)
//
// Design Name: FPGA NTP Server
// Module Name: ntp_clock
// Description: NTP clock
//======================================================================

`default_nettype none

module ntp_clock # (
   // Parameters of Axi Slave Bus Interface AXI
   parameter integer C_AXI_DATA_WIDTH = 32,
   parameter integer C_AXI_ADDR_WIDTH = 5
  )(
   input wire           areset,

   input wire           clk128,
   input wire           PPS_IN,
   output wire          PPS_OUT,

   output reg [63:0]    NTP_TIME,
   output reg           NTP_TIME_UPD,

   output wire [9:0]    PLL_SYNC_STATUS,

   output wire          pll_psclk,
   output wire          pll_psen,
   output wire          pll_psincdec,
   input wire           pll_psdone,
   input wire           pll_locked,

   output wire          LED1,
   output wire          LED2,
   output wire          LED3,
   output wire          LED4,
   output wire          LED5,
   output wire          LED6,
   output wire          LED7,
   output wire          LED8,

   output wire          SYNC_OK,

   // Ports of Axi Slave Bus Interface
   input wire                            axi_aclk,
   input wire                            axi_aresetn,
   input wire [C_AXI_ADDR_WIDTH-1:0]     axi_awaddr,
   input wire [2:0]                      axi_awprot,
   input wire                            axi_awvalid,
   output wire                           axi_awready,
   input wire [C_AXI_DATA_WIDTH-1:0]     axi_wdata,
   input wire [(C_AXI_DATA_WIDTH/8)-1:0] axi_wstrb,
   input wire                            axi_wvalid,
   output wire                           axi_wready,
   output wire [1:0]                     axi_bresp,
   output wire                           axi_bvalid,
   input wire                            axi_bready,
   input wire [C_AXI_ADDR_WIDTH-1:0]     axi_araddr,
   input wire [2:0]                      axi_arprot,
   input wire                            axi_arvalid,
   output wire                           axi_arready,
   output wire [C_AXI_DATA_WIDTH-1:0]    axi_rdata,
   output wire [1:0]                     axi_rresp,
   output wire                           axi_rvalid,
   input wire                            axi_rready
 );

  //----------------------------------------------------------------
  //----------------------------------------------------------------
  wire        pps_reset;
  wire        pll_sync_ok;
  wire [9:0]  pll_sync_status;
  wire [31:0] new_second;
  wire        second_set;
  wire        second_set_done;
  wire [31:0] leap_second;
  wire        leap_set;
  wire        leap_set_done;
  wire        leap_inc;
  wire [63:0] NTP_TIME_sync;


  //----------------------------------------------------------------
  //----------------------------------------------------------------
  assign PLL_SYNC_STATUS = pll_sync_status;
  assign SYNC_OK = pll_sync_ok;


  //----------------------------------------------------------------
  // clock domain crossing for NTP time, there will be a delay that
  // will be negligible compared to SW latency
  //----------------------------------------------------------------
  synchronizer_vector #(.DATA_WIDTH(64))
  sync_time (
             .data_in(NTP_TIME),
             .old_clk(clk128),
             .new_clk(axi_aclk),
             .data_out(NTP_TIME_sync)
             );


  //----------------------------------------------------------------
  // Instantiation of Axi Bus Interface AXI
  //----------------------------------------------------------------
  ntp_clock_axi_slave # (
    .C_S_AXI_DATA_WIDTH (C_AXI_DATA_WIDTH),
    .C_S_AXI_ADDR_WIDTH (C_AXI_ADDR_WIDTH)
  )
  ntp_clock_axi_slave_0 (
    .S_AXI_ACLK      (axi_aclk),
    .S_AXI_ARESETN   (axi_aresetn),
    .S_AXI_AWADDR    (axi_awaddr),
    .S_AXI_AWPROT    (axi_awprot),
    .S_AXI_AWVALID   (axi_awvalid),
    .S_AXI_AWREADY   (axi_awready),
    .S_AXI_WDATA     (axi_wdata),
    .S_AXI_WSTRB     (axi_wstrb),
    .S_AXI_WVALID    (axi_wvalid),
    .S_AXI_WREADY    (axi_wready),
    .S_AXI_BRESP     (axi_bresp),
    .S_AXI_BVALID    (axi_bvalid),
    .S_AXI_BREADY    (axi_bready),
    .S_AXI_ARADDR    (axi_araddr),
    .S_AXI_ARPROT    (axi_arprot),
    .S_AXI_ARVALID   (axi_arvalid),
    .S_AXI_ARREADY   (axi_arready),
    .S_AXI_RDATA     (axi_rdata),
    .S_AXI_RRESP     (axi_rresp),
    .S_AXI_RVALID    (axi_rvalid),
    .S_AXI_RREADY    (axi_rready),

    .ntp_time        (NTP_TIME_sync),
    .pll_locked      (pll_locked),
    .pll_sync_status (pll_sync_status),
    .pll_sync_ok     (pll_sync_ok),
    .new_second      (new_second),
    .second_set_done (second_set_done),
    .second_set      (second_set),
    .leap_second     (leap_second),
    .leap_set        (leap_set),
    .leap_set_done   (leap_set_done),
    .leap_inc        (leap_inc),

    .LED1            (LED1),
    .LED2            (LED2),
    .LED3            (LED3),
    .LED4            (LED4),
    .LED5            (LED5),
    .LED6            (LED6),
    .LED7            (LED7),
    .LED8            (LED8)
  );


  //----------------------------------------------------------------
  //----------------------------------------------------------------
  wire pps_pre;

  pll_sync pll_sync_inst0 (
    .areset          (areset),
    .clk128          (clk128),
    .PPS_IN          (PPS_IN),
    .PPS_PRE         (pps_pre),
    .PPS_OUT         (PPS_OUT),
    .PPS_RESET       (pps_reset),
    .pll_locked      (pll_locked),
    .pll_psclk       (pll_psclk),
    .pll_psen        (pll_psen),
    .pll_psincdec    (pll_psincdec),
    .pll_psdone      (pll_psdone),
    .SYNC_OK         (pll_sync_ok),
    .SYNC_STATUS     (pll_sync_status)
  );


  //----------------------------------------------------------------
  // NTP counters.
  //----------------------------------------------------------------
  wire [63:0] ntp_time;
  wire        ntp_time_upd;

  ntp_counters ntp_counters_inst0 (
    .areset          (areset),
    .ntp_clk         (clk128),
    .pps_reset       (pps_reset),
    .new_second      (new_second),
    .second_set      (second_set),
    .second_set_done (second_set_done),
    .leap_second     (leap_second),
    .leap_set        (leap_set),
    .leap_set_done   (leap_set_done),
    .leap_inc        (leap_inc),
    .ntp_time        (ntp_time),
    .ntp_time_upd    (ntp_time_upd),
    .pps_pre         (pps_pre)
  );


  //----------------------------------------------------------------
  // Throttle down data rate to allow the network
  // paths can catch them.
  //----------------------------------------------------------------
  always @(posedge clk128, posedge areset) begin
    if (areset == 1'b1) begin
      NTP_TIME     <=  64'h0;
      NTP_TIME_UPD <= 1'b0;

    end else if (ntp_time_upd) begin
      NTP_TIME     <=  ntp_time;
      NTP_TIME_UPD <= ~NTP_TIME_UPD;
    end
  end

endmodule

`default_nettype wire

//======================================================================
// EOF ntp_clock.v
//======================================================================
