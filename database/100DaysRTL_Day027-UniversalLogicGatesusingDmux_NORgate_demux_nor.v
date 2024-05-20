// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module demux_1_2(
    input sel,
    input i,
    output y0, y1
    );    
    assign {y0,y1} = sel?{1'b0,i}: {i,1'b0};
endmodule

module demux_nor(
    input a, b,
    output nor_g
    );
        wire w;
        
    demux_1_2 norgate(b, ~a, nor_g, w);
endmodule
