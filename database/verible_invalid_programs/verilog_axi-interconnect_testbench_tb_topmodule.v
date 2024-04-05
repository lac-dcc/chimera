module tb();
reg             aclk;
reg             areset;

//
// master -- master router
//

// master 0
// write address channel
wire    [31:0]  awaddr_m0;
wire     [3:0]  awid_m0;
wire     [1:0]  awburst_m0;
wire     [3:0]  awlen_m0;
wire     [2:0]  awsize_m0;
wire     [1:0]  awlock_m0;
wire     [3:0]  awcache_m0;
wire     [2:0]  awprot_m0;
wire            awvalid_m0;
wire            awready_m0;

// write data channel
wire     [3:0]  wid_m0;
wire    [31:0]  wdata_m0;
wire     [3:0]  wstrb_m0;
wire            wlast_m0;
wire            wvalid_m0;
wire            wready_m0;

// read address channel
wire    [31:0]  araddr_m0;
wire     [3:0]  arid_m0;
wire     [1:0]  arburst_m0;
wire     [3:0]  arlen_m0;
wire     [2:0]  arsize_m0;
wire     [1:0]  arlock_m0;
wire     [3:0]  arcache_m0;
wire     [2:0]  arprot_m0;
wire            arvalid_m0;
wire            arready_m0;

// read data channel
wire     [3:0]  rid_m0;
wire    [31:0]  rdata_m0;
wire            rlast_m0;
wire     [1:0]  rresp_m0;
wire            rvalid_m0;
wire            rready_m0;

// write response channel
wire     [3:0]  bid_m0;
wire     [1:0]  bresp_m0;
wire            bvalid_m0;
wire            bready_m0;

// master 1
// write address channel
wire    [31:0]  awaddr_m1;
wire     [3:0]  awid_m1;
wire     [1:0]  awburst_m1;
wire     [3:0]  awlen_m1;
wire     [2:0]  awsize_m1;
wire     [1:0]  awlock_m1;
wire     [3:0]  awcache_m1;
wire     [2:0]  awprot_m1;
wire            awvalid_m1;
wire            awready_m1;

// write data channel
wire     [3:0]  wid_m1;
wire    [31:0]  wdata_m1;
wire     [3:0]  wstrb_m1;
wire            wlast_m1;
wire            wvalid_m1;
wire            wready_m1;

// read address channel
wire    [31:0]  araddr_m1;
wire     [3:0]  arid_m1;
wire     [1:0]  arburst_m1;
wire     [3:0]  arlen_m1;
wire     [2:0]  arsize_m1;
wire     [1:0]  arlock_m1;
wire     [3:0]  arcache_m1;
wire     [2:0]  arprot_m1;
wire            arvalid_m1;
wire            arready_m1;

// read data channel
wire     [3:0]  rid_m1;
wire    [31:0]  rdata_m1;
wire            rlast_m1;
wire     [1:0]  rresp_m1;
wire            rvalid_m1;
wire            rready_m1;

// write response channel
wire     [3:0]  bid_m1;
wire     [1:0]  bresp_m1;
wire            bvalid_m1;
wire            bready_m1;

// master 2
// write address channel
wire    [31:0]  awaddr_m2;
wire     [3:0]  awid_m2;
wire     [1:0]  awburst_m2;
wire     [3:0]  awlen_m2;
wire     [2:0]  awsize_m2;
wire     [1:0]  awlock_m2;
wire     [3:0]  awcache_m2;
wire     [2:0]  awprot_m2;
wire            awvalid_m2;
wire            awready_m2;

// write data channel
wire     [3:0]  wid_m2;
wire    [31:0]  wdata_m2;
wire     [3:0]  wstrb_m2;
wire            wlast_m2;
wire            wvalid_m2;
wire            wready_m2;

// read address channel
wire    [31:0]  araddr_m2;
wire     [3:0]  arid_m2;
wire     [1:0]  arburst_m2;
wire     [3:0]  arlen_m2;
wire     [2:0]  arsize_m2;
wire     [1:0]  arlock_m2;
wire     [3:0]  arcache_m2;
wire     [2:0]  arprot_m2;
wire            arvalid_m2;
wire            arready_m2;

// read data channel
wire     [3:0]  rid_m2;
wire    [31:0]  rdata_m2;
wire            rlast_m2;
wire     [1:0]  rresp_m2;
wire            rvalid_m2;
wire            rready_m2;

// write response channel
wire     [3:0]  bid_m2;
wire     [1:0]  bresp_m2;
wire            bvalid_m2;
wire            bready_m2;

// master 3
// write address channel
wire    [31:0]  awaddr_m3;
wire     [3:0]  awid_m3;
wire     [1:0]  awburst_m3;
wire     [3:0]  awlen_m3;
wire     [2:0]  awsize_m3;
wire     [1:0]  awlock_m3;
wire     [3:0]  awcache_m3;
wire     [2:0]  awprot_m3;
wire            awvalid_m3;
wire            awready_m3;

// write data channel
wire     [3:0]  wid_m3;
wire    [31:0]  wdata_m3;
wire     [3:0]  wstrb_m3;
wire            wlast_m3;
wire            wvalid_m3;
wire            wready_m3;

// read address channel
wire    [31:0]  araddr_m3;
wire     [3:0]  arid_m3;
wire     [1:0]  arburst_m3;
wire     [3:0]  arlen_m3;
wire     [2:0]  arsize_m3;
wire     [1:0]  arlock_m3;
wire     [3:0]  arcache_m3;
wire     [2:0]  arprot_m3;
wire            arvalid_m3;
wire            arready_m3;

// read data channel
wire     [3:0]  rid_m3;
wire    [31:0]  rdata_m3;
wire            rlast_m3;
wire     [1:0]  rresp_m3;
wire            rvalid_m3;
wire            rready_m3;

// write response channel
wire     [3:0]  bid_m3;
wire     [1:0]  bresp_m3;
wire            bvalid_m3;
wire            bready_m3;

//
// master router -- interconnect
//

// master 0
// write address channel
wire    [31:0]  awaddr_r_m0;
wire     [3:0]  awid_r_m0;
wire     [1:0]  awburst_r_m0;
wire     [3:0]  awlen_r_m0;
wire     [2:0]  awsize_r_m0;
wire     [1:0]  awlock_r_m0;
wire     [3:0]  awcache_r_m0;
wire     [2:0]  awprot_r_m0;
wire            awvalid_r_m0;
wire            awready_r_m0;

// write data channel
wire     [3:0]  wid_r_m0;
wire    [31:0]  wdata_r_m0;
wire     [3:0]  wstrb_r_m0;
wire            wlast_r_m0;
wire            wvalid_r_m0;
wire            wready_r_m0;

// read address channel
wire    [31:0]  araddr_r_m0;
wire     [3:0]  arid_r_m0;
wire     [1:0]  arburst_r_m0;
wire     [3:0]  arlen_r_m0;
wire     [2:0]  arsize_r_m0;
wire     [1:0]  arlock_r_m0;
wire     [3:0]  arcache_r_m0;
wire     [2:0]  arprot_r_m0;
wire            arvalid_r_m0;
wire            arready_r_m0;

// read data channel
wire     [3:0]  rid_r_m0;
wire    [31:0]  rdata_r_m0;
wire            rlast_r_m0;
wire     [1:0]  rresp_r_m0;
wire            rvalid_r_m0;
wire            rready_r_m0;

