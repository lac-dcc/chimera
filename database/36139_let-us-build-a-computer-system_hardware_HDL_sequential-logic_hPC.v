// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _hpc_h_
`define _hpc_h_

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:05:31 08/15/2023 
// Design Name: 
// Module Name:    hPC 
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
module hPC(
    input [15:0] in,
    input load,
    input inc,
    input reset,
	 input clock,
    output [15:0] out
    );

	reg [15:0] h_reg;
	wire [15:0] reg_next;
	
	always @(posedge clock) begin
		if (reset == 1) begin
			h_reg <= 0;
		end else if (load == 1) begin
			h_reg <= in;
		end else if (inc == 1) begin
			h_reg <= h_reg + 16'b1;
		end else begin
			h_reg <= reg_next;
		end
		
		$write("hPC::h_reg %x reg_next %x\n", h_reg, reg_next);
	end
	
	assign reg_next = h_reg;
	assign out = h_reg;

endmodule

`endif
