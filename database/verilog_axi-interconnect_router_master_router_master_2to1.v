module router_master_2to1(
input aclk,
input areset,

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

// slave
// write address channel
output  [31:0]  awaddr_s,
output   [3:0]  awid_s,
output   [1:0]  awburst_s,
output   [3:0]  awlen_s,
output   [2:0]  awsize_s,
output   [1:0]  awlock_s,
output   [3:0]  awcache_s,
output   [2:0]  awprot_s,
output          awvalid_s,
input           awready_s,

// write data channel
output   [3:0]  wid_s,
output  [31:0]  wdata_s,
output   [3:0]  wstrb_s,
output          wlast_s,
output          wvalid_s,
input           wready_s,

// read address channel
output  [31:0]  araddr_s,
output   [3:0]  arid_s,
output   [1:0]  arburst_s,
output   [3:0]  arlen_s,
output   [2:0]  arsize_s,
output   [1:0]  arlock_s,
output   [3:0]  arcache_s,
output   [2:0]  arprot_s,
output          arvalid_s,
input           arready_s,

// read data channel
input    [3:0]  rid_s,
input   [31:0]  rdata_s,
input           rlast_s,
input    [1:0]  rresp_s,
input           rvalid_s,
output          rready_s,

// write response channel
input    [3:0]  bid_s,
input    [1:0]  bresp_s,
input           bvalid_s,
output          bready_s
);

// write address, data mux
addr_wdata_mux_2to1 addr_wdata_mux(
aclk,
areset,

// master 1
// write address channel
awaddr_m1,
awid_m1,
awburst_m1,
awlen_m1,
awsize_m1,
awlock_m1,
awcache_m1,
awprot_m1,
awvalid_m1,
awready_m1,

// write data channel
wid_m1,
wdata_m1,
wstrb_m1,
wlast_m1,
wvalid_m1,
wready_m1,

// master 2
// write address channel
awaddr_m2,
awid_m2,
awburst_m2,
awlen_m2,
awsize_m2,
awlock_m2,
awcache_m2,
awprot_m2,
awvalid_m2,
awready_m2,

// write data channel
wid_m2,
wdata_m2,
wstrb_m2,
wlast_m2,
wvalid_m2,
wready_m2,

// slave
// write address channel
awaddr_s,
awid_s,
awburst_s,
awlen_s,
awsize_s,
awlock_s,
awcache_s,
awprot_s,
awvalid_s,
awready_s,

// write data channel
wid_s,
wdata_s,
wstrb_s,
wlast_s,
wvalid_s,
wready_s
);

// read address mux
ar_mux_2to1 ar_mux(
areset,

// master 1
araddr_m1,
arid_m1,
arburst_m1,
arlen_m1,
arsize_m1,
arlock_m1,
arcache_m1,
arprot_m1,
arvalid_m1,
arready_m1,

// master 2
araddr_m2,
arid_m2,
arburst_m2,
arlen_m2,
arsize_m2,
arlock_m2,
arcache_m2,
arprot_m2,
arvalid_m2,
arready_m2,

// slave
araddr_s,
arid_s,
arburst_s,
arlen_s,
arsize_s,
arlock_s,
arcache_s,
arprot_s,
arvalid_s,
arready_s
);

// rdata demux
rdata_demux_1to2 rdata_demux(
areset,

// master 1
rid_m1,
rdata_m1,
rlast_m1,
rresp_m1,
rvalid_m1,
rready_m1,

// master 2
rid_m2,
rdata_m2,
rlast_m2,
rresp_m2,
rvalid_m2,
rready_m2,

// slave
rid_s,
rdata_s,
rlast_s,
rresp_s,
rvalid_s,
rready_s
);

// wresponse demux
wr_demux_1to2 wr_demux(
areset,

// master 1
bid_m1,
bresp_m1,
bvalid_m1,
bready_m1,

// master 2
bid_m2,
bresp_m2,
bvalid_m2,
bready_m2,

// slave
bid_s,
bresp_s,
bvalid_s,
bready_s
);
endmodule
