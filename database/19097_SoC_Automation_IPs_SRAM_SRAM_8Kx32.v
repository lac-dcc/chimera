// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

module SRAM_8Kx32 (
		output [31:0] Q,
		input [31:0] D,
		input [14:0] A,
		input clk,
		input cen,
		input [3:0] wen
	);
	reg [31:0] RAM[4*1024-1:0];
	reg [31:0] DATA;
	wire [31:0] data = RAM[A];	
	assign Q = DATA;
	always @ (posedge clk) DATA <= data;
	always @(posedge clk) 
		if(cen) begin
			if(wen[0]) RAM[A] <= {data[32:8],D[7:0]};
			if(wen[1]) RAM[A] <= {data[32:16],D[15:8],data[7:0]};
			if(wen[2]) RAM[A] <= {data[32:24],D[23:16],data[15:0]};
			if(wen[3]) RAM[A] <= {D[31:24],data[23:0]};
			RAM[A] <= D;
		end
endmodule