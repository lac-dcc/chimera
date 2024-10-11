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

module demux_xor_xnor(
    input a,b,
    output xor_g, xnor_g
    );
    wire [3:0] w;
    demux_1_2 demux1(b, ~a, w[0], w[1]);
    demux_1_2 demux2(b, a, w[2], w[3]);
    
    assign xor_g= w[1] | w[2];
    assign xnor_g= w[0] | w[3];
    
endmodule
