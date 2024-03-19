// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// reverse
module jelly_reverse
        #(
            parameter   WIDTH = 8
        )
        (
            input   wire                    reverse,
            
            input   wire    [WIDTH-1:0]     din,
            output  wire    [WIDTH-1:0]     dout
        );
    
    reg     [WIDTH-1:0]     rev_data;
    
    integer i;
    always @* begin
        rev_data = {WIDTH{1'b0}};
        for ( i = 0; i < WIDTH; i = i + 1 ) begin
            rev_data[i] = din[WIDTH-1-i];
        end
    end
    
    assign dout = reverse ? rev_data : din;
    
endmodule


`default_nettype wire


// end of file
