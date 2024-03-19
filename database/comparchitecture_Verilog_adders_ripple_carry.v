module ripple_carry
(
    input [15:0] in1, in2,
    output [15:0] out,
    output overflow
);

	wire [14:0] carry;

	half_adder ha(in1[0], in2[0], out[0], carry[0]);

	for (genvar i = 1; i <= 14; i = i+1)
		full_adder fa(in1[i], in2[i], carry[i-1], out[i], carry[i]);

	full_adder fa(in1[15], in2[15], carry[14], out[15], overflow);

endmodule