// write response channel
wire     [3:0]  bid_r_m0;
wire     [1:0]  bresp_r_m0;
wire            bvalid_r_m0;
wire            bready_r_m0;

// master 1
// write address channel
wire    [31:0]  awaddr_r_m1;
wire     [3:0]  awid_r_m1;
wire     [1:0]  awburst_r_m1;
wire     [3:0]  awlen_r_m1;
wire     [2:0]  awsize_r_m1;
wire     [1:0]  awlock_r_m1;
wire     [3:0]  awcache_r_m1;
wire     [2:0]  awprot_r_m1;
wire            awvalid_r_m1;
wire            awready_r_m1;

// write data channel
wire     [3:0]  wid_r_m1;
wire    [31:0]  wdata_r_m1;
wire     [3:0]  wstrb_r_m1;
wire            wlast_r_m1;
wire            wvalid_r_m1;
wire            wready_r_m1;

// read address channel
wire    [31:0]  araddr_r_m1;
wire     [3:0]  arid_r_m1;
wire     [1:0]  arburst_r_m1;
wire     [3:0]  arlen_r_m1;
wire     [2:0]  arsize_r_m1;
wire     [1:0]  arlock_r_m1;
wire     [3:0]  arcache_r_m1;
wire     [2:0]  arprot_r_m1;
wire            arvalid_r_m1;
wire            arready_r_m1;

// read data channel
wire     [3:0]  rid_r_m1;
wire    [31:0]  rdata_r_m1;
wire            rlast_r_m1;
wire     [1:0]  rresp_r_m1;
wire            rvalid_r_m1;
wire            rready_r_m1;

// write response channel
wire     [3:0]  bid_r_m1;
wire     [1:0]  bresp_r_m1;
wire            bvalid_r_m1;
wire            bready_r_m1;

// master 2
// write address channel
wire    [31:0]  awaddr_r_m2;
wire     [3:0]  awid_r_m2;
wire     [1:0]  awburst_r_m2;
wire     [3:0]  awlen_r_m2;
wire     [2:0]  awsize_r_m2;
wire     [1:0]  awlock_r_m2;
wire     [3:0]  awcache_r_m2;
wire     [2:0]  awprot_r_m2;
wire            awvalid_r_m2;
wire            awready_r_m2;

// write data channel
wire     [3:0]  wid_r_m2;
wire    [31:0]  wdata_r_m2;
wire     [3:0]  wstrb_r_m2;
wire            wlast_r_m2;
wire            wvalid_r_m2;
wire            wready_r_m2;

// read address channel
wire    [31:0]  araddr_r_m2;
wire     [3:0]  arid_r_m2;
wire     [1:0]  arburst_r_m2;
wire     [3:0]  arlen_r_m2;
wire     [2:0]  arsize_r_m2;
wire     [1:0]  arlock_r_m2;
wire     [3:0]  arcache_r_m2;
wire     [2:0]  arprot_r_m2;
wire            arvalid_r_m2;
wire            arready_r_m2;

// read data channel
wire     [3:0]  rid_r_m2;
wire    [31:0]  rdata_r_m2;
wire            rlast_r_m2;
wire     [1:0]  rresp_r_m2;
wire            rvalid_r_m2;
wire            rready_r_m2;

// write response channel
wire     [3:0]  bid_r_m2;
wire     [1:0]  bresp_r_m2;
wire            bvalid_r_m2;
wire            bready_r_m2;

// master 3
// write address channel
wire    [31:0]  awaddr_r_m3;
wire     [3:0]  awid_r_m3;
wire     [1:0]  awburst_r_m3;
wire     [3:0]  awlen_r_m3;
wire     [2:0]  awsize_r_m3;
wire     [1:0]  awlock_r_m3;
wire     [3:0]  awcache_r_m3;
wire     [2:0]  awprot_r_m3;
wire            awvalid_r_m3;
wire            awready_r_m3;

// write data channel
wire     [3:0]  wid_r_m3;
wire    [31:0]  wdata_r_m3;
wire     [3:0]  wstrb_r_m3;
wire            wlast_r_m3;
wire            wvalid_r_m3;
wire            wready_r_m3;

// read address channel
wire    [31:0]  araddr_r_m3;
wire     [3:0]  arid_r_m3;
wire     [1:0]  arburst_r_m3;
wire     [3:0]  arlen_r_m3;
wire     [2:0]  arsize_r_m3;
wire     [1:0]  arlock_r_m3;
wire     [3:0]  arcache_r_m3;
wire     [2:0]  arprot_r_m3;
wire            arvalid_r_m3;
wire            arready_r_m3;

// read data channel
wire     [3:0]  rid_r_m3;
wire    [31:0]  rdata_r_m3;
wire            rlast_r_m3;
wire     [1:0]  rresp_r_m3;
wire            rvalid_r_m3;
wire            rready_r_m3;

// write response channel
wire     [3:0]  bid_r_m3;
wire     [1:0]  bresp_r_m3;
wire            bvalid_r_m3;
wire            bready_r_m3;

//
// interconnect -- slave router
//

// slave 0
// write address channel
wire    [31:0]  awaddr_r_s0;
wire     [3:0]  awid_r_s0;
wire     [1:0]  awburst_r_s0;
wire     [3:0]  awlen_r_s0;
wire     [2:0]  awsize_r_s0;
wire     [1:0]  awlock_r_s0;
wire     [3:0]  awcache_r_s0;
wire     [2:0]  awprot_r_s0;
wire            awvalid_r_s0;
wire            awready_r_s0;

// write data channel
wire     [3:0]  wid_r_s0;
wire    [31:0]  wdata_r_s0;
wire     [3:0]  wstrb_r_s0;
wire            wlast_r_s0;
wire            wvalid_r_s0;
wire            wready_r_s0;

// read address channel
wire    [31:0]  araddr_r_s0;
wire     [3:0]  arid_r_s0;
wire     [1:0]  arburst_r_s0;
wire     [3:0]  arlen_r_s0;
wire     [2:0]  arsize_r_s0;
wire     [1:0]  arlock_r_s0;
wire     [3:0]  arcache_r_s0;
wire     [2:0]  arprot_r_s0;
wire            arvalid_r_s0;
wire            arready_r_s0;

// read data channel
wire     [3:0]  rid_r_s0;
wire    [31:0]  rdata_r_s0;
wire            rlast_r_s0;
wire     [1:0]  rresp_r_s0;
wire            rvalid_r_s0;
wire            rready_r_s0;

// write response channel
wire     [3:0]  bid_r_s0;
wire     [1:0]  bresp_r_s0;
wire            bvalid_r_s0;
wire            bready_r_s0;

// slave 1
// write address channel
wire    [31:0]  awaddr_r_s1;
wire     [3:0]  awid_r_s1;
wire     [1:0]  awburst_r_s1;
wire     [3:0]  awlen_r_s1;
wire     [2:0]  awsize_r_s1;
wire     [1:0]  awlock_r_s1;
wire     [3:0]  awcache_r_s1;
wire     [2:0]  awprot_r_s1;
wire            awvalid_r_s1;
wire            awready_r_s1;

// write data channel
wire     [3:0]  wid_r_s1;
wire    [31:0]  wdata_r_s1;
wire     [3:0]  wstrb_r_s1;
wire            wlast_r_s1;
wire            wvalid_r_s1;
wire            wready_r_s1;

