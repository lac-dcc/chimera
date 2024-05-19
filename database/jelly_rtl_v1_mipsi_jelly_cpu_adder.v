// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//    MIPS like CPU core
//
//                                  Copyright (C) 2008-2010 by Ryuz
//                                  https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale       1ns / 1ps
`default_nettype none



// adder
module jelly_cpu_adder
        #(
            parameter                           DATA_WIDTH = 32
        )
        (
            input   wire    [DATA_WIDTH-1:0]    in_data0,
            input   wire    [DATA_WIDTH-1:0]    in_data1,
            input   wire                        in_carry,
            
            output  wire    [DATA_WIDTH-1:0]    out_data,
            
            output  wire                        out_carry,
            output  wire                        out_overflow,
            output  wire                        out_negative,
            output  wire                        out_zero
        );
    
    // add
    wire                        msb_carry;
    assign {msb_carry, out_data[DATA_WIDTH-2:0]} = in_data0[DATA_WIDTH-2:0] + in_data1[DATA_WIDTH-2:0] + in_carry;
    
    // add MSB
    assign {out_carry, out_data[DATA_WIDTH-1]} = in_data0[DATA_WIDTH-1] + in_data1[DATA_WIDTH-1] + msb_carry;
    
    // overflow
    assign out_overflow = (msb_carry != out_carry);
    
    // negative
    assign out_negative = out_data[DATA_WIDTH-1];
    
    // zero
    assign out_zero = (out_data == {DATA_WIDTH{1'b0}});
    
endmodule



`default_nettype wire


// end of file
