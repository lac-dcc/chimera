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

module demux_nand(
    input a, b,
    output nand_g
    );
    wire w0, w1, w2;
    
    demux_1_2 nandgate(b, a, w0, w1);
    demux_1_2 not_t(w1, 1'b1, nand_g, w2);
endmodule
