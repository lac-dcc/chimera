module interconnect(
input           aclk,
input           areset,

// master 0
// write address channel
input   [31:0]  awaddr_m0,
input    [3:0]  awid_m0,
input    [1:0]  awburst_m0,
input    [3:0]  awlen_m0,
input    [2:0]  awsize_m0,
input    [1:0]  awlock_m0,
input    [3:0]  awcache_m0,
input    [2:0]  awprot_m0,
input           awvalid_m0,
output          awready_m0,

// write data channel
input    [3:0]  wid_m0,
input   [31:0]  wdata_m0,
input    [3:0]  wstrb_m0,
input           wlast_m0,
input           wvalid_m0,
output          wready_m0,

// read address channel
input   [31:0]  araddr_m0,
input    [3:0]  arid_m0,
input    [1:0]  arburst_m0,
input    [3:0]  arlen_m0,
input    [2:0]  arsize_m0,
input    [1:0]  arlock_m0,
input    [3:0]  arcache_m0,
input    [2:0]  arprot_m0,
input           arvalid_m0,
output          arready_m0,

// read data channel
output   [3:0]  rid_m0,
output  [31:0]  rdata_m0,
output          rlast_m0,
output   [1:0]  rresp_m0,
output          rvalid_m0,
input           rready_m0,

// write response channel
output   [3:0]  bid_m0,
output   [1:0]  bresp_m0,
output          bvalid_m0,
input           bready_m0,

// master 1
// write address channel
input   [31:0]  awaddr_m1,
input    [3:0]  awid_m1,
input    [1:0]  awburst_m1,
input    [3:0]  awlen_m1,
input    [2:0]  awsize_m1,
input    [1:0]  awlock_m1,
input    [3:0]  awcache_m1,
input    [2:0]  awprot_m1,
input           awvalid_m1,
output          awready_m1,

// write data channel
input    [3:0]  wid_m1,
input   [31:0]  wdata_m1,
input    [3:0]  wstrb_m1,
input           wlast_m1,
input           wvalid_m1,
output          wready_m1,

// read address channel
input   [31:0]  araddr_m1,
input    [3:0]  arid_m1,
input    [1:0]  arburst_m1,
input    [3:0]  arlen_m1,
input    [2:0]  arsize_m1,
input    [1:0]  arlock_m1,
input    [3:0]  arcache_m1,
input    [2:0]  arprot_m1,
input           arvalid_m1,
output          arready_m1,

// read data channel
output   [3:0]  rid_m1,
output  [31:0]  rdata_m1,
output          rlast_m1,
output   [1:0]  rresp_m1,
output          rvalid_m1,
input           rready_m1,

// write response channel
output   [3:0]  bid_m1,
output   [1:0]  bresp_m1,
output          bvalid_m1,
input           bready_m1,

// master 2
// write address channel
input   [31:0]  awaddr_m2,
input    [3:0]  awid_m2,
input    [1:0]  awburst_m2,
input    [3:0]  awlen_m2,
input    [2:0]  awsize_m2,
input    [1:0]  awlock_m2,
input    [3:0]  awcache_m2,
input    [2:0]  awprot_m2,
input           awvalid_m2,
output          awready_m2,

// write data channel
input    [3:0]  wid_m2,
input   [31:0]  wdata_m2,
input    [3:0]  wstrb_m2,
input           wlast_m2,
input           wvalid_m2,
output          wready_m2,

// read address channel
input   [31:0]  araddr_m2,
input    [3:0]  arid_m2,
input    [1:0]  arburst_m2,
input    [3:0]  arlen_m2,
input    [2:0]  arsize_m2,
input    [1:0]  arlock_m2,
input    [3:0]  arcache_m2,
input    [2:0]  arprot_m2,
input           arvalid_m2,
output          arready_m2,

// read data channel
output   [3:0]  rid_m2,
output  [31:0]  rdata_m2,
output          rlast_m2,
output   [1:0]  rresp_m2,
output          rvalid_m2,
input           rready_m2,

// write response channel
output   [3:0]  bid_m2,
output   [1:0]  bresp_m2,
output          bvalid_m2,
input           bready_m2,

// master 3
// write address channel
input   [31:0]  awaddr_m3,
input    [3:0]  awid_m3,
input    [1:0]  awburst_m3,
input    [3:0]  awlen_m3,
input    [2:0]  awsize_m3,
input    [1:0]  awlock_m3,
input    [3:0]  awcache_m3,
input    [2:0]  awprot_m3,
input           awvalid_m3,
output          awready_m3,

// write data channel
input    [3:0]  wid_m3,
input   [31:0]  wdata_m3,
input    [3:0]  wstrb_m3,
input           wlast_m3,
input           wvalid_m3,
output          wready_m3,

// read address channel
input   [31:0]  araddr_m3,
input    [3:0]  arid_m3,
input    [1:0]  arburst_m3,
input    [3:0]  arlen_m3,
input    [2:0]  arsize_m3,
input    [1:0]  arlock_m3,
input    [3:0]  arcache_m3,
input    [2:0]  arprot_m3,
input           arvalid_m3,
output          arready_m3,

// read data channel
output   [3:0]  rid_m3,
output  [31:0]  rdata_m3,
output          rlast_m3,
output   [1:0]  rresp_m3,
output          rvalid_m3,
input           rready_m3,

// write response channel
output   [3:0]  bid_m3,
output   [1:0]  bresp_m3,
output          bvalid_m3,
input           bready_m3,

// slave 0
// write address channel
output  [31:0]  awaddr_s0,
output   [3:0]  awid_s0,
output   [1:0]  awburst_s0,
output   [3:0]  awlen_s0,
output   [2:0]  awsize_s0,
output   [1:0]  awlock_s0,
output   [3:0]  awcache_s0,
output   [2:0]  awprot_s0,
output          awvalid_s0,
input           awready_s0,

// write data channel
output   [3:0]  wid_s0,
output  [31:0]  wdata_s0,
output   [3:0]  wstrb_s0,
output          wlast_s0,
output          wvalid_s0,
input           wready_s0,

// read address channel
output  [31:0]  araddr_s0,
output   [3:0]  arid_s0,
output   [1:0]  arburst_s0,
output   [3:0]  arlen_s0,
output   [2:0]  arsize_s0,
output   [1:0]  arlock_s0,
output   [3:0]  arcache_s0,
output   [2:0]  arprot_s0,
output          arvalid_s0,
input           arready_s0,

// read data channel
input    [3:0]  rid_s0,
input   [31:0]  rdata_s0,
input           rlast_s0,
input    [1:0]  rresp_s0,
input           rvalid_s0,
output          rready_s0,

// write response channel
input    [3:0]  bid_s0,
input    [1:0]  bresp_s0,
input           bvalid_s0,
output          bready_s0,

// slave 1
// write address channel
output  [31:0]  awaddr_s1,
output   [3:0]  awid_s1,
output   [1:0]  awburst_s1,
output   [3:0]  awlen_s1,
output   [2:0]  awsize_s1,
output   [1:0]  awlock_s1,
output   [3:0]  awcache_s1,
output   [2:0]  awprot_s1,
output          awvalid_s1,
input           awready_s1,

// write data channel
output   [3:0]  wid_s1,
output  [31:0]  wdata_s1,
output   [3:0]  wstrb_s1,
output          wlast_s1,
output          wvalid_s1,
input           wready_s1,

// read address channel
output  [31:0]  araddr_s1,
output   [3:0]  arid_s1,
output   [1:0]  arburst_s1,
output   [3:0]  arlen_s1,
output   [2:0]  arsize_s1,
output   [1:0]  arlock_s1,
output   [3:0]  arcache_s1,
output   [2:0]  arprot_s1,
output          arvalid_s1,
input           arready_s1,

// read data channel
input    [3:0]  rid_s1,
input   [31:0]  rdata_s1,
input           rlast_s1,
input    [1:0]  rresp_s1,
input           rvalid_s1,
output          rready_s1,

// write response channel
input    [3:0]  bid_s1,
input    [1:0]  bresp_s1,
input           bvalid_s1,
output          bready_s1,


// slave 2
// write address channel
output  [31:0]  awaddr_s2,
output   [3:0]  awid_s2,
output   [1:0]  awburst_s2,
output   [3:0]  awlen_s2,
output   [2:0]  awsize_s2,
output   [1:0]  awlock_s2,
output   [3:0]  awcache_s2,
output   [2:0]  awprot_s2,
output          awvalid_s2,
input           awready_s2,

// write data channel
output   [3:0]  wid_s2,
output  [31:0]  wdata_s2,
output   [3:0]  wstrb_s2,
output          wlast_s2,
output          wvalid_s2,
input           wready_s2,

// read address channel
output  [31:0]  araddr_s2,
output   [3:0]  arid_s2,
output   [1:0]  arburst_s2,
output   [3:0]  arlen_s2,
output   [2:0]  arsize_s2,
output   [1:0]  arlock_s2,
output   [3:0]  arcache_s2,
output   [2:0]  arprot_s2,
output          arvalid_s2,
input           arready_s2,

// read data channel
input    [3:0]  rid_s2,
input   [31:0]  rdata_s2,
input           rlast_s2,
input    [1:0]  rresp_s2,
input           rvalid_s2,
output          rready_s2,

// write response channel
input    [3:0]  bid_s2,
input    [1:0]  bresp_s2,
input           bvalid_s2,
output          bready_s2,

// slave 3
// write address channel
output  [31:0]  awaddr_s3,
output   [3:0]  awid_s3,
output   [1:0]  awburst_s3,
output   [3:0]  awlen_s3,
output   [2:0]  awsize_s3,
output   [1:0]  awlock_s3,
output   [3:0]  awcache_s3,
output   [2:0]  awprot_s3,
output          awvalid_s3,
input           awready_s3,

// write data channel
output   [3:0]  wid_s3,
output  [31:0]  wdata_s3,
output   [3:0]  wstrb_s3,
output          wlast_s3,
output          wvalid_s3,
input           wready_s3,

// read address channel
output  [31:0]  araddr_s3,
output   [3:0]  arid_s3,
output   [1:0]  arburst_s3,
output   [3:0]  arlen_s3,
output   [2:0]  arsize_s3,
output   [1:0]  arlock_s3,
output   [3:0]  arcache_s3,
output   [2:0]  arprot_s3,
output          arvalid_s3,
input           arready_s3,

// read data channel
input    [3:0]  rid_s3,
input   [31:0]  rdata_s3,
input           rlast_s3,
input    [1:0]  rresp_s3,
input           rvalid_s3,
output          rready_s3,

// write response channel
input    [3:0]  bid_s3,
input    [1:0]  bresp_s3,
input           bvalid_s3,
output          bready_s3

);

