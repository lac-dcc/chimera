`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:32 09/28/2020 
// Design Name: 
// Module Name:    counting 
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

`define S0 2'b00
`define S1 2'b01
`define S2 2'b10
`define S3 2'b11

module counting(
    input [1:0] num,
    input clk,
    output ans
    );
reg [1:0]state;
initial begin
	state = `S0;
end

always@(posedge clk)
	begin
		case(state)
		`S0 : begin
					if (num == 1) begin
						state <= `S1;
						end
					else begin
						
					end
				end
				
		`S1 : begin
					if (num ==1) begin
						state <= `S1;
						end
					else if(num==2) begin
						state <= `S2;
						end
					else begin
						state <= `S0;
						end
				end
				
		`S2: begin
					if (num ==1) begin
						state <=`S1;
					end
					else if(num==2)begin
						state <=`S0;
					end
					else begin
						state <=`S0;
					end
				end
				
		`S3 : begin 
					if(num==1) begin
						state <=`S1;
					end
					else if(num==2) begin
						state <=`S0;
					end
					else begin
						state <=`S3;
					end
				end
		endcase
	end
assign ans=(state==`S3)? 1:0;
endmodule
