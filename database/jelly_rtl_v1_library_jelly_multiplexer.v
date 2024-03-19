// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// multiplexer
module jelly_multiplexer
        #(
            parameter   SEL_WIDTH = 2,
            parameter   NUM       = (1 << SEL_WIDTH),
            parameter   OUT_WIDTH = 8,
            parameter   IN_WIDTH  = (OUT_WIDTH * NUM),
            
            parameter   SEL_BITS  = SEL_WIDTH > 0 ? SEL_WIDTH : 1
        )
        (
            input   wire                        endian,
            input   wire    [SEL_BITS-1:0]      sel,
            input   wire    [IN_WIDTH-1:0]      din,
            output  wire    [OUT_WIDTH-1:0]     dout
        );
    
    // verilator lint_off WIDTH
    generate
    if ( SEL_WIDTH > 0 ) begin
        reg     [OUT_WIDTH-1:0]     sig_dout;
        
        integer i;
        integer j;
        always @* begin
            sig_dout = {OUT_WIDTH{1'b0}};
            for ( i = 0; i < NUM; i = i + 1 ) begin
                if ( i == (sel ^ {SEL_WIDTH{endian}}) ) begin
                    for ( j = 0; j < OUT_WIDTH; j = j + 1 ) begin
                        sig_dout[j] = din[OUT_WIDTH*i + j];
                    end
                end
            end
        end
        
        assign dout = sig_dout;
    end
    else begin
        assign dout = din;
    end
    endgenerate
    // verilator lint_on WIDTH
    
endmodule



`default_nettype wire


// end of file
