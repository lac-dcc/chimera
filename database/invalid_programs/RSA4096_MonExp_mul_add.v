// (multiplication, addition) component for MonPro
`include "_parameter.v"

module mul_add
(
	input clk,
	input [`DATA_WIDTH - 1 : 0] x,
	input [`DATA_WIDTH - 1 : 0] y,
	input [`DATA_WIDTH - 1 : 0] z,
	input [`DATA_WIDTH - 1 : 0] last_c,
	output [`DATA_WIDTH - 1 : 0] s,	// lower output
	output [`DATA_WIDTH - 1 : 0] c	// higher output
);

	// Declare input and output registers
	wire [2 * `DATA_WIDTH-1 : 0] mult_out;
	assign mult_out = x * y + z + last_c;
	assign s = mult_out[`DATA_WIDTH - 1 : 0];
	assign c = mult_out[2 * `DATA_WIDTH-1 : `DATA_WIDTH];

endmodule
