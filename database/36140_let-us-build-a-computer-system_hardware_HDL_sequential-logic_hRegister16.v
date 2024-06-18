// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _hregister16_h_
`define _hregister16_h_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:22:52 08/15/2023 
// Design Name: 
// Module Name:    hRegister16 
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
module hRegister16(
    input [15:0] in,
    input load,
	 input clock,
    output [15:0] out
    );

	reg [15:0] register16;
	wire [15:0] reg_next;
	
	always @(posedge clock) begin
		if (load == 1) begin 
			register16 <= in;
		end else begin
			register16 <= reg_next;
		end
	end
	
	assign reg_next = register16;
	assign out = register16;

endmodule

`endif