module accarray(
	clk,
	ena,
	clr,
	accumulate,
	feature,
	value,
	result
);

parameter WL=32;
parameter NUM=128;

input clk, ena, clr, accumulate;

input [WL - 1:0] value;
input [WL*NUM - 1:0] feature;

output wire [WL*NUM - 1:0] result;

genvar i;
generate
for (i = 0; i < NUM; i = i + 1) begin: accgen
	acc ins(
		.clk0(clk),
		.ena(ena),
		.clr0(clr),
		.result(result[(i+1)*WL -1:i*WL]),
		.accumulate(accumulate),
		.ay(value),
		.az(feature[(i+1)*WL -1:i*WL])
	);
end
endgenerate



endmodule