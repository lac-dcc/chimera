// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module Register_0 #(parameter VAL = 0)(
	input wire clk, 
	input wire clr,
	input wire [31:0] dIn,
	input wire Rin,
	output reg [31:0] qOut,
	input wire BAout
);


 	always@(posedge clk or negedge clr)
		begin
			if(clr == 0)
				qOut <= 0;
			else if(Rin && !BAout)
				qOut <= dIn;
			else 
				qOut = 0;
		end		
		initial qOut = VAL;
 
endmodule
