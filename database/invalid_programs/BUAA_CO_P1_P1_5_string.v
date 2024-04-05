`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:42 10/25/2018 
// Design Name: 
// Module Name:    string 
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
module string(
    input clk,
    input clr,
    input [7:0] in,
    output reg out = 0
    );
	integer state = 0;
	always@(posedge clk, posedge clr) begin
		if(clr) begin
			out = 0;
			state = 0;
		end
		else begin
			case(state) 
				0:
					begin
						if(in>="0"&&in<="9") begin
							state = 1;
							out = 1;
						end
						else begin
							state = 3;
							out = 0;
						end
					end
				1:
					begin
						if(in=="*"||in=="+") begin
							state = 2;
							out = 0;
						end
						else begin
							state = 3;
							out = 0;
						end
					end
				2:
					begin
						if(in>="0"&&in<="9") begin
							state = 1;
							out = 1;
						end
						else begin
							state = 3;
							out = 0;
						end
					end
				3:
					begin
						state = 3;
						out = 0;
					end
				default:
					begin
						state = 0;
						out = 0;
					end
			endcase
		end
	end

endmodule
