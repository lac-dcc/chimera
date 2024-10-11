// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module MAR (
	input wire clk, 
	input wire clr,
	input wire [31:0] dIn,
	input wire Rin,
	output reg [8:0] address
);
	always@(posedge clk or negedge clr)
		begin
			if(clr == 0)
				address <= 0;
			else if(Rin)
				address <= dIn[8:0];
		end		
endmodule