module router_slave_1to2(
input aclk,
input areset,

// master
// write address channel
input   [31:0]  awaddr_m,
input    [3:0]  awid_m,
input    [1:0]  awburst_m,
input    [3:0]  awlen_m,
input    [2:0]  awsize_m,
input    [1:0]  awlock_m,
input    [3:0]  awcache_m,
input    [2:0]  awprot_m,
input           awvalid_m,
output          awready_m,

// write data channel
input    [3:0]  wid_m,
input   [31:0]  wdata_m,
input    [3:0]  wstrb_m,
input           wlast_m,
input           wvalid_m,
output          wready_m,

// read address channel
input   [31:0]  araddr_m,
input    [3:0]  arid_m,
input    [1:0]  arburst_m,
input    [3:0]  arlen_m,
input    [2:0]  arsize_m,
input    [1:0]  arlock_m,
input    [3:0]  arcache_m,
input    [2:0]  arprot_m,
input           arvalid_m,
output          arready_m,

// read data channel
output   [3:0]  rid_m,
output  [31:0]  rdata_m,
output          rlast_m,
output   [1:0]  rresp_m,
output          rvalid_m,
input           rready_m,

// write response channel
output   [3:0]  bid_m,
output   [1:0]  bresp_m,
output          bvalid_m,
input           bready_m,

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
output          bready_s2
);

// write address, data demux
addr_wdata_demux_1to2 addr_wdata_demux(
aclk,
areset,

// master
// write address channel
awaddr_m,
awid_m,
awburst_m,
awlen_m,
awsize_m,
awlock_m,
awcache_m,
awprot_m,
awvalid_m,
awready_m,

// write data channel
wid_m,
wdata_m,
wstrb_m,
wlast_m,
wvalid_m,
wready_m,

// slave 1
// write address channel
awaddr_s1,
awid_s1,
awburst_s1,
awlen_s1,
awsize_s1,
awlock_s1,
awcache_s1,
awprot_s1,
awvalid_s1,
awready_s1,

// write data channel
wid_s1,
wdata_s1,
wstrb_s1,
wlast_s1,
wvalid_s1,
wready_s1,

// slave 2
// write address channel
awaddr_s2,
awid_s2,
awburst_s2,
awlen_s2,
awsize_s2,
awlock_s2,
awcache_s2,
awprot_s2,
awvalid_s2,
awready_s2,

// write data channel
wid_s2,
wdata_s2,
wstrb_s2,
wlast_s2,
wvalid_s2,
wready_s2
);

// read address demux
ar_demux_1to2 ar_demux(
areset,

// master
araddr_m,
arid_m,
arburst_m,
arlen_m,
arsize_m,
arlock_m,
arcache_m,
arprot_m,
arvalid_m,
arready_m,

// slave 1
araddr_s1,
arid_s1,
arburst_s1,
arlen_s1,
arsize_s1,
arlock_s1,
arcache_s1,
arprot_s1,
arvalid_s1,
arready_s1,

// slave 2
araddr_s2,
arid_s2,
arburst_s2,
arlen_s2,
arsize_s2,
arlock_s2,
arcache_s2,
arprot_s2,
arvalid_s2,
arready_s2
);

// read data mux
rdata_mux_2to1 rdata_mux(
areset,

// master
rid_m,
rdata_m,
rlast_m,
rresp_m,
rvalid_m,
rready_m,

// slave 1
rid_s1,
rdata_s1,
rlast_s1,
rresp_s1,
rvalid_s1,
rready_s1,

// slave 2
rid_s2,
rdata_s2,
rlast_s2,
rresp_s2,
rvalid_s2,
rready_s2
);

// wresponse mux
wr_mux_2to1 wr_mux(
areset,

// master
bid_m,
bresp_m,
bvalid_m,
bready_m,

// slave 1
bid_s1,
bresp_s1,
bvalid_s1,
bready_s1,

// slave 2
bid_s2,
bresp_s2,
bvalid_s2,
bready_s2
);
endmodule
