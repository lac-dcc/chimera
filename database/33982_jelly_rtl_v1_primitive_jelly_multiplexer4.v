// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// 4bit multiplexer (XILINX XAPP522)
module jelly_multiplexer4
        #(
            parameter   DEVICE = "RTL"
        )
        (
            output  wire            o,
            input   wire    [3:0]   i,
            input   wire    [1:0]   s
        );
    
    generate
    if ( DEVICE == "VIRTEX6" || DEVICE == "SPARTAN6" || DEVICE == "7SERIES" ) begin : blk_lut6
        LUT6
                #(
                    .INIT(64'hFF00F0F0CCCCAAAA)
                )
            i_lut6
                (
                    .O      (o),
                    .I0     (i[0]),
                    .I1     (i[1]),
                    .I2     (i[2]),
                    .I3     (i[3]),
                    .I4     (s[0]),
                    .I5     (s[1])
                );
    end
    else  begin : blk_rtl
        assign o = i[s];
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
