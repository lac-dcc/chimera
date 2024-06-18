// This program was cloned from: https://github.com/Tommydag/CAN-Bus-Controller
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:31:35 04/27/2015
// Design Name:   can_tx
// Module Name:   C:/Users/dagosttv.ROSE-HULMAN/Documents/School/ECE/ECE398/CAN-Bus-Controller-/tx_test.v
// Project Name:  CAN_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: can_tx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tx_test;

	// Inputs
	wire rx;
	reg [10:0] address;
	reg clk;
	reg baud_clk;
	reg rst;
	reg [63:0] data;
	reg send_data;
	reg rxing;

	// Outputs
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	tx_container uut (
		.tx(tx), 
		.txing(txing),
		.rx(rx), 
		.rxing(rxing),
		.address(address), 
		.clk(clk),
		.baud_clk(baud_clk),
		.rst(rst), 
		.data(data), 
		.send_data(send_data)
	);
	
	

	assign rx = tx;
	
	initial begin
		// Initialize Inputs
		address = 11'h28;
		rxing = 0;
		clk = 1'b0;
		baud_clk = 1'b0;
		rst = 1'b1;
		//data = 64'hAAAAAAAAAAAAAAAA;
		data = 64'hA83;
		send_data = 1'b0;
		
		// Add stimulus here
		#100 rst = 0;

		#101 send_data = 1'b1;
		#3000 send_data = 1'b0;
		#310000 $stop;
	end
		always #1.25 clk=~clk;
		always #1000 baud_clk=~baud_clk;
endmodule

