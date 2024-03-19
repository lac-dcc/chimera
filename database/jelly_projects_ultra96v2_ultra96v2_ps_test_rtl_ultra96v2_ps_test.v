// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module ultra96v2_ps_test();
    
    wire                    aresetn;
    wire                    aclk;
    
    wire    [15:0]          axi4_fpd0_awid;
    wire    [39:0]          axi4_fpd0_awaddr;
    wire    [1:0]           axi4_fpd0_awburst;
    wire    [3:0]           axi4_fpd0_awcache;
    wire    [7:0]           axi4_fpd0_awlen;
    wire                    axi4_fpd0_awlock;
    wire    [2:0]           axi4_fpd0_awprot;
    wire    [3:0]           axi4_fpd0_awqos;
    wire    [2:0]           axi4_fpd0_awsize;
    wire    [15:0]          axi4_fpd0_awuser;
    wire                    axi4_fpd0_awvalid;
    wire                    axi4_fpd0_awready;
    wire    [127:0]         axi4_fpd0_wdata;
    wire                    axi4_fpd0_wlast;
    wire    [15:0]          axi4_fpd0_wstrb;
    wire                    axi4_fpd0_wvalid;
    wire                    axi4_fpd0_wready;
    wire    [15:0]          axi4_fpd0_bid;
    wire    [1:0]           axi4_fpd0_bresp;
    wire                    axi4_fpd0_bvalid;
    wire                    axi4_fpd0_bready;
    wire    [39:0]          axi4_fpd0_araddr;
    wire    [1:0]           axi4_fpd0_arburst;
    wire    [3:0]           axi4_fpd0_arcache;
    wire    [15:0]          axi4_fpd0_arid;
    wire    [7:0]           axi4_fpd0_arlen;
    wire                    axi4_fpd0_arlock;
    wire    [2:0]           axi4_fpd0_arprot;
    wire    [3:0]           axi4_fpd0_arqos;
    wire    [2:0]           axi4_fpd0_arsize;
    wire    [15:0]          axi4_fpd0_aruser;
    wire                    axi4_fpd0_arvalid;
    wire                    axi4_fpd0_arready;
    wire    [127:0]         axi4_fpd0_rdata;
    wire    [15:0]          axi4_fpd0_rid;
    wire                    axi4_fpd0_rlast;
    wire                    axi4_fpd0_rready;
    wire    [1:0]           axi4_fpd0_rresp;
    wire                    axi4_fpd0_rvalid;
    
    wire    [15:0]          axi4_fpd1_awid;
    wire    [39:0]          axi4_fpd1_awaddr;
    wire    [1:0]           axi4_fpd1_awburst;
    wire    [3:0]           axi4_fpd1_awcache;
    wire    [7:0]           axi4_fpd1_awlen;
    wire                    axi4_fpd1_awlock;
    wire    [2:0]           axi4_fpd1_awprot;
    wire    [3:0]           axi4_fpd1_awqos;
    wire    [2:0]           axi4_fpd1_awsize;
    wire    [15:0]          axi4_fpd1_awuser;
    wire                    axi4_fpd1_awvalid;
    wire                    axi4_fpd1_awready;
    wire    [127:0]         axi4_fpd1_wdata;
    wire                    axi4_fpd1_wlast;
    wire    [15:0]          axi4_fpd1_wstrb;
    wire                    axi4_fpd1_wvalid;
    wire                    axi4_fpd1_wready;
    wire    [15:0]          axi4_fpd1_bid;
    wire    [1:0]           axi4_fpd1_bresp;
    wire                    axi4_fpd1_bvalid;
    wire                    axi4_fpd1_bready;
    wire    [39:0]          axi4_fpd1_araddr;
    wire    [1:0]           axi4_fpd1_arburst;
    wire    [3:0]           axi4_fpd1_arcache;
    wire    [15:0]          axi4_fpd1_arid;
    wire    [7:0]           axi4_fpd1_arlen;
    wire                    axi4_fpd1_arlock;
    wire    [2:0]           axi4_fpd1_arprot;
    wire    [3:0]           axi4_fpd1_arqos;
    wire    [2:0]           axi4_fpd1_arsize;
    wire    [15:0]          axi4_fpd1_aruser;
    wire                    axi4_fpd1_arvalid;
    wire                    axi4_fpd1_arready;
    wire    [127:0]         axi4_fpd1_rdata;
    wire    [15:0]          axi4_fpd1_rid;
    wire                    axi4_fpd1_rlast;
    wire                    axi4_fpd1_rready;
    wire    [1:0]           axi4_fpd1_rresp;
    wire                    axi4_fpd1_rvalid;
    
    wire    [15:0]          axi4_lpd0_awid;
    wire    [39:0]          axi4_lpd0_awaddr;
    wire    [1:0]           axi4_lpd0_awburst;
    wire    [3:0]           axi4_lpd0_awcache;
    wire    [7:0]           axi4_lpd0_awlen;
    wire                    axi4_lpd0_awlock;
    wire    [2:0]           axi4_lpd0_awprot;
    wire    [3:0]           axi4_lpd0_awqos;
    wire    [2:0]           axi4_lpd0_awsize;
    wire    [15:0]          axi4_lpd0_awuser;
    wire                    axi4_lpd0_awvalid;
    wire                    axi4_lpd0_awready;
    wire    [127:0]         axi4_lpd0_wdata;
    wire                    axi4_lpd0_wlast;
    wire    [15:0]          axi4_lpd0_wstrb;
    wire                    axi4_lpd0_wvalid;
    wire                    axi4_lpd0_wready;
    wire    [15:0]          axi4_lpd0_bid;
    wire    [1:0]           axi4_lpd0_bresp;
    wire                    axi4_lpd0_bvalid;
    wire                    axi4_lpd0_bready;
    wire    [39:0]          axi4_lpd0_araddr;
    wire    [1:0]           axi4_lpd0_arburst;
    wire    [3:0]           axi4_lpd0_arcache;
    wire    [15:0]          axi4_lpd0_arid;
    wire    [7:0]           axi4_lpd0_arlen;
    wire                    axi4_lpd0_arlock;
    wire    [2:0]           axi4_lpd0_arprot;
    wire    [3:0]           axi4_lpd0_arqos;
    wire    [2:0]           axi4_lpd0_arsize;
    wire    [15:0]          axi4_lpd0_aruser;
    wire                    axi4_lpd0_arvalid;
    wire                    axi4_lpd0_arready;
    wire    [127:0]         axi4_lpd0_rdata;
    wire    [15:0]          axi4_lpd0_rid;
    wire                    axi4_lpd0_rlast;
    wire                    axi4_lpd0_rready;
    wire    [1:0]           axi4_lpd0_rresp;
    wire                    axi4_lpd0_rvalid;
    
    design_1
        i_design_1_i
            (
                .in_reset(1'b0),
                
                .aclk                   (aclk),
                .aresetn                (aresetn),
                
                .m_axi4_fpd0_awid       (axi4_fpd0_awid),
                .m_axi4_fpd0_awaddr     (axi4_fpd0_awaddr),
                .m_axi4_fpd0_awburst    (axi4_fpd0_awburst),
                .m_axi4_fpd0_awcache    (axi4_fpd0_awcache),
                .m_axi4_fpd0_awlen      (axi4_fpd0_awlen),
                .m_axi4_fpd0_awlock     (axi4_fpd0_awlock),
                .m_axi4_fpd0_awprot     (axi4_fpd0_awprot),
                .m_axi4_fpd0_awqos      (axi4_fpd0_awqos),
                .m_axi4_fpd0_awsize     (axi4_fpd0_awsize),
                .m_axi4_fpd0_awuser     (axi4_fpd0_awuser),
                .m_axi4_fpd0_awvalid    (axi4_fpd0_awvalid),
                .m_axi4_fpd0_awready    (axi4_fpd0_awready),
                .m_axi4_fpd0_wdata      (axi4_fpd0_wdata),
                .m_axi4_fpd0_wlast      (axi4_fpd0_wlast),
                .m_axi4_fpd0_wstrb      (axi4_fpd0_wstrb),
                .m_axi4_fpd0_wvalid     (axi4_fpd0_wvalid),
                .m_axi4_fpd0_wready     (axi4_fpd0_wready),
                .m_axi4_fpd0_bid        (axi4_fpd0_bid),
                .m_axi4_fpd0_bresp      (axi4_fpd0_bresp),
                .m_axi4_fpd0_bvalid     (axi4_fpd0_bvalid),
                .m_axi4_fpd0_bready     (axi4_fpd0_bready),
                .m_axi4_fpd0_arid       (axi4_fpd0_arid),
                .m_axi4_fpd0_araddr     (axi4_fpd0_araddr),
                .m_axi4_fpd0_arburst    (axi4_fpd0_arburst),
                .m_axi4_fpd0_arcache    (axi4_fpd0_arcache),
                .m_axi4_fpd0_arlen      (axi4_fpd0_arlen),
                .m_axi4_fpd0_arlock     (axi4_fpd0_arlock),
                .m_axi4_fpd0_arprot     (axi4_fpd0_arprot),
                .m_axi4_fpd0_arqos      (axi4_fpd0_arqos),
                .m_axi4_fpd0_arsize     (axi4_fpd0_arsize),
                .m_axi4_fpd0_aruser     (axi4_fpd0_aruser),
                .m_axi4_fpd0_arvalid    (axi4_fpd0_arvalid),
                .m_axi4_fpd0_arready    (axi4_fpd0_arready),
                .m_axi4_fpd0_rid        (axi4_fpd0_rid),
                .m_axi4_fpd0_rdata      (axi4_fpd0_rdata),
                .m_axi4_fpd0_rlast      (axi4_fpd0_rlast),
                .m_axi4_fpd0_rresp      (axi4_fpd0_rresp),
                .m_axi4_fpd0_rvalid     (axi4_fpd0_rvalid),
                .m_axi4_fpd0_rready     (axi4_fpd0_rready),
                
                .m_axi4_fpd1_awid       (axi4_fpd1_awid),
                .m_axi4_fpd1_awaddr     (axi4_fpd1_awaddr),
                .m_axi4_fpd1_awburst    (axi4_fpd1_awburst),
                .m_axi4_fpd1_awcache    (axi4_fpd1_awcache),
                .m_axi4_fpd1_awlen      (axi4_fpd1_awlen),
                .m_axi4_fpd1_awlock     (axi4_fpd1_awlock),
                .m_axi4_fpd1_awprot     (axi4_fpd1_awprot),
                .m_axi4_fpd1_awqos      (axi4_fpd1_awqos),
                .m_axi4_fpd1_awsize     (axi4_fpd1_awsize),
                .m_axi4_fpd1_awuser     (axi4_fpd1_awuser),
                .m_axi4_fpd1_awvalid    (axi4_fpd1_awvalid),
                .m_axi4_fpd1_awready    (axi4_fpd1_awready),
                .m_axi4_fpd1_wdata      (axi4_fpd1_wdata),
                .m_axi4_fpd1_wlast      (axi4_fpd1_wlast),
                .m_axi4_fpd1_wstrb      (axi4_fpd1_wstrb),
                .m_axi4_fpd1_wvalid     (axi4_fpd1_wvalid),
                .m_axi4_fpd1_wready     (axi4_fpd1_wready),
                .m_axi4_fpd1_bid        (axi4_fpd1_bid),
                .m_axi4_fpd1_bresp      (axi4_fpd1_bresp),
                .m_axi4_fpd1_bvalid     (axi4_fpd1_bvalid),
                .m_axi4_fpd1_bready     (axi4_fpd1_bready),
                .m_axi4_fpd1_arid       (axi4_fpd1_arid),
                .m_axi4_fpd1_araddr     (axi4_fpd1_araddr),
                .m_axi4_fpd1_arburst    (axi4_fpd1_arburst),
                .m_axi4_fpd1_arcache    (axi4_fpd1_arcache),
                .m_axi4_fpd1_arlen      (axi4_fpd1_arlen),
                .m_axi4_fpd1_arlock     (axi4_fpd1_arlock),
                .m_axi4_fpd1_arprot     (axi4_fpd1_arprot),
                .m_axi4_fpd1_arqos      (axi4_fpd1_arqos),
                .m_axi4_fpd1_arsize     (axi4_fpd1_arsize),
                .m_axi4_fpd1_aruser     (axi4_fpd1_aruser),
                .m_axi4_fpd1_arvalid    (axi4_fpd1_arvalid),
                .m_axi4_fpd1_arready    (axi4_fpd1_arready),
                .m_axi4_fpd1_rid        (axi4_fpd1_rid),
                .m_axi4_fpd1_rdata      (axi4_fpd1_rdata),
                .m_axi4_fpd1_rlast      (axi4_fpd1_rlast),
                .m_axi4_fpd1_rresp      (axi4_fpd1_rresp),
                .m_axi4_fpd1_rvalid     (axi4_fpd1_rvalid),
                .m_axi4_fpd1_rready     (axi4_fpd1_rready),
                
                .m_axi4_lpd0_awid       (axi4_lpd0_awid),
                .m_axi4_lpd0_awaddr     (axi4_lpd0_awaddr),
                .m_axi4_lpd0_awburst    (axi4_lpd0_awburst),
                .m_axi4_lpd0_awcache    (axi4_lpd0_awcache),
                .m_axi4_lpd0_awlen      (axi4_lpd0_awlen),
                .m_axi4_lpd0_awlock     (axi4_lpd0_awlock),
                .m_axi4_lpd0_awprot     (axi4_lpd0_awprot),
                .m_axi4_lpd0_awqos      (axi4_lpd0_awqos),
                .m_axi4_lpd0_awsize     (axi4_lpd0_awsize),
                .m_axi4_lpd0_awuser     (axi4_lpd0_awuser),
                .m_axi4_lpd0_awvalid    (axi4_lpd0_awvalid),
                .m_axi4_lpd0_awready    (axi4_lpd0_awready),
                .m_axi4_lpd0_wdata      (axi4_lpd0_wdata),
                .m_axi4_lpd0_wlast      (axi4_lpd0_wlast),
                .m_axi4_lpd0_wstrb      (axi4_lpd0_wstrb),
                .m_axi4_lpd0_wvalid     (axi4_lpd0_wvalid),
                .m_axi4_lpd0_wready     (axi4_lpd0_wready),
                .m_axi4_lpd0_bid        (axi4_lpd0_bid),
                .m_axi4_lpd0_bresp      (axi4_lpd0_bresp),
                .m_axi4_lpd0_bvalid     (axi4_lpd0_bvalid),
                .m_axi4_lpd0_bready     (axi4_lpd0_bready),
                .m_axi4_lpd0_arid       (axi4_lpd0_arid),
                .m_axi4_lpd0_araddr     (axi4_lpd0_araddr),
                .m_axi4_lpd0_arburst    (axi4_lpd0_arburst),
                .m_axi4_lpd0_arcache    (axi4_lpd0_arcache),
                .m_axi4_lpd0_arlen      (axi4_lpd0_arlen),
                .m_axi4_lpd0_arlock     (axi4_lpd0_arlock),
                .m_axi4_lpd0_arprot     (axi4_lpd0_arprot),
                .m_axi4_lpd0_arqos      (axi4_lpd0_arqos),
                .m_axi4_lpd0_arsize     (axi4_lpd0_arsize),
                .m_axi4_lpd0_aruser     (axi4_lpd0_aruser),
                .m_axi4_lpd0_arvalid    (axi4_lpd0_arvalid),
                .m_axi4_lpd0_arready    (axi4_lpd0_arready),
                .m_axi4_lpd0_rid        (axi4_lpd0_rid),
                .m_axi4_lpd0_rdata      (axi4_lpd0_rdata),
                .m_axi4_lpd0_rlast      (axi4_lpd0_rlast),
                .m_axi4_lpd0_rresp      (axi4_lpd0_rresp),
                .m_axi4_lpd0_rvalid     (axi4_lpd0_rvalid),
                .m_axi4_lpd0_rready     (axi4_lpd0_rready)
            );
    
    
    jelly_axi4_dummy_slave
            #(
                .AXI4_ID_WIDTH      (16),
                .AXI4_ADDR_WIDTH    (40),
                .AXI4_DATA_SIZE     (4)
            )
        i_axi4_dummy_slave_fpd0
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                
                .s_axi4_awid        (axi4_fpd0_awid),
                .s_axi4_awaddr      (axi4_fpd0_awaddr),
                .s_axi4_awlen       (axi4_fpd0_awlen),
                .s_axi4_awsize      (axi4_fpd0_awsize),
                .s_axi4_awburst     (axi4_fpd0_awburst),
                .s_axi4_awlock      (axi4_fpd0_awlock),
                .s_axi4_awcache     (axi4_fpd0_awcache),
                .s_axi4_awprot      (axi4_fpd0_awprot),
                .s_axi4_awqos       (axi4_fpd0_awqos),
                .s_axi4_awvalid     (axi4_fpd0_awvalid),
                .s_axi4_awready     (axi4_fpd0_awready),
                .s_axi4_wdata       (axi4_fpd0_wdata),
                .s_axi4_wstrb       (axi4_fpd0_wstrb),
                .s_axi4_wlast       (axi4_fpd0_wlast),
                .s_axi4_wvalid      (axi4_fpd0_wvalid),
                .s_axi4_wready      (axi4_fpd0_wready),
                .s_axi4_bid         (axi4_fpd0_bid),
                .s_axi4_bresp       (axi4_fpd0_bresp),
                .s_axi4_bvalid      (axi4_fpd0_bvalid),
                .s_axi4_bready      (axi4_fpd0_bready),
                .s_axi4_arid        (axi4_fpd0_arid),
                .s_axi4_araddr      (axi4_fpd0_araddr),
                .s_axi4_arlen       (axi4_fpd0_arlen),
                .s_axi4_arsize      (axi4_fpd0_arsize),
                .s_axi4_arburst     (axi4_fpd0_arburst),
                .s_axi4_arlock      (axi4_fpd0_arlock),
                .s_axi4_arcache     (axi4_fpd0_arcache),
                .s_axi4_arprot      (axi4_fpd0_arprot),
                .s_axi4_arqos       (axi4_fpd0_arqos),
                .s_axi4_arvalid     (axi4_fpd0_arvalid),
                .s_axi4_arready     (axi4_fpd0_arready),
                .s_axi4_rid         (axi4_fpd0_rid),
                .s_axi4_rdata       (axi4_fpd0_rdata),
                .s_axi4_rresp       (axi4_fpd0_rresp),
                .s_axi4_rlast       (axi4_fpd0_rlast),
                .s_axi4_rvalid      (axi4_fpd0_rvalid),
                .s_axi4_rready      (axi4_fpd0_rready)
            );
    
    
    jelly_axi4_dummy_slave
            #(
                .AXI4_ID_WIDTH      (16),
                .AXI4_ADDR_WIDTH    (40),
                .AXI4_DATA_SIZE     (4)
            )
        i_axi4_dummy_slave_fpd1
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                
                .s_axi4_awid        (axi4_fpd1_awid),
                .s_axi4_awaddr      (axi4_fpd1_awaddr),
                .s_axi4_awlen       (axi4_fpd1_awlen),
                .s_axi4_awsize      (axi4_fpd1_awsize),
                .s_axi4_awburst     (axi4_fpd1_awburst),
                .s_axi4_awlock      (axi4_fpd1_awlock),
                .s_axi4_awcache     (axi4_fpd1_awcache),
                .s_axi4_awprot      (axi4_fpd1_awprot),
                .s_axi4_awqos       (axi4_fpd1_awqos),
                .s_axi4_awvalid     (axi4_fpd1_awvalid),
                .s_axi4_awready     (axi4_fpd1_awready),
                .s_axi4_wdata       (axi4_fpd1_wdata),
                .s_axi4_wstrb       (axi4_fpd1_wstrb),
                .s_axi4_wlast       (axi4_fpd1_wlast),
                .s_axi4_wvalid      (axi4_fpd1_wvalid),
                .s_axi4_wready      (axi4_fpd1_wready),
                .s_axi4_bid         (axi4_fpd1_bid),
                .s_axi4_bresp       (axi4_fpd1_bresp),
                .s_axi4_bvalid      (axi4_fpd1_bvalid),
                .s_axi4_bready      (axi4_fpd1_bready),
                .s_axi4_arid        (axi4_fpd1_arid),
                .s_axi4_araddr      (axi4_fpd1_araddr),
                .s_axi4_arlen       (axi4_fpd1_arlen),
                .s_axi4_arsize      (axi4_fpd1_arsize),
                .s_axi4_arburst     (axi4_fpd1_arburst),
                .s_axi4_arlock      (axi4_fpd1_arlock),
                .s_axi4_arcache     (axi4_fpd1_arcache),
                .s_axi4_arprot      (axi4_fpd1_arprot),
                .s_axi4_arqos       (axi4_fpd1_arqos),
                .s_axi4_arvalid     (axi4_fpd1_arvalid),
                .s_axi4_arready     (axi4_fpd1_arready),
                .s_axi4_rid         (axi4_fpd1_rid),
                .s_axi4_rdata       (axi4_fpd1_rdata),
                .s_axi4_rresp       (axi4_fpd1_rresp),
                .s_axi4_rlast       (axi4_fpd1_rlast),
                .s_axi4_rvalid      (axi4_fpd1_rvalid),
                .s_axi4_rready      (axi4_fpd1_rready)
            );
    
    
    jelly_axi4_dummy_slave
            #(
                .AXI4_ID_WIDTH      (16),
                .AXI4_ADDR_WIDTH    (40),
                .AXI4_DATA_SIZE     (4)
            )
        i_axi4_dummy_slave_lpd0
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                
                .s_axi4_awid        (axi4_lpd0_awid),
                .s_axi4_awaddr      (axi4_lpd0_awaddr),
                .s_axi4_awlen       (axi4_lpd0_awlen),
                .s_axi4_awsize      (axi4_lpd0_awsize),
                .s_axi4_awburst     (axi4_lpd0_awburst),
                .s_axi4_awlock      (axi4_lpd0_awlock),
                .s_axi4_awcache     (axi4_lpd0_awcache),
                .s_axi4_awprot      (axi4_lpd0_awprot),
                .s_axi4_awqos       (axi4_lpd0_awqos),
                .s_axi4_awvalid     (axi4_lpd0_awvalid),
                .s_axi4_awready     (axi4_lpd0_awready),
                .s_axi4_wdata       (axi4_lpd0_wdata),
                .s_axi4_wstrb       (axi4_lpd0_wstrb),
                .s_axi4_wlast       (axi4_lpd0_wlast),
                .s_axi4_wvalid      (axi4_lpd0_wvalid),
                .s_axi4_wready      (axi4_lpd0_wready),
                .s_axi4_bid         (axi4_lpd0_bid),
                .s_axi4_bresp       (axi4_lpd0_bresp),
                .s_axi4_bvalid      (axi4_lpd0_bvalid),
                .s_axi4_bready      (axi4_lpd0_bready),
                .s_axi4_arid        (axi4_lpd0_arid),
                .s_axi4_araddr      (axi4_lpd0_araddr),
                .s_axi4_arlen       (axi4_lpd0_arlen),
                .s_axi4_arsize      (axi4_lpd0_arsize),
                .s_axi4_arburst     (axi4_lpd0_arburst),
                .s_axi4_arlock      (axi4_lpd0_arlock),
                .s_axi4_arcache     (axi4_lpd0_arcache),
                .s_axi4_arprot      (axi4_lpd0_arprot),
                .s_axi4_arqos       (axi4_lpd0_arqos),
                .s_axi4_arvalid     (axi4_lpd0_arvalid),
                .s_axi4_arready     (axi4_lpd0_arready),
                .s_axi4_rid         (axi4_lpd0_rid),
                .s_axi4_rdata       (axi4_lpd0_rdata),
                .s_axi4_rresp       (axi4_lpd0_rresp),
                .s_axi4_rlast       (axi4_lpd0_rlast),
                .s_axi4_rvalid      (axi4_lpd0_rvalid),
                .s_axi4_rready      (axi4_lpd0_rready)
            );
    
    
endmodule



`default_nettype wire


// end of file
