// This program was cloned from: https://github.com/namberino/vsap-1
// License: BSD 2-Clause "Simplified" License

module pc(
	input clk,
	input rst,
	input inc,

	output[7:0] out
);
	
	reg[3:0] pc;
	
	always @ (posedge clk, posedge rst)
	begin
		if (rst)
		begin
			pc <= 4'b0;
		end else if (inc)
		begin
			pc <= pc + 1;
		end
	end

	assign out = pc;

endmodule
