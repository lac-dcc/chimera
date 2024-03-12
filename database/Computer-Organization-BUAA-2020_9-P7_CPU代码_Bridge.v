`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:57 12/20/2020 
// Design Name: 
// Module Name:    Bridge 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Bridge(

/// from processor
	// Processor caculate the DevAddr out, pass it to the Dev
    input [31:2] PrAddr,
	
    input [31:0] PrWD, // gonna write DEV **from Processor**
	input PrWE,	// Write Enable signal, gonna write Device??

	/// from Devices
    input [31:0] DEV0RD,	// ReadData from DEV0
    input [31:0] DEV1RD,	// ReadData from DEV1
	
	// Pr read from DEV
    output [31:0] PrRD,
	
	// pass from Pr to DEV
    output [31:2] DEVAddr,
    output [31:0] DEVWD,
	
    output DEV0WE,
    output DEV1WE
    );
	
	assign DEVAddr = PrAddr;
	
	// if gonna write
	assign DEVWD = PrWD;
	assign	DEV0WE = PrWE & (PrAddr[4] == 0),
			DEV1WE = PrWE & (PrAddr[4] == 1);
			
	// read logic
	assign PrRD = (PrAddr[4] == 0)? DEV0RD : DEV1RD;
endmodule
