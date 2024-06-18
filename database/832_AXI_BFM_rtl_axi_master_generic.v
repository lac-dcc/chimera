// This program was cloned from: https://github.com/ptracton/AXI_BFM
// License: MIT License

//                              -*- Mode: Verilog -*-
// Filename        : axi_master_generic.v
// Description     : AXI Master Generic
// Author          : Philip Tracton
// Created On      : Fri Dec  9 17:40:49 2016
// Last Modified By: Philip Tracton
// Last Modified On: Fri Dec  9 17:40:49 2016
// Update Count    : 0
// Status          : Unknown, Use with caution!

module axi_master_generic (/*AUTOARG*/
   // Outputs
   awid, awadr, awlen, awsize, awburst, awlock, awcache, awprot,
   awvalid, wid, wrdata, wstrb, wlast, wvalid, bid, bresp, bvalid,
   arid, araddr, arlen, arsize, arlock, arcache, arprot, arvalid,
   rready,
   // Inputs
   aclk, aresetn, awready, wready, bready, arready, rid, rdata, rresp,
   rlast, rvalid
   ) ;
   //
   // Global Signals
   //
   input wire aclk;
   input wire aresetn;   //Active LOW
   
   //
   // Write Address Channel
   //
   output reg [3:0] awid;     // Address Write ID
   output reg [31:0] awadr;   // Write Address
   output reg [3:0]  awlen;   // Burst Length
   output reg [2:0]  awsize;  // Burst Size
   output reg [1:0]  awburst; // Burst Type
   output reg [1:0]  awlock;  // Lock Type
   output reg [3:0]  awcache; // Cache Type
   output reg [2:0]  awprot;  // Protection Type
   output reg        awvalid; // Write Address Valid   
   input wire        awready; // Write Address Ready

   //
   // Write Data Channel
   //
   output reg [3:0]  wid;     // Write ID
   output reg [31:0] wrdata;  // Write Data
   output reg [3:0]  wstrb;   // Write Strobes
   output reg        wlast;   // Write Last
   output reg        wvalid;  // Write Valid   
   input wire        wready;  // Write Ready
   
   //
   // Write Response CHannel
   //
   output reg [3:0]  bid;    // Response ID
   output reg [1:0]  bresp;  // Write Response
   output reg        bvalid; // Write Response Valid   
   input wire        bready; // Response Ready
   
   //
   // Read Address Channel
   //
   output reg [3:0]  arid;    // Read Address ID
   output reg [31:0] araddr;  // Read Address
   output reg [3:0]  arlen;   // Burst Length
   output reg [2:0]  arsize;  // Burst Size
   output reg [1:0]  arlock;  // Lock Type
   output reg [3:0]  arcache; // Cache Type
   output reg [2:0]  arprot;  // Protection Type
   output reg        arvalid; // Read Address Valid   
   input wire        arready; // Read Address Ready
   input wire [3:0]  rid;     // Read ID
   input wire [31:0] rdata;   // Read Data
   input wire [1:0]  rresp;   // Read Response
   input wire        rlast;   // Read Last
   input wire        rvalid;  // Read Valid
   output reg        rready;  // Read Ready
   
endmodule // axi_master_generic
