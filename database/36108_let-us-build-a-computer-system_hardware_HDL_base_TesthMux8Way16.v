// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:39:35 08/04/2023
// Design Name:   hMux8Way16
// Module Name:   /home/ise/HDL/base/TesthMux8Way16.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hMux8Way16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthMux8Way16;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg [15:0] c;
	reg [15:0] d;
	reg [15:0] e;
	reg [15:0] f;
	reg [15:0] g;
	reg [15:0] h;
	reg [2:0] sel;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	hMux8Way16 uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.h(h), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 16'b01;
		c = 16'b10;
		d = 16'b11;
		e = 16'b100;
		f = 16'b101;
		g = 16'b110;
		h = 16'b111;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		sel = 3'b000;
		
		#10;
		
		sel = 3'b001;
		
		#10;
		
		sel = 3'b010;
		
		#10;
		
		sel = 3'b011;
		
		#10;
		
		sel = 3'b100;
		
		#10;
		
		sel = 3'b101;
		
		#10;
		
		sel = 3'b110;
		
		#10;
		
		sel = 3'b111;
		
		#10;
	end
      
endmodule

