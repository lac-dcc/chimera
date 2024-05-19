// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module transmission_gate_cell(inout A, inout B, input C, input Cnot);
  // Use the verilog primitive where available, in which case c_not is not
  // used.
  tranif1(A, B, C);
endmodule
