// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


//   Graycode to Binary 
module jelly_graycode_to_binary
        #(
            parameter                       WIDTH = 4
        )
        (
            input   wire    [WIDTH-1:0]     graycode,
            output  reg     [WIDTH-1:0]     binary
        );
    
    integer i;
    always @* begin
        binary[WIDTH-1] = graycode[WIDTH-1];
        for ( i = WIDTH - 2; i >= 0; i = i - 1 ) begin
            binary[i] = binary[i+1] ^ graycode[i];
        end
    end
    
endmodule


`default_nettype wire


// end of file
