module ripple_carry
(
    input [31:0] in1, in2,
    output [31:0] out
);

	wire [31:0] carry;

	half_adder ha(in1[0], in2[0], out[0], carry[0]);

	for (genvar i = 1; i <= 31; i = i+1)
		full_adder fa(in1[i], in2[i], carry[i-1], out[i], carry[i]);

endmodule
