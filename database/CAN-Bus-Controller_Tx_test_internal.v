`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:04 05/25/2015
// Design Name:   can_tx
// Module Name:   C:/Users/dagosttv.ROSE-HULMAN/Documents/School/ECE/ECE398/CAN-Bus-Controller-/Tx_test_internal.v
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

module Tx_test_internal;

	// Inputs
	reg [10:0] address;
	reg clk;
	reg baud_clk;
	reg rst;
	reg [63:0] data;
	reg send_data;
	reg clear_to_tx;
	assign rx = tx;
	assign bitstuffed_output = tx;

	// Outputs
	wire tx;
	wire can_bitstuff;
	wire txing;

	// Instantiate the Unit Under Test (UUT)
	can_tx uut (
		.tx(tx), 
		.can_bitstuff(can_bitstuff), 
		.txing(txing), 
		.rx(rx), 
		.address(address), 
		.clk(clk), 
		.baud_clk(baud_clk), 
		.rst(rst), 
		.data(data), 
		.send_data(send_data), 
		.bitstuffed_output(bitstuffed_output), 
		.clear_to_tx(clear_to_tx)
	);

	initial begin
		// Initialize Inputs
		address = 11'h28;
		clk = 0;
		baud_clk = 0;
		rst = 1;
		data = 43;
		send_data = 0;
		clear_to_tx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;
		#10;
		send_data = 1;
		clear_to_tx = 1;
		#300000 $stop;
		// Add stimulus here

	end
	always #1.25 clk=~clk;
	always #1000 baud_clk=~baud_clk;
      
endmodule

