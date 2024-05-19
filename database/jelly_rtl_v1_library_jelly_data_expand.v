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


// データ幅拡張
module jelly_data_expand
        #(
            parameter   NUM            = 1,
            parameter   IN_DATA_WIDTH  = 8,
            parameter   OUT_DATA_WIDTH = 12,
            parameter   DATA_SIGNED    = 1,
            parameter   OFFSET         = 0,
            parameter   RSHIFT         = 0,
            parameter   LSHIFT         = 0
        )
        (
            input   wire    [NUM*IN_DATA_WIDTH-1:0]     din,
            output  wire    [NUM*OUT_DATA_WIDTH-1:0]    dout
        );
    
    genvar      i;
    
    generate
    if ( DATA_SIGNED ) begin : blk_signed
        for ( i = 0; i < NUM; i = i+1 ) begin : loop_unit
            wire    signed  [IN_DATA_WIDTH-1:0]     in_data;
            wire    signed  [OUT_DATA_WIDTH-1:0]    out_data;
            assign in_data  = din[i*IN_DATA_WIDTH +: IN_DATA_WIDTH];
            assign out_data = (((in_data + OFFSET) >>> RSHIFT) <<< LSHIFT);
            assign dout[i*OUT_DATA_WIDTH +: OUT_DATA_WIDTH] = out_data;
        end
    end
    else begin : blk_unsigned
        for ( i = 0; i < NUM; i = i+1 ) begin : loop_unit
            wire            [IN_DATA_WIDTH-1:0]     in_data;
            wire            [OUT_DATA_WIDTH-1:0]    out_data;
            assign in_data  = din[i*IN_DATA_WIDTH +: IN_DATA_WIDTH];
            assign out_data = (((in_data + OFFSET) >> RSHIFT) << LSHIFT);
            assign dout[i*OUT_DATA_WIDTH +: OUT_DATA_WIDTH] = out_data;
        end
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
