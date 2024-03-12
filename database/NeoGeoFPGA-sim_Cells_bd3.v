`timescale 1ns/1ns

module BD3(
	input INPT,
	output OUTPT
);

	assign #5 OUTPT = INPT;

endmodule
