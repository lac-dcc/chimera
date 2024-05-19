// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module switch_box_element_two
  (
   inout [1:0] north, east, south, west,
   input [11:0] c
   );

   transmission_gate n0e0(east[0], north[0], c[0]);
   transmission_gate e1s0(south[0], east[1], c[1]);
   transmission_gate s1w1(west[1], south[1], c[2]);
   transmission_gate w0n1(north[1], west[0], c[3]);
   
   transmission_gate n0s0(south[0], north[0], c[4]);
   transmission_gate e1w1(west[1], east[1], c[5]);
   transmission_gate s1n1(north[1], south[1], c[6]);
   transmission_gate w0e0(east[0], west[0], c[7]);
   
   transmission_gate n1e1(east[1], north[1], c[8]);
   transmission_gate e0s1(south[1], east[0], c[9]);
   transmission_gate s0w0(west[0], south[0], c[10]);
   transmission_gate w1n0(north[0], west[1], c[11]);
   
endmodule
