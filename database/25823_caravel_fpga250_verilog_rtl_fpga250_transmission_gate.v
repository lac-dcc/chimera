// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module transmission_gate(inout a, inout b, input c);
  transmission_gate_cell impl(.A(a), .B(b), .C(c), .Cnot(~c));
endmodule
