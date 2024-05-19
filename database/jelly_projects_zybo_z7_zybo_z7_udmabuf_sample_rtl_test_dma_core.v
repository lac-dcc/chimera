// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the system on fpga system
//
//  Test DMA
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


module test_dma_core
        #(
            parameter   AXI4_ID_WIDTH   = 6,
            parameter   AXI4_ADDR_WIDTH = 32,
            parameter   AXI4_DATA_SIZE  = 2,   // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH = (1 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH  = 8,
            parameter   AXI4_QOS_WIDTH  = 4,
            
            parameter   AXI4_AWID       = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_AWSIZE     = AXI4_DATA_SIZE,
            parameter   AXI4_AWBURST    = 2'b01,
            parameter   AXI4_AWLOCK     = 1'b0,
            parameter   AXI4_AWCACHE    = 4'b0001,
            parameter   AXI4_AWPROT     = 3'b000,
            parameter   AXI4_AWQOS      = 0,
            parameter   AXI4_AWREGION   = 4'b0000,
            parameter   AXI4_ARID       = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_ARSIZE     = AXI4_DATA_SIZE,
            parameter   AXI4_ARBURST    = 2'b01,
            parameter   AXI4_ARLOCK     = 1'b0,
            parameter   AXI4_ARCACHE    = 4'b0001,
            parameter   AXI4_ARPROT     = 3'b000,
            parameter   AXI4_ARQOS      = 0,
            parameter   AXI4_ARREGION   = 4'b0000
        )
        (
            input   wire                                aresetn,
            input   wire                                aclk,
            
            input   wire                                wstart,
            input   wire                                rstart,
            output  wire                                busy,
            
            input   wire    [AXI4_ADDR_WIDTH-1:0]       addr,
            input   wire    [AXI4_DATA_WIDTH-1:0]       wdata,
            output  wire    [AXI4_DATA_WIDTH-1:0]       rdata,
            
            
            output  wire    [AXI4_ID_WIDTH-1:0]         m_axi4_awid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_awaddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_awlen,
            output  wire    [2:0]                       m_axi4_awsize,
            output  wire    [1:0]                       m_axi4_awburst,
            output  wire    [0:0]                       m_axi4_awlock,
            output  wire    [3:0]                       m_axi4_awcache,
            output  wire    [2:0]                       m_axi4_awprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_awqos,
            output  wire    [3:0]                       m_axi4_awregion,
            output  wire                                m_axi4_awvalid,
            input   wire                                m_axi4_awready,
            output  wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_wdata,
            output  wire    [AXI4_STRB_WIDTH-1:0]       m_axi4_wstrb,
            output  wire                                m_axi4_wlast,
            output  wire                                m_axi4_wvalid,
            input   wire                                m_axi4_wready,
            input   wire    [AXI4_ID_WIDTH-1:0]         m_axi4_bid,
            input   wire    [1:0]                       m_axi4_bresp,
            input   wire                                m_axi4_bvalid,
            output  wire                                m_axi4_bready,
            output  wire    [AXI4_ID_WIDTH-1:0]         m_axi4_arid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_araddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_arlen,
            output  wire    [2:0]                       m_axi4_arsize,
            output  wire    [1:0]                       m_axi4_arburst,
            output  wire    [0:0]                       m_axi4_arlock,
            output  wire    [3:0]                       m_axi4_arcache,
            output  wire    [2:0]                       m_axi4_arprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_arqos,
            output  wire    [3:0]                       m_axi4_arregion,
            output  wire                                m_axi4_arvalid,
            input   wire                                m_axi4_arready,
            input   wire    [AXI4_ID_WIDTH-1:0]         m_axi4_rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_rdata,
            input   wire    [1:0]                       m_axi4_rresp,
            input   wire                                m_axi4_rlast,
            input   wire                                m_axi4_rvalid,
            output  wire                                m_axi4_rready
        );
    
    reg                             reg_busy;
    reg                             reg_awvalid;
    reg                             reg_wvalid;
    reg                             reg_arvalid;
    reg     [AXI4_DATA_WIDTH-1:0]   reg_rdata;
    
    always @(posedge aclk) begin
        if ( !aresetn ) begin
            reg_busy    <= 1'b0;
            reg_awvalid <= 1'b0;
            reg_wvalid  <= 1'b0;
            reg_arvalid <= 1'b0;
            reg_rdata   <= {AXI4_DATA_WIDTH{1'b0}};
        end
        else begin
            if ( m_axi4_bvalid || m_axi4_rvalid ) begin
                reg_busy <= 1'b0;
            end
            if ( m_axi4_awready ) begin
                reg_awvalid <= 1'b0;
            end
            if ( m_axi4_wready ) begin
                reg_wvalid <= 1'b0;
            end
            if ( m_axi4_arready ) begin
                reg_arvalid <= 1'b0;
            end
            if ( m_axi4_rvalid ) begin
                reg_rdata <= m_axi4_rdata;
            end
            
            if ( wstart && !busy ) begin
                reg_awvalid <= 1'b1;
                reg_wvalid  <= 1'b1;
                reg_busy    <= 1'b1;
            end
            else if ( rstart && !busy ) begin
                reg_arvalid <= 1'b1;
                reg_busy    <= 1'b1;
            end
        end
    end
    
    assign busy            = reg_busy;
    assign rdata           = reg_rdata;
    
    assign m_axi4_awid     = AXI4_AWID;
    assign m_axi4_awaddr   = addr;
    assign m_axi4_awlen    = 0;
    assign m_axi4_awsize   = AXI4_AWSIZE;
    assign m_axi4_awburst  = AXI4_AWBURST;
    assign m_axi4_awlock   = AXI4_AWLOCK;
    assign m_axi4_awcache  = AXI4_AWCACHE;
    assign m_axi4_awprot   = AXI4_AWPROT;
    assign m_axi4_awqos    = AXI4_AWQOS;
    assign m_axi4_awregion = AXI4_AWREGION;
    assign m_axi4_awvalid  = reg_awvalid;
    assign m_axi4_wdata    = wdata;
    assign m_axi4_wstrb    = {AXI4_STRB_WIDTH{1'b1}};
    assign m_axi4_wlast    = 1'b1;
    assign m_axi4_wvalid   = reg_wvalid;
    assign m_axi4_bready   = 1'b1;
    
    assign m_axi4_arid     = AXI4_ARID;
    assign m_axi4_araddr   = addr;
    assign m_axi4_arlen    = 0;
    assign m_axi4_arsize   = AXI4_ARSIZE;
    assign m_axi4_arburst  = AXI4_ARBURST;
    assign m_axi4_arlock   = AXI4_ARLOCK;
    assign m_axi4_arcache  = AXI4_ARCACHE;
    assign m_axi4_arprot   = AXI4_ARPROT;
    assign m_axi4_arqos    = AXI4_ARQOS;
    assign m_axi4_arregion = AXI4_ARREGION;
    assign m_axi4_arvalid  = reg_arvalid;
    assign m_axi4_rready   = 1'b1;
    
endmodule


`default_nettype wire


// end of file
