`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:57 11/23/2018 
// Design Name: 
// Module Name:    dm 
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
module dm(
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
	 input if_sh,
	 input if_sb,
    input [31:0] MemAddr,
    input [31:0] WD,
	 input [31:0] PC,
    output [31:0] RD
    );

	reg[31:0] dm[0:4095];
	integer i;
	initial begin
		for(i=0;i<4096;i=i+1) begin  //1024
			dm[i]<=0;
		end
	end
	
	assign RD = MemRead ? dm[MemAddr[13:2]] : 0;
	
	always@(posedge clk) begin
		if(reset) begin
			for(i=0;i<4096;i=i+1) begin//1024
				dm[i]<=0;
			end
		end
		else begin
			if(MemWrite) begin
				if(if_sh) begin
					if(MemAddr[1]==1'b1) begin
						dm[MemAddr[13:2]][31:16] <= WD[15:0];
						$display("%d@%h: *%h <= %h",$time,PC,{MemAddr[31:2],2'b00},{WD[15:0],dm[MemAddr[13:2]][15:0]});
					end
					else if(MemAddr[1]==1'b0) begin
						dm[MemAddr[13:2]][15:0] <= WD[15:0];
						$display("%d@%h: *%h <= %h",$time,PC,{MemAddr[31:2],2'b00},{dm[MemAddr[13:2]][31:16],WD[15:0]});
					end
				end
				else if(if_sb) begin
					case(MemAddr[1:0])
						2'b00: begin
							dm[MemAddr[13:2]][7:0] <= WD[7:0];
							$display("%d@%h: *%h <= %h",$time,PC,{MemAddr[31:2],2'b00},{dm[MemAddr[13:2]][31:8],WD[7:0]});
						end
						2'b01: begin
							dm[MemAddr[13:2]][15:8] <= WD[7:0];
							$display("%d@%h: *%h <= %h",$time,PC,{MemAddr[31:2],2'b00},{dm[MemAddr[13:2]][31:16],WD[7:0],dm[MemAddr[13:2]][7:0]});
						end
						2'b10: begin
							dm[MemAddr[13:2]][23:16] <= WD[7:0];
							$display("%d@%h: *%h <= %h",$time,PC,{MemAddr[31:2],2'b00},{dm[MemAddr[13:2]][31:24],WD[7:0],dm[MemAddr[13:2]][15:0]});
						end
						2'b11: begin
							dm[MemAddr[13:2]][31:24] <= WD[7:0];
							$display("%d@%h: *%h <= %h",$time,PC,{MemAddr[31:2],2'b00},{WD[7:0],dm[MemAddr[13:2]][23:0]});
						end
					endcase
				end
				else begin
					dm[MemAddr[13:2]] <= WD;
					$display("%d@%h: *%h <= %h",$time,PC,MemAddr,WD);
				end
			end
		end
	end
endmodule
