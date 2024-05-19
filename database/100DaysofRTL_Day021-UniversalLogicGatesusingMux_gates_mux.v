// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
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
    input a, b,
    output nand_out, nor_out
    );
    wire bbar;
    
    mux_2_1 mbbar({1'b0, 1'b1}, b, bbar);
    
    mux_2_1 mnand({bbar, 1'b1}, a, nand_out);
    mux_2_1 mnor({1'b0, bbar}, a, nor_out);
endmodule