//  Wires AW, WDATA channel
wire awready_m0_0;
wire awready_m0_1;
wire awready_m0_2;
wire awready_m0_3;
wire awready_m1_0;
wire awready_m1_1;
wire awready_m1_2;
wire awready_m1_3;
wire awready_m2_0;
wire awready_m2_1;
wire awready_m2_2;
wire awready_m2_3;
wire awready_m3_0;
wire awready_m3_1;
wire awready_m3_2;
wire awready_m3_3;
assign awready_m0 = awready_m0_0|awready_m0_1|awready_m0_2|awready_m0_3;
assign awready_m1 = awready_m1_0|awready_m1_1|awready_m1_2|awready_m1_3;
assign awready_m2 = awready_m2_0|awready_m2_1|awready_m2_2|awready_m2_3;
assign awready_m3 = awready_m3_0|awready_m3_1|awready_m3_2|awready_m3_3;

wire wready_m0_0;
wire wready_m0_1;
wire wready_m0_2;
wire wready_m0_3;
wire wready_m1_0;
wire wready_m1_1;
wire wready_m1_2;
wire wready_m1_3;
wire wready_m2_0;
wire wready_m2_1;
wire wready_m2_2;
wire wready_m2_3;
wire wready_m3_0;
wire wready_m3_1;
wire wready_m3_2;
wire wready_m3_3;
assign wready_m0 = wready_m0_0|wready_m0_1|wready_m0_2|wready_m0_3;
assign wready_m1 = wready_m1_0|wready_m1_1|wready_m1_2|wready_m1_3;
assign wready_m2 = wready_m2_0|wready_m2_1|wready_m2_2|wready_m2_3;
assign wready_m3 = wready_m3_0|wready_m3_1|wready_m3_2|wready_m3_3;

