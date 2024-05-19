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



// Delay
module jelly_data_delay
        #(
            parameter                               LATENCY    = 1,
            parameter                               DATA_WIDTH = 8,
            parameter           [DATA_WIDTH-1:0]    DATA_INIT  = {DATA_WIDTH{1'bx}}
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [DATA_WIDTH-1:0]    in_data,
            
            output  wire    [DATA_WIDTH-1:0]    out_data
        );
    
    integer     i;
    
    generate
    if ( LATENCY == 0 ) begin
        assign out_data = in_data;
    end
    else begin
        reg     [LATENCY*DATA_WIDTH-1:0]    reg_data;
        always @(posedge clk) begin
            if ( reset ) begin
                for ( i = 0; i < LATENCY; i = i+1 ) begin
                    reg_data[i*DATA_WIDTH +: DATA_WIDTH] <= DATA_INIT;
                end
            end
            else if ( cke ) begin
                reg_data[0 +: DATA_WIDTH] <= in_data;
                for ( i = 0; i < LATENCY-1; i = i+1 ) begin
                    reg_data[(i+1)*DATA_WIDTH +: DATA_WIDTH] <= reg_data[i*DATA_WIDTH +: DATA_WIDTH];
                end
            end
        end
        assign out_data = reg_data[(LATENCY-1)*DATA_WIDTH +: DATA_WIDTH];
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