// read address channel
wire    [31:0]  araddr_r_s1;
wire     [3:0]  arid_r_s1;
wire     [1:0]  arburst_r_s1;
wire     [3:0]  arlen_r_s1;
wire     [2:0]  arsize_r_s1;
wire     [1:0]  arlock_r_s1;
wire     [3:0]  arcache_r_s1;
wire     [2:0]  arprot_r_s1;
wire            arvalid_r_s1;
wire            arready_r_s1;

// read data channel
wire     [3:0]  rid_r_s1;
wire    [31:0]  rdata_r_s1;
wire            rlast_r_s1;
wire     [1:0]  rresp_r_s1;
wire            rvalid_r_s1;
wire            rready_r_s1;

// write response channel
wire     [3:0]  bid_r_s1;
wire     [1:0]  bresp_r_s1;
wire            bvalid_r_s1;
wire            bready_r_s1;

//slave 2
// write address channel
wire    [31:0]  awaddr_r_s2;
wire     [3:0]  awid_r_s2;
wire     [1:0]  awburst_r_s2;
wire     [3:0]  awlen_r_s2;
wire     [2:0]  awsize_r_s2;
wire     [1:0]  awlock_r_s2;
wire     [3:0]  awcache_r_s2;
wire     [2:0]  awprot_r_s2;
wire            awvalid_r_s2;
wire            awready_r_s2;

// write data channel
wire     [3:0]  wid_r_s2;
wire    [31:0]  wdata_r_s2;
wire     [3:0]  wstrb_r_s2;
wire            wlast_r_s2;
wire            wvalid_r_s2;
wire            wready_r_s2;

// read address channel
wire    [31:0]  araddr_r_s2;
wire     [3:0]  arid_r_s2;
wire     [1:0]  arburst_r_s2;
wire     [3:0]  arlen_r_s2;
wire     [2:0]  arsize_r_s2;
wire     [1:0]  arlock_r_s2;
wire     [3:0]  arcache_r_s2;
wire     [2:0]  arprot_r_s2;
wire            arvalid_r_s2;
wire            arready_r_s2;

// read data channel
wire     [3:0]  rid_r_s2;
wire    [31:0]  rdata_r_s2;
wire            rlast_r_s2;
wire     [1:0]  rresp_r_s2;
wire            rvalid_r_s2;
wire            rready_r_s2;

// write response channel
wire     [3:0]  bid_r_s2;
wire     [1:0]  bresp_r_s2;
wire            bvalid_r_s2;
wire            bready_r_s2;

//slave 3
// write address channel
wire    [31:0]  awaddr_r_s3;
wire     [3:0]  awid_r_s3;
wire     [1:0]  awburst_r_s3;
wire     [3:0]  awlen_r_s3;
wire     [2:0]  awsize_r_s3;
wire     [1:0]  awlock_r_s3;
wire     [3:0]  awcache_r_s3;
wire     [2:0]  awprot_r_s3;
wire            awvalid_r_s3;
wire            awready_r_s3;

// write data channel
wire     [3:0]  wid_r_s3;
wire    [31:0]  wdata_r_s3;
wire     [3:0]  wstrb_r_s3;
wire            wlast_r_s3;
wire            wvalid_r_s3;
wire            wready_r_s3;

// read address channel
wire    [31:0]  araddr_r_s3;
wire     [3:0]  arid_r_s3;
wire     [1:0]  arburst_r_s3;
wire     [3:0]  arlen_r_s3;
wire     [2:0]  arsize_r_s3;
wire     [1:0]  arlock_r_s3;
wire     [3:0]  arcache_r_s3;
wire     [2:0]  arprot_r_s3;
wire            arvalid_r_s3;
wire            arready_r_s3;

// read data channel
wire     [3:0]  rid_r_s3;
wire    [31:0]  rdata_r_s3;
wire            rlast_r_s3;
wire     [1:0]  rresp_r_s3;
wire            rvalid_r_s3;
wire            rready_r_s3;

// write response channel
wire     [3:0]  bid_r_s3;
wire     [1:0]  bresp_r_s3;
wire            bvalid_r_s3;
wire            bready_r_s3;

//
// slave router -- slave
//

// slave 0
// write address channel
wire    [31:0]  awaddr_s0;
wire     [3:0]  awid_s0;
wire     [1:0]  awburst_s0;
wire     [3:0]  awlen_s0;
wire     [2:0]  awsize_s0;
wire     [1:0]  awlock_s0;
wire     [3:0]  awcache_s0;
wire     [2:0]  awprot_s0;
wire            awvalid_s0;
wire            awready_s0;

// write data channel
wire     [3:0]  wid_s0;
wire    [31:0]  wdata_s0;
wire     [3:0]  wstrb_s0;
wire            wlast_s0;
wire            wvalid_s0;
wire            wready_s0;

// read address channel
wire    [31:0]  araddr_s0;
wire     [3:0]  arid_s0;
wire     [1:0]  arburst_s0;
wire     [3:0]  arlen_s0;
wire     [2:0]  arsize_s0;
wire     [1:0]  arlock_s0;
wire     [3:0]  arcache_s0;
wire     [2:0]  arprot_s0;
wire            arvalid_s0;
wire            arready_s0;

// read data channel
wire     [3:0]  rid_s0;
wire    [31:0]  rdata_s0;
wire            rlast_s0;
wire     [1:0]  rresp_s0;
wire            rvalid_s0;
wire            rready_s0;

// write response channel
wire     [3:0]  bid_s0;
wire     [1:0]  bresp_s0;
wire            bvalid_s0;
wire            bready_s0;

// slave 1
// write address channel
wire    [31:0]  awaddr_s1;
wire     [3:0]  awid_s1;
wire     [1:0]  awburst_s1;
wire     [3:0]  awlen_s1;
wire     [2:0]  awsize_s1;
wire     [1:0]  awlock_s1;
wire     [3:0]  awcache_s1;
wire     [2:0]  awprot_s1;
wire            awvalid_s1;
wire            awready_s1;

// write data channel
wire     [3:0]  wid_s1;
wire    [31:0]  wdata_s1;
wire     [3:0]  wstrb_s1;
wire            wlast_s1;
wire            wvalid_s1;
wire            wready_s1;

// read address channel
wire    [31:0]  araddr_s1;
wire     [3:0]  arid_s1;
wire     [1:0]  arburst_s1;
wire     [3:0]  arlen_s1;
wire     [2:0]  arsize_s1;
wire     [1:0]  arlock_s1;
wire     [3:0]  arcache_s1;
wire     [2:0]  arprot_s1;
wire            arvalid_s1;
wire            arready_s1;

// read data channel
wire     [3:0]  rid_s1;
wire    [31:0]  rdata_s1;
wire            rlast_s1;
wire     [1:0]  rresp_s1;
wire            rvalid_s1;
wire            rready_s1;

// write response channel
wire     [3:0]  bid_s1;
wire     [1:0]  bresp_s1;
wire            bvalid_s1;
wire            bready_s1;

//slave 2
// write address channel
wire    [31:0]  awaddr_s2;
wire     [3:0]  awid_s2;
wire     [1:0]  awburst_s2;
wire     [3:0]  awlen_s2;
wire     [2:0]  awsize_s2;
wire     [1:0]  awlock_s2;
wire     [3:0]  awcache_s2;
wire     [2:0]  awprot_s2;
wire            awvalid_s2;
wire            awready_s2;

