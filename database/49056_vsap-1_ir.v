// This program was cloned from: https://github.com/namberino/vsap-1
// License: BSD 2-Clause "Simplified" License

// intruction register (seperate opcode from data)
// the upper 4 bits are the opcode, lower 4 bits are the operand
module ir(
	input clk, 
	input rst,
	input load,
	input[7:0] bus,

	output[7:0] out
);

	reg[7:0] ir;

	always @ (posedge clk, posedge rst)
	begin
		if (rst)
		begin
			ir <= 8'b0;
		end else if (load)
		begin
			ir <= bus;
		end
	end

	assign out = ir;

endmodule
