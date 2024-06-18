// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module transmission_gate_oneway(output a, input b, input c);
   assign a = c? b: 1'bz;
endmodule