// Wires AR, RDATA channel
wire arready_m0_0;
wire arready_m0_1;
wire arready_m0_2;
wire arready_m0_3;
wire arready_m1_0;
wire arready_m1_1;
wire arready_m1_2;
wire arready_m1_3;
wire arready_m2_0;
wire arready_m2_1;
wire arready_m2_2;
wire arready_m2_3;
wire arready_m3_0;
wire arready_m3_1;
wire arready_m3_2;
wire arready_m3_3;
assign arready_m0 = arready_m0_0|arready_m0_1|arready_m0_2|arready_m0_3;
assign arready_m1 = arready_m1_0|arready_m1_1|arready_m1_2|arready_m1_3;
assign arready_m2 = arready_m2_0|arready_m2_1|arready_m2_2|arready_m2_3;
assign arready_m3 = arready_m3_0|arready_m3_1|arready_m3_2|arready_m3_3;

wire rready_s0_0;
wire rready_s0_1;
wire rready_s0_2;
wire rready_s0_3;
wire rready_s1_0;
wire rready_s1_1;
wire rready_s1_2;
wire rready_s1_3;
wire rready_s2_0;
wire rready_s2_1;
wire rready_s2_2;
wire rready_s2_3;
wire rready_s3_0;
wire rready_s3_1;
wire rready_s3_2;
wire rready_s3_3;
assign rready_s0 = rready_s0_0|rready_s0_1|rready_s0_2|rready_s0_3;
assign rready_s1 = rready_s1_0|rready_s1_1|rready_s1_2|rready_s1_3;
assign rready_s2 = rready_s2_0|rready_s2_1|rready_s2_2|rready_s2_3;
assign rready_s3 = rready_s3_0|rready_s3_1|rready_s3_2|rready_s3_3;


// Wires wresponse channel
wire bready_s0_0;
wire bready_s0_1;
wire bready_s0_2;
wire bready_s0_3;
wire bready_s1_0;
wire bready_s1_1;
wire bready_s1_2;
wire bready_s1_3;
wire bready_s2_0;
wire bready_s2_1;
wire bready_s2_2;
wire bready_s2_3;
wire bready_s3_0;
wire bready_s3_1;
wire bready_s3_2;
wire bready_s3_3;
assign bready_s0 = bready_s0_0|bready_s0_1|bready_s0_2|bready_s0_3;
assign bready_s1 = bready_s1_0|bready_s1_1|bready_s1_2|bready_s1_3;
assign bready_s2 = bready_s2_0|bready_s2_1|bready_s2_2|bready_s2_3;
assign bready_s3 = bready_s3_0|bready_s3_1|bready_s3_2|bready_s3_3;


// MODULES

