// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4s_video_fifo
        #(
            parameter   TUSER_WIDTH = 1,
            parameter   TDATA_WIDTH = 32,
            
            parameter   ASYNC       = 1,
            parameter   PTR_WIDTH   = 10,
            parameter   DOUT_REGS   = 1,
            parameter   RAM_TYPE    = "block",
            parameter   LOW_DEALY   = 0,
            parameter   S_REGS      = 1,
            parameter   M_REGS      = 1
        )
        (
            input   wire                        s_axi4s_aresetn,
            input   wire                        s_axi4s_aclk,
            input   wire    [TUSER_WIDTH-1:0]   s_axi4s_tuser,
            input   wire                        s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]   s_axi4s_tdata,
            input   wire                        s_axi4s_tvalid,
            output  wire                        s_axi4s_tready,
            output  wire    [PTR_WIDTH:0]       s_fifo_free_count,
            
            input   wire                        m_axi4s_aresetn,
            input   wire                        m_axi4s_aclk,
            output  wire    [TUSER_WIDTH-1:0]   m_axi4s_tuser,
            output  wire                        m_axi4s_tlast,
            output  wire    [TDATA_WIDTH-1:0]   m_axi4s_tdata,
            output  wire                        m_axi4s_tvalid,
            input   wire                        m_axi4s_tready,
            output  wire    [PTR_WIDTH:0]       m_fifo_data_count
        );
    
    jelly_fifo_generic_fwtf
            #(
                .ASYNC          (ASYNC),
                .DATA_WIDTH     (TUSER_WIDTH + 1 + TDATA_WIDTH),
                .PTR_WIDTH      (PTR_WIDTH),
                .DOUT_REGS      (DOUT_REGS),
                .RAM_TYPE       (RAM_TYPE),
                .LOW_DEALY      (LOW_DEALY),
                .SLAVE_REGS     (S_REGS),
                .MASTER_REGS    (M_REGS)
            )
        i_fifo_generic_fwtf
            (
                .s_reset       (~s_axi4s_aresetn),
                .s_clk         (s_axi4s_aclk),
                .s_data        ({s_axi4s_tuser, s_axi4s_tlast, s_axi4s_tdata}),
                .s_valid       (s_axi4s_tvalid),
                .s_ready       (s_axi4s_tready),
                .s_free_count  (s_fifo_free_count),
                
                .m_reset       (~m_axi4s_aresetn),
                .m_clk         (m_axi4s_aclk),
                .m_data        ({m_axi4s_tuser, m_axi4s_tlast, m_axi4s_tdata}),
                .m_valid       (m_axi4s_tvalid),
                .m_ready       (m_axi4s_tready),
                .m_data_count  (m_fifo_data_count)
            );
    
    
endmodule


`default_nettype wire


// end of file
