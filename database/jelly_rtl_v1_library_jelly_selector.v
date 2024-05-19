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



// selecter
module jelly_selector
        #(
            parameter   SEL_WIDTH = 2,
            parameter   OUT_WIDTH = 8,
            parameter   IN_WIDTH  = (OUT_WIDTH * SEL_WIDTH)
        )
        (
            input   wire    [SEL_WIDTH-1:0]     sel,
            input   wire    [IN_WIDTH-1:0]      din,
            output  reg     [OUT_WIDTH-1:0]     dout
        );
    
    integer i;
    integer j;
    always @* begin
        dout = {OUT_WIDTH{1'b0}};
        for ( i = 0; i < SEL_WIDTH; i = i + 1 ) begin
            if ( sel[i] ) begin
                for ( j = 0; j < OUT_WIDTH; j = j + 1 ) begin
                    dout[j] = dout[j] | din[OUT_WIDTH*i + j];
                end
            end
        end
    end
    
endmodule


`default_nettype wire


// end of file
