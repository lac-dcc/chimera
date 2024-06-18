// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps



// Binary to Graycode
module jelly_binary_to_graycode
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
    
    /*
    function [WIDTH-1:0] gray_out;
    input   [WIDTH-1:0] bin_in;
    integer i;
        begin
            gray_out[WIDTH-1] = bin_in[WIDTH-1];
            for ( i = WIDTH-2; i >= 0; i = i-1 ) begin
                gray_out[i] = bin_in[i+1] ^ bin_in[i];
            end
        end
    endfunction
    
    assign graycode = gray_out(binary);
    */
    
endmodule


// End of file
