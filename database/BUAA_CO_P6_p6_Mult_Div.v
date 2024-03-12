`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:10 11/30/2018 
// Design Name: 
// Module Name:    Mult_Div 
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
module Mult_Div(
	 input clk,
	 input reset,
    input [31:0] A,
    input [31:0] B,
	 input [1:0] op,
	 input start,
	 input if_mthi,
	 input if_mtlo,
    output reg Busy,
    output [31:0] High,
    output [31:0] Low
    );
	reg [31:0] Hi;
	reg [31:0] Lo;
	assign High = Hi;
	assign Low = Lo;
	reg[31:0] cycles;
	reg [63:0] tmp;
	
	initial begin
		Hi<=0;
		Lo<=0;
		cycles<=0;
		Busy<=0;
	end
	
	always@(posedge clk) begin
		if(reset) begin
			Hi<=0;
			Lo<=0;
			cycles<=0;
			Busy<=0;
		end
		else if(!Busy) begin
			if(start) begin
				case(op)
					2'b00: begin//mult
						tmp<=$signed(A)*$signed(B);
						cycles<=5;
					end
					2'b01: begin//multu
						tmp<=A*B;
						cycles<=5;
					end
					2'b10: begin//div
						tmp<={$signed(A)%$signed(B),$signed(A)/$signed(B)};
						cycles<=10;
					end
					2'b11: begin//divu
						tmp<={A%B,A/B};
						cycles<=10;
					end
				endcase
				Busy<=1;
			end
			if(if_mthi) begin
				Hi<=A;
			end
			if(if_mtlo) begin
				Lo<=A;
			end
		end
		else if(Busy) begin
			if(cycles>0) begin
				cycles=cycles-1;
				if(cycles==0) begin
					{Hi,Lo}<=tmp;
					Busy<=0;
				end
			end
		end
	end
endmodule