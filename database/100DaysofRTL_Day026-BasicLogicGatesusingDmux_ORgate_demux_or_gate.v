// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module demux_1_2(
    input sel,
    input i,
    output y0, y1
    );    
    assign {y0,y1} = sel?{1'b0,i}: {i,1'b0};
endmodule

module demux_or_gate(
    input a, b,
    output or_g
    );
        wire w0, w1, w2;
        
    demux_1_2 gate(b, ~a, w0, w1);
    demux_1_2 not_t(w0, 1'b1, or_g, w2);
endmodule
