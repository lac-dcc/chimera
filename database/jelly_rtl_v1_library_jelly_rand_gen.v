// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// random generator
module jelly_rand_gen
        (
            input   wire            reset,
            input   wire            clk,
            input   wire            cke,
            
            input   wire    [15:0]  seed,
            output  wire            out
        );
    
    reg     [15:0]  lfsr;
    
    always @(posedge clk) begin
        if ( reset ) begin
            lfsr <= seed;
        end
        else if ( cke ) begin
            lfsr[15:1] <= lfsr[14:0];
            lfsr[0]    <= lfsr[15] ^ lfsr[13] ^ lfsr[12] ^ lfsr[10];
        end
    end
    
    assign out = lfsr[0];
    
endmodule


`default_nettype wire


// end of file
