`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:26 11/17/2020 
// Design Name: 
// Module Name:    DM 
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
`define WORD	2'b00
`define HALF	2'b01
`define BYTE	2'b10

module DM(
    input clk,
    input reset,
    input WE,
	
	input [1:0] width,
	input LoadSign,
	
    input [31:0] addr,
    input [31:0] WD,
    output reg [31:0] RD,
	
	input [31:0] PC		// the pre-test requires
	
    );
	// reg [31:0] DM[1023:0];
	reg [31:0] DM[4095:0];
	integer i;
	
	initial begin 
		for (i = 0; i < 4096; i = i + 1)
			DM[i] = 0;
	end
	
	
	always@(posedge clk) begin
		if(reset == 1) begin
			for (i = 0; i < 4096; i = i + 1)
				DM[i] = 0;
		end
		else if(WE == 1) begin
			case(width)
				`WORD : begin
					// DM[addr[11:2]] = WD;
					DM[addr[13:2]] = WD;
					$display("%d@%h: *%h <= %h", $time, PC, addr, WD);		// the pre-test requires
		
				end
				`HALF : begin
					case(addr[1])
						0 : DM[addr[13:2]][15:0] = WD[15:0];
						1 : DM[addr[13:2]][31:16] = WD[15:0];
					endcase
					$display("%d@%h: *%h <= %h", $time, PC, {addr[31:2],2'b0}, DM[addr[13:2]]);		// the pre-test requires
				end
				`BYTE : begin
					case(addr[1:0])
						0 : DM[addr[13:2]][7:0] = WD[7:0];
						1 : DM[addr[13:2]][15:8] = WD[7:0];
						2 : DM[addr[13:2]][23:16] = WD[7:0];
						3 : DM[addr[13:2]][31:24] = WD[7:0];
					endcase
					$display("%d@%h: *%h <= %h", $time, PC, {addr[31:2],2'b0}, DM[addr[13:2]]);		// the pre-test requires
				end
			endcase
		end
	end
	
	always@(*) begin
		case(width)
			`WORD : RD = DM[addr[13:2]];
			`HALF : begin
				case(addr[1])
					0 : RD[15:0] = DM[addr[13:2]][15:0];
					1 : RD[15:0] = DM[addr[13:2]][31:16];
				endcase
				case(LoadSign)
					0 : RD[31:16] = 0;
					1 : RD[31:16] = {16{RD[15]}};
				endcase
			end
			`BYTE : begin
				case(addr[1:0])
					0 : RD[7:0] = DM[addr[13:2]][7:0];
					1 : RD[7:0] = DM[addr[13:2]][15:8];
					2 : RD[7:0] = DM[addr[13:2]][23:16];
					3 : RD[7:0] = DM[addr[13:2]][31:24];
				endcase
				case(LoadSign)
					0 : RD[31:8] = 0;
					1 : RD[31:8] = {24{RD[7]}};
				endcase
			end
			default : RD = 32'bx;
		endcase
	end
endmodule
