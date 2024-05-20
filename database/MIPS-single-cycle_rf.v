// This program was cloned from: https://github.com/the-pinbo/MIPS-single-cycle
// License: MIT License

module rf(
	input clk,
	input RegWrite,
	input[4:0] ra, //read register 1 (instr 25-21)
	input[4:0] rb, //read register 2 (instr 20-16)
	input[4:0] rc, //write register (out mux instr)
	input[31:0] dc, //write data (out mux data)
	output[31:0] da, //read data 1
	output[31:0] db //read data 2
);

	reg[31:0] memory[31:0]; //32 32-bit registers

	assign da = (ra!=0)?memory[ra]:0;
	assign db = (rb!=0)?memory[rb]:0;

	always@(posedge clk) begin
		if(RegWrite==1'b1) begin
			memory[rc] <= dc;
		end
	end
endmodule
