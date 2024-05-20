// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

// MDR 2-1 Mux and MDR Data Register


module MDR(
	input wire clk,			// Synchronous clock input
	input wire Clear,			// Clear signal 
	 
	input wire[31:0] BusMuxOut, 
	input wire[31:0] MDataIn,
	input wire MDRead,
	input wire MDRIn,        // Control signal to enable MDR update 

	output reg[31:0] Q
);
reg[31:0] InputD;
// Mux Logic
//always @(BusMuxOut, MDataIn, MDRead) begin
//	InputD = MDRead ? MDataIn : BusMuxOut;
//end

// Register Update
always @(posedge clk) begin 
InputD = MDRead ? MDataIn : BusMuxOut;
	if (Clear)
		Q <= 31'b0; 	//Clear Q to all zeros 
	else if (MDRIn)
		Q <= InputD;
end

endmodule  
