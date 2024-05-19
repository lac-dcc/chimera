// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4_dummy_slave
        #(
            // AXI4
            parameter   BYTE_WIDTH      = 8,
            parameter   AXI4_ID_WIDTH   = 6,
            parameter   AXI4_ADDR_WIDTH = 32,
            parameter   AXI4_DATA_SIZE  = 4,
            parameter   AXI4_DATA_WIDTH = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH = AXI4_DATA_WIDTH / BYTE_WIDTH,
            parameter   AXI4_LEN_WIDTH  = 8,
            parameter   AXI4_QOS_WIDTH  = 4
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            
            input   wire    [AXI4_ID_WIDTH-1:0]     s_axi4_awid,
            input   wire    [AXI4_ADDR_WIDTH-1:0]   s_axi4_awaddr,
            input   wire    [AXI4_LEN_WIDTH-1:0]    s_axi4_awlen,
            input   wire    [2:0]                   s_axi4_awsize,
            input   wire    [1:0]                   s_axi4_awburst,
            input   wire    [0:0]                   s_axi4_awlock,
            input   wire    [3:0]                   s_axi4_awcache,
            input   wire    [2:0]                   s_axi4_awprot,
            input   wire    [AXI4_QOS_WIDTH-1:0]    s_axi4_awqos,
            input   wire    [3:0]                   s_axi4_awregion,
            input   wire                            s_axi4_awvalid,
            output  wire                            s_axi4_awready,
            input   wire    [AXI4_DATA_WIDTH-1:0]   s_axi4_wdata,
            input   wire    [AXI4_STRB_WIDTH-1:0]   s_axi4_wstrb,
            input   wire                            s_axi4_wlast,
            input   wire                            s_axi4_wvalid,
            output  wire                            s_axi4_wready,
            output  wire    [AXI4_ID_WIDTH-1:0]     s_axi4_bid,
            output  wire    [1:0]                   s_axi4_bresp,
            output  wire                            s_axi4_bvalid,
            input   wire                            s_axi4_bready,
            input   wire    [AXI4_ID_WIDTH-1:0]     s_axi4_arid,
            input   wire    [AXI4_ADDR_WIDTH-1:0]   s_axi4_araddr,
            input   wire    [AXI4_LEN_WIDTH-1:0]    s_axi4_arlen,
            input   wire    [2:0]                   s_axi4_arsize,
            input   wire    [1:0]                   s_axi4_arburst,
            input   wire    [0:0]                   s_axi4_arlock,
            input   wire    [3:0]                   s_axi4_arcache,
            input   wire    [2:0]                   s_axi4_arprot,
            input   wire    [AXI4_QOS_WIDTH-1:0]    s_axi4_arqos,
            input   wire    [3:0]                   s_axi4_arregion,
            input   wire                            s_axi4_arvalid,
            output  wire                            s_axi4_arready,
            output  wire    [AXI4_ID_WIDTH-1:0]     s_axi4_rid,
            output  wire    [AXI4_DATA_WIDTH-1:0]   s_axi4_rdata,
            output  wire    [1:0]                   s_axi4_rresp,
            output  wire                            s_axi4_rlast,
            output  wire                            s_axi4_rvalid,
            input   wire                            s_axi4_rready
        );
    
    jelly_axi4_dummy_slave_write
            #(
                .BYTE_WIDTH         (BYTE_WIDTH),
                .AXI4_ID_WIDTH      (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH    (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE     (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH    (AXI4_DATA_WIDTH),
                .AXI4_STRB_WIDTH    (AXI4_STRB_WIDTH),
                .AXI4_LEN_WIDTH     (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH     (AXI4_QOS_WIDTH)
            )
        i_axi4_dummy_slave_write
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                
                .s_axi4_awid        (s_axi4_awid),
                .s_axi4_awaddr      (s_axi4_awaddr),
                .s_axi4_awlen       (s_axi4_awlen),
                .s_axi4_awsize      (s_axi4_awsize),
                .s_axi4_awburst     (s_axi4_awburst),
                .s_axi4_awlock      (s_axi4_awlock),
                .s_axi4_awcache     (s_axi4_awcache),
                .s_axi4_awprot      (s_axi4_awprot),
                .s_axi4_awqos       (s_axi4_awqos),
                .s_axi4_awregion    (s_axi4_awregion),
                .s_axi4_awvalid     (s_axi4_awvalid),
                .s_axi4_awready     (s_axi4_awready),
                .s_axi4_wdata       (s_axi4_wdata),
                .s_axi4_wstrb       (s_axi4_wstrb),
                .s_axi4_wlast       (s_axi4_wlast),
                .s_axi4_wvalid      (s_axi4_wvalid),
                .s_axi4_wready      (s_axi4_wready),
                .s_axi4_bid         (s_axi4_bid),
                .s_axi4_bresp       (s_axi4_bresp),
                .s_axi4_bvalid      (s_axi4_bvalid),
                .s_axi4_bready      (s_axi4_bready)
            );
    
    
    jelly_axi4_dummy_slave_read
            #(
                .BYTE_WIDTH         (BYTE_WIDTH),
                .AXI4_ID_WIDTH      (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH    (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE     (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH    (AXI4_DATA_WIDTH),
                .AXI4_STRB_WIDTH    (AXI4_STRB_WIDTH),
                .AXI4_LEN_WIDTH     (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH     (AXI4_QOS_WIDTH)
            )
        i_axi4_dummy_slave_read
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                
                .s_axi4_arid        (s_axi4_arid),
                .s_axi4_araddr      (s_axi4_araddr),
                .s_axi4_arlen       (s_axi4_arlen),
                .s_axi4_arsize      (s_axi4_arsize),
                .s_axi4_arburst     (s_axi4_arburst),
                .s_axi4_arlock      (s_axi4_arlock),
                .s_axi4_arcache     (s_axi4_arcache),
                .s_axi4_arprot      (s_axi4_arprot),
                .s_axi4_arqos       (s_axi4_arqos),
                .s_axi4_arregion    (s_axi4_arregion),
                .s_axi4_arvalid     (s_axi4_arvalid),
                .s_axi4_arready     (s_axi4_arready),
                .s_axi4_rid         (s_axi4_rid),
                .s_axi4_rdata       (s_axi4_rdata),
                .s_axi4_rresp       (s_axi4_rresp),
                .s_axi4_rlast       (s_axi4_rlast),
                .s_axi4_rvalid      (s_axi4_rvalid),
                .s_axi4_rready      (s_axi4_rready)
            );
    
endmodule


`default_nettype wire


// end of file
