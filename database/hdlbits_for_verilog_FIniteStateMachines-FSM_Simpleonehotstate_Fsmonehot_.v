// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = (state[A] | state[C])&(~in);
    assign next_state[B] = (state[A] | state[B] | state[D])&(in);//~state[C]&in;//
    assign next_state[C] = (state[B] | state[D])&(~in);
    assign next_state[D] = state[C]&in;

    // Output logic: 
    assign out = state[D];

endmodule
