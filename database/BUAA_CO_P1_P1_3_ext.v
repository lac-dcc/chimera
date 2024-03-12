`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:55 10/25/2018 
// Design Name: 
// Module Name:    ext 
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
module ext(
    input [15:0] imm,
    input [1:0] EOp,
    output reg [31:0] ext
    );

	always@(*) begin
		if(EOp==2'b00) begin
			ext = {{16{imm[15]}},imm[15:0]};
		end
		else if(EOp==2'b01) begin
			ext = {{16{1'b0}},imm[15:0]};
		end
		else if(EOp==2'b10) begin
			ext = {imm[15:0],{16{1'b0}}};
		end
		else if(EOp==2'b11) begin
			ext = {{14{imm[15]}},imm[15:0],1'b0,1'b0};
		end
	end 
endmodule