// AW, WDATA 0
addr_wdata_mux_m4 addr_wdata_mux_slave0(
.aclk(aclk),
.areset(areset),
.awaddr_m1(awaddr_m0),
.awaddr_m2(awaddr_m1),
.awaddr_m3(awaddr_m2),
.awaddr_m4(awaddr_m3),
.awaddr_s(awaddr_s0),
.awid_m1(awid_m0),
.awid_m2(awid_m1),
.awid_m3(awid_m2),
.awid_m4(awid_m3),
.awid_s(awid_s0),
.awvalid_m1(awvalid_m0),
.awvalid_m2(awvalid_m1),
.awvalid_m3(awvalid_m2),
.awvalid_m4(awvalid_m3),
.awvalid_s(awvalid_s0),
.awlen_m1(awlen_m0),
.awlen_m2(awlen_m1),
.awlen_m3(awlen_m2),
.awlen_m4(awlen_m3),
.awlen_s(awlen_s0),
.awsize_m1(awsize_m0),
.awsize_m2(awsize_m1),
.awsize_m3(awsize_m2),
.awsize_m4(awsize_m3),
.awsize_s(awsize_s0),
.awburst_m1(awburst_m0),
.awburst_m2(awburst_m1),
.awburst_m3(awburst_m2),
.awburst_m4(awburst_m3),
.awburst_s(awburst_s0),
.awlock_m1(awlock_m0),
.awlock_m2(awlock_m1),
.awlock_m3(awlock_m2),
.awlock_m4(awlock_m3),
.awlock_s(awlock_s0),
.awcache_m1(awcache_m0),
.awcache_m2(awcache_m1),
.awcache_m3(awcache_m2),
.awcache_m4(awcache_m3),
.awcache_s(awcache_s0),
.awprot_m1(awprot_m0),
.awprot_m2(awprot_m1),
.awprot_m3(awprot_m2),
.awprot_m4(awprot_m3),
.awprot_s(awprot_s0),
.awready_m1(awready_m0_0),
.awready_m2(awready_m1_0),
.awready_m3(awready_m2_0),
.awready_m4(awready_m3_0),
.awready_s(awready_s0),
.wid_m1(wid_m0),
.wid_m2(wid_m1),
.wid_m3(wid_m2),
.wid_m4(wid_m3),
.wid_s(wid_s0),
.wdata_m1(wdata_m0),
.wdata_m2(wdata_m1),
.wdata_m3(wdata_m2),
.wdata_m4(wdata_m3),
.wdata_s(wdata_s0),
.wstrb_m1(wstrb_m0),
.wstrb_m2(wstrb_m1),
.wstrb_m3(wstrb_m2),
.wstrb_m4(wstrb_m3),
.wstrb_s(wstrb_s0),
.wlast_m1(wlast_m0),
.wlast_m2(wlast_m1),
.wlast_m3(wlast_m2),
.wlast_m4(wlast_m3),
.wlast_s(wlast_s0),
.wvalid_m1(wvalid_m0),
.wvalid_m2(wvalid_m1),
.wvalid_m3(wvalid_m2),
.wvalid_m4(wvalid_m3),
.wvalid_s(wvalid_s0),
.wready_m1(wready_m0_0),
.wready_m2(wready_m1_0),
.wready_m3(wready_m2_0),
.wready_m4(wready_m3_0),
.wready_s(wready_s0),
.sel(2'b00)
);

// AW, WDATA 1
addr_wdata_mux_m4 addr_wdata_mux_slave1(
.aclk(aclk),
.areset(areset),
.awaddr_m1(awaddr_m0),
.awaddr_m2(awaddr_m1),
.awaddr_m3(awaddr_m2),
.awaddr_m4(awaddr_m3),
.awaddr_s(awaddr_s1),
.awid_m1(awid_m0),
.awid_m2(awid_m1),
.awid_m3(awid_m2),
.awid_m4(awid_m3),
.awid_s(awid_s1),
.awvalid_m1(awvalid_m0),
.awvalid_m2(awvalid_m1),
.awvalid_m3(awvalid_m2),
.awvalid_m4(awvalid_m3),
.awvalid_s(awvalid_s1),
.awlen_m1(awlen_m0),
.awlen_m2(awlen_m1),
.awlen_m3(awlen_m2),
.awlen_m4(awlen_m3),
.awlen_s(awlen_s1),
.awsize_m1(awsize_m0),
.awsize_m2(awsize_m1),
.awsize_m3(awsize_m2),
.awsize_m4(awsize_m3),
.awsize_s(awsize_s1),
.awburst_m1(awburst_m0),
.awburst_m2(awburst_m1),
.awburst_m3(awburst_m2),
.awburst_m4(awburst_m3),
.awburst_s(awburst_s1),
.awlock_m1(awlock_m0),
.awlock_m2(awlock_m1),
.awlock_m3(awlock_m2),
.awlock_m4(awlock_m3),
.awlock_s(awlock_s1),
.awcache_m1(awcache_m0),
.awcache_m2(awcache_m1),
.awcache_m3(awcache_m2),
.awcache_m4(awcache_m3),
.awcache_s(awcache_s1),
.awprot_m1(awprot_m0),
.awprot_m2(awprot_m1),
.awprot_m3(awprot_m2),
.awprot_m4(awprot_m3),
.awprot_s(awprot_s1),
.awready_m1(awready_m0_1),
.awready_m2(awready_m1_1),
.awready_m3(awready_m2_1),
.awready_m4(awready_m3_1),
.awready_s(awready_s1),
.wid_m1(wid_m0),
.wid_m2(wid_m1),
.wid_m3(wid_m2),
.wid_m4(wid_m3),
.wid_s(wid_s1),
.wdata_m1(wdata_m0),
.wdata_m2(wdata_m1),
.wdata_m3(wdata_m2),
.wdata_m4(wdata_m3),
.wdata_s(wdata_s1),
.wstrb_m1(wstrb_m0),
.wstrb_m2(wstrb_m1),
.wstrb_m3(wstrb_m2),
.wstrb_m4(wstrb_m3),
.wstrb_s(wstrb_s1),
.wlast_m1(wlast_m0),
.wlast_m2(wlast_m1),
.wlast_m3(wlast_m2),
.wlast_m4(wlast_m3),
.wlast_s(wlast_s1),
.wvalid_m1(wvalid_m0),
.wvalid_m2(wvalid_m1),
.wvalid_m3(wvalid_m2),
.wvalid_m4(wvalid_m3),
.wvalid_s(wvalid_s1),
.wready_m1(wready_m0_1),
.wready_m2(wready_m1_1),
.wready_m3(wready_m2_1),
.wready_m4(wready_m3_1),
.wready_s(wready_s1),
.sel(2'b01)
);

// AW, WDATA 2
addr_wdata_mux_m4 addr_wdata_mux_slave2(
.aclk(aclk),
.areset(areset),
.awaddr_m1(awaddr_m0),
.awaddr_m2(awaddr_m1),
.awaddr_m3(awaddr_m2),
.awaddr_m4(awaddr_m3),
.awaddr_s(awaddr_s2),
.awid_m1(awid_m0),
.awid_m2(awid_m1),
.awid_m3(awid_m2),
.awid_m4(awid_m3),
.awid_s(awid_s2),
.awvalid_m1(awvalid_m0),
.awvalid_m2(awvalid_m1),
.awvalid_m3(awvalid_m2),
.awvalid_m4(awvalid_m3),
.awvalid_s(awvalid_s2),
.awlen_m1(awlen_m0),
.awlen_m2(awlen_m1),
.awlen_m3(awlen_m2),
.awlen_m4(awlen_m3),
.awlen_s(awlen_s2),
.awsize_m1(awsize_m0),
.awsize_m2(awsize_m1),
.awsize_m3(awsize_m2),
.awsize_m4(awsize_m3),
.awsize_s(awsize_s2),
.awburst_m1(awburst_m0),
.awburst_m2(awburst_m1),
.awburst_m3(awburst_m2),
.awburst_m4(awburst_m3),
.awburst_s(awburst_s2),
.awlock_m1(awlock_m0),
.awlock_m2(awlock_m1),
.awlock_m3(awlock_m2),
.awlock_m4(awlock_m3),
.awlock_s(awlock_s2),
.awcache_m1(awcache_m0),
.awcache_m2(awcache_m1),
.awcache_m3(awcache_m2),
.awcache_m4(awcache_m3),
.awcache_s(awcache_s2),
.awprot_m1(awprot_m0),
.awprot_m2(awprot_m1),
.awprot_m3(awprot_m2),
.awprot_m4(awprot_m3),
.awprot_s(awprot_s2),
.awready_m1(awready_m0_2),
.awready_m2(awready_m1_2),
.awready_m3(awready_m2_2),
.awready_m4(awready_m3_2),
.awready_s(awready_s2),
.wid_m1(wid_m0),
.wid_m2(wid_m1),
.wid_m3(wid_m2),
.wid_m4(wid_m3),
.wid_s(wid_s2),
.wdata_m1(wdata_m0),
.wdata_m2(wdata_m1),
.wdata_m3(wdata_m2),
.wdata_m4(wdata_m3),
.wdata_s(wdata_s2),
.wstrb_m1(wstrb_m0),
.wstrb_m2(wstrb_m1),
.wstrb_m3(wstrb_m2),
.wstrb_m4(wstrb_m3),
.wstrb_s(wstrb_s2),
.wlast_m1(wlast_m0),
.wlast_m2(wlast_m1),
.wlast_m3(wlast_m2),
.wlast_m4(wlast_m3),
.wlast_s(wlast_s2),
.wvalid_m1(wvalid_m0),
.wvalid_m2(wvalid_m1),
.wvalid_m3(wvalid_m2),
.wvalid_m4(wvalid_m3),
.wvalid_s(wvalid_s2),
.wready_m1(wready_m0_2),
.wready_m2(wready_m1_2),
.wready_m3(wready_m2_2),
.wready_m4(wready_m3_2),
.wready_s(wready_s2),
.sel(2'b10)
);

// AW, WDATA 3
addr_wdata_mux_m4 addr_wdata_mux_slave3(
.aclk(aclk),
.areset(areset),
.awaddr_m1(awaddr_m0),
.awaddr_m2(awaddr_m1),
.awaddr_m3(awaddr_m2),
.awaddr_m4(awaddr_m3),
.awaddr_s(awaddr_s3),
.awid_m1(awid_m0),
.awid_m2(awid_m1),
.awid_m3(awid_m2),
.awid_m4(awid_m3),
.awid_s(awid_s3),
.awvalid_m1(awvalid_m0),
.awvalid_m2(awvalid_m1),
.awvalid_m3(awvalid_m2),
.awvalid_m4(awvalid_m3),
.awvalid_s(awvalid_s3),
.awlen_m1(awlen_m0),
.awlen_m2(awlen_m1),
.awlen_m3(awlen_m2),
.awlen_m4(awlen_m3),
.awlen_s(awlen_s3),
.awsize_m1(awsize_m0),
.awsize_m2(awsize_m1),
.awsize_m3(awsize_m2),
.awsize_m4(awsize_m3),
.awsize_s(awsize_s3),
.awburst_m1(awburst_m0),
.awburst_m2(awburst_m1),
.awburst_m3(awburst_m2),
.awburst_m4(awburst_m3),
.awburst_s(awburst_s3),
.awlock_m1(awlock_m0),
.awlock_m2(awlock_m1),
.awlock_m3(awlock_m2),
.awlock_m4(awlock_m3),
.awlock_s(awlock_s3),
.awcache_m1(awcache_m0),
.awcache_m2(awcache_m1),
.awcache_m3(awcache_m2),
.awcache_m4(awcache_m3),
.awcache_s(awcache_s3),
.awprot_m1(awprot_m0),
.awprot_m2(awprot_m1),
.awprot_m3(awprot_m2),
.awprot_m4(awprot_m3),
.awprot_s(awprot_s3),
.awready_m1(awready_m0_3),
.awready_m2(awready_m1_3),
.awready_m3(awready_m2_3),
.awready_m4(awready_m3_3),
.awready_s(awready_s3),
.wid_m1(wid_m0),
.wid_m2(wid_m1),
.wid_m3(wid_m2),
.wid_m4(wid_m3),
.wid_s(wid_s3),
.wdata_m1(wdata_m0),
.wdata_m2(wdata_m1),
.wdata_m3(wdata_m2),
.wdata_m4(wdata_m3),
.wdata_s(wdata_s3),
.wstrb_m1(wstrb_m0),
.wstrb_m2(wstrb_m1),
.wstrb_m3(wstrb_m2),
.wstrb_m4(wstrb_m3),
.wstrb_s(wstrb_s3),
.wlast_m1(wlast_m0),
.wlast_m2(wlast_m1),
.wlast_m3(wlast_m2),
.wlast_m4(wlast_m3),
.wlast_s(wlast_s3),
.wvalid_m1(wvalid_m0),
.wvalid_m2(wvalid_m1),
.wvalid_m3(wvalid_m2),
.wvalid_m4(wvalid_m3),
.wvalid_s(wvalid_s3),
.wready_m1(wready_m0_3),
.wready_m2(wready_m1_3),
.wready_m3(wready_m2_3),
.wready_m4(wready_m3_3),
.wready_s(wready_s3),
.sel(2'b11)
);


// WR channel
// WR 0
wr_mux_s4 wr_mux_master0(
.areset(areset),
.bid_s1(bid_s0),
.bid_s2(bid_s1),
.bid_s3(bid_s2),
.bid_s4(bid_s3),
.bid_m(bid_m0),
.bresp_s1(bresp_s0),
.bresp_s2(bresp_s1),
.bresp_s3(bresp_s2),
.bresp_s4(bresp_s3),
.bresp_m(bresp_m0),
.bvalid_s1(bvalid_s0),
.bvalid_s2(bvalid_s1),
.bvalid_s3(bvalid_s2),
.bvalid_s4(bvalid_s3),
.bvalid_m(bvalid_m0),
.bready_s1(bready_s0_0),
.bready_s2(bready_s1_0),
.bready_s3(bready_s2_0),
.bready_s4(bready_s3_0),
.bready_m(bready_m0),
.sel(2'b00)
);

// WR 1
wr_mux_s4 wr_mux_master1(
.areset(areset),
.bid_s1(bid_s0),
.bid_s2(bid_s1),
.bid_s3(bid_s2),
.bid_s4(bid_s3),
.bid_m(bid_m1),
.bresp_s1(bresp_s0),
.bresp_s2(bresp_s1),
.bresp_s3(bresp_s2),
.bresp_s4(bresp_s3),
.bresp_m(bresp_m1),
.bvalid_s1(bvalid_s0),
.bvalid_s2(bvalid_s1),
.bvalid_s3(bvalid_s2),
.bvalid_s4(bvalid_s3),
.bvalid_m(bvalid_m1),
.bready_s1(bready_s0_1),
.bready_s2(bready_s1_1),
.bready_s3(bready_s2_1),
.bready_s4(bready_s3_1),
.bready_m(bready_m1),
.sel(2'b01)
);

// WR 2
wr_mux_s4 wr_mux_master2(
.areset(areset),
.bid_s1(bid_s0),
.bid_s2(bid_s1),
.bid_s3(bid_s2),
.bid_s4(bid_s3),
.bid_m(bid_m2),
.bresp_s1(bresp_s0),
.bresp_s2(bresp_s1),
.bresp_s3(bresp_s2),
.bresp_s4(bresp_s3),
.bresp_m(bresp_m2),
.bvalid_s1(bvalid_s0),
.bvalid_s2(bvalid_s1),
.bvalid_s3(bvalid_s2),
.bvalid_s4(bvalid_s3),
.bvalid_m(bvalid_m2),
.bready_s1(bready_s0_2),
.bready_s2(bready_s1_2),
.bready_s3(bready_s2_2),
.bready_s4(bready_s3_2),
.bready_m(bready_m2),
.sel(2'b10)
);

// WR 3
wr_mux_s4 wr_mux_master3(
.areset(areset),
.bid_s1(bid_s0),
.bid_s2(bid_s1),
.bid_s3(bid_s2),
.bid_s4(bid_s3),
.bid_m(bid_m3),
.bresp_s1(bresp_s0),
.bresp_s2(bresp_s1),
.bresp_s3(bresp_s2),
.bresp_s4(bresp_s3),
.bresp_m(bresp_m3),
.bvalid_s1(bvalid_s0),
.bvalid_s2(bvalid_s1),
.bvalid_s3(bvalid_s2),
.bvalid_s4(bvalid_s3),
.bvalid_m(bvalid_m3),
.bready_s1(bready_s0_3),
.bready_s2(bready_s1_3),
.bready_s3(bready_s2_3),
.bready_s4(bready_s3_3),
.bready_m(bready_m3),
.sel(2'b11)
);

// AR CHANNEL
// AR 0
ar_mux_m4 ar_mux_slave0(
.areset(areset),
.araddr_m1(araddr_m0),
.araddr_m2(araddr_m1),
.araddr_m3(araddr_m2),
.araddr_m4(araddr_m3),
.araddr_s(araddr_s0),
.arid_m1(arid_m0),
.arid_m2(arid_m1),
.arid_m3(arid_m2),
.arid_m4(arid_m3),
.arid_s(arid_s0),
.arvalid_m1(arvalid_m0),
.arvalid_m2(arvalid_m1),
.arvalid_m3(arvalid_m2),
.arvalid_m4(arvalid_m3),
.arvalid_s(arvalid_s0),
.arlen_m1(arlen_m0),
.arlen_m2(arlen_m1),
.arlen_m3(arlen_m2),
.arlen_m4(arlen_m3),
.arlen_s(arlen_s0),
.arsize_m1(arsize_m0),
.arsize_m2(arsize_m1),
.arsize_m3(arsize_m2),
.arsize_m4(arsize_m3),
.arsize_s(arsize_s0),
.arburst_m1(arburst_m0),
.arburst_m2(arburst_m1),
.arburst_m3(arburst_m2),
.arburst_m4(arburst_m3),
.arburst_s(arburst_s0),
.arlock_m1(arlock_m0),
.arlock_m2(arlock_m1),
.arlock_m3(arlock_m2),
.arlock_m4(arlock_m3),
.arlock_s(arlock_s0),
.arcache_m1(arcache_m0),
.arcache_m2(arcache_m1),
.arcache_m3(arcache_m2),
.arcache_m4(arcache_m3),
.arcache_s(arcache_s0),
.arprot_m1(arprot_m0),
.arprot_m2(arprot_m1),
.arprot_m3(arprot_m2),
.arprot_m4(arprot_m3),
.arprot_s(arprot_s0),
.arready_m1(arready_m0_0),
.arready_m2(arready_m1_0),
.arready_m3(arready_m2_0),
.arready_m4(arready_m3_0),
.arready_s(arready_s0),
.sel(2'b00)
);

// AR 1
ar_mux_m4 ar_mux_slave1(
.areset(areset),
.araddr_m1(araddr_m0),
.araddr_m2(araddr_m1),
.araddr_m3(araddr_m2),
.araddr_m4(araddr_m3),
.araddr_s(araddr_s1),
.arid_m1(arid_m0),
.arid_m2(arid_m1),
.arid_m3(arid_m2),
.arid_m4(arid_m3),
.arid_s(arid_s1),
.arvalid_m1(arvalid_m0),
.arvalid_m2(arvalid_m1),
.arvalid_m3(arvalid_m2),
.arvalid_m4(arvalid_m3),
.arvalid_s(arvalid_s1),
.arlen_m1(arlen_m0),
.arlen_m2(arlen_m1),
.arlen_m3(arlen_m2),
.arlen_m4(arlen_m3),
.arlen_s(arlen_s1),
.arsize_m1(arsize_m0),
.arsize_m2(arsize_m1),
.arsize_m3(arsize_m2),
.arsize_m4(arsize_m3),
.arsize_s(arsize_s1),
.arburst_m1(arburst_m0),
.arburst_m2(arburst_m1),
.arburst_m3(arburst_m2),
.arburst_m4(arburst_m3),
.arburst_s(arburst_s1),
.arlock_m1(arlock_m0),
.arlock_m2(arlock_m1),
.arlock_m3(arlock_m2),
.arlock_m4(arlock_m3),
.arlock_s(arlock_s1),
.arcache_m1(arcache_m0),
.arcache_m2(arcache_m1),
.arcache_m3(arcache_m2),
.arcache_m4(arcache_m3),
.arcache_s(arcache_s1),
.arprot_m1(arprot_m0),
.arprot_m2(arprot_m1),
.arprot_m3(arprot_m2),
.arprot_m4(arprot_m3),
.arprot_s(arprot_s1),
.arready_m1(arready_m0_1),
.arready_m2(arready_m1_1),
.arready_m3(arready_m2_1),
.arready_m4(arready_m3_1),
.arready_s(arready_s1),
.sel(2'b01)
);

// AR 2
ar_mux_m4 ar_mux_slave2(
.areset(areset),
.araddr_m1(araddr_m0),
.araddr_m2(araddr_m1),
.araddr_m3(araddr_m2),
.araddr_m4(araddr_m3),
.araddr_s(araddr_s2),
.arid_m1(arid_m0),
.arid_m2(arid_m1),
.arid_m3(arid_m2),
.arid_m4(arid_m3),
.arid_s(arid_s2),
.arvalid_m1(arvalid_m0),
.arvalid_m2(arvalid_m1),
.arvalid_m3(arvalid_m2),
.arvalid_m4(arvalid_m3),
.arvalid_s(arvalid_s2),
.arlen_m1(arlen_m0),
.arlen_m2(arlen_m1),
.arlen_m3(arlen_m2),
.arlen_m4(arlen_m3),
.arlen_s(arlen_s2),
.arsize_m1(arsize_m0),
.arsize_m2(arsize_m1),
.arsize_m3(arsize_m2),
.arsize_m4(arsize_m3),
.arsize_s(arsize_s2),
.arburst_m1(arburst_m0),
.arburst_m2(arburst_m1),
.arburst_m3(arburst_m2),
.arburst_m4(arburst_m3),
.arburst_s(arburst_s2),
.arlock_m1(arlock_m0),
.arlock_m2(arlock_m1),
.arlock_m3(arlock_m2),
.arlock_m4(arlock_m3),
.arlock_s(arlock_s2),
.arcache_m1(arcache_m0),
.arcache_m2(arcache_m1),
.arcache_m3(arcache_m2),
.arcache_m4(arcache_m3),
.arcache_s(arcache_s2),
.arprot_m1(arprot_m0),
.arprot_m2(arprot_m1),
.arprot_m3(arprot_m2),
.arprot_m4(arprot_m3),
.arprot_s(arprot_s2),
.arready_m1(arready_m0_2),
.arready_m2(arready_m1_2),
.arready_m3(arready_m2_2),
.arready_m4(arready_m3_2),
.arready_s(arready_s2),
.sel(2'b10)
);

// AR 3
ar_mux_m4 ar_mux_slave3(
.areset(areset),
.araddr_m1(araddr_m0),
.araddr_m2(araddr_m1),
.araddr_m3(araddr_m2),
.araddr_m4(araddr_m3),
.araddr_s(araddr_s3),
.arid_m1(arid_m0),
.arid_m2(arid_m1),
.arid_m3(arid_m2),
.arid_m4(arid_m3),
.arid_s(arid_s3),
.arvalid_m1(arvalid_m0),
.arvalid_m2(arvalid_m1),
.arvalid_m3(arvalid_m2),
.arvalid_m4(arvalid_m3),
.arvalid_s(arvalid_s3),
.arlen_m1(arlen_m0),
.arlen_m2(arlen_m1),
.arlen_m3(arlen_m2),
.arlen_m4(arlen_m3),
.arlen_s(arlen_s3),
.arsize_m1(arsize_m0),
.arsize_m2(arsize_m1),
.arsize_m3(arsize_m2),
.arsize_m4(arsize_m3),
.arsize_s(arsize_s3),
.arburst_m1(arburst_m0),
.arburst_m2(arburst_m1),
.arburst_m3(arburst_m2),
.arburst_m4(arburst_m3),
.arburst_s(arburst_s3),
.arlock_m1(arlock_m0),
.arlock_m2(arlock_m1),
.arlock_m3(arlock_m2),
.arlock_m4(arlock_m3),
.arlock_s(arlock_s3),
.arcache_m1(arcache_m0),
.arcache_m2(arcache_m1),
.arcache_m3(arcache_m2),
.arcache_m4(arcache_m3),
.arcache_s(arcache_s3),
.arprot_m1(arprot_m0),
.arprot_m2(arprot_m1),
.arprot_m3(arprot_m2),
.arprot_m4(arprot_m3),
.arprot_s(arprot_s3),
.arready_m1(arready_m0_3),
.arready_m2(arready_m1_3),
.arready_m3(arready_m2_3),
.arready_m4(arready_m3_3),
.arready_s(arready_s3),
.sel(2'b11)
);

// RDATA CHANNEL
// RDATA 0
rdata_mux_m4 rdata_mux_master0(
.areset(areset),
.rid_s1(rid_s0),
.rid_s2(rid_s1),
.rid_s3(rid_s2),
.rid_s4(rid_s3),
.rid_m(rid_m0),
.rdata_s1(rdata_s0),
.rdata_s2(rdata_s1),
.rdata_s3(rdata_s2),
.rdata_s4(rdata_s3),
.rdata_m(rdata_m0),
.rresp_s1(rresp_s0),
.rresp_s2(rresp_s1),
.rresp_s3(rresp_s2),
.rresp_s4(rresp_s3),
.rresp_m(rresp_m0),
.rlast_s1(rlast_s0),
.rlast_s2(rlast_s1),
.rlast_s3(rlast_s2),
.rlast_s4(rlast_s3),
.rlast_m(rlast_m0),
.rvalid_s1(rvalid_s0),
.rvalid_s2(rvalid_s1),
.rvalid_s3(rvalid_s2),
.rvalid_s4(rvalid_s3),
.rvalid_m(rvalid_m0),
.rready_s1(rready_s0_0),
.rready_s2(rready_s1_0),
.rready_s3(rready_s2_0),
.rready_s4(rready_s3_0),
.rready_m(rready_m0),
.sel(2'b00)
);

// RDATA 1
rdata_mux_m4 rdata_mux_master1(
.areset(areset),
.rid_s1(rid_s0),
.rid_s2(rid_s1),
.rid_s3(rid_s2),
.rid_s4(rid_s3),
.rid_m(rid_m1),
.rdata_s1(rdata_s0),
.rdata_s2(rdata_s1),
.rdata_s3(rdata_s2),
.rdata_s4(rdata_s3),
.rdata_m(rdata_m1),
.rresp_s1(rresp_s0),
.rresp_s2(rresp_s1),
.rresp_s3(rresp_s2),
.rresp_s4(rresp_s3),
.rresp_m(rresp_m1),
.rlast_s1(rlast_s0),
.rlast_s2(rlast_s1),
.rlast_s3(rlast_s2),
.rlast_s4(rlast_s3),
.rlast_m(rlast_m1),
.rvalid_s1(rvalid_s0),
.rvalid_s2(rvalid_s1),
.rvalid_s3(rvalid_s2),
.rvalid_s4(rvalid_s3),
.rvalid_m(rvalid_m1),
.rready_s1(rready_s0_1),
.rready_s2(rready_s1_1),
.rready_s3(rready_s2_1),
.rready_s4(rready_s3_1),
.rready_m(rready_m1),
.sel(2'b01)
);

// RDATA 2
rdata_mux_m4 rdata_mux_master2(
.areset(areset),
.rid_s1(rid_s0),
.rid_s2(rid_s1),
.rid_s3(rid_s2),
.rid_s4(rid_s3),
.rid_m(rid_m2),
.rdata_s1(rdata_s0),
.rdata_s2(rdata_s1),
.rdata_s3(rdata_s2),
.rdata_s4(rdata_s3),
.rdata_m(rdata_m2),
.rresp_s1(rresp_s0),
.rresp_s2(rresp_s1),
.rresp_s3(rresp_s2),
.rresp_s4(rresp_s3),
.rresp_m(rresp_m2),
.rlast_s1(rlast_s0),
.rlast_s2(rlast_s1),
.rlast_s3(rlast_s2),
.rlast_s4(rlast_s3),
.rlast_m(rlast_m2),
.rvalid_s1(rvalid_s0),
.rvalid_s2(rvalid_s1),
.rvalid_s3(rvalid_s2),
.rvalid_s4(rvalid_s3),
.rvalid_m(rvalid_m2),
.rready_s1(rready_s0_2),
.rready_s2(rready_s1_2),
.rready_s3(rready_s2_2),
.rready_s4(rready_s3_2),
.rready_m(rready_m2),
.sel(2'b10)
);

// RDATA 3
rdata_mux_m4 rdata_mux_master3(
.areset(areset),
.rid_s1(rid_s0),
.rid_s2(rid_s1),
.rid_s3(rid_s2),
.rid_s4(rid_s3),
.rid_m(rid_m3),
.rdata_s1(rdata_s0),
.rdata_s2(rdata_s1),
.rdata_s3(rdata_s2),
.rdata_s4(rdata_s3),
.rdata_m(rdata_m3),
.rresp_s1(rresp_s0),
.rresp_s2(rresp_s1),
.rresp_s3(rresp_s2),
.rresp_s4(rresp_s3),
.rresp_m(rresp_m3),
.rlast_s1(rlast_s0),
.rlast_s2(rlast_s1),
.rlast_s3(rlast_s2),
.rlast_s4(rlast_s3),
.rlast_m(rlast_m3),
.rvalid_s1(rvalid_s0),
.rvalid_s2(rvalid_s1),
.rvalid_s3(rvalid_s2),
.rvalid_s4(rvalid_s3),
.rvalid_m(rvalid_m3),
.rready_s1(rready_s0_3),
.rready_s2(rready_s1_3),
.rready_s3(rready_s2_3),
.rready_s4(rready_s3_3),
.rready_m(rready_m3),
.sel(2'b11)
);
endmodule
