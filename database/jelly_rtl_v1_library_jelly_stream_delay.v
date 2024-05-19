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



// delay
module jelly_stream_delay
        #(
            parameter   LATENCY    = 1,
            parameter   DATA_WIDTH = 8,
            parameter   DATA_INIT  = {DATA_WIDTH{1'bx}}
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    integer     i;
    
    generate
    if ( LATENCY == 0 ) begin : blk_bypass
        assign m_data  = s_data;
        assign m_valid = s_valid;
        assign s_ready = m_ready;
    end
    else begin : blk_delay
        reg     [LATENCY*DATA_WIDTH-1:0]    reg_data;
        reg     [LATENCY-1:0]               reg_valid;
        always @(posedge clk) begin
            if ( reset ) begin
                for ( i = 0; i < LATENCY; i = i+1 ) begin
                    reg_data[i*DATA_WIDTH +: DATA_WIDTH] <= DATA_INIT;
                    reg_valid[i] <= 1'b0;
                end
            end
            else if ( cke && s_ready ) begin
                reg_data[0 +: DATA_WIDTH] <= s_data;
                reg_valid[0]              <= s_valid;
                for ( i = 0; i < LATENCY-1; i = i+1 ) begin
                    reg_data[(i+1)*DATA_WIDTH +: DATA_WIDTH] <= reg_data[i*DATA_WIDTH +: DATA_WIDTH];
                    reg_valid[i+1] <= reg_valid[i];
                end
            end
        end
        assign m_data  = reg_data[(LATENCY-1)*DATA_WIDTH +: DATA_WIDTH];
        assign m_valid = reg_valid[LATENCY-1];
    end
    endgenerate
    
    assign s_ready = (!m_valid || m_ready);
    
endmodule


`default_nettype wire


// end of file
