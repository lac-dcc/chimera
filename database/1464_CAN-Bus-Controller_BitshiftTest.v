// This program was cloned from: https://github.com/Tommydag/CAN-Bus-Controller
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:02:18 05/17/2015
// Design Name:   shift_reg
// Module Name:   C:/Users/dagosttv.ROSE-HULMAN/Documents/School/ECE/ECE398/CAN-Bus-Controller-/BitshiftTest.v
// Project Name:  CAN_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BitshiftTest;

	// Inputs
	reg rx;
	reg rst;
	reg baud_clk;

	// Outputs
	wire [149:0] shifted_bus;

	// Instantiate the Unit Under Test (UUT)
	shift_reg uut (
		.rx(rx), 
		.shifted_bus(shifted_bus),
		.finished_rx(finished_rx),
		.rst(rst), 
		.baud_clk(baud_clk)
	);

	initial begin
		// Initialize Inputs
		rx = 1'b1;
		rst = 1;
		baud_clk = 0;
		#10 rst = 1'b0;
		
		#1000 rx = 1'b0;
		#12000 rx = 1'b1;
		#2000 rx = 1'b0;
		#2000 rx = 1'b1;
		#2000 rx = 1'b0;
		#10000 rx = 1'b1;
		#4100 rx = 1'b0;
		#10000 rx = 1'b1;
		#2000 rx = 1'b0;
		#10000 rx = 1'b1;
		#2000 rx = 1'b0;
		#10000 rx = 1'b1;
		#2000 rx = 1'b0;
		#10000 rx = 1'b1;
		#2000 rx = 1'b0;
		#10000 rx = 1'b1;
		#2000 rx = 1'b0;
		#10000 rx = 1'b1;
		#2000 rx = 1'b0;
		#10000 rx = 1'b1;
		#2000 rx = 1'b0;
		#10000 rx = 1'b1;
		#2000 rx = 1'b0;
		#10000 rx = 1'b1;
		#2000 rx = 1'b0;
		#2000 rx = 1'b1;
		#2000 rx = 1'b0;
		#2000 rx = 1'b1;
		#2000 rx = 1'b0;
		#10000 rx = 1'b1;
		#6000 rx = 1'b0;
		#2000 rx = 1'b1;
		#10000 rx = 1'b0;
		#6000 rx = 1'b1;
		#70000; $stop;
		
	end
	
	
	always #1000 baud_clk=~baud_clk;
      
endmodule

