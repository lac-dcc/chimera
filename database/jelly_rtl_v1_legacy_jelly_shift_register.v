// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// SRLC32E 想定
module jelly_shift_register
        #(
            parameter   SEL_WIDTH = 5,
            parameter   NUM       = (1 << SEL_WIDTH)
        )
        (
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [SEL_WIDTH-1:0]     sel,
            input   wire                        in_data,
            output  wire                        out_data
        );
    
    reg     [NUM-1:0]   reg_shift;
    
    always @(posedge clk) begin
        if ( cke ) begin
            reg_shift <= {reg_shift, in_data};
        end
    end
    
    assign out_data = reg_shift[sel];
    
endmodule


`default_nettype wire


// end of file
