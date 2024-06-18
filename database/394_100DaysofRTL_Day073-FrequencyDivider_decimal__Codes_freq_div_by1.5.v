// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module freq_div(
    input clk, reset,
    output new_clk
    );
    wire t1, t2;
    
    freq_div_by3 FD3(clk, reset, t1);
    
    dual_edge_trig_ff DETF(clk, reset, t1, t2);
    
    xor(new_clk, t1, t2);
endmodule
