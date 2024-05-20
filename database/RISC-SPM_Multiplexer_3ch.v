// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License


module Multiplexer_3ch #(
    parameter word_size = 8
) (
    //mux_out := Bus_2
    output [word_size-1: 0] mux_out,
    // data_a := alu_out
    input [word_size-1: 0] data_a, 
    // data_b := Bus_1
    input [word_size-1: 0] data_b, 
    // data_c := mem_word
    input [word_size-1: 0] data_c,
    // sel := Sel_Bus_2_Mux
    input [1: 0] sel
);
    assign mux_out = (sel == 0) ? data_a: 
        (sel == 1) ? data_b : 
        (sel == 2) ? data_c:
        'bx;
endmodule