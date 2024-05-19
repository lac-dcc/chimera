// This program was cloned from: https://github.com/FPGADude/Digital-Design
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module mux2x1(
    input a, b,             // a = clk_1Hz, b = LED_five
    input [2:0] select,     // state
    output mux_out
    );
    
    assign mux_out = (select == 3'b001) ? a : b;
    
endmodule
