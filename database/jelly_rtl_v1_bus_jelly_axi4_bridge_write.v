// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_axi4_bridge_write
        #(
            parameter   ASYNC               = 1,
            
            parameter   AXI4_ID_WIDTH       = 6,
            parameter   AXI4_ADDR_WIDTH     = 32,
            parameter   AXI4_DATA_SIZE      = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH     = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH     = (1 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH      = 8,
            parameter   AXI4_QOS_WIDTH      = 4,

            parameter   AW_FIFO_PTR_WIDTH   = 6,
            parameter   AW_FIFO_RAM_TYPE    = "distributed",
            parameter   AW_M_REGS           = 1,
            parameter   W_FIFO_PTR_WIDTH    = 6,
            parameter   W_FIFO_RAM_TYPE     = "distributed",
            parameter   W_M_REGS            = 1,
            parameter   B_FIFO_PTR_WIDTH    = 6,
            parameter   B_FIFO_RAM_TYPE     = "distributed",
            parameter   B_S_REGS            = 0
        )
        (
            input   wire                                s_axi4_aresetn,
            input   wire                                s_axi4_aclk,
            input   wire    [AXI4_ID_WIDTH-1:0]         s_axi4_awid,
            input   wire    [AXI4_ADDR_WIDTH-1:0]       s_axi4_awaddr,
            input   wire    [AXI4_LEN_WIDTH-1:0]        s_axi4_awlen,
            input   wire    [2:0]                       s_axi4_awsize,
            input   wire    [1:0]                       s_axi4_awburst,
            input   wire    [0:0]                       s_axi4_awlock,
            input   wire    [3:0]                       s_axi4_awcache,
            input   wire    [2:0]                       s_axi4_awprot,
            input   wire    [AXI4_QOS_WIDTH-1:0]        s_axi4_awqos,
            input   wire    [3:0]                       s_axi4_awregion,
            input   wire                                s_axi4_awvalid,
            output  wire                                s_axi4_awready,
            input   wire    [AXI4_DATA_WIDTH-1:0]       s_axi4_wdata,
            input   wire    [AXI4_STRB_WIDTH-1:0]       s_axi4_wstrb,
            input   wire                                s_axi4_wlast,
            input   wire                                s_axi4_wvalid,
            output  wire                                s_axi4_wready,
            output  wire    [AXI4_ID_WIDTH-1:0]         s_axi4_bid,
            output  wire    [1:0]                       s_axi4_bresp,
            output  wire                                s_axi4_bvalid,
            input   wire                                s_axi4_bready,
            
            input   wire                                m_axi4_aresetn,
            input   wire                                m_axi4_aclk,
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
            output  wire                                m_axi4_bready
        );
    
    // aw
    jelly_fifo_generic_fwtf
            #(
                .ASYNC          (ASYNC),
                .DATA_WIDTH     (AXI4_ID_WIDTH+AXI4_ADDR_WIDTH+AXI4_LEN_WIDTH+3+2+1+4+3+AXI4_QOS_WIDTH+4),
                .PTR_WIDTH      (AW_FIFO_PTR_WIDTH),
                .RAM_TYPE       (AW_FIFO_RAM_TYPE),
                .MASTER_REGS    (AW_M_REGS)
            )
        i_fifo_generic_fwtf_aw
            (
                .s_reset        (~s_axi4_aresetn),
                .s_clk          (s_axi4_aclk),
                .s_data         ({
                                    s_axi4_awid,
                                    s_axi4_awaddr,
                                    s_axi4_awlen,
                                    s_axi4_awsize,
                                    s_axi4_awburst,
                                    s_axi4_awlock,
                                    s_axi4_awcache,
                                    s_axi4_awprot,
                                    s_axi4_awqos,
                                    s_axi4_awregion
                                }),
                .s_valid        (s_axi4_awvalid),
                .s_ready        (s_axi4_awready),
                .s_free_count   (),
                
                .m_reset        (~m_axi4_aresetn),
                .m_clk          (m_axi4_aclk),
                .m_data         ({
                                    m_axi4_awid,
                                    m_axi4_awaddr,
                                    m_axi4_awlen,
                                    m_axi4_awsize,
                                    m_axi4_awburst,
                                    m_axi4_awlock,
                                    m_axi4_awcache,
                                    m_axi4_awprot,
                                    m_axi4_awqos,
                                    m_axi4_awregion
                                }),
                .m_valid        (m_axi4_awvalid),
                .m_ready        (m_axi4_awready),
                .m_data_count   ()
            );
    
    
    // w
    jelly_fifo_generic_fwtf
            #(
                .ASYNC          (ASYNC),
                .DATA_WIDTH     (AXI4_DATA_WIDTH+AXI4_STRB_WIDTH+1),
                .PTR_WIDTH      (W_FIFO_PTR_WIDTH),
                .RAM_TYPE       (W_FIFO_RAM_TYPE),
                .MASTER_REGS    (W_M_REGS)
            )
        i_fifo_generic_fwtf_w
            (
                .s_reset        (~s_axi4_aresetn),
                .s_clk          (s_axi4_aclk),
                .s_data         ({
                                    s_axi4_wdata,
                                    s_axi4_wstrb,
                                    s_axi4_wlast
                                }),
                .s_valid        (s_axi4_wvalid),
                .s_ready        (s_axi4_wready),
                .s_free_count   (),
                
                .m_reset        (~m_axi4_aresetn),
                .m_clk          (m_axi4_aclk),
                .m_data         ({
                                    m_axi4_wdata,
                                    m_axi4_wstrb,
                                    m_axi4_wlast
                                }),
                .m_valid        (m_axi4_wvalid),
                .m_ready        (m_axi4_wready),
                .m_data_count   ()
            );
    
    // b
    jelly_fifo_generic_fwtf
            #(
                .ASYNC          (ASYNC),
                .DATA_WIDTH     (AXI4_ID_WIDTH+2),
                .PTR_WIDTH      (B_FIFO_PTR_WIDTH),
                .RAM_TYPE       (B_FIFO_RAM_TYPE),
                .MASTER_REGS    (B_S_REGS)
            )
        i_fifo_generic_fwtf_b
            (
                .s_reset        (~m_axi4_aresetn),
                .s_clk          (m_axi4_aclk),
                .s_data         ({
                                    m_axi4_bid,
                                    m_axi4_bresp
                                }),
                .s_valid        (m_axi4_bvalid),
                .s_ready        (m_axi4_bready),
                .s_free_count   (),
                
                .m_reset        (~s_axi4_aresetn),
                .m_clk          (s_axi4_aclk),
                .m_data         ({
                                    s_axi4_bid,
                                    s_axi4_bresp
                                }),
                .m_valid        (s_axi4_bvalid),
                .m_ready        (s_axi4_bready),
                .m_data_count   ()
            );
    
    
endmodule


`default_nettype wire


// end of file
