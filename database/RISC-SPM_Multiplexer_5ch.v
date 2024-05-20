// This program was cloned from: https://github.com/the-pinbo/RISC-SPM
// License: MIT License

module Multiplexer_5ch #(
    parameter word_size = 8
) (
    // mux_out := Bus_1
    output [word_size-1: 0] mux_out,
    // data_a := R0_out
    input [word_size-1: 0] data_a,
    // data_b := R1_out 
    input [word_size-1: 0] data_b,
    // data_c := R2_out 
    input [word_size-1: 0] data_c,
    // data_d := R3_out 
    input [word_size-1: 0] data_d,
    // data_e := Sel_Bus_1_Mux 
    input [word_size-1: 0] data_e,
    // data_b := R2_out
    input [2: 0] sel
);
      assign  mux_out = (sel == 0) 	? data_a: 
        (sel == 1) ? data_b :
        (sel == 2) ? data_c :
        (sel == 3)? data_d :
        (sel == 4)? data_e :
        'bx;
endmodule