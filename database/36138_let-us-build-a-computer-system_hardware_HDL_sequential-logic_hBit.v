// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _hbit_h_
`define _hbit_h_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:00:03 08/14/2023 
// Design Name: 
// Module Name:    hBit 
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
module hBit(
    input in,
    input load,
	 input clock,
    output out
    );

	reg dff;
	wire dff_next;
	
	always @(posedge clock) begin
		if (load == 1) begin
			dff <= in;
		end else begin
			dff <= dff_next;
		end
	end
	
	assign dff_next = dff;
	assign out = dff;

endmodule

`endif
