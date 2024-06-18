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



// generic FIFO (First-Word Fall-Through mode)
module jelly_fifo_generic_fwtf
        #(
            parameter   ASYNC       = 0,
            parameter   DATA_WIDTH  = 8,
            parameter   PTR_WIDTH   = 10,
            parameter   DOUT_REGS   = 0,
            parameter   RAM_TYPE    = "block",
            parameter   LOW_DEALY   = 0,
            parameter   SLAVE_REGS  = 0,
            parameter   MASTER_REGS = 1
        )
        (
            // slave port
            input   wire                        s_reset,
            input   wire                        s_clk,
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            output  wire    [PTR_WIDTH:0]       s_free_count,
            
            // master port
            input   wire                        m_reset,
            input   wire                        m_clk,
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready,
            output  wire    [PTR_WIDTH:0]       m_data_count
        );
    
    
    generate
    if ( ASYNC ) begin : blk_async
        jelly_fifo_async_fwtf
                #(
                    .DATA_WIDTH     (DATA_WIDTH),
                    .PTR_WIDTH      (PTR_WIDTH == 0 ? 1 : PTR_WIDTH),
                    .DOUT_REGS      (DOUT_REGS),
                    .RAM_TYPE       (RAM_TYPE),
                    .SLAVE_REGS     (SLAVE_REGS),
                    .MASTER_REGS    (MASTER_REGS)
                )
            i_fifo_async_fwtf
                (
                    .s_reset        (s_reset),
                    .s_clk          (s_clk),
                    .s_data         (s_data),
                    .s_valid        (s_valid),
                    .s_ready        (s_ready),
                    .s_free_count   (s_free_count),
                    
                    .m_reset        (m_reset),
                    .m_clk          (m_clk),
                    .m_data         (m_data),
                    .m_valid        (m_valid),
                    .m_ready        (m_ready),
                    .m_data_count   (m_data_count)
                );
    end
    else begin : blk_sync
        jelly_fifo_fwtf
                #(
                    .DATA_WIDTH     (DATA_WIDTH),
                    .PTR_WIDTH      (PTR_WIDTH),
                    .DOUT_REGS      (DOUT_REGS),
                    .RAM_TYPE       (RAM_TYPE),
                    .LOW_DEALY      (LOW_DEALY),
                    .SLAVE_REGS     (SLAVE_REGS),
                    .MASTER_REGS    (MASTER_REGS)
                )
            i_fifo_fwtf
                (
                    .reset          (s_reset),
                    .clk            (s_clk),
                    
                    .s_data         (s_data),
                    .s_valid        (s_valid),
                    .s_ready        (s_ready),
                    .s_free_count   (s_free_count),
                    
                    .m_data         (m_data),
                    .m_valid        (m_valid),
                    .m_ready        (m_ready),
                    .m_data_count   (m_data_count)
                );
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
