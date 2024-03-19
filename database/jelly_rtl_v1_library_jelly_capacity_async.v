// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// 容量の非同期伝搬
module jelly_capacity_async
        #(
            parameter   ASYNC               = 1,
            parameter   CAPACITY_WIDTH      = 32,               // オーバーフローしないサイズとする
            parameter   REQUEST_WIDTH       = CAPACITY_WIDTH,
            parameter   ISSUE_WIDTH         = CAPACITY_WIDTH,   // CAPACITY_WIDTH より大きくすること
            parameter   REQUEST_SIZE_OFFSET = 1'b0,
            parameter   ISSUE_SIZE_OFFSET   = 1'b0,
            
            parameter   INIT_REQUEST        = {CAPACITY_WIDTH{1'b0}}
        )
        (
            input   wire                            s_reset,
            input   wire                            s_clk,
            input   wire    [REQUEST_WIDTH-1:0]     s_request_size,
            input   wire                            s_request_valid,
            output  wire    [CAPACITY_WIDTH-1:0]    s_queued_request,
            
            input   wire                            m_reset,
            input   wire                            m_clk,
            output  wire    [ISSUE_WIDTH-1:0]       m_issue_size,
            output  wire                            m_issue_valid,
            input   wire                            m_issue_ready,
            output  wire    [CAPACITY_WIDTH-1:0]    m_queued_request
        );
    
    generate
    if ( ASYNC ) begin : blk_async
        
        wire    [CAPACITY_WIDTH-1:0]    s_size;
        wire                            s_valid;
        wire                            s_ready;
        
        wire    [CAPACITY_WIDTH-1:0]    m_size;
        wire                            m_valid;
        
        jelly_capacity_buffer
                #(
                    .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                    .REQUEST_WIDTH          (REQUEST_WIDTH),
                    .ISSUE_WIDTH            (CAPACITY_WIDTH),
                    .REQUEST_SIZE_OFFSET    (REQUEST_SIZE_OFFSET),
                    .ISSUE_SIZE_OFFSET      (1'b0),
                    
                    .INIT_REQUEST           ({CAPACITY_WIDTH{1'b0}})
                )
            i_capacity_buffer_s 
                (
                    .reset                  (s_reset),
                    .clk                    (s_clk),
                    .cke                    (1'b1),
                    
                    .queued_request         (s_queued_request),
                    
                    .s_request_size         (s_request_size),
                    .s_request_valid        (s_request_valid),
                    
                    .m_issue_size           (s_size),
                    .m_issue_valid          (s_valid),
                    .m_issue_ready          (s_ready)
                );
        
        jelly_data_async
                #(
                    .DATA_WIDTH             (CAPACITY_WIDTH)
                )
            i_data_async
                (
                    .s_reset                (s_reset),
                    .s_clk                  (s_clk),
                    .s_data                 (s_size),
                    .s_valid                (s_valid),
                    .s_ready                (s_ready),
                    
                    .m_reset                (m_reset),
                    .m_clk                  (m_clk),
                    .m_data                 (m_size),
                    .m_valid                (m_valid),
                    .m_ready                (1'b1)
                );
        
        jelly_capacity_buffer
                #(
                    .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                    .REQUEST_WIDTH          (CAPACITY_WIDTH),
                    .ISSUE_WIDTH            (ISSUE_WIDTH),
                    .REQUEST_SIZE_OFFSET    (1'b0),
                    .ISSUE_SIZE_OFFSET      (ISSUE_SIZE_OFFSET),
                    
                    .INIT_REQUEST           (INIT_REQUEST)
                )
            i_capacity_buffer_m
                (
                    .reset                  (m_reset),
                    .clk                    (m_clk),
                    .cke                    (1'b1),
                    
                    .queued_request         (m_queued_request),
                    
                    .s_request_size         (m_size),
                    .s_request_valid        (m_valid),
                    
                    .m_issue_size           (m_issue_size),
                    .m_issue_valid          (m_issue_valid),
                    .m_issue_ready          (m_issue_ready)
                );
    end
    else begin : blk_sync
        jelly_capacity_buffer
                #(
                    .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                    .REQUEST_WIDTH          (REQUEST_WIDTH),
                    .ISSUE_WIDTH            (ISSUE_WIDTH),
                    .REQUEST_SIZE_OFFSET    (REQUEST_SIZE_OFFSET),
                    .ISSUE_SIZE_OFFSET      (ISSUE_SIZE_OFFSET),
                    
                    .INIT_REQUEST           (INIT_REQUEST)
                )
            i_capacity_buffer
                (
                    .reset                  (s_reset),
                    .clk                    (s_clk),
                    .cke                    (1'b1),
                    
                    .queued_request         (m_queued_request),
                    
                    .s_request_size         (s_request_size),
                    .s_request_valid        (s_request_valid),
                    
                    .m_issue_size           (m_issue_size),
                    .m_issue_valid          (m_issue_valid),
                    .m_issue_ready          (m_issue_ready)
                );
        
        assign s_queued_request = 0;
    end
    endgenerate
    
    
    
    // debug (for simulation)
    integer total_request;
    always @(posedge s_clk) begin
        if ( s_reset ) begin
            total_request <= 0;
        end
        else begin
            if ( s_request_valid ) begin
                total_request <= total_request + s_request_size + REQUEST_SIZE_OFFSET;
            end
        end
    end
    
    integer total_issue;
    always @(posedge m_clk) begin
        if ( m_reset ) begin
            total_issue <= 0;
        end
        else begin
            if ( m_issue_valid & m_issue_ready ) begin
                total_issue <= total_issue + m_issue_size + ISSUE_SIZE_OFFSET;
            end
        end
    end
    
endmodule


`default_nettype wire


// end of file
