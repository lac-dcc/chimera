//=======================================================================
// Project Polyphony
//
// File:
//   bv_axi_master.v
//
// Abstract:
//   AXI master behavioral model
//
//  Created:
//    27 August 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  Revision History

module bv_axi_master (
    // System
    clk_core,
    rst_x,
    // AXI
    o_awaddr,
    o_awlen,
    o_awsize,
    o_awburst,
    o_awvalid,
    i_awready,
    o_wdata,
    o_wstrb,
    o_wlast,
    o_wvalid,
    i_wready,
    i_bresp,
    i_bvalid,
    o_bready,
    o_araddr,
    o_arlen,
    o_arsize,
    o_arburst,
    o_arvalid,
    i_arready,
    i_rdata,
    i_rresp,
    i_rlast,
    i_rvalid,
    o_rready
);

parameter AXI_DATA_WIDTH = 32;
parameter AXI_BE_WIDTH   = 4;
    
input clk_core;
input rst_x;

output [31:0] o_awaddr;
output [3:0]  o_awlen;
output [2:0]  o_awsize;
output [1:0]  o_awburst;
output        o_awvalid;
input         i_awready;
output [AXI_DATA_WIDTH-1:0] o_wdata;
output [AXI_BE_WIDTH-1:0]   o_wstrb;
output        o_wlast;
output        o_wvalid;
input         i_wready;
input [1:0]   i_bresp;
input         i_bvalid;
output        o_bready;
output [31:0] o_araddr;
output [3:0]  o_arlen;
output [2:0]  o_arsize;
output [1:0]  o_arburst;
output        o_arvalid;
input         i_arready;
input [AXI_DATA_WIDTH-1:0] i_rdata;
input [1:0]   i_rresp;
input         i_rlast;
input         i_rvalid;
output        o_rready;


assign o_awsize  = (AXI_DATA_WIDTH == 32) ? 3'b010 : 3'b011;
assign o_awburst = 2'b01;
assign o_arsize  = (AXI_DATA_WIDTH == 32) ? 3'b010 : 3'b011;
assign o_arburst = 2'b01;
     
reg [31:0]               o_awaddr; 
reg [3:0]                o_awlen;
reg                      o_awvalid; 
reg [AXI_DATA_WIDTH-1:0] o_wdata;
reg [AXI_BE_WIDTH-1:0]   o_wstrb;
reg                      o_wlast;
reg                      o_wvalid;
reg                      o_bready;
reg [31:0]               o_araddr;
reg [3:0]                o_arlen;
reg                      o_arvalid;
reg                      o_rready;

initial begin
    o_awaddr = 0;
    o_awlen = 0;
    o_awvalid = 0;
    o_wdata = 0; 
    o_wstrb = 0;
    o_wlast = 0;
    o_wvalid = 0;
    o_bready = 0;
    o_araddr = 0;
    o_arlen = 0;
    o_arvalid = 0;
    o_rready = 0;
end

task axi_single_write;
    input [31:0] i_adr;
    input [AXI_BE_WIDTH-1:0]  i_be;
    input [AXI_DATA_WIDTH-1:0] i_dat;
    begin
        @(posedge clk_core) #1;
        o_awaddr      = i_adr;
        o_awlen       = 4'd0;
        o_awvalid     = 1;
        o_wdata       = i_dat;
        o_wstrb       = i_be;
        o_wlast       = 0;
        o_wvalid      = 0;
        o_bready      = 0;
        while(!i_awready) @(posedge clk_core) #1;
        @(posedge clk_core) #1;
        o_awvalid = 0;
        o_wlast   = 1;
        o_wvalid  = 1;
        o_bready  = 1;
        while(!i_wready) @(posedge clk_core) #1; 
        @(posedge clk_core) #1;
        o_wvalid  = 0;
        o_wlast   = 0;
        o_wvalid  = 0;
        while(!i_bvalid) @(posedge clk_core);
        @(posedge clk_core) #1;
        o_bready       = 0;
        @(posedge clk_core) #1;
    end
endtask
   
task axi_single_read;
    input [31:0] i_adr;
    output [AXI_DATA_WIDTH-1:0] o_dat;
    begin
        @(posedge clk_core) #1;
        o_arvalid     = 1;
        o_araddr      = i_adr;
        o_arlen       = 4'd0;
        while(!i_arready) @(posedge clk_core) #1;
        @(posedge clk_core) #1;
        o_arvalid     = 0;
        @(posedge clk_core) #1;
        while(!i_rvalid) @(posedge clk_core) #1;
        o_dat = i_rdata;
        o_rready  = 1;
        @(posedge clk_core) #1;
        o_rready  = 0;
        @(posedge clk_core) #1;
    end
endtask

endmodule

