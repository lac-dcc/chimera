// This program was cloned from: https://github.com/rj45/rj32
// License: MIT License

module pll(
	input  clock_in,
	output clock_out,
	output locked
	);

  assign locked = 1'b1;
  assign clock_out = clock_in;

endmodule
