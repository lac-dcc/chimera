// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = state[0]&(~in)|state[2]&(~in);
    assign next_state[B] = state[0]&in|state[1]&in|state[3]&in;
    assign next_state[C] = state[1]&(~in)|state[3]&(~in);
    assign next_state[D] = state[2]&(in);

    // Output logic: 
    assign out = (state[3] == 1);

endmodule

