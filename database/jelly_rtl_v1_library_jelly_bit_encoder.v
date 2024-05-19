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



// bit encoder
module jelly_bit_encoder
        #(
            parameter   DATA_WIDTH = 8,
            parameter   SEL_WIDTH  = DATA_WIDTH <     2 ?  1 :
                                     DATA_WIDTH <     4 ?  2 :
                                     DATA_WIDTH <     8 ?  3 :
                                     DATA_WIDTH <    16 ?  4 :
                                     DATA_WIDTH <    32 ?  5 :
                                     DATA_WIDTH <    64 ?  6 :
                                     DATA_WIDTH <   128 ?  7 :
                                     DATA_WIDTH <   256 ?  8 :
                                     DATA_WIDTH <   512 ?  9 :
                                     DATA_WIDTH <  1024 ? 10 :
                                     DATA_WIDTH <  2048 ? 11 :
                                     DATA_WIDTH <  4096 ? 12 :
                                     DATA_WIDTH <  8192 ? 13 :
                                     DATA_WIDTH < 16384 ? 14 :
                                     DATA_WIDTH < 32768 ? 15 : 16,
            parameter   PRIORITYT  = 0,
            parameter   LSB_FIRST  = 0
        )
        (
            input   wire    [DATA_WIDTH-1:0]    in_data,
            output  wire    [SEL_WIDTH-1:0]     out_sel
        );
    
    genvar  i, j;
    
    generate
    if ( PRIORITYT ) begin : blk_priority
        reg     [SEL_WIDTH-1:0]     sig_sel;
        integer                     k;
        always @* begin
            sig_sel = {SEL_WIDTH{1'bx}};
            if ( LSB_FIRST ) begin
                for ( k = DATA_WIDTH-1; k >= 0; k = k-1 ) begin
                    if ( in_data[k] ) begin
                        sig_sel = k;
                    end
                end
            end
            else begin
                for ( k = 0; k < DATA_WIDTH; k = k+1 ) begin
                    if ( in_data[k] ) begin
                        sig_sel = k;
                    end
                end
            end
        end
        assign out_sel = sig_sel;
    end
    else begin : blk_onehot
        // make mask
        wire    [SEL_WIDTH*DATA_WIDTH-1:0]  bit_mask;
        for ( i = 0; i < SEL_WIDTH; i = i+1 ) begin : loop_mask
            for ( j = 0; j < DATA_WIDTH; j = j+1 ) begin : loop_bit
                assign bit_mask[i*DATA_WIDTH + j] = ((j & (1 << i)) != 0);
            end
        end
        
        // bit encode
        for ( i = 0; i < SEL_WIDTH; i = i+1 ) begin  : loop_sel
            assign out_sel[i] = |(in_data & bit_mask[i*DATA_WIDTH +: DATA_WIDTH]);
        end
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
