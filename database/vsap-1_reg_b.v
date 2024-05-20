// This program was cloned from: https://github.com/namberino/vsap-1
// License: BSD 2-Clause "Simplified" License

// supporting register
module reg_b(
	input clk,
	input rst,
	input load,
	input[7:0] bus,

	output[7:0] out
);

	reg[7:0] reg_b;

	always @ (posedge clk, posedge rst)
	begin
		if (rst)
		begin
			reg_b <= 8'b0;
		end else if (load)
		begin
			reg_b <= bus;
		end
	end

	assign out = reg_b;

endmodule
