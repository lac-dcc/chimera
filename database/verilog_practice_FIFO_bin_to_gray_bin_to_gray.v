// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module bin_to_gray #(
	parameter SIZE = 4
	)(
	input wire [SIZE-1 : 0] bin ,

	output wire [SIZE-1 : 0] gray
);

	assign gray = (bin >> 1) ^ bin ;

endmodule