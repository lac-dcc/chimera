// This program was cloned from: https://github.com/IObundle/iob-lib
// License: MIT License

`timescale 1ns / 1ps

`include "axi.vh"

module iob2axil #
  (
   parameter AXIL_ADDR_W = 32, // Width of address bus in bits
   parameter AXIL_DATA_W = 32  // Width of data bus in bits
   )
   (
    input                        clk,
    input                        rst,

    //
    // AXI-4 lite master interface
    //
`include "axil_m_port.vh"

    //
    // Native slave interface
    //
    input                        valid,
    input [AXIL_ADDR_W-1:0]      addr,
    input [AXIL_DATA_W-1:0]      wdata,
    input [AXIL_DATA_W/8-1:0]    wstrb,
    output reg [AXIL_DATA_W-1:0] rdata,
    output                       ready
    );

   assign axil_awaddr  = addr;
   assign axil_araddr  = addr;
   assign axil_wdata   = wdata;
   assign axil_wstrb   = wstrb;

   // AXI IDs
   assign axil_awid = `AXI_ID_W'd0;
   assign axil_wid  = `AXI_ID_W'd0;
   assign axil_arid = `AXI_ID_W'd0;

   // Protection types
   assign axil_awprot = `AXI_PROT_W'd2;
   assign axil_arprot = `AXI_PROT_W'd2;

   // Quality of services
   assign axil_awqos = `AXI_QOS_W'd0;
   assign axil_arqos = `AXI_QOS_W'd0;

   always @(posedge clk, posedge rst) begin
      if (rst) begin
         rdata <= {AXIL_DATA_W{1'b0}};
      end else begin
         rdata <= axil_rdata;
      end
   end

   wire                          wr = valid & |wstrb;
   wire                          rd = valid & ~|wstrb;
   reg                           wr_reg, rd_reg;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         wr_reg <= 1'b0;
         rd_reg <= 1'b0;
      end else begin
         wr_reg <= wr;
         rd_reg <= rd;
      end
   end

   reg                           awvalid_ack;
   assign axil_awvalid = (wr | wr_reg) & ~awvalid_ack;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         awvalid_ack <= 1'b0;
      end else if (axil_awvalid & axil_awready) begin
         awvalid_ack <= 1'b1;
      end else if (axil_bvalid) begin
         awvalid_ack <= 1'b0;
      end
   end

   reg                           wvalid_ack;
   assign axil_wvalid = (wr | wr_reg)  & ~wvalid_ack;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         wvalid_ack <= 1'b0;
      end else if (axil_wvalid & axil_wready) begin
         wvalid_ack <= 1'b1;
      end else begin
         wvalid_ack <= 1'b0;
      end
   end

   assign axil_bready = 1'b1;

   reg                           axil_rvalid_reg;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         axil_rvalid_reg <= 1'b0;
      end else begin
         axil_rvalid_reg <= axil_rvalid;
      end
   end

   reg                           arvalid_ack;
   assign axil_arvalid = (rd | rd_reg) & ~arvalid_ack;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         arvalid_ack <= 1'b0;
      end else if (axil_arvalid & axil_arready) begin
         arvalid_ack <= 1'b1;
      end else if (axil_rvalid | axil_rvalid_reg) begin
         arvalid_ack <= 1'b0;
      end
   end

   reg                           rready_ack;
   assign axil_rready = (rd | rd_reg) & ~rready_ack;
   always @(posedge clk, posedge rst) begin
      if (rst) begin
         rready_ack <= 1'b0;
      end else if (axil_rvalid & axil_rready) begin
         rready_ack <= 1'b1;
      end else begin
         rready_ack <= 1'b0;
      end
   end

   assign ready = axil_bvalid | rready_ack;

endmodule
