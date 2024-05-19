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


module jelly_busy_control
        #(
            parameter   CAPACITY_WIDTH       = 32,
            parameter   ISSUE_WIDTH          = CAPACITY_WIDTH,
            parameter   COMPLETE_WIDTH       = CAPACITY_WIDTH,
            parameter   ISSUE_SIZE_OFFSET    = 1'b1,
            parameter   COMPLETE_SIZE_OFFSET = 1'b1,
            parameter   FAST_BUSY            = 0
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            enable,
            output  wire                            busy,
            
            output  wire    [CAPACITY_WIDTH-1:0]    current_count,
            
            input   wire    [ISSUE_WIDTH-1:0]       s_issue_size,
            input   wire                            s_issue_valid,
            
            input   wire    [COMPLETE_WIDTH-1:0]    s_complete_size,
            input   wire                            s_complete_valid
        );
    
    
    reg                             reg_busy,    next_busy;
    reg     [CAPACITY_WIDTH-1:0]    reg_counter, next_counter;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_busy    <= 1'b0;
            reg_counter <= {CAPACITY_WIDTH{1'b0}};
        end
        else if ( cke ) begin
            reg_busy    <= next_busy;
            reg_counter <= next_counter;
        end
    end
    
    always @* begin
        next_busy    = reg_busy;
        next_counter = reg_counter;
        
        if ( s_issue_valid ) begin
            next_counter = next_counter + s_issue_size + ISSUE_SIZE_OFFSET;
        end
        if ( s_complete_valid ) begin
            next_counter = next_counter - s_complete_size - COMPLETE_SIZE_OFFSET;
        end
        
        if ( enable ) begin
            next_busy = 1'b1;
        end
        else begin
            next_busy = FAST_BUSY ? (next_counter != 0) : (reg_counter != 0);
        end
    end
    
    assign current_count = reg_counter;
    
    assign busy          = reg_busy;
    
endmodule


`default_nettype wire


// end of file
