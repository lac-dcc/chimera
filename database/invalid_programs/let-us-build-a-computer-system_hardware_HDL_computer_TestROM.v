// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
`include "hCPU.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:02:52 09/07/2023
// Design Name:   test_rom
// Module Name:   /home/ise/HDL/computer/TestROM.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: test_rom
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestROM;
	localparam T = 10;

	// ROM Inputs
	reg clka;
	reg ena;

	// ROM Outputs
	wire [31:0] douta;
	
	// CPU Inputs
	reg [15:0] inM;
	reg reset;

	// CPU Outputs
	wire [15:0] outM;
	wire writeM;
	wire [15:0] addressM;
	wire [15:0] pc;

	// Instantiate the Unit Under Test (UUT)
	test_rom uut (
		.clka(clka), 
		.ena(ena), 
		.addra({14'b0, pc, 2'b0}), 
		.douta(douta)
	);

	// Instantiate the Unit Under Test (UUT)
	hCPU uut2 (
		.inM(inM), 
		.instruction(douta[15:0]), 
		.reset(reset), 
		.clock(clka), 
		.outM(outM), 
		.writeM(writeM), 
		.addressM(addressM), 
		.pc(pc)
	);
	
	always begin
		clka = 1'b0;
		#(T/2);
		
		clka = 1'b1;
		#(T/2);
	end
	
	reg [15:0] pc_temp;
	always @(posedge clka) begin
		pc_temp <= pc;
		$write("TestROM::pc_temp %d\n", pc);
	end

	initial begin
		// Initialize Inputs
		ena = 1;
		reset = 1;
		inM = 16'b0;
		
		#10;
		reset = 0;

		#1000;
	end
      
endmodule

