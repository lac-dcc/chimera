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



// 発行量管理
module jelly_capacity_timeout
        #(
            parameter   TIMER_WIDTH         = 8,
            parameter   CAPACITY_WIDTH      = 32,               // オーバーフローしないサイズとする
            parameter   REQUEST_WIDTH       = CAPACITY_WIDTH,
            parameter   ISSUE_WIDTH         = 8,
            parameter   REQUEST_SIZE_OFFSET = 1'b0,
            parameter   ISSUE_SIZE_OFFSET   = 1'b1,
            
            parameter   INIT_REQUEST        = {CAPACITY_WIDTH{1'b0}}
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [ISSUE_WIDTH-1:0]       max_issue_size,
            input   wire    [TIMER_WIDTH-1:0]       timeout,
            
            output  wire    [CAPACITY_WIDTH-1:0]    queued_request,
            output  wire    [TIMER_WIDTH-1:0]       current_timer,
            
            input   wire    [REQUEST_WIDTH-1:0]     s_request_size,
            input   wire                            s_request_valid,
            
            output  wire    [ISSUE_WIDTH-1:0]       m_issue_size,
            output  wire                            m_issue_valid,
            input   wire                            m_issue_ready
        );
    
    wire                            ready = (!m_issue_valid || m_issue_ready);
    
    reg     [CAPACITY_WIDTH-1:0]    reg_queued_request,    next_queued_request;
    reg     [TIMER_WIDTH-1:0]       reg_timer,             next_timer;
    reg                             reg_timeout,           next_timeout;
    reg     [ISSUE_WIDTH-1:0]       reg_issue_size,        next_issue_size;
    reg                             reg_issue_valid,       next_issue_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_queued_request    <= INIT_REQUEST;
            reg_timer             <= {TIMER_WIDTH{1'b0}};
            reg_timeout           <= 1'b0;
            reg_issue_size        <= {ISSUE_WIDTH{1'bx}};
            reg_issue_valid       <= 1'b0;
        end
        else if ( cke ) begin
            reg_queued_request    <= next_queued_request;
            reg_timer             <= next_timer;
            reg_timeout           <= next_timeout;
            reg_issue_size        <= next_issue_size;
            reg_issue_valid       <= next_issue_valid;
        end
    end
    
    always @* begin
        next_queued_request = reg_queued_request;
        next_timer          = reg_timer;
        next_timeout        = 1'b0;
        next_issue_size     = reg_issue_size;
        next_issue_valid    = reg_issue_valid;
        
        // issue complete
        if ( m_issue_ready ) begin
            next_issue_valid = 1'b0;
        end
        
        // issue
        if ( !next_issue_valid ) begin
            if ( reg_queued_request >= ({1'b0, max_issue_size} + ISSUE_SIZE_OFFSET) ) begin
                next_issue_size     = max_issue_size;
                next_issue_valid    = 1'b1;
                next_queued_request = next_queued_request - max_issue_size - ISSUE_SIZE_OFFSET;
            end
            else if ( reg_timeout ) begin
                next_issue_size     = next_queued_request - ISSUE_SIZE_OFFSET;
                next_issue_valid    = 1'b1;
                next_queued_request = 0;
            end
        end
        
        // request
        if ( s_request_valid ) begin
            next_queued_request = next_queued_request + s_request_size + REQUEST_SIZE_OFFSET;
        end
        
        // timeout
        if ( next_issue_valid || s_request_valid ) begin
            next_timer = 0;
        end
        else if ( reg_queued_request > 0 ) begin
            next_timeout = (next_timer >= timeout);
            next_timer   = next_timer + 1;
        end
    end
    
    assign m_issue_size  = reg_issue_size;
    assign m_issue_valid = reg_issue_valid;
    
    assign current_timer  = reg_timer;
    assign queued_request = reg_queued_request;
    
endmodule


`default_nettype wire


// end of file
