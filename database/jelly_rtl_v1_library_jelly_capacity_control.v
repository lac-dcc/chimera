// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// コマンド等の発行量管理
module jelly_capacity_control
        #(
            parameter   CAPACITY_WIDTH      = 32,
            parameter   REQUEST_WIDTH       = CAPACITY_WIDTH,
            parameter   CHARGE_WIDTH        = CAPACITY_WIDTH,
            parameter   ISSUE_WIDTH         = CAPACITY_WIDTH,   // CAPACITY_WIDTH より大きくすること
            parameter   REQUEST_SIZE_OFFSET = 1'b0,
            parameter   CHARGE_SIZE_OFFSET  = 1'b0,
            parameter   ISSUE_SIZE_OFFSET   = 1'b0
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire    [CAPACITY_WIDTH-1:0]    initial_capacity,
            input   wire    [CAPACITY_WIDTH-1:0]    initial_request,
            
            output  wire    [CAPACITY_WIDTH-1:0]    current_capacity,
            output  wire    [CAPACITY_WIDTH-1:0]    queued_request,
            
            input   wire    [REQUEST_WIDTH-1:0]     s_request_size,
            input   wire                            s_request_valid,
            
            input   wire    [CHARGE_WIDTH-1:0]      s_charge_size,
            input   wire                            s_charge_valid,
            
            output  wire    [ISSUE_WIDTH-1:0]       m_issue_size,
            output  wire                            m_issue_valid,
            input   wire                            m_issue_ready
        );
    
    wire                            ready = (!m_issue_valid || m_issue_ready);
    
    reg     [CAPACITY_WIDTH-1:0]    reg_queued_request,   next_queued_request;
    reg     [CAPACITY_WIDTH-1:0]    reg_current_capacity, next_current_capacity;
                                                               
    reg     [ISSUE_WIDTH-1:0]       reg_issue_size,       next_issue_size;
    reg                             reg_issue_valid,      next_issue_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_queued_request   <= initial_request;
            reg_current_capacity <= initial_capacity;
            reg_issue_size       <= {ISSUE_WIDTH{1'bx}};
            reg_issue_valid      <= 1'b0;
        end
        else if ( cke ) begin
            reg_queued_request   <= next_queued_request;
            reg_current_capacity <= next_current_capacity;
            reg_issue_size       <= next_issue_size;
            reg_issue_valid      <= next_issue_valid;
        end
    end
    
    always @* begin
        next_queued_request   = reg_queued_request;
        next_current_capacity = reg_current_capacity;
        next_issue_size       = reg_issue_size;
        next_issue_valid      = reg_issue_valid;
        
        if ( s_request_valid ) begin
            next_queued_request   = next_queued_request   + s_request_size + REQUEST_SIZE_OFFSET;
        end
        if ( s_charge_valid ) begin
            next_current_capacity = next_current_capacity + s_charge_size  + CHARGE_SIZE_OFFSET;
        end
        
        if ( ready ) begin
            next_issue_valid = (reg_queued_request > 0) && (reg_current_capacity > 0);
            next_issue_size  = reg_queued_request < reg_current_capacity ? reg_queued_request : reg_current_capacity;
            
            next_queued_request   = next_queued_request   - next_issue_size;
            next_current_capacity = next_current_capacity - next_issue_size;
            
            next_issue_size = next_issue_size - ISSUE_SIZE_OFFSET;
        end
    end
    
    assign m_issue_size  = reg_issue_size;
    assign m_issue_valid = reg_issue_valid;
    
    assign current_capacity = reg_current_capacity;
    assign queued_request   = reg_queued_request;
    
    
    
    // debug (simulation only)
    integer     total_request;
    integer     total_charge;
    integer     total_issue;
    always @(posedge clk) begin
        if ( reset ) begin
            total_request <= 0;
            total_charge  <= 0;
            total_issue   <= 0;
        end
        else if ( cke ) begin
            if ( s_request_valid ) begin
                total_request <= total_request + s_request_size + REQUEST_SIZE_OFFSET;
            end
            
            if ( s_charge_valid ) begin
                total_charge <= total_charge + s_charge_size + CHARGE_SIZE_OFFSET;
            end
            
            if ( m_issue_valid & m_issue_ready ) begin
                total_issue <= total_issue + m_issue_size + ISSUE_SIZE_OFFSET;
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
