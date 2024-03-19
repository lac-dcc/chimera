// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// データを持たないFIFO的挙動のカウンタ
// データではなくシグナルの回数だけを伝えるための


module jelly_signal_transfer
        #(
            parameter ASYNC          = 1,
            parameter PTR_WIDTH      = 6,
            parameter CAPACITY_WIDTH = 8
        )
        (
            input   wire    s_reset,
            input   wire    s_clk,
            input   wire    s_valid,
            
            input   wire    m_reset,
            input   wire    m_clk,
            output  wire    m_valid,
            input   wire    m_ready
        );
    
    
    generate
    if ( ASYNC ) begin : blk_async
        jelly_signal_transfer_async
                #(
                    .PTR_WIDTH      (PTR_WIDTH),
                    .CAPACITY_WIDTH (CAPACITY_WIDTH)
                )
            i_signal_transfer_async
                (
                    .s_reset        (s_reset),
                    .s_clk          (s_clk),
                    .s_valid        (s_valid),
                    
                    .m_reset        (m_reset),
                    .m_clk          (m_clk),
                    .m_valid        (m_valid),
                    .m_ready        (m_ready)
                );
    end
    else begin : blk_sync
        jelly_signal_transfer_sync
                #(
                    .CAPACITY_WIDTH (CAPACITY_WIDTH)
                )
            i_signal_transfer_sync
                (
                    .reset          (s_reset),
                    .clk            (s_clk),
                    .s_valid        (s_valid),
                    
                    .m_valid        (m_valid),
                    .m_ready        (m_ready)
                );
    end
    endgenerate
endmodule


/*
// signal fifo
module jelly_signal_transfer
        #(
            parameter   ASYNC          = 1,
            parameter   CAPACITY_WIDTH = 8
        )
        (
            input   wire    s_reset,
            input   wire    s_clk,
            input   wire    s_valid,
            
            input   wire    m_reset,
            input   wire    m_clk,
            output  wire    m_valid,
            input   wire    m_ready
        );
    
    wire    [CAPACITY_WIDTH-1:0]    async_size;
    wire                            async_valid;
    
    jelly_capacity_async
            #(
                .ASYNC                  (ASYNC),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .REQUEST_WIDTH          (1),
                .ISSUE_WIDTH            (CAPACITY_WIDTH),
                .REQUEST_SIZE_OFFSET    (1'b0),
                .ISSUE_SIZE_OFFSET      (1'b0),
                .INIT_REQUEST           ({CAPACITY_WIDTH{1'b0}})
            )
        i_capacity_async
            (
                .s_reset                (s_reset),
                .s_clk                  (s_clk),
                .s_request_size         (1'b1),
                .s_request_valid        (s_valid),
                .s_queued_request       (),
                
                .m_reset                (m_reset),
                .m_clk                  (m_clk),
                .m_issue_size           (async_size),
                .m_issue_valid          (async_valid),
                .m_issue_ready          (1'b1),
                .m_queued_request       ()
            );
    
    
    jelly_capacity_size_limitter
            #(
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .REQUEST_WIDTH          (CAPACITY_WIDTH),
                .ISSUE_WIDTH            (1),
                .REQUEST_SIZE_OFFSET    (1'b0),
                .ISSUE_SIZE_OFFSET      (1'b0)
            )
        i_capacity_size_limitter
            (
                .reset                  (m_reset),
                .clk                    (m_clk),
                .cke                    (1'b1),
                
                .max_issue_size         (1'b1),
                .queued_request         (),
                
                .s_request_size         (async_size),
                .s_request_valid        (async_valid),
                
                .m_issue_size           (),
                .m_issue_valid          (m_valid),
                .m_issue_ready          (m_ready)
            );
    
    
endmodule
*/


`default_nettype wire


// end of file
