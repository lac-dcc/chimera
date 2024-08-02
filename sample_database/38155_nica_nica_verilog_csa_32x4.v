// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

module csa_32x4(
                input wire [31:0]  in1,
                input wire [31:0]  in2,
                input wire [31:0]  in3,
                input wire [31:0]  in4,
                output wire [31:0] sum,
                output wire [31:0] carry
                );

  wire [31:0] 			   sum1;
  wire [31:0] 			   carry1;
  
csa_32x3 csa_32x3_1(
		    .in1(in1),
		    .in2(in2),
		    .in3(in3),
		    .sum(sum1),
		    .carry(carry1)
		    );

csa_32x3 csa_32x3_2(
		    .in1(in4),
		    .in2(sum1),
		    .in3({carry1[30:0], 1'b0}),
		    .sum(sum),
		    .carry(carry)
		    );

endmodule // csa_32x4
  
