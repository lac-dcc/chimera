

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:44:30 11/05/2012 
// Design Name: 
// Module Name:    if_id_reg 
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
module if_id_reg(clk,rst,Write,instruction_in,PCNow_in,PCNext4_in,instruction_out,PCNow_out,PCNext4_out);
    input clk, rst,Write;
	 input [31:0] instruction_in,PCNext4_in,PCNow_in;
	 output [31:0] instruction_out, PCNext4_out,PCNow_out;
	 reg [31:0] instruction_out, PCNext4_out,PCNow_out;
	 reg [31:0] instruction_outB, PCNext4_outB,PCNow_outB;
	
	
	always@(rst)
	begin
		if (rst == 1) begin
			instruction_out <= 32'b0;
			PCNext4_out <= 32'b0;
			PCNow_out <= 0;
		end else if (rst == 0) begin
		instruction_out <= instruction_outB;
		PCNext4_out <= PCNext4_outB;
		PCNow_out <= PCNow_outB;
		end
	end

	always@(posedge clk)
	begin
		if (Write) begin
			instruction_out <= instruction_in;
			PCNext4_out <= PCNext4_in;
			PCNow_out <= PCNow_in;
		end
	end
	 
	always@(negedge clk) begin
		instruction_outB <= instruction_in;
		PCNext4_outB <= PCNext4_in;
		PCNow_outB <= PCNow_in;
	end
	 
	 

endmodule
