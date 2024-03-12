`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:35 10/25/2018 
// Design Name: 
// Module Name:    gray 
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
module gray(
    input Clk,
    input Reset,
    input En,
    output reg [2:0] Output = 2'b00,
    output reg Overflow = 0
    );

	always@(posedge Clk) begin
		if(Reset) begin
			Output <= 2'b00;
			Overflow <= 0;
		end
		else if(En) begin
			Output[2]<=(Output[1]&&!Output[0])||(Output[2]&&Output[0]);
			Output[1]<=(!Output[2]&&Output[0])||(Output[1]&&!Output[0]);
			Output[0]<=(!Output[2]&&!Output[1])||(Output[2]&&Output[1]);
			if(Overflow==0) begin
				Overflow <= (Output[2]&&!Output[1]&&!Output[0]);
			end
		end
	end

endmodule
