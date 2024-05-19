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


// データの線形拡張(要はbitを繰り返す)
module jelly_data_linear_expand
        #(
            parameter   NUM            = 1,
            parameter   IN_DATA_WIDTH  = 8,
            parameter   OUT_DATA_WIDTH = 12
        )
        (
            input   wire    [NUM*IN_DATA_WIDTH-1:0]     din,
            output  wire    [NUM*OUT_DATA_WIDTH-1:0]    dout
        );
    
    genvar      i;
    
    generate
    for ( i = 0; i < NUM; i = i+1 ) begin : loop_unit
        jelly_data_linear_expand_unit
                #(
                    .IN_DATA_WIDTH      (IN_DATA_WIDTH),
                    .OUT_DATA_WIDTH     (OUT_DATA_WIDTH)
                )
            i_data_linear_expand_unit
                (
                    .din                (din [i*IN_DATA_WIDTH  +: IN_DATA_WIDTH]),
                    .dout               (dout[i*OUT_DATA_WIDTH +: OUT_DATA_WIDTH])
                );
    end
    endgenerate
    
endmodule


module jelly_data_linear_expand_unit
        #(
            parameter   IN_DATA_WIDTH  = 8,
            parameter   OUT_DATA_WIDTH = 12
        )
        (
            input   wire    [IN_DATA_WIDTH-1:0]     din,
            output  wire    [OUT_DATA_WIDTH-1:0]    dout
        );

    genvar      i;
    generate
    for ( i = 0; i < OUT_DATA_WIDTH; i = i+1 ) begin : loop_bit
        assign dout[OUT_DATA_WIDTH-1 - i] = din[IN_DATA_WIDTH-1 - (i % IN_DATA_WIDTH)];
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
