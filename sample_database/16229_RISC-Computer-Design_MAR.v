// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

module MAR(
	input wire clk,			
	input wire Clear,			
	input wire MARIn,// Control signal to enable MAR  
	
	input wire[31:0] BusMuxOut, 
	  

	output reg[8:0] AddressOut
);

always @(posedge clk) begin 
	if (Clear==1)
		AddressOut <= 8'b0; 	
	else if (MARIn==1)
		AddressOut <= BusMuxOut[8:0]; // Assign lower 9 bits of BusMuxOut to Address when MARIn is asserted (Not sure if this is correct)
end

endmodule  
