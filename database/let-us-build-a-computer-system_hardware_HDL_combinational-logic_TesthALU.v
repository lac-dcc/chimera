// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:15:27 08/09/2023
// Design Name:   hALU
// Module Name:   /home/ise/HDL/combinational-logic/TesthALU.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthALU;

	// Inputs
	reg [15:0] x;
	reg zx;
	reg nx;
	reg [15:0] y;
	reg zy;
	reg ny;
	reg f;
	reg no;

	// Outputs
	wire [15:0] out;
	wire zr;
	wire ng;

	// Instantiate the Unit Under Test (UUT)
	hALU uut (
		.x(x), 
		.zx(zx), 
		.nx(nx), 
		.y(y), 
		.zy(zy), 
		.ny(ny), 
		.f(f), 
		.no(no), 
		.out(out), 
		.zr(zr), 
		.ng(ng)
	);

	initial begin
		// case 1
		// out = 0; zr = 1; ng = 0;
		x = 0;
		zx = 0;
		nx = 0;
		y = 0;
		zy = 0;
		ny = 0;
		f = 0;
		no = 0;
		
		#10;
		
		if (!((out == 0) && (zr == 1) && (ng == 0))) begin
			$display("Test failed for case 1");
			$finish;
		end

		// Wait 100 ns for global reset to finish
		#100;
        
		// case 2
		// out = 1; zr = 0; ng = 0;
		x = 16'b1;
		zx = 0;
		nx = 0;
		y = 16'b1;
		zy = 0;
		ny = 0;
		f = 0;
		no = 0;
		
		#10;
		
		if (!((out == 1) && (zr == 0) && (ng == 0))) begin
			$display("Test failed for case 2");
			$finish;
		end
		
		#100;
		
		// case 3
		// out = b10; zr = 0; ng = 0;
		x = 1;
		zx = 0;
		nx = 0;
		y = 1;
		zy = 0;
		ny = 0;
		f = 1;
		no = 0;
		
		#10;

		if (!((out == 2'b10) && (zr == 0) && (ng == 0))) begin
			$display("Test failed for case 3");
			$finish;
		end
		
		#100;
		
		// case 4
		x = 1;
		zx = 1;
		nx = 0;
		y = 1;
		zy = 0;
		ny = 0;
		f = 0;
		no = 0;
		
		#10;
		
		if (!((out == 0) && (zr == 1) && (ng == 0))) begin
			$display("Test failed for case 4");
			$finish;
		end
		
		#100;
		
		// case 5
		x = 1;
		zx = 1;
		nx = 0;
		y = 1;
		zy = 0;
		ny = 0;
		f = 1;
		no = 0;
		
		#10;
		
		if (!((out == 1) && (zr == 0) && (ng == 0))) begin
			$display("Test failed for case 5");
			$finish;
		end
		
		#100;
		
		// case 6
		x = 1;
		zx = 1;
		nx = 1;
		y = 1;
		zy = 0;
		ny = 0;
		f = 0;
		no = 0;
		
		#10;
		
		if (!((out == 1) && (zr == 0) && (ng == 0))) begin
			$display("Test failed for case 6");
			$finish;
		end
		
		#100;
		
		// case 7
		x = 1;
		zx = 1;
		nx = 1;
		y = 1;
		zy = 0;
		ny = 0;
		f = 1;
		no = 0;
		
		#10;
		
		if (!((out == 0) && (zr == 1) && (ng == 0))) begin
			$display("Test failed for case 7");
			$finish;
		end
		
		#100;
		
		// case 8
		x = 1;
		zx = 1;
		nx = 1;
		y = 1;
		zy = 1;
		ny = 0;
		f = 0;
		no = 0;
		
		#10;
		
		if (!((out == 0) && (zr == 1) && (ng == 0))) begin
			$display("Test failed for case 8");
			$finish;
		end
		
		#100;
		
		// case 9
		x = 1;
		zx = 1;
		nx = 1;
		y = 1;
		zy = 1;
		ny = 0;
		f = 1;
		no = 0;
		
		#10;
		
		if (!((out == 16'b1111111111111111) && (zr == 0) && (ng == 1))) begin
			$display("Test failed for case 9");
			$finish;
		end
		
		#100;
		
		// case 10
		x = 1;
		zx = 1;
		nx = 1;
		y = 1;
		zy = 1;
		ny = 1;
		f = 0;
		no = 0;
		
		#10;
		
		if (!((out == 16'b1111111111111111) && (zr == 0) && (ng == 1))) begin
			$display("Test failed for case 10");
			$finish;
		end
		
		#100;

		// case 11
		x = 1;
		zx = 1;
		nx = 1;
		y = 1;
		zy = 1;
		ny = 1;
		f = 1;
		no = 0;
		
		#10;
		
		if (!((out == 16'b1111111111111110) && (zr == 0) && (ng == 1))) begin
			$display("Test failed for case 11");
			$finish;
		end
		
		#100;
		
		// case 12
		x = 1;
		zx = 1;
		nx = 1;
		y = 1;
		zy = 1;
		ny = 1;
		f = 1;
		no = 1;
		
		#10;
		
		if (!((out == 1) && (zr == 0) && (ng == 0))) begin
			$display("Test failed for case 12");
			$finish;
		end
		
		#100;
		
		$display("Test finish!");
		$finish;
	end
      
endmodule

