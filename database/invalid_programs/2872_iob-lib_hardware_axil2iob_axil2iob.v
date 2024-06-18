// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`include "axi.vh"

module axil2iob
  #(
    parameter AXIL_ADDR_W = 32, // Width of address bus in bits
    parameter AXIL_DATA_W = 32  // Width of data bus in bits
    )
   (
    // AXI-4 lite slave interface
`include "axil_s_port.vh"

    // Native master interface
    output                     valid,
    output [AXIL_ADDR_W-1:0]   addr,
    output [AXIL_DATA_W-1:0]   wdata,
    output [AXIL_DATA_W/8-1:0] wstrb,
    input [AXIL_DATA_W-1:0]    rdata,
    input                      ready,
`include "iob_gen_if.vh"
    );

   reg                         awvalid_ack;
   reg                         arvalid_ack;

   assign axil_rdata = rdata;

   // AXI IDs
   assign axil_bid = `AXI_ID_W'd0;
   assign axil_rid = `AXI_ID_W'd0;

   // Response is always OK
   assign axil_bresp = `AXI_RESP_W'd0;
   assign axil_rresp = `AXI_RESP_W'd0;

   assign valid = (axil_wvalid | axil_arvalid) & ~ready;
   assign addr  = axil_wvalid? axil_awaddr: axil_araddr;
   assign wstrb = axil_wvalid? axil_wstrb: {(AXIL_DATA_W/8){1'b0}};
   assign wdata = axil_wdata;

   assign axil_awready = awvalid_ack & ready;
   assign axil_wready  = awvalid_ack & ready;
   assign axil_arready = arvalid_ack & ready;
   assign axil_rvalid  = arvalid_ack & ready;

   reg                         axil_bvalid_int;
   assign axil_bvalid = axil_bvalid_int;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         axil_bvalid_int <= 1'b0;
      end else begin
         axil_bvalid_int <= axil_wready;
      end
   end

   always @(posedge clk, posedge rst) begin
      if (rst) begin
         awvalid_ack <= 1'b0;
      end else if (axil_awvalid & ~awvalid_ack) begin
         awvalid_ack <= 1'b1;
      end else if (ready) begin
         awvalid_ack <= 1'b0;
      end
   end

   always @(posedge clk, posedge rst) begin
      if (rst) begin
         arvalid_ack <= 1'b0;
      end else if (axil_arvalid & ~arvalid_ack) begin
         arvalid_ack <= 1'b1;
      end else if (ready) begin
         arvalid_ack <= 1'b0;
      end
   end

endmodule
