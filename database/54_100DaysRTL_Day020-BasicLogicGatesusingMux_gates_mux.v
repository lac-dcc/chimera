// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module mux_2_1(
    input [1:0] i,
    input select,
    output y_out    
    );
    assign y_out= select ? i[1] : i[0];
endmodule


module gates_mux(
    input a,b,
    output and_out,
    output or_out,
    output not_out
    );

    mux_2_1 mand({b, 1'b0}, a, and_out);

    mux_2_1 mor({1'b1, b}, a, or_out);

    mux_2_1 mnot({1'b0, 1'b1}, a, not_out);    
    
endmodule
