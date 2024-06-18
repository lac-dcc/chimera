// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module sync_reset(
	input 	clk,
	input 	reset_in, 
	output	reset_out
	);

	wire	reset_in;
	reg	reset_in_p1;
	reg	reset_in_p2;
	wire	reset_out;

	always @(posedge clk or posedge reset_in)
	begin
		if (reset_in) begin
			reset_in_p1 	<= 1'b1;
			reset_in_p2 	<= 1'b1;
		end
		else begin
			reset_in_p1 	<= reset_in;
			reset_in_p2 	<= reset_in_p1;
		end
	end

	assign reset_out = !reset_in_p2;

endmodule
