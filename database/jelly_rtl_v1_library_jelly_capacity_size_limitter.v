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



// サイズ制約
module jelly_capacity_size_limitter
        #(
            parameter   CAPACITY_WIDTH      = 32,
            parameter   REQUEST_WIDTH       = CAPACITY_WIDTH,
            parameter   ISSUE_WIDTH         = 8,
            parameter   REQUEST_SIZE_OFFSET = 1'b1,
            parameter   ISSUE_SIZE_OFFSET   = 1'b1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [ISSUE_WIDTH-1:0]       max_issue_size,
            output  wire    [CAPACITY_WIDTH-1:0]    queued_request,
            
            input   wire    [REQUEST_WIDTH-1:0]     s_request_size,
            input   wire                            s_request_valid,
            
            output  wire    [ISSUE_WIDTH-1:0]       m_issue_size,
            output  wire                            m_issue_valid,
            input   wire                            m_issue_ready
        );
    
    wire                            ready = (!m_issue_valid || m_issue_ready);
    
    reg     [CAPACITY_WIDTH-1:0]    reg_queued_request, next_queued_request;
    reg     [ISSUE_WIDTH-1:0]       reg_issue_size,     next_issue_size;
    reg                             reg_issue_valid,    next_issue_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_queued_request <= {CAPACITY_WIDTH{1'b0}};
            reg_issue_size     <= {ISSUE_WIDTH{1'bx}};
            reg_issue_valid    <= 1'b0;
        end
        else if ( cke ) begin
            reg_queued_request <= next_queued_request;
            reg_issue_size     <= next_issue_size;
            reg_issue_valid    <= next_issue_valid;
        end
    end
    
    always @* begin
        next_queued_request = reg_queued_request;
        next_issue_size     = reg_issue_size;
        next_issue_valid    = reg_issue_valid;
        
        if ( s_request_valid ) begin
            next_queued_request = next_queued_request + s_request_size + REQUEST_SIZE_OFFSET;
        end
        
        if ( ready ) begin
            next_issue_size  = {ISSUE_WIDTH{1'bx}};
            next_issue_valid = 1'b0;
            if ( next_queued_request > 0 ) begin
                if ( next_queued_request >= ({1'b0, max_issue_size} + ISSUE_SIZE_OFFSET) ) begin
                    next_issue_size     = max_issue_size;
                    next_issue_valid    = 1'b1;
                    next_queued_request = next_queued_request - ({1'b0, max_issue_size} + ISSUE_SIZE_OFFSET);
                end
                else begin
                    next_issue_size     = next_queued_request - ISSUE_SIZE_OFFSET;
                    next_issue_valid    = 1'b1;
                    next_queued_request = {CAPACITY_WIDTH{1'b0}};
                end
            end
        end
        
    end
    
    assign queued_request = reg_queued_request;
    
    assign m_issue_size   = reg_issue_size;
    assign m_issue_valid  = reg_issue_valid;
    
endmodule


`default_nettype wire


// end of file
