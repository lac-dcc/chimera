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


// 16bit multiplexer (XILINX XAPP522)
module jelly_multiplexer16
        #(
            parameter   DEVICE = "RTL"
        )
        (
            output  wire            o,
            input   wire    [15:0]  i,
            input   wire    [3:0]   s
        );
    
    generate
    if ( DEVICE == "VIRTEX6" || DEVICE == "SPARTAN6" || DEVICE == "7SERIES" ) begin : blk_lut6
        
        wire    [3:0]   l;
        
        LUT6
                #(
                    .INIT(64'hFF00F0F0CCCCAAAA)
                )
            i_lut6_0
                (
                    .O      (l[0]),
                    
                    .I0     (i[0]),
                    .I1     (i[1]),
                    .I2     (i[2]),
                    .I3     (i[3]),
                    
                    .I4     (s[0]),
                    .I5     (s[1])
                );
        
        LUT6
                #(
                    .INIT(64'hFF00F0F0CCCCAAAA)
                )
            i_lut6_1
                (
                    .O      (l[1]),
                    
                    .I0     (i[4]),
                    .I1     (i[5]),
                    .I2     (i[6]),
                    .I3     (i[7]),
                    
                    .I4     (s[0]),
                    .I5     (s[1])
                );
        
        LUT6
                #(
                    .INIT(64'hFF00F0F0CCCCAAAA)
                )
            i_lut6_2
                (
                    .O      (l[2]),
                    
                    .I0     (i[8]),
                    .I1     (i[9]),
                    .I2     (i[10]),
                    .I3     (i[11]),
                    
                    .I4     (s[0]),
                    .I5     (s[1])
                );
        
        LUT6
                #(
                    .INIT(64'hFF00F0F0CCCCAAAA)
                )
            i_lut6_3
                (
                    .O      (l[3]),
                    
                    .I0     (i[12]),
                    .I1     (i[13]),
                    .I2     (i[14]),
                    .I3     (i[15]),
                    
                    .I4     (s[0]),
                    .I5     (s[1])
                );
        
        
        wire    [1:0]   m;
        
        MUXF7
            i_mux7_0
                (
                    .O      (m[0]),
                    
                    .I0     (l[0]),
                    .I1     (l[1]),
                    
                    .S      (s[2])
                );
        
        MUXF7
            i_mux7_1
                (
                    .O      (m[1]),
                    
                    .I0     (l[2]),
                    .I1     (l[3]),
                    
                    .S      (s[2])
                );
        
        
        MUXF8
            i_mux8
                (
                    .O      (o),
                    
                    .I0     (m[0]),
                    .I1     (m[1]),
                    
                    .S      (s[3])
                );
        
    end
    else  begin : blk_rtl
        assign o = i[s];
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
