// This program was cloned from: https://github.com/namberino/vsap-1
// License: BSD 2-Clause "Simplified" License

// there's a 4-bit register called the Memory Address Register (MAR) (used to store a memory address)
// this computer takes 2 clock cycles to read from memory: 
// - 1st cycle loads an address from the bus into the MAR (using the load signal)
// - 2nd cycle uses the value in the MAR to address into ram and output that value onto the bus
module memory(
	input clk,
	input rst,
	input load,
	input[7:0] bus,

	output[7:0] out
);

	// setting memory
	initial begin
		$readmemh("program.bin", ram);
	end

	reg[3:0] mar;
	reg[7:0] ram[0:15];		// 16 8-bit wide elements

	always @ (posedge clk, posedge rst)
	begin
		if (rst)
		begin
			mar <= 4'b0;
		end else if (load)
		begin
			mar <= bus[3:0];
		end
	end

	assign out = ram[mar];

endmodule
