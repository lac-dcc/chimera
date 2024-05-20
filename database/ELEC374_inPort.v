// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module inPort #(parameter VAL = 0)(
	input wire clk, 
	input wire clr,
	input wire [31:0] inputUnit,
	output reg [31:0] busMuxInPort
);
	always@(posedge clk or negedge clr)
		begin
			if(clr == 0)
				busMuxInPort <= 0;
			else
				busMuxInPort <= inputUnit;
		end
		initial busMuxInPort = VAL;
endmodule