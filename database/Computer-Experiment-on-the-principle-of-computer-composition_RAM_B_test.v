`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:08:44 06/16/2018
// Design Name:   RAM_B
// Module Name:   D:/FPGA/RAM_B/test.v
// Project Name:  RAM_B
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RAM_B
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg clka;
	reg [0:0] wea;
	reg [5:0] addra;
	reg [31:0] dina;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	RAM_B uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		wea = 0;
		addra = 0;
		dina = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		clka = 1;
		wea = 0;
		addra = 6'b000001;
		dina = 32'h0000_0003;
		
		#100;
		clka = 0;
		wea = 0;
		addra = 6'b000001;
		dina = 32'h0000_0607;
		
		#100;
		clka = 1;
		wea = 1;
		addra = 6'b000001;
		dina = 32'hFFFF_FFFF;
		
		#100;
		clka = 0;
		wea = 1;
		addra = 6'b000001;
		dina = 32'hFFFF_FFFF;


	end
      
endmodule

