// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

module openstriVe_soc_mem #(
	parameter integer WORDS = 4096*2
) (
	input clk,
	input ena,
	input [3:0] wen,
	input [21:0] addr,
	input [31:0] wdata,
	output reg [31:0] rdata
);
	reg [31:0] mem [0:WORDS-1];
	always @(posedge clk) begin
		if (ena == 1'b1) begin
			rdata <= mem[addr];
			if (wen[0]) mem[addr][ 7: 0] <= wdata[ 7: 0];
			if (wen[1]) mem[addr][15: 8] <= wdata[15: 8];
			if (wen[2]) mem[addr][23:16] <= wdata[23:16];
			if (wen[3]) mem[addr][31:24] <= wdata[31:24];
		end
	end
endmodule