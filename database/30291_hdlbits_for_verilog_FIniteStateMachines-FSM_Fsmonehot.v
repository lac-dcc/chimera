// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);
    parameter A=0,
    		  B=1,
    		  C=2,
    		  D=3,
    		  E=4,
    		  F=5,
    		  G=6,
    		  H=7,
    		  I=8,
    		  J=9;
    assign next_state[A] = ~in & (state[A]|state[B]|state[C]|state[D]|state[E]|state[H]|state[I]|state[J]);
    assign next_state[B] = in & (state[A]|state[I]|state[J]);
    assign next_state[C] = in & state[B];
    assign next_state[D] = in & state[C];
    assign next_state[E] = in & state[D];
    assign next_state[F] = in & state[E];
    assign next_state[G] = in & state[F];
    assign next_state[H] = in & (state[G]|state[H]);
    assign next_state[I] = ~in & state[F];
    assign next_state[J] = ~in & state[G];
    
    assign out1 = state[I]|state[J];
    assign out2 = state[H]|state[J];

endmodule
