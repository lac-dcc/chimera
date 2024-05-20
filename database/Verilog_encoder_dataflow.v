// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 4X2 ENCODER DATAFLOW
************************************************/

module encode_4_2_df(Y,V,I);

	input [3:0]I;
	output [1:0]Y;
	output V;

	assign Y={I[3]|I[2], I[3]|I[1]};
	assign V=|I;

endmodule