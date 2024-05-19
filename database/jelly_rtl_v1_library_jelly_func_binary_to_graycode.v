// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps



// Binary to Graycode
module jelly_func_binary_to_graycode
        #(
            parameter                       WIDTH = 4
        )
        (
            input   wire    [WIDTH-1:0]     binary,
            output  reg     [WIDTH-1:0]     graycode
        );
    
    integer i;
    always @* begin
        graycode[WIDTH-1] = binary[WIDTH-1];
        for ( i = WIDTH - 2; i >= 0; i = i-1 ) begin
            graycode[i] = binary[i+1] ^ binary[i];
        end
    end
    
endmodule


// End of file
