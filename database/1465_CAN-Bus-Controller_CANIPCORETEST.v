// This program was cloned from: https://github.com/Tommydag/CAN-Bus-Controller
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:31:21 05/25/2015
// Design Name:   CAN_BUS_Model
// Module Name:   C:/Users/dagosttv.ROSE-HULMAN/Documents/School/ECE/ECE398/CAN-Bus-Controller-/CANIPCORETEST.v
// Project Name:  CAN_Controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CAN_BUS_Model
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CANIPCORETEST;

	// Inputs
	reg can_clk;
	reg can_phy_rx;
	reg bus2ip_reset;
	reg bus2ip_rnw;
	reg bus2ip_cs;
	reg sys_clk;
	reg [0:5] bus2ip_addr;
	reg [0:31] bus2ip_data;

	// Outputs
	wire ip2bus_intrevent;
	wire ip2bus_error;
	wire ip2bus_ack;
	wire can_phy_tx;
	wire [0:31] ip2bus_data;

	// Instantiate the Unit Under Test (UUT)
	CAN_BUS_Model uut (
		.can_phy_rx(can_phy_rx), 
		.can_clk(can_clk), 
		.bus2ip_reset(bus2ip_reset), 
		.ip2bus_intrevent(ip2bus_intrevent), 
		.bus2ip_rnw(bus2ip_rnw), 
		.bus2ip_cs(bus2ip_cs), 
		.ip2bus_error(ip2bus_error), 
		.sys_clk(sys_clk), 
		.ip2bus_ack(ip2bus_ack), 
		.can_phy_tx(can_phy_tx), 
		.ip2bus_data(ip2bus_data), 
		.bus2ip_addr(bus2ip_addr), 
		.bus2ip_data(bus2ip_data)
	);

	initial begin
		// Initialize Inputs
		can_clk = 0;
		bus2ip_reset = 1;
		bus2ip_rnw = 1;
		bus2ip_cs = 0;
		sys_clk = 0;
		bus2ip_addr = 6'd3;
		bus2ip_data = 32'd42;
		can_phy_rx = 1;

		// Wait 100 ns for global reset to finish
		#100;
		bus2ip_reset = 0;
		#10;
		bus2ip_data = 32'd42;
		bus2ip_addr = 6'd3;
		#10;
        bus2ip_cs = 1;
		bus2ip_rnw = 0;
		#50
		bus2ip_cs = 0;
		bus2ip_rnw = 1;
		
		// Add stimulus here

	end
	
	always #5 sys_clk=~sys_clk;
    always #25 can_clk=~can_clk;
endmodule

