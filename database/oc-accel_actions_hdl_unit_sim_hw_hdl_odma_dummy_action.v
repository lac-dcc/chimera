// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
module odma_dummy_action #(
    parameter DDR_AXI_ID_WIDTH     = 4,
    parameter DDR_AXI_ADDR_WIDTH   = 33,
    parameter DDR_AXI_DATA_WIDTH   = 512,
    parameter DDR_AXI_AWUSER_WIDTH = 1,
    parameter DDR_AXI_ARUSER_WIDTH = 1,
    parameter DDR_AXI_WUSER_WIDTH  = 1,
    parameter DDR_AXI_RUSER_WIDTH  = 1,
    parameter DDR_AXI_BUSER_WIDTH  = 1,

    parameter AXI_ID_WIDTH         = 5,
    parameter AXI_ADDR_WIDTH       = 64,
    parameter AXI_DATA_WIDTH       = 1024,
    parameter AXI_AWUSER_WIDTH     = 9,
    parameter AXI_ARUSER_WIDTH     = 9,
    parameter AXI_WUSER_WIDTH      = 1,
    parameter AXI_RUSER_WIDTH      = 1,
    parameter AXI_BUSER_WIDTH      = 1,
    parameter AXIL_ADDR_WIDTH      = 32,
    parameter AXIL_DATA_WIDTH      = 32
)
(
    input                                   clk,
    input                                   rst_n,
    // AXI SDRAM Interface
    output [DDR_AXI_ADDR_WIDTH-1 : 0 ]      ddr_axi_araddr,
    output [1 : 0 ]                         ddr_axi_arburst,
    output [3 : 0 ]                         ddr_axi_arcache,
    output [DDR_AXI_ID_WIDTH-1 : 0 ]        ddr_axi_arid,
    output [7 : 0 ]                         ddr_axi_arlen,
    output [1 : 0 ]                         ddr_axi_arlock,
    output [2 : 0 ]                         ddr_axi_arprot,
    output [3 : 0 ]                         ddr_axi_arqos,
    input                                   ddr_axi_arready,
    output [3 : 0 ]                         ddr_axi_arregion,
    output [2 : 0 ]                         ddr_axi_arsize,
    output [DDR_AXI_ARUSER_WIDTH-1 : 0 ]    ddr_axi_aruser,
    output                                  ddr_axi_arvalid,
    output [DDR_AXI_ADDR_WIDTH-1 : 0 ]      ddr_axi_awaddr,
    output [1 : 0 ]                         ddr_axi_awburst,
    output [3 : 0 ]                         ddr_axi_awcache,
    output [DDR_AXI_ID_WIDTH-1 : 0 ]        ddr_axi_awid,
    output [7 : 0 ]                         ddr_axi_awlen,
    output [1 : 0 ]                         ddr_axi_awlock,
    output [2 : 0 ]                         ddr_axi_awprot,
    output [3 : 0 ]                         ddr_axi_awqos,
    input                                   ddr_axi_awready,
    output [3 : 0 ]                         ddr_axi_awregion,
    output [2 : 0 ]                         ddr_axi_awsize,
    output [DDR_AXI_AWUSER_WIDTH-1 : 0 ]    ddr_axi_awuser,
    output                                  ddr_axi_awvalid,
    input  [DDR_AXI_ID_WIDTH-1 : 0 ]        ddr_axi_bid,
    output                                  ddr_axi_bready,
    input  [1 : 0 ]                         ddr_axi_bresp,
    input  [DDR_AXI_BUSER_WIDTH-1 : 0 ]     ddr_axi_buser,
    input                                   ddr_axi_bvalid,
    input  [DDR_AXI_DATA_WIDTH-1 : 0 ]      ddr_axi_rdata,
    input  [DDR_AXI_ID_WIDTH-1 : 0 ]        ddr_axi_rid,
    input                                   ddr_axi_rlast,
    output                                  ddr_axi_rready,
    input  [1 : 0 ]                         ddr_axi_rresp,
    input  [DDR_AXI_RUSER_WIDTH-1 : 0 ]     ddr_axi_ruser,
    input                                   ddr_axi_rvalid,
    output [DDR_AXI_DATA_WIDTH-1 : 0 ]      ddr_axi_wdata,
    output                                  ddr_axi_wlast,
    input                                   ddr_axi_wready,
    output [(DDR_AXI_DATA_WIDTH/8)-1 : 0 ]  ddr_axi_wstrb,
    output [DDR_AXI_WUSER_WIDTH-1 : 0 ]     ddr_axi_wuser,
    output                                  ddr_axi_wvalid,
    //----- AXI4 read addr interface -----
    input  [AXI_ADDR_WIDTH-1 : 0]           axi_araddr,         
    input  [1 : 0]                          axi_arburst,        
    input  [3 : 0]                          axi_arcache,        
    input  [AXI_ID_WIDTH-1 : 0]             axi_arid,           
    input  [7 : 0]                          axi_arlen,         
    input  [1 : 0]                          axi_arlock,         
    input  [2 : 0]                          axi_arprot,         
    input  [3 : 0]                          axi_arqos,          
    output                                  axi_arready,       
    input  [3 : 0]                          axi_arregion,       
    input  [2 : 0]                          axi_arsize,         
    input  [AXI_ARUSER_WIDTH-1 : 0]         axi_aruser,         
    input                                   axi_arvalid,       
    //----- AXI4 read data interface -----
    output [AXI_DATA_WIDTH-1 : 0 ]          axi_rdata,          
    output [AXI_ID_WIDTH-1 : 0 ]            axi_rid,            
    output                                  axi_rlast,          
    input                                   axi_rready,         
    output [1 : 0 ]                         axi_rresp,        
    output [AXI_RUSER_WIDTH-1 : 0 ]         axi_ruser,          
    output                                  axi_rvalid,         
    //----- AXI4 write addr interface -----
    input  [AXI_ADDR_WIDTH-1 : 0]           axi_awaddr,         
    input  [1 : 0]                          axi_awburst,        
    input  [3 : 0]                          axi_awcache,        
    input  [AXI_ID_WIDTH-1 : 0]             axi_awid,           
    input  [7 : 0]                          axi_awlen,         
    input  [1 : 0]                          axi_awlock,         
    input  [2 : 0]                          axi_awprot,         
    input  [3 : 0]                          axi_awqos,          
    output                                  axi_awready,       
    input  [3 : 0]                          axi_awregion,       
    input  [2 : 0]                          axi_awsize,         
    input  [AXI_ARUSER_WIDTH-1 : 0]         axi_awuser,         
    input                                   axi_awvalid,       
    //----- AXI4 write data interface -----
    input  [AXI_DATA_WIDTH-1 : 0 ]          axi_wdata,          
    input  [(AXI_DATA_WIDTH/8)-1 : 0 ]      axi_wstrb,          
    input                                   axi_wlast,          
    input  [AXI_WUSER_WIDTH-1 : 0 ]         axi_wuser,          
    input                                   axi_wvalid,         
    output                                  axi_wready,         
    //----- AXI4 write resp interface -----
    output                                  axi_bvalid,         
    output [1 : 0]                          axi_bresp,         
    output [AXI_BUSER_WIDTH-1 : 0 ]         axi_buser,          
    output [AXI_ID_WIDTH-1 : 0 ]            axi_bid,
    input                                   axi_bready,
    //----- AXI lite slave interface -----
    input                                   s_lite_arvalid,        
    input  [AXIL_ADDR_WIDTH-1 : 0]          s_lite_araddr,         
    output reg                              s_lite_arready,        
    output reg                              s_lite_rvalid,         
    output [AXIL_DATA_WIDTH-1 : 0 ]         s_lite_rdata,          
    output [1 : 0 ]                         s_lite_rresp,          
    input                                   s_lite_rready,         
    input                                   s_lite_awvalid,        
    input  [AXIL_ADDR_WIDTH-1 : 0]          s_lite_awaddr,         
    output reg                              s_lite_awready,        
    input                                   s_lite_wvalid,         
    input  [AXIL_DATA_WIDTH-1 : 0 ]         s_lite_wdata,          
    input  [(AXIL_DATA_WIDTH/8)-1 : 0 ]     s_lite_wstrb,          
    output reg                              s_lite_wready,         
    output reg                              s_lite_bvalid,         
    output [1 : 0 ]                         s_lite_bresp,          
    input                                   s_lite_bready,         
    //----- AXI lite master interface -----
    output                                  m_lite_arvalid,        
    output [AXIL_ADDR_WIDTH-1 : 0]          m_lite_araddr,         
    input                                   m_lite_arready,        
    input                                   m_lite_rvalid,         
    input  [AXIL_DATA_WIDTH-1 : 0 ]         m_lite_rdata,          
    input  [1 : 0 ]                         m_lite_rresp,          
    output                                  m_lite_rready,         
    output                                  m_lite_awvalid,        
    output [AXIL_ADDR_WIDTH-1 : 0]          m_lite_awaddr,         
    input                                   m_lite_awready,        
    output                                  m_lite_wvalid,         
    output [AXIL_DATA_WIDTH-1 : 0 ]         m_lite_wdata,          
    output [(AXIL_DATA_WIDTH/8)-1 : 0 ]     m_lite_wstrb,          
    input                                   m_lite_wready,         
    input                                   m_lite_bvalid,         
    input  [1 : 0 ]                         m_lite_bresp,          
    output                                  m_lite_bready       
);
//------------------------------------------------------------------------------
parameter AXIL_STRB_WIDTH = AXIL_DATA_WIDTH/8;
//------------------------------------------------------------------------------
// AXI data width converter(1024b <-> 512b)
// Xilinx IP
axi_data_width_converter axi_converter (
  .s_axi_aclk       (clk),
  .s_axi_aresetn    (rst_n),
  .s_axi_awid       (axi_awid    ),
  .s_axi_awaddr     (axi_awaddr[DDR_AXI_ADDR_WIDTH-1 : 0]),
  .s_axi_awlen      (axi_awlen   ),
  .s_axi_awsize     (axi_awsize  ),
  .s_axi_awburst    (axi_awburst ),
  .s_axi_awlock     (axi_awlock  ),
  .s_axi_awcache    (axi_awcache ),
  .s_axi_awprot     (axi_awprot  ),
  .s_axi_awregion   (axi_awregion),
  .s_axi_awqos      (axi_awqos   ),
  .s_axi_awvalid    (axi_awvalid ),
  .s_axi_awready    (axi_awready ),
  .s_axi_wdata      (axi_wdata   ),
  .s_axi_wstrb      (axi_wstrb   ),
  .s_axi_wlast      (axi_wlast   ),
  .s_axi_wvalid     (axi_wvalid  ),
  .s_axi_wready     (axi_wready  ),
  .s_axi_bid        (axi_bid     ),
  .s_axi_bresp      (axi_bresp   ),
  .s_axi_bvalid     (axi_bvalid  ),
  .s_axi_bready     (axi_bready  ),
  .s_axi_arid       (axi_arid    ),
  .s_axi_araddr     (axi_araddr  ),
  .s_axi_arlen      (axi_arlen   ),
  .s_axi_arsize     (axi_arsize  ),
  .s_axi_arburst    (axi_arburst ),
  .s_axi_arlock     (axi_arlock  ),
  .s_axi_arcache    (axi_arcache ),
  .s_axi_arprot     (axi_arprot  ),
  .s_axi_arregion   (axi_arregion),
  .s_axi_arqos      (axi_arqos   ),
  .s_axi_arvalid    (axi_arvalid ),
  .s_axi_arready    (axi_arready ),
  .s_axi_rid        (axi_rid     ),
  .s_axi_rdata      (axi_rdata   ),
  .s_axi_rresp      (axi_rresp   ),
  .s_axi_rlast      (axi_rlast   ),
  .s_axi_rvalid     (axi_rvalid  ),
  .s_axi_rready     (axi_rready  ),
  .m_axi_awaddr     (ddr_axi_awaddr  ),
  .m_axi_awlen      (ddr_axi_awlen   ),
  .m_axi_awsize     (ddr_axi_awsize  ),
  .m_axi_awburst    (ddr_axi_awburst ),
  .m_axi_awlock     (ddr_axi_awlock  ),
  .m_axi_awcache    (ddr_axi_awcache ),
  .m_axi_awprot     (ddr_axi_awprot  ),
  .m_axi_awregion   (ddr_axi_awregion),
  .m_axi_awqos      (ddr_axi_awqos   ),
  .m_axi_awvalid    (ddr_axi_awvalid ),
  .m_axi_awready    (ddr_axi_awready ),
  .m_axi_wdata      (ddr_axi_wdata   ),
  .m_axi_wstrb      (ddr_axi_wstrb   ),
  .m_axi_wlast      (ddr_axi_wlast   ),
  .m_axi_wvalid     (ddr_axi_wvalid  ),
  .m_axi_wready     (ddr_axi_wready  ),
  .m_axi_bresp      (ddr_axi_bresp   ),
  .m_axi_bvalid     (ddr_axi_bvalid  ),
  .m_axi_bready     (ddr_axi_bready  ),
  .m_axi_araddr     (ddr_axi_araddr  ),
  .m_axi_arlen      (ddr_axi_arlen   ),
  .m_axi_arsize     (ddr_axi_arsize  ),
  .m_axi_arburst    (ddr_axi_arburst ),
  .m_axi_arlock     (ddr_axi_arlock  ),
  .m_axi_arcache    (ddr_axi_arcache ),
  .m_axi_arprot     (ddr_axi_arprot  ),
  .m_axi_arregion   (ddr_axi_arregion),
  .m_axi_arqos      (ddr_axi_arqos   ),
  .m_axi_arvalid    (ddr_axi_arvalid ),
  .m_axi_arready    (ddr_axi_arready ),
  .m_axi_rdata      (ddr_axi_rdata   ),
  .m_axi_rresp      (ddr_axi_rresp   ),
  .m_axi_rlast      (ddr_axi_rlast   ),
  .m_axi_rvalid     (ddr_axi_rvalid  ),
  .m_axi_rready     (ddr_axi_rready  )
);

