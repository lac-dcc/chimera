`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:43:45 10/26/2020 
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
`define	s0	0
`define	s1	1
`define	s2 2

module string(
    input clk,
    input clr,
    input [7:0] in,
    output out
    );
reg err;
reg[1:0] state;

initial begin
	err <= 0;
	state <= 0;
end

always@(posedge clk or posedge clr) begin
	if(clr == 1) begin
		state <= 0;
		err <= 0;
	end
	else begin
		if(clk == 1) begin
			case(state)
				`s0 : begin
					if((in >= "0")&&(in <= "9")) begin
						state <= `s1;
					end
					else if((in == "+")||(in == "*")) begin
						state <= 0;
						err <= 1;
					end
					else begin
						state <= 0;
						err <= 1;
					end
				end
				`s1 : begin
					if((in >= "0")&&(in <= "9"))begin
						state <= 0;
						err <= 1;
					end
					else if((in == "*")||(in == "+")) begin
						state <= `s2;
					end
					else begin
						state <= 0;
						err <= 1;
					end
				end
				`s2 : begin
					if((in >= "0")&&(in <= "9"))begin
						state <= `s1;
					end
					else if((in == "+")||(in == "*")) begin
						state <= 0;
						err <= 1;
					end
					else begin
						state <= 0;
						err <= 1;
					end
				end
				default : begin
					state <= 0;
					err <= 0;
				end
			endcase
		end
		else begin
		end
	end	
end

assign out =	(err == 1)? 0:
					(state == `s1)? 1:
					0;
endmodule