// write data channel
wire     [3:0]  wid_s2;
wire    [31:0]  wdata_s2;
wire     [3:0]  wstrb_s2;
wire            wlast_s2;
wire            wvalid_s2;
wire            wready_s2;

// read address channel
wire    [31:0]  araddr_s2;
wire     [3:0]  arid_s2;
wire     [1:0]  arburst_s2;
wire     [3:0]  arlen_s2;
wire     [2:0]  arsize_s2;
wire     [1:0]  arlock_s2;
wire     [3:0]  arcache_s2;
wire     [2:0]  arprot_s2;
wire            arvalid_s2;
wire            arready_s2;

// read data channel
wire     [3:0]  rid_s2;
wire    [31:0]  rdata_s2;
wire            rlast_s2;
wire     [1:0]  rresp_s2;
wire            rvalid_s2;
wire            rready_s2;

// write response channel
wire     [3:0]  bid_s2;
wire     [1:0]  bresp_s2;
wire            bvalid_s2;
wire            bready_s2;

//slave 3
// write address channel
wire    [31:0]  awaddr_s3;
wire     [3:0]  awid_s3;
wire     [1:0]  awburst_s3;
wire     [3:0]  awlen_s3;
wire     [2:0]  awsize_s3;
wire     [1:0]  awlock_s3;
wire     [3:0]  awcache_s3;
wire     [2:0]  awprot_s3;
wire            awvalid_s3;
wire            awready_s3;

// write data channel
wire     [3:0]  wid_s3;
wire    [31:0]  wdata_s3;
wire     [3:0]  wstrb_s3;
wire            wlast_s3;
wire            wvalid_s3;
wire            wready_s3;

// read address channel
wire    [31:0]  araddr_s3;
wire     [3:0]  arid_s3;
wire     [1:0]  arburst_s3;
wire     [3:0]  arlen_s3;
wire     [2:0]  arsize_s3;
wire     [1:0]  arlock_s3;
wire     [3:0]  arcache_s3;
wire     [2:0]  arprot_s3;
wire            arvalid_s3;
wire            arready_s3;

// read data channel
wire     [3:0]  rid_s3;
wire    [31:0]  rdata_s3;
wire            rlast_s3;
wire     [1:0]  rresp_s3;
wire            rvalid_s3;
wire            rready_s3;

// write response channel
wire     [3:0]  bid_s3;
wire     [1:0]  bresp_s3;
wire            bvalid_s3;
wire            bready_s3;

//
// Controller -- SRAM
//

wire     [9:0]  addr_s0;
wire    [31:0]  din_s0;
wire    [31:0]  dout_s0;
wire            we_s0;

wire     [9:0]  addr_s1;
wire    [31:0]  din_s1;
wire    [31:0]  dout_s1;
wire            we_s1;

wire     [9:0]  addr_s2;
wire    [31:0]  din_s2;
wire    [31:0]  dout_s2;
wire            we_s2;

wire     [9:0]  addr_s3;
wire    [31:0]  din_s3;
wire    [31:0]  dout_s3;
wire            we_s3;

// Testbench -- MASTER
reg             valid_m0;
reg             rw_m0;
reg     [31:0]  addr_m0;
reg    [127:0]  data_m0;
reg      [1:0]  burst_m0;
reg      [3:0]  len_m0;
wire            last_m0;

reg             valid_m1;
reg             rw_m1;
reg     [31:0]  addr_m1;
reg    [127:0]  data_m1;
reg      [1:0]  burst_m1;
reg      [3:0]  len_m1;
wire            last_m1;

reg             valid_m2;
reg             rw_m2;
reg     [31:0]  addr_m2;
reg    [127:0]  data_m2;
reg      [1:0]  burst_m2;
reg      [3:0]  len_m2;
wire            last_m2;

reg             valid_m3;
reg             rw_m3;
reg     [31:0]  addr_m3;
reg    [127:0]  data_m3;
reg      [1:0]  burst_m3;
reg      [3:0]  len_m3;
wire            last_m3;

//
// MASTER
//

