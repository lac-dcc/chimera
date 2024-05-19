// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

module csa_32x3(
                input wire [31:0]  in1,
                input wire [31:0]  in2,
                input wire [31:0]  in3,
                output wire [31:0] sum,
                output wire [31:0] carry
                );

  assign sum = in1 ^ in2 ^ in3;
  assign carry = in1 & in2 | in1 & in3 | in2 & in3;

endmodule // csa_32x3
  