assign ddr_axi_arid   = {DDR_AXI_ID_WIDTH{1'b0}};
assign ddr_axi_awid   = {DDR_AXI_ID_WIDTH{1'b0}};
assign ddr_axi_aruser = {DDR_AXI_ARUSER_WIDTH{1'b0}};
assign ddr_axi_awuser = {DDR_AXI_AWUSER_WIDTH{1'b0}};
assign ddr_axi_wuser  = {DDR_AXI_WUSER_WIDTH{1'b0}};
assign axi_ruser      = {AXI_RUSER_WIDTH{1'b0}};
assign axi_buser      = {AXI_BUSER_WIDTH{1'b0}};

// AXI lite slave
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    s_lite_arready <= 1'b1;
  else if(s_lite_arvalid)
    s_lite_arready <= 1'b0;
  else if(s_lite_rvalid & s_lite_rready)
    s_lite_arready <= 1'b1;
  else
    s_lite_arready <= s_lite_arready;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    s_lite_rvalid <= 1'b0;
  else if(s_lite_arvalid & s_lite_arready)
    s_lite_rvalid <= 1'b1;
  else if(s_lite_rready)
    s_lite_rvalid <= 1'b0;
  else
    s_lite_rvalid <= s_lite_rvalid;
end

assign s_lite_rdata = {AXIL_DATA_WIDTH{1'b0}};
assign s_lite_rresp = 2'b0;

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    s_lite_awready <= 1'b0;
  else if(s_lite_awvalid)
    s_lite_awready <= 1'b1;
  else if(s_lite_wvalid & s_lite_wready)
    s_lite_awready <= 1'b0;
  else
    s_lite_awready <= s_lite_awready;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    s_lite_wready <= 1'b0;
  else if(s_lite_awvalid & s_lite_awready)
    s_lite_wready <= 1'b1;
  else if(s_lite_wvalid)
    s_lite_wready <= 1'b0;
  else
    s_lite_wready <= s_lite_wready;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    s_lite_bvalid <= 1'b0;
  else if(s_lite_wvalid & s_lite_wready)
    s_lite_bvalid <= 1'b1;
  else if(s_lite_bready)
    s_lite_bvalid <= 1'b0;
  else
    s_lite_bvalid <= s_lite_bvalid;
end

assign s_lite_bresp = 2'b0;

// AXI lite master
assign m_lite_arvalid = 1'b0;
assign m_lite_araddr  = {AXIL_ADDR_WIDTH{1'b0}};
assign m_lite_rready  = 1'b0;
assign m_lite_awvalid = 1'b0;
assign m_lite_awaddr  = {AXIL_ADDR_WIDTH{1'b0}};
assign m_lite_wvalid  = 1'b0;
assign m_lite_wdata   = {AXIL_DATA_WIDTH{1'b0}};
assign m_lite_wstrb   = {AXIL_STRB_WIDTH{1'b0}};
assign m_lite_bready  = 1'b0;

endmodule