// master 0
master master_m0(
.aclk(aclk),
.areset(areset),
.awaddr(awaddr_m0),
.awid(awid_m0),
.awvalid(awvalid_m0),
.awlen(awlen_m0),
.awsize(awsize_m0),
.awburst(awburst_m0),
.awlock(awlock_m0),
.awcache(awcache_m0),
.awprot(awprot_m0),
.awready(awready_m0),
.wid(wid_m0),
.wdata(wdata_m0),
.wvalid(wvalid_m0),
.wstrb(wstrb_m0),
.wlast(wlast_m0),
.wready(wready_m0),
.bid(bid_m0),
.bresp(bresp_m0),
.bvalid(bvalid_m0),
.bready(bready_m0),
.araddr(araddr_m0),
.arid(arid_m0),
.arvalid(arvalid_m0),
.arlen(arlen_m0),
.arsize(arsize_m0),
.arburst(arburst_m0),
.arlock(arlock_m0),
.arcache(arcache_m0),
.arprot(arprot_m0),
.arready(arready_m0),
.rid(rid_m0),
.rdata(rdata_m0),
.rresp(rresp_m0),
.rvalid(rvalid_m0),
.rlast(rlast_m0),
.rready(rready_m0),
.valid(valid_m0),
.rw(rw_m0),
.addr(addr_m0),
.data(data_m0),
.burst(burst_m0),
.len(len_m0),
.last(last_m0),
.id_in(4'b0000)
);

// master 1
master master_m1(
.aclk(aclk),
.areset(areset),
.awaddr(awaddr_m1),
.awid(awid_m1),
.awvalid(awvalid_m1),
.awlen(awlen_m1),
.awsize(awsize_m1),
.awburst(awburst_m1),
.awlock(awlock_m1),
.awcache(awcache_m1),
.awprot(awprot_m1),
.awready(awready_m1),
.wid(wid_m1),
.wdata(wdata_m1),
.wvalid(wvalid_m1),
.wstrb(wstrb_m1),
.wlast(wlast_m1),
.wready(wready_m1),
.bid(bid_m1),
.bresp(bresp_m1),
.bvalid(bvalid_m1),
.bready(bready_m1),
.araddr(araddr_m1),
.arid(arid_m1),
.arvalid(arvalid_m1),
.arlen(arlen_m1),
.arsize(arsize_m1),
.arburst(arburst_m1),
.arlock(arlock_m1),
.arcache(arcache_m1),
.arprot(arprot_m1),
.arready(arready_m1),
.rid(rid_m1),
.rdata(rdata_m1),
.rresp(rresp_m1),
.rvalid(rvalid_m1),
.rlast(rlast_m1),
.rready(rready_m1),
.valid(valid_m1),
.rw(rw_m1),
.addr(addr_m1),
.data(data_m1),
.burst(burst_m1),
.len(len_m1),
.last(last_m1),
.id_in(4'b0010)
);

// master 2
master master_m2(
.aclk(aclk),
.areset(areset),
.awaddr(awaddr_m2),
.awid(awid_m2),
.awvalid(awvalid_m2),
.awlen(awlen_m2),
.awsize(awsize_m2),
.awburst(awburst_m2),
.awlock(awlock_m2),
.awcache(awcache_m2),
.awprot(awprot_m2),
.awready(awready_m2),
.wid(wid_m2),
.wdata(wdata_m2),
.wvalid(wvalid_m2),
.wstrb(wstrb_m2),
.wlast(wlast_m2),
.wready(wready_m2),
.bid(bid_m2),
.bresp(bresp_m2),
.bvalid(bvalid_m2),
.bready(bready_m2),
.araddr(araddr_m2),
.arid(arid_m2),
.arvalid(arvalid_m2),
.arlen(arlen_m2),
.arsize(arsize_m2),
.arburst(arburst_m2),
.arlock(arlock_m2),
.arcache(arcache_m2),
.arprot(arprot_m2),
.arready(arready_m2),
.rid(rid_m2),
.rdata(rdata_m2),
.rresp(rresp_m2),
.rvalid(rvalid_m2),
.rlast(rlast_m2),
.rready(rready_m2),
.valid(valid_m2),
.rw(rw_m2),
.addr(addr_m2),
.data(data_m2),
.burst(burst_m2),
.len(len_m2),
.last(last_m2),
.id_in(4'b0100)
);

// master 3
master master_m3(
.aclk(aclk),
.areset(areset),
.awaddr(awaddr_m3),
.awid(awid_m3),
.awvalid(awvalid_m3),
.awlen(awlen_m3),
.awsize(awsize_m3),
.awburst(awburst_m3),
.awlock(awlock_m3),
.awcache(awcache_m3),
.awprot(awprot_m3),
.awready(awready_m3),
.wid(wid_m3),
.wdata(wdata_m3),
.wvalid(wvalid_m3),
.wstrb(wstrb_m3),
.wlast(wlast_m3),
.wready(wready_m3),
.bid(bid_m3),
.bresp(bresp_m3),
.bvalid(bvalid_m3),
.bready(bready_m3),
.araddr(araddr_m3),
.arid(arid_m3),
.arvalid(arvalid_m3),
.arlen(arlen_m3),
.arsize(arsize_m3),
.arburst(arburst_m3),
.arlock(arlock_m3),
.arcache(arcache_m3),
.arprot(arprot_m3),
.arready(arready_m3),
.rid(rid_m3),
.rdata(rdata_m3),
.rresp(rresp_m3),
.rvalid(rvalid_m3),
.rlast(rlast_m3),
.rready(rready_m3),
.valid(valid_m3),
.rw(rw_m3),
.addr(addr_m3),
.data(data_m3),
.burst(burst_m3),
.len(len_m3),
.last(last_m3),
.id_in(4'b0110)
);

//
// SRAM_CONTROLLER 
//

// slave 0
sram_controller slave_s0(
.aclk(aclk),
.areset(areset),
.awid(awid_s0),
.awaddr(awaddr_s0),
.awlen(awlen_s0),
.awsize(awsize_s0),
.awburst(awburst_s0),
.awlock(awlock_s0),
.awcache(awcache_s0),
.awprot(awprot_s0),
.awvalid(awvalid_s0),
.awready(awready_s0),
.wid(wid_s0),
.wdata(wdata_s0),
.wstrb(wstrb_s0),
.wlast(wlast_s0),
.wvalid(wvalid_s0),
.wready(wready_s0),
.bid(bid_s0),
.bresp(bresp_s0),
.bvalid(bvalid_s0),
.bready(bready_s0),
.arid(arid_s0),
.araddr(araddr_s0),
.arlen(arlen_s0),
.arsize(arsize_s0),
.arburst(arburst_s0),
.arlock(arlock_s0),
.arcache(arcache_s0),
.arprot(arprot_s0),
.arvalid(arvalid_s0),
.arready(arready_s0),
.rid(rid_s0),
.rdata(rdata_s0),
.rresp(rresp_s0),
.rlast(rlast_s0),
.rvalid(rvalid_s0),
.rready(rready_s0),
.addr(addr_s0),
.din(din_s0),
.dout(dout_s0),
.we(we_s0)
);

// slave 1
sram_controller slave_s1(
.aclk(aclk),
.areset(areset),
.awid(awid_s1),
.awaddr(awaddr_s1),
.awlen(awlen_s1),
.awsize(awsize_s1),
.awburst(awburst_s1),
.awlock(awlock_s1),
.awcache(awcache_s1),
.awprot(awprot_s1),
.awvalid(awvalid_s1),
.awready(awready_s1),
.wid(wid_s1),
.wdata(wdata_s1),
.wstrb(wstrb_s1),
.wlast(wlast_s1),
.wvalid(wvalid_s1),
.wready(wready_s1),
.bid(bid_s1),
.bresp(bresp_s1),
.bvalid(bvalid_s1),
.bready(bready_s1),
.arid(arid_s1),
.araddr(araddr_s1),
.arlen(arlen_s1),
.arsize(arsize_s1),
.arburst(arburst_s1),
.arlock(arlock_s1),
.arcache(arcache_s1),
.arprot(arprot_s1),
.arvalid(arvalid_s1),
.arready(arready_s1),
.rid(rid_s1),
.rdata(rdata_s1),
.rresp(rresp_s1),
.rlast(rlast_s1),
.rvalid(rvalid_s1),
.rready(rready_s1),
.addr(addr_s1),
.din(din_s1),
.dout(dout_s1),
.we(we_s1)
);

// slave 2
sram_controller slave_s2(
.aclk(aclk),
.areset(areset),
.awid(awid_s2),
.awaddr(awaddr_s2),
.awlen(awlen_s2),
.awsize(awsize_s2),
.awburst(awburst_s2),
.awlock(awlock_s2),
.awcache(awcache_s2),
.awprot(awprot_s2),
.awvalid(awvalid_s2),
.awready(awready_s2),
.wid(wid_s2),
.wdata(wdata_s2),
.wstrb(wstrb_s2),
.wlast(wlast_s2),
.wvalid(wvalid_s2),
.wready(wready_s2),
.bid(bid_s2),
.bresp(bresp_s2),
.bvalid(bvalid_s2),
.bready(bready_s2),
.arid(arid_s2),
.araddr(araddr_s2),
.arlen(arlen_s2),
.arsize(arsize_s2),
.arburst(arburst_s2),
.arlock(arlock_s2),
.arcache(arcache_s2),
.arprot(arprot_s2),
.arvalid(arvalid_s2),
.arready(arready_s2),
.rid(rid_s2),
.rdata(rdata_s2),
.rresp(rresp_s2),
.rlast(rlast_s2),
.rvalid(rvalid_s2),
.rready(rready_s2),
.addr(addr_s2),
.din(din_s2),
.dout(dout_s2),
.we(we_s2)
);

// slave 3
sram_controller slave_s3(
.aclk(aclk),
.areset(areset),
.awid(awid_s3),
.awaddr(awaddr_s3),
.awlen(awlen_s3),
.awsize(awsize_s3),
.awburst(awburst_s3),
.awlock(awlock_s3),
.awcache(awcache_s3),
.awprot(awprot_s3),
.awvalid(awvalid_s3),
.awready(awready_s3),
.wid(wid_s3),
.wdata(wdata_s3),
.wstrb(wstrb_s3),
.wlast(wlast_s3),
.wvalid(wvalid_s3),
.wready(wready_s3),
.bid(bid_s3),
.bresp(bresp_s3),
.bvalid(bvalid_s3),
.bready(bready_s3),
.arid(arid_s3),
.araddr(araddr_s3),
.arlen(arlen_s3),
.arsize(arsize_s3),
.arburst(arburst_s3),
.arlock(arlock_s3),
.arcache(arcache_s3),
.arprot(arprot_s3),
.arvalid(arvalid_s3),
.arready(arready_s3),
.rid(rid_s3),
.rdata(rdata_s3),
.rresp(rresp_s3),
.rlast(rlast_s3),
.rvalid(rvalid_s3),
.rready(rready_s3),
.addr(addr_s3),
.din(din_s3),
.dout(dout_s3),
.we(we_s3)
);

//
// interconnect
//
interconnect interconnect(
aclk,
areset,

// master 0
// write address channel
awaddr_r_m0,
awid_r_m0,
awburst_r_m0,
awlen_r_m0,
awsize_r_m0,
awlock_r_m0,
awcache_r_m0,
awprot_r_m0,
awvalid_r_m0,
awready_r_m0,

// write data channel
wid_r_m0,
wdata_r_m0,
wstrb_r_m0,
wlast_r_m0,
wvalid_r_m0,
wready_r_m0,

// read address channel
araddr_r_m0,
arid_r_m0,
arburst_r_m0,
arlen_r_m0,
arsize_r_m0,
arlock_r_m0,
arcache_r_m0,
arprot_r_m0,
arvalid_r_m0,
arready_r_m0,

// read data channel
rid_r_m0,
rdata_r_m0,
rlast_r_m0,
rresp_r_m0,
rvalid_r_m0,
rready_r_m0,

// write response channel
bid_r_m0,
bresp_r_m0,
bvalid_r_m0,
bready_r_m0,

// master 1
// write address channel
awaddr_r_m1,
awid_r_m1,
awburst_r_m1,
awlen_r_m1,
awsize_r_m1,
awlock_r_m1,
awcache_r_m1,
awprot_r_m1,
awvalid_r_m1,
awready_r_m1,

// write data channel
wid_r_m1,
wdata_r_m1,
wstrb_r_m1,
wlast_r_m1,
wvalid_r_m1,
wready_r_m1,

// read address channel
araddr_r_m1,
arid_r_m1,
arburst_r_m1,
arlen_r_m1,
arsize_r_m1,
arlock_r_m1,
arcache_r_m1,
arprot_r_m1,
arvalid_r_m1,
arready_r_m1,

// read data channel
rid_r_m1,
rdata_r_m1,
rlast_r_m1,
rresp_r_m1,
rvalid_r_m1,
rready_r_m1,

// write response channel
bid_r_m1,
bresp_r_m1,
bvalid_r_m1,
bready_r_m1,

// master 2
// write address channel
awaddr_r_m2,
awid_r_m2,
awburst_r_m2,
awlen_r_m2,
awsize_r_m2,
awlock_r_m2,
awcache_r_m2,
awprot_r_m2,
1'b0,
awready_r_m2,

// write data channel
wid_r_m2,
wdata_r_m2,
wstrb_r_m2,
wlast_r_m2,
1'b0,
wready_r_m2,

// read address channel
araddr_r_m2,
arid_r_m2,
arburst_r_m2,
arlen_r_m2,
arsize_r_m2,
arlock_r_m2,
arcache_r_m2,
arprot_r_m2,
1'b0,
arready_r_m2,

// read data channel
rid_r_m2,
rdata_r_m2,
rlast_r_m2,
rresp_r_m2,
rvalid_r_m2,
1'b0,

// write response channel
bid_r_m2,
bresp_r_m2,
bvalid_r_m2,
1'b0,

// master 3
// write address channel
awaddr_r_m3,
awid_r_m3,
awburst_r_m3,
awlen_r_m3,
awsize_r_m3,
awlock_r_m3,
awcache_r_m3,
awprot_r_m3,
1'b0,
awready_r_m3,

// write data channel
wid_r_m3,
wdata_r_m3,
wstrb_r_m3,
wlast_r_m3,
1'b0,
wready_r_m3,

// read address channel
araddr_r_m3,
arid_r_m3,
arburst_r_m3,
arlen_r_m3,
arsize_r_m3,
arlock_r_m3,
arcache_r_m3,
arprot_r_m3,
1'b0,
arready_r_m3,

// read data channel
rid_r_m3,
rdata_r_m3,
rlast_r_m3,
rresp_r_m3,
rvalid_r_m3,
1'b0,

// write response channel
bid_r_m3,
bresp_r_m3,
bvalid_r_m3,
1'b0,

// slave 0
// write address channel
awaddr_r_s0,
awid_r_s0,
awburst_r_s0,
awlen_r_s0,
awsize_r_s0,
awlock_r_s0,
awcache_r_s0,
awprot_r_s0,
awvalid_r_s0,
awready_r_s0,

// write data channel
wid_r_s0,
wdata_r_s0,
wstrb_r_s0,
wlast_r_s0,
wvalid_r_s0,
wready_r_s0,

// read address channel
araddr_r_s0,
arid_r_s0,
arburst_r_s0,
arlen_r_s0,
arsize_r_s0,
arlock_r_s0,
arcache_r_s0,
arprot_r_s0,
arvalid_r_s0,
arready_r_s0,

// read data channel
rid_r_s0,
rdata_r_s0,
rlast_r_s0,
rresp_r_s0,
rvalid_r_s0,
rready_r_s0,

// write response channel
bid_r_s0,
bresp_r_s0,
bvalid_r_s0,
bready_r_s0,

// slave 1
// write address channel
awaddr_r_s1,
awid_r_s1,
awburst_r_s1,
awlen_r_s1,
awsize_r_s1,
awlock_r_s1,
awcache_r_s1,
awprot_r_s1,
awvalid_r_s1,
awready_r_s1,

// write data channel
wid_r_s1,
wdata_r_s1,
wstrb_r_s1,
wlast_r_s1,
wvalid_r_s1,
wready_r_s1,

// read address channel
araddr_r_s1,
arid_r_s1,
arburst_r_s1,
arlen_r_s1,
arsize_r_s1,
arlock_r_s1,
arcache_r_s1,
arprot_r_s1,
arvalid_r_s1,
arready_r_s1,

// read data channel
rid_r_s1,
rdata_r_s1,
rlast_r_s1,
rresp_r_s1,
rvalid_r_s1,
rready_r_s1,

// write response channel
bid_r_s1,
bresp_r_s1,
bvalid_r_s1,
bready_r_s1,

// slave 2
// write address channel
awaddr_r_s2,
awid_r_s2,
awburst_r_s2,
awlen_r_s2,
awsize_r_s2,
awlock_r_s2,
awcache_r_s2,
awprot_r_s2,
awvalid_r_s2,
1'b0,

// write data channel
wid_r_s2,
wdata_r_s2,
wstrb_r_s2,
wlast_r_s2,
wvalid_r_s2,
1'b0,

// read address channel
araddr_r_s2,
arid_r_s2,
arburst_r_s2,
arlen_r_s2,
arsize_r_s2,
arlock_r_s2,
arcache_r_s2,
arprot_r_s2,
arvalid_r_s2,
1'b0,

// read data channel
rid_r_s2,
rdata_r_s2,
rlast_r_s2,
rresp_r_s2,
1'b0,
rready_r_s2,

// write response channel
bid_r_s2,
bresp_r_s2,
1'b0,
bready_r_s2,

// slave 3
// write address channel
awaddr_r_s3,
awid_r_s3,
awburst_r_s3,
awlen_r_s3,
awsize_r_s3,
awlock_r_s3,
awcache_r_s3,
awprot_r_s3,
awvalid_r_s3,
1'b0,

// write data channel
wid_r_s3,
wdata_r_s3,
wstrb_r_s3,
wlast_r_s3,
wvalid_r_s3,
1'b0,

// read address channel
araddr_r_s3,
arid_r_s3,
arburst_r_s3,
arlen_r_s3,
arsize_r_s3,
arlock_r_s3,
arcache_r_s3,
arprot_r_s3,
arvalid_r_s3,
1'b0,

// read data channel
rid_r_s3,
rdata_r_s3,
rlast_r_s3,
rresp_r_s3,
1'b0,
rready_r_s3,

// write response channel
bid_r_s3,
bresp_r_s3,
1'b0,
bready_r_s3
);

//
// master routers
//

// router_m0
router_master_2to1 router_m0(
aclk,
areset,

// master 0
// write address channel
awaddr_m0,
awid_m0,
awburst_m0,
awlen_m0,
awsize_m0,
awlock_m0,
awcache_m0,
awprot_m0,
awvalid_m0,
awready_m0,

// write data channel
wid_m0,
wdata_m0,
wstrb_m0,
wlast_m0,
wvalid_m0,
wready_m0,

// read address channel
araddr_m0,
arid_m0,
arburst_m0,
arlen_m0,
arsize_m0,
arlock_m0,
arcache_m0,
arprot_m0,
arvalid_m0,
arready_m0,

// read data channel
rid_m0,
rdata_m0,
rlast_m0,
rresp_m0,
rvalid_m0,
rready_m0,

// write response channel
bid_m0,
bresp_m0,
bvalid_m0,
bready_m0,

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

// read address channel
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

// read data channel
rid_m1,
rdata_m1,
rlast_m1,
rresp_m1,
rvalid_m1,
rready_m1,

// write response channel
bid_m1,
bresp_m1,
bvalid_m1,
bready_m1,

// to interconnect
// write address channel
awaddr_r_m0,
awid_r_m0,
awburst_r_m0,
awlen_r_m0,
awsize_r_m0,
awlock_r_m0,
awcache_r_m0,
awprot_r_m0,
awvalid_r_m0,
awready_r_m0,

// write data channel
wid_r_m0,
wdata_r_m0,
wstrb_r_m0,
wlast_r_m0,
wvalid_r_m0,
wready_r_m0,

// read address channel
araddr_r_m0,
arid_r_m0,
arburst_r_m0,
arlen_r_m0,
arsize_r_m0,
arlock_r_m0,
arcache_r_m0,
arprot_r_m0,
arvalid_r_m0,
arready_r_m0,

// read data channel
rid_r_m0,
rdata_r_m0,
rlast_r_m0,
rresp_r_m0,
rvalid_r_m0,
rready_r_m0,

// write response channel
bid_r_m0,
bresp_r_m0,
bvalid_r_m0,
bready_r_m0
);

// router m1
router_master_2to1 router_m1(
aclk,
areset,

// master 0
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

// read address channel
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

// read data channel
rid_m2,
rdata_m2,
rlast_m2,
rresp_m2,
rvalid_m2,
rready_m2,

// write response channel
bid_m2,
bresp_m2,
bvalid_m2,
bready_m2,

// master 1
// write address channel
awaddr_m3,
awid_m3,
awburst_m3,
awlen_m3,
awsize_m3,
awlock_m3,
awcache_m3,
awprot_m3,
awvalid_m3,
awready_m3,

// write data channel
wid_m3,
wdata_m3,
wstrb_m3,
wlast_m3,
wvalid_m3,
wready_m3,

// read address channel
araddr_m3,
arid_m3,
arburst_m3,
arlen_m3,
arsize_m3,
arlock_m3,
arcache_m3,
arprot_m3,
arvalid_m3,
arready_m3,

// read data channel
rid_m3,
rdata_m3,
rlast_m3,
rresp_m3,
rvalid_m3,
rready_m3,

// write response channel
bid_m3,
bresp_m3,
bvalid_m3,
bready_m3,

// to interconnect
// write address channel
awaddr_r_m1,
awid_r_m1,
awburst_r_m1,
awlen_r_m1,
awsize_r_m1,
awlock_r_m1,
awcache_r_m1,
awprot_r_m1,
awvalid_r_m1,
awready_r_m1,

// write data channel
wid_r_m1,
wdata_r_m1,
wstrb_r_m1,
wlast_r_m1,
wvalid_r_m1,
wready_r_m1,

// read address channel
araddr_r_m1,
arid_r_m1,
arburst_r_m1,
arlen_r_m1,
arsize_r_m1,
arlock_r_m1,
arcache_r_m1,
arprot_r_m1,
arvalid_r_m1,
arready_r_m1,

// read data channel
rid_r_m1,
rdata_r_m1,
rlast_r_m1,
rresp_r_m1,
rvalid_r_m1,
rready_r_m1,

// write response channel
bid_r_m1,
bresp_r_m1,
bvalid_r_m1,
bready_r_m1
);

//
// slave routers
//

// router s0
router_slave_1to2 router_s0(
aclk,
areset,

// to interconnect
// write address channel
awaddr_r_s0,
awid_r_s0,
awburst_r_s0,
awlen_r_s0,
awsize_r_s0,
awlock_r_s0,
awcache_r_s0,
awprot_r_s0,
awvalid_r_s0,
awready_r_s0,

// write data channel
wid_r_s0,
wdata_r_s0,
wstrb_r_s0,
wlast_r_s0,
wvalid_r_s0,
wready_r_s0,

// read address channel
araddr_r_s0,
arid_r_s0,
arburst_r_s0,
arlen_r_s0,
arsize_r_s0,
arlock_r_s0,
arcache_r_s0,
arprot_r_s0,
arvalid_r_s0,
arready_r_s0,

// read data channel
rid_r_s0,
rdata_r_s0,
rlast_r_s0,
rresp_r_s0,
rvalid_r_s0,
rready_r_s0,

// write response channel
bid_r_s0,
bresp_r_s0,
bvalid_r_s0,
bready_r_s0,

// slave 0
// write address channel
awaddr_s0,
awid_s0,
awburst_s0,
awlen_s0,
awsize_s0,
awlock_s0,
awcache_s0,
awprot_s0,
awvalid_s0,
awready_s0,

// write data channel
wid_s0,
wdata_s0,
wstrb_s0,
wlast_s0,
wvalid_s0,
wready_s0,

// read address channel
araddr_s0,
arid_s0,
arburst_s0,
arlen_s0,
arsize_s0,
arlock_s0,
arcache_s0,
arprot_s0,
arvalid_s0,
arready_s0,

// read data channel
rid_s0,
rdata_s0,
rlast_s0,
rresp_s0,
rvalid_s0,
rready_s0,

// write response channel
bid_s0,
bresp_s0,
bvalid_s0,
bready_s0,


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

// read address channel
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

// read data channel
rid_s1,
rdata_s1,
rlast_s1,
rresp_s1,
rvalid_s1,
rready_s1,

// write response channel
bid_s1,
bresp_s1,
bvalid_s1,
bready_s1
);

// router_s1
router_slave_1to2 router_s1(
aclk,
areset,

// to interconnect
// write address channel
awaddr_r_s1,
awid_r_s1,
awburst_r_s1,
awlen_r_s1,
awsize_r_s1,
awlock_r_s1,
awcache_r_s1,
awprot_r_s1,
awvalid_r_s1,
awready_r_s1,

// write data channel
wid_r_s1,
wdata_r_s1,
wstrb_r_s1,
wlast_r_s1,
wvalid_r_s1,
wready_r_s1,

// read address channel
araddr_r_s1,
arid_r_s1,
arburst_r_s1,
arlen_r_s1,
arsize_r_s1,
arlock_r_s1,
arcache_r_s1,
arprot_r_s1,
arvalid_r_s1,
arready_r_s1,

// read data channel
rid_r_s1,
rdata_r_s1,
rlast_r_s1,
rresp_r_s1,
rvalid_r_s1,
rready_r_s1,

// write response channel
bid_r_s1,
bresp_r_s1,
bvalid_r_s1,
bready_r_s1,

// slave 0
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
wready_s2,

// read address channel
araddr_s2,
arid_s2,
arburst_s2,
arlen_s2,
arsize_s2,
arlock_s2,
arcache_s2,
arprot_s2,
arvalid_s2,
arready_s2,

// read data channel
rid_s2,
rdata_s2,
rlast_s2,
rresp_s2,
rvalid_s2,
rready_s2,

// write response channel
bid_s2,
bresp_s2,
bvalid_s2,
bready_s2,


// slave 1
// write address channel
awaddr_s3,
awid_s3,
awburst_s3,
awlen_s3,
awsize_s3,
awlock_s3,
awcache_s3,
awprot_s3,
awvalid_s3,
awready_s3,

// write data channel
wid_s3,
wdata_s3,
wstrb_s3,
wlast_s3,
wvalid_s3,
wready_s3,

// read address channel
araddr_s3,
arid_s3,
arburst_s3,
arlen_s3,
arsize_s3,
arlock_s3,
arcache_s3,
arprot_s3,
arvalid_s3,
arready_s3,

// read data channel
rid_s3,
rdata_s3,
rlast_s3,
rresp_s3,
rvalid_s3,
rready_s3,

// write response channel
bid_s3,
bresp_s3,
bvalid_s3,
bready_s3
);

//
// SRAM
//

sram_1024x32 sram_1024x32_0 (.addr(addr_s0), .clk(aclk), .din(dout_s0), .dout(din_s0), .we(we_s0));
sram_1024x32 sram_1024x32_1 (.addr(addr_s1), .clk(aclk), .din(dout_s1), .dout(din_s1), .we(we_s1));
sram_1024x32 sram_1024x32_2 (.addr(addr_s2), .clk(aclk), .din(dout_s2), .dout(din_s2), .we(we_s2));
sram_1024x32 sram_1024x32_3 (.addr(addr_s3), .clk(aclk), .din(dout_s3), .dout(din_s3), .we(we_s3));

//
// Testbench sequence
//

parameter READ = 1'b0, WRITE = 1'b1, FIXED = 1'b0, INCR = 1'b1;
integer i, j, k, f;

always #5 aclk = ~aclk; //10ns period time clk

initial begin
   tb_start;
   #8

   fork
      // Master 0
      begin 
	     while(1)
            master0(WRITE,$random%'b1000000000000,128'b0,$random%'b10,$random%'b100);
      end
	  
      // Master 1
      begin 
	     while(1)
            master1(WRITE,$random%'b1000000000000,128'b0,$random%'b10,$random%'b100);
      end

      // Master 2
      begin
	     while(1)
            master2(WRITE,$random%'b1000000000000,128'b0,$random%'b10,$random%'b100);
      end

      // Master 3
      begin
	     while(1)
            master3(WRITE,$random%'b1000000000000,128'b0,$random%'b10,$random%'b100);
      end
	  
	  begin
         #3000000
	     dump_file(2'b00);
         dump_file(2'b01);
         dump_file(2'b10);
         dump_file(2'b11);
         #100
         $finish;  
	  end
   join


end


task tb_start; 
// start tb task
begin
   $shm_open("signals");
   $shm_probe(tb,"AS");
   
   // load sram
   tb.sram_1024x32_0.mem[0] = 32'b0;
   tb.sram_1024x32_1.mem[0] = 32'b0;
   tb.sram_1024x32_2.mem[0] = 32'b0;
   tb.sram_1024x32_3.mem[0] = 32'b0;
   
   // reset data
   aclk = 1'b1; 
   areset = 1'b1;
   #1 areset = 1'b0;
   #1 areset = 1'b1;
end
endtask

task master0;
   input          rw0;
   input  [31:0]  addr0;
   input [127:0]  data0;
   input   [1:0]  burst0;
   input   [3:0]  len0;   
   begin
      rw_m0    = rw0;
      valid_m0 = 1'b1;
      addr_m0  = addr0;
      data_m0  = data0;
      burst_m0 = burst0;
      len_m0   = len0;
      #10
      valid_m0 = 1'b0;
      while(!last_m0) #10;
   end
endtask

task master1; 
   input          rw0;
   input  [31:0]  addr0;
   input [127:0]  data0;
   input   [1:0]  burst0;
   input   [3:0]  len0;   
   begin
      rw_m1    = rw0;
      valid_m1 = 1'b1;
      addr_m1  = addr0;
      data_m1  = data0;
      burst_m1 = burst0;
      len_m1   = len0;
      #10
      valid_m1 = 1'b0;
      while(!last_m1) #10;
   end
endtask

task master2; 
   input          rw0;
   input  [31:0]  addr0;
   input [127:0]  data0;
   input   [1:0]  burst0;
   input   [3:0]  len0;   
   begin
      rw_m2    = rw0;
      valid_m2 = 1'b1;
      addr_m2  = addr0;
      data_m2  = data0;
      burst_m2 = burst0;
      len_m2   = len0;
      #10
      valid_m2 = 1'b0;
      while(!last_m2) #10;
   end
endtask

task master3; 
   input          rw0;
   input  [31:0]  addr0;
   input [127:0]  data0;
   input   [1:0]  burst0;
   input   [3:0]  len0;   
   begin
      rw_m3    = rw0;
      valid_m3 = 1'b1;
      addr_m3  = addr0;
      data_m3  = data0;
      burst_m3 = burst0;
      len_m3   = len0;
      #10
      valid_m3 = 1'b0;
      while(!last_m3) #10;
   end
endtask

task dump_file;
input [1:0] dump;

begin
   case (dump)
      2'b00 : begin
         j = 0;
         f = $fopen("sram0.txt","w");
      end
	  
      2'b01 : begin
         j = 64;
         f = $fopen("sram1.txt","w");
      end
	  
      2'b10 : begin
         j = 128;
         f = $fopen("sram2.txt","w");
      end
	  
      2'b11 : begin
         j = 192;
         f = $fopen("sram3.txt","w");
      end
   endcase

   // write operation
   // write the first line
   $fwrite(f,"              0        1        2        3        4        5        6        7        8        9        A        B        C        D        E        F\n");

   for(i=0; i<64; i=i+1) begin 
      $fwrite(f,"%4x : ",((i+j)<<4));
	  
	  // write data
      for(k=0; k<16; k=k+1) begin
        case (dump)
            2'b00 : $fwrite(f,"%8x ",tb.sram_1024x32_0.mem[(i<<4)+k]);
	        
            2'b01 : $fwrite(f,"%8x ",tb.sram_1024x32_1.mem[(i<<4)+k]);
      	  
            2'b10 : $fwrite(f,"%8x ",tb.sram_1024x32_2.mem[(i<<4)+k]);
      	  
            2'b11 : $fwrite(f,"%8x ",tb.sram_1024x32_3.mem[(i<<4)+k]);
         endcase
      end
      $fwrite(f,"\n");
   end
   $fclose(f);
end
endtask
endmodule





