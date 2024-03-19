// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_axi4_bridge_read
        #(
            parameter   ASYNC               = 1,
            
            parameter   AXI4_ID_WIDTH       = 6,
            parameter   AXI4_ADDR_WIDTH     = 32,
            parameter   AXI4_DATA_SIZE      = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH     = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH      = 8,
            parameter   AXI4_QOS_WIDTH      = 4,
            
            parameter   AR_FIFO_PTR_WIDTH   = 6,
            parameter   AR_FIFO_RAM_TYPE    = "distributed",
            parameter   AR_M_REGS           = 1,
            parameter   R_FIFO_PTR_WIDTH    = 6,
            parameter   R_FIFO_RAM_TYPE     = "distributed",
            parameter   R_S_REGS            = 1
        )
        (
            input   wire                                s_axi4_aresetn,
            input   wire                                s_axi4_aclk,
            input   wire    [AXI4_ID_WIDTH-1:0]         s_axi4_arid,
            input   wire    [AXI4_ADDR_WIDTH-1:0]       s_axi4_araddr,
            input   wire    [AXI4_LEN_WIDTH-1:0]        s_axi4_arlen,
            input   wire    [2:0]                       s_axi4_arsize,
            input   wire    [1:0]                       s_axi4_arburst,
            input   wire    [0:0]                       s_axi4_arlock,
            input   wire    [3:0]                       s_axi4_arcache,
            input   wire    [2:0]                       s_axi4_arprot,
            input   wire    [AXI4_QOS_WIDTH-1:0]        s_axi4_arqos,
            input   wire    [3:0]                       s_axi4_arregion,
            input   wire                                s_axi4_arvalid,
            output  wire                                s_axi4_arready,
            output  wire    [AXI4_ID_WIDTH-1:0]         s_axi4_rid,
            output  wire    [AXI4_DATA_WIDTH-1:0]       s_axi4_rdata,
            output  wire    [1:0]                       s_axi4_rresp,
            output  wire                                s_axi4_rlast,
            output  wire                                s_axi4_rvalid,
            input   wire                                s_axi4_rready,
            
            input   wire                                m_axi4_aresetn,
            input   wire                                m_axi4_aclk,
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
    
    // aw
    jelly_fifo_generic_fwtf
            #(
                .ASYNC          (ASYNC),
                .DATA_WIDTH     (AXI4_ID_WIDTH+AXI4_ADDR_WIDTH+AXI4_LEN_WIDTH+3+2+1+4+3+AXI4_QOS_WIDTH+4),
                .PTR_WIDTH      (AR_FIFO_PTR_WIDTH),
                .RAM_TYPE       (AR_FIFO_RAM_TYPE),
                .MASTER_REGS    (AR_M_REGS)
            )
        i_fifo_generic_fwtf_ar
            (
                .s_reset        (~s_axi4_aresetn),
                .s_clk          (s_axi4_aclk),
                .s_data         ({
                                    s_axi4_arid,
                                    s_axi4_araddr,
                                    s_axi4_arlen,
                                    s_axi4_arsize,
                                    s_axi4_arburst,
                                    s_axi4_arlock,
                                    s_axi4_arcache,
                                    s_axi4_arprot,
                                    s_axi4_arqos,
                                    s_axi4_arregion
                                }),
                .s_valid        (s_axi4_arvalid),
                .s_ready        (s_axi4_arready),
                .s_free_count   (),
                
                .m_reset        (~m_axi4_aresetn),
                .m_clk          (m_axi4_aclk),
                .m_data         ({
                                    m_axi4_arid,
                                    m_axi4_araddr,
                                    m_axi4_arlen,
                                    m_axi4_arsize,
                                    m_axi4_arburst,
                                    m_axi4_arlock,
                                    m_axi4_arcache,
                                    m_axi4_arprot,
                                    m_axi4_arqos,
                                    m_axi4_arregion
                                }),
                .m_valid        (m_axi4_arvalid),
                .m_ready        (m_axi4_arready),
                .m_data_count   ()
            );
    
    
    // r
    jelly_fifo_generic_fwtf
            #(
                .ASYNC          (ASYNC),
                .DATA_WIDTH     (AXI4_ID_WIDTH+AXI4_DATA_WIDTH+2+1),
                .PTR_WIDTH      (R_FIFO_PTR_WIDTH),
                .RAM_TYPE       (R_FIFO_RAM_TYPE),
                .MASTER_REGS    (R_S_REGS)
            )
        i_fifo_generic_fwtf_r
            (
                .s_reset        (~m_axi4_aresetn),
                .s_clk          (m_axi4_aclk),
                .s_data         ({
                                    m_axi4_rid,
                                    m_axi4_rdata,
                                    m_axi4_rresp,
                                    m_axi4_rlast
                                }),
                .s_valid        (m_axi4_rvalid),
                .s_ready        (m_axi4_rready),
                .s_free_count   (),
                
                .m_reset        (~s_axi4_aresetn),
                .m_clk          (s_axi4_aclk),
                .m_data         ({
                                    s_axi4_rid,
                                    s_axi4_rdata,
                                    s_axi4_rresp,
                                    s_axi4_rlast
                                }),
                .m_valid        (s_axi4_rvalid),
                .m_ready        (s_axi4_rready),
                .m_data_count   ()
            );
    
    
endmodule


`default_nettype wire


// end of file
