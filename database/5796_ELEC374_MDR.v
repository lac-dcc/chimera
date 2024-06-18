// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module MDR (
	input wire clk, 
	input wire clr,
	input wire Read,
	input wire MDRin,
	input wire [31:0] BusMuxOut,
	input wire [31:0] Mdatain,
	output reg [31:0] MDROut
);
//busMuxOut is the input, busMuxIn is output, it is flipped POV the bus
//the memory reg is normal cus its POV mem register, 0 is for bus STUPHH, 1 is for that memorrry
	always@(posedge clk or negedge clr)
		begin
			if(clr == 0)
			MDROut<= 0;
			else if(MDRin)
				MDROut <= Read ? Mdatain : BusMuxOut;
		end		
endmodule