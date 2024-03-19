// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// 容量伝搬バッファ
module jelly_capacity_buffer
        #(
            parameter   CAPACITY_WIDTH      = 32,               // オーバーフローしないサイズとする
            parameter   REQUEST_WIDTH       = CAPACITY_WIDTH,
            parameter   ISSUE_WIDTH         = CAPACITY_WIDTH,   // CAPACITY_WIDTH より大きくすること
            parameter   REQUEST_SIZE_OFFSET = 1'b0,
            parameter   ISSUE_SIZE_OFFSET   = 1'b0,
            
            parameter   INIT_REQUEST        = {CAPACITY_WIDTH{1'b0}}
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            output  wire    [CAPACITY_WIDTH-1:0]    queued_request,
            
            input   wire    [REQUEST_WIDTH-1:0]     s_request_size,
            input   wire                            s_request_valid,
            
            output  wire    [ISSUE_WIDTH-1:0]       m_issue_size,
            output  wire                            m_issue_valid,
            input   wire                            m_issue_ready
        );
    
    wire                            ready = (!m_issue_valid || m_issue_ready);
    
    reg     [CAPACITY_WIDTH-1:0]    reg_queued_request, next_queued_request;
    reg                             reg_request_empty,  next_request_empty;
    
    reg     [ISSUE_WIDTH-1:0]       reg_issue_size,     next_issue_size;
    reg                             reg_issue_valid,    next_issue_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_queued_request <= INIT_REQUEST;
            reg_request_empty  <= (INIT_REQUEST == 0);
            reg_issue_size     <= {ISSUE_WIDTH{1'bx}};
            reg_issue_valid    <= 1'b0;
        end
        else if ( cke ) begin
            reg_queued_request <= next_queued_request;
            reg_request_empty  <= next_request_empty;
            reg_issue_size     <= next_issue_size;
            reg_issue_valid    <= next_issue_valid;
        end
    end
    
    always @* begin
        next_queued_request = reg_queued_request;
        next_request_empty  = reg_request_empty;
        next_issue_size     = reg_issue_size;
        next_issue_valid    = reg_issue_valid;
        
        if ( m_issue_ready ) begin
            next_issue_valid = 1'b0;
        end
        
        if ( !next_issue_valid && !next_request_empty ) begin
            next_issue_size  = next_queued_request - ISSUE_SIZE_OFFSET;
            next_issue_valid = 1'b1;
            next_queued_request = 0;
            next_request_empty  = 1'b1;
        end
        
        if ( s_request_valid ) begin
            next_queued_request = next_queued_request + s_request_size + REQUEST_SIZE_OFFSET;
            next_request_empty  = (({1'b0, s_request_size} + REQUEST_SIZE_OFFSET) == 0);
        end
    end
    
    assign m_issue_size  = reg_issue_size;
    assign m_issue_valid = reg_issue_valid;
    
    assign queued_request = reg_queued_request;
    
endmodule


`default_nettype wire


// end of file
