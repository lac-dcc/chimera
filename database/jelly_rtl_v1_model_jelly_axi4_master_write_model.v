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



module jelly_axi4_master_write_model
        #(
            // AXI4
            parameter   BYTE_WIDTH       = 8,
            parameter   AXI4_ID_WIDTH    = 6,
            parameter   AXI4_ADDR_WIDTH  = 32,
            parameter   AXI4_DATA_SIZE   = 4,
            parameter   AXI4_DATA_WIDTH  = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH  = AXI4_DATA_WIDTH / BYTE_WIDTH,
            parameter   AXI4_LEN_WIDTH   = 8,
            parameter   AXI4_QOS_WIDTH   = 4,
            parameter   AXI4_AWID        = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_AWSIZE      = AXI4_DATA_SIZE,
            parameter   AXI4_AWBURST     = 2'b01,
            parameter   AXI4_AWLOCK      = 1'b0,
            parameter   AXI4_AWCACHE     = 4'b0001,
            parameter   AXI4_AWPROT      = 3'b000,
            parameter   AXI4_AWQOS       = 0,
            parameter   AXI4_AWREGION    = 4'b0000,
            parameter   RATE_AW          = 50,
            parameter   RATE_W           = 50,
            parameter   RATE_B           = 50,
            
            parameter   SEED_RAND        = 1,
            parameter   SEED_LEN         = 2
            
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            
            output  wire    [AXI4_ID_WIDTH-1:0]     m_axi4_awid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]   m_axi4_awaddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]    m_axi4_awlen,
            output  wire    [2:0]                   m_axi4_awsize,
            output  wire    [1:0]                   m_axi4_awburst,
            output  wire    [0:0]                   m_axi4_awlock,
            output  wire    [3:0]                   m_axi4_awcache,
            output  wire    [2:0]                   m_axi4_awprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]    m_axi4_awqos,
            output  wire    [3:0]                   m_axi4_awregion,
            output  wire                            m_axi4_awvalid,
            input   wire                            m_axi4_awready,
            output  wire    [AXI4_DATA_WIDTH-1:0]   m_axi4_wdata,
            output  wire    [AXI4_STRB_WIDTH-1:0]   m_axi4_wstrb,
            output  wire                            m_axi4_wlast,
            output  wire                            m_axi4_wvalid,
            input   wire                            m_axi4_wready,
            input   wire    [AXI4_ID_WIDTH-1:0]     m_axi4_bid,
            input   wire    [1:0]                   m_axi4_bresp,
            input   wire                            m_axi4_bvalid,
            output  wire                            m_axi4_bready
        );
    
    reg     [31:0]                  rnd_seed;
    reg     [31:0]                  rnd_awlen;
    reg     [31:0]                  rnd_wlen;
    
    reg     [AXI4_LEN_WIDTH-1:0]    reg_awlen;
    reg                             reg_awvalid;
    reg     [AXI4_LEN_WIDTH-1:0]    tmp_wlen;
    reg     [AXI4_LEN_WIDTH-1:0]    reg_wlen;
    reg                             reg_wlast;
    reg                             reg_wvalid;
    reg                             reg_bready;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            rnd_seed     <= SEED_RAND;
            rnd_awlen    <= SEED_LEN;
            rnd_wlen     <= SEED_LEN;
            
            reg_awlen    <= 0;
            reg_awvalid  <= 1'b0;
            reg_wlen     <= 0;
            reg_wlast    <= 0;
            reg_wvalid   <= 0;
            reg_bready   <= 0;
        end
        else begin
            if ( !m_axi4_awvalid || m_axi4_awready ) begin
                if ( {$random(rnd_seed)} % 100 < RATE_AW ) begin
                    reg_awlen   <= {$random(rnd_awlen)};
                    reg_awvalid <= 1'b1;
                end
                else begin
                    reg_awvalid <= 1'b0;
                end
            end
            
            if ( !m_axi4_wvalid || (m_axi4_wlast && m_axi4_wready) ) begin
                if ( {$random(rnd_seed)} % 100 < RATE_W ) begin
                    tmp_wlen    = {$random(rnd_wlen)};
                    reg_wlen   <= tmp_wlen;
                    reg_wlast  <= (tmp_wlen == 0);
                    reg_wvalid <= 1'b1;
                end
                else begin
                    reg_wlen   <= {AXI4_LEN_WIDTH{1'bx}};
                    reg_wlast  <= 1'bx;
                    reg_wvalid <= 1'b0;
                end
            end
            else if ( m_axi4_wvalid && m_axi4_wready ) begin
                reg_wlen  <= reg_wlen - 1;
                reg_wlast <= ((reg_wlen  - 1) == 0);
            end
            
            reg_bready <= ({$random(rnd_seed)} % 100 < RATE_B);
        end
    end
    
    
    assign m_axi4_awid     = AXI4_AWID;
    assign m_axi4_awaddr   = 0;
    assign m_axi4_awlen    = reg_awlen;
    assign m_axi4_awsize   = AXI4_AWSIZE;
    assign m_axi4_awburst  = AXI4_AWBURST;
    assign m_axi4_awlock   = AXI4_AWLOCK;
    assign m_axi4_awcache  = AXI4_AWCACHE;
    assign m_axi4_awprot   = AXI4_AWPROT;
    assign m_axi4_awqos    = AXI4_AWQOS;
    assign m_axi4_awregion = AXI4_AWREGION;
    assign m_axi4_awvalid  = reg_awvalid;
    assign m_axi4_wdata    = 0;
    assign m_axi4_wstrb    = {AXI4_STRB_WIDTH{1'b1}};
    assign m_axi4_wlast    = reg_wlast;
    assign m_axi4_wvalid   = reg_wvalid;
    assign m_axi4_bready   = reg_bready;
    
endmodule


`default_nettype wire


// end of file
