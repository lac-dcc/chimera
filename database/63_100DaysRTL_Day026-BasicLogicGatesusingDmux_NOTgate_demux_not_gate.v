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

module demux_not_gate(
    input a,
    output not_g
    );
        wire w;

    demux_1_2 notgate(a, 1'b1, not_g, w);
endmodule

