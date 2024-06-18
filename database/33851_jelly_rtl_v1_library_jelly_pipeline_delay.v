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



// pipeline delay
module jelly_pipeline_delay
        #(
            parameter   PIPELINE_STAGES = 2,
            parameter   DATA_WIDTH      = 8,
            parameter   INIT_DATA       = {DATA_WIDTH{1'bx}}
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire    [PIPELINE_STAGES-1:0]   stage_cke,
            
            input   wire    [DATA_WIDTH-1:0]        in_data,
            
            output  wire    [DATA_WIDTH-1:0]        out_data
        );
    
    
    generate
    if ( PIPELINE_STAGES > 0 ) begin
        integer                                     i;
        reg     [PIPELINE_STAGES*DATA_WIDTH-1:0]    reg_data;
        always @(posedge clk) begin
            if ( reset ) begin
                for ( i = 0; i < PIPELINE_STAGES; i = i+1 ) begin
                    reg_data[i*DATA_WIDTH +: DATA_WIDTH] <= INIT_DATA;
                end
            end
            else begin
                for ( i = 0; i < PIPELINE_STAGES; i = i+1 ) begin
                    if ( stage_cke[i] ) begin
                        reg_data[i*DATA_WIDTH +: DATA_WIDTH] <= (i == 0 ) ? in_data : reg_data[(i-1)*DATA_WIDTH +: DATA_WIDTH];
                    end
                end
            end
        end
        assign out_data = reg_data[(PIPELINE_STAGES-1)*DATA_WIDTH +: DATA_WIDTH];
    end
    else begin
        assign out_data = in_data;
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
