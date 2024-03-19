// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4_master_read_model
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
            parameter   AXI4_ARID        = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_ARSIZE      = AXI4_DATA_SIZE,
            parameter   AXI4_ARBURST     = 2'b01,
            parameter   AXI4_ARLOCK      = 1'b0,
            parameter   AXI4_ARCACHE     = 4'b0001,
            parameter   AXI4_ARPROT      = 3'b000,
            parameter   AXI4_ARQOS       = 0,
            parameter   AXI4_ARREGION    = 4'b0000,
            
            parameter   RATE_AR          = 50,
            parameter   RATE_R           = 50,
            parameter   SEED_RAND        = 1
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            
            output  wire    [AXI4_ID_WIDTH-1:0]     m_axi4_arid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]   m_axi4_araddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]    m_axi4_arlen,
            output  wire    [2:0]                   m_axi4_arsize,
            output  wire    [1:0]                   m_axi4_arburst,
            output  wire    [0:0]                   m_axi4_arlock,
            output  wire    [3:0]                   m_axi4_arcache,
            output  wire    [2:0]                   m_axi4_arprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]    m_axi4_arqos,
            output  wire    [3:0]                   m_axi4_arregion,
            output  wire                            m_axi4_arvalid,
            input   wire                            m_axi4_arready,
            input   wire    [AXI4_ID_WIDTH-1:0]     m_axi4_rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]   m_axi4_rdata,
            input   wire    [1:0]                   m_axi4_rresp,
            input   wire                            m_axi4_rlast,
            input   wire                            m_axi4_rvalid,
            output  wire                            m_axi4_rready
        );
    
    reg     [31:0]                  rnd_seed;
    
    reg     [AXI4_LEN_WIDTH-1:0]    reg_arlen;
    reg                             reg_arvalid;
    reg                             reg_rready;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            rnd_seed     <= SEED_RAND;
            
            reg_arlen    <= 0;
            reg_arvalid  <= 1'b0;
            reg_rready   <= 0;
        end
        else begin
            if ( !m_axi4_arvalid || m_axi4_arready ) begin
                if ( {$random(rnd_seed)} % 100 < RATE_AR ) begin
                    reg_arlen   <= {$random(rnd_seed)};
                    reg_arvalid <= 1'b1;
                end
                else begin
                    reg_arvalid <= 1'b0;
                end
            end
            
            reg_rready <= ({$random(rnd_seed)} % 100 < RATE_R);
        end
    end
    
    
    assign m_axi4_arid     = AXI4_ARID;
    assign m_axi4_araddr   = 0;
    assign m_axi4_arlen    = reg_arlen;
    assign m_axi4_arsize   = AXI4_ARSIZE;
    assign m_axi4_arburst  = AXI4_ARBURST;
    assign m_axi4_arlock   = AXI4_ARLOCK;
    assign m_axi4_arcache  = AXI4_ARCACHE;
    assign m_axi4_arprot   = AXI4_ARPROT;
    assign m_axi4_arqos    = AXI4_ARQOS;
    assign m_axi4_arregion = AXI4_ARREGION;
    assign m_axi4_arvalid  = reg_arvalid;
    assign m_axi4_rready   = reg_rready;
    
endmodule


`default_nettype wire


// end of file
