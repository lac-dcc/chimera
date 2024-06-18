// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module dfa_two_last_bits_are_01(input clk, input reset, input input_sequence, output condition_met);
   parameter S0 = 3'b001, S1 = 3'b010, S2 = 3'b100;

   reg [2:0] state = S0;
   reg [2:0] next_state;
   always @(negedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= next_state;

   always @(*)
     case (state)
       S0: if (input_sequence) next_state <= S0;
           else                next_state <= S1;
       S1: if (input_sequence) next_state <= S2;
           else                next_state <= S1;
       S2: if (input_sequence) next_state <= S0;
           else                next_state <= S1;

       // Just to prevent latch generation
       default:                next_state <= S0;
     endcase

   assign condition_met = state == S2;
endmodule
