// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module IncPCModule(

	input Clock, IncPC, Enable,
	input [31:0] wirePC,
	output reg [31:0] regPC
);
	
	always@(posedge Clock)
		begin
			if(IncPC && Enable) 
				regPC <= regPC + 1;
			else if (Enable)
				regPC = wirePC;
		end
			
endmodule 