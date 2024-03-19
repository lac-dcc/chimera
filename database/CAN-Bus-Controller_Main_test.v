`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:34:40 05/17/2015
// Design Name:   Main
// Module Name:   C:/Users/dagosttv.ROSE-HULMAN/Documents/School/ECE/ECE398/CAN-Bus-Controller-/Main_test.v
// Project Name:  CAN_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Main_test;

	// Inputs
	assign CAN_RX = CAN_TX;
	reg RESET;
	reg CLOCK_SIGNAL_IN;
	reg send_data;
	reg [7:0] transmit_data;
	// Outputs
	wire CAN_TX;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.CAN_TX(CAN_TX), 
		.CAN_RX(CAN_RX), 
		.RESET(RESET), 
		.CLOCK_SIGNAL_IN(CLOCK_SIGNAL_IN), 
		.send_data(send_data), 
		.transmit_data(transmit_data)
	);

	initial begin
		// Initialize Inputs
		RESET = 1;
		CLOCK_SIGNAL_IN = 0;
		send_data = 0;
		transmit_data = 8'b11100011;

		// Wait 100 ns for global reset to finish
		#100;
		#100 RESET = 0;
		#1000 send_data = 1;
		#100000 $stop;
		
        
		// Add stimulus here
	end
     
	 always #10 CLOCK_SIGNAL_IN = ~CLOCK_SIGNAL_IN;
endmodule

