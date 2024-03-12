`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:58:02 09/29/2020 
// Design Name: 
// Module Name:    code 
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
module code(
    input En,
    input Clk,
    input Slt,
    input Reset,
    output reg[63:0] Output0,
    output reg[63:0] Output1
    );
reg [1:0] tmp;
initial begin
	Output0 <= 64'b0;
	Output1 <= 64'b0;
	tmp <= 2'b0;
end
always @(posedge Clk) begin
	if (Reset == 1) begin
		Output0 <= 64'b0;
		Output1 <= 64'b0;
		tmp <= 2'b0;
	end 
	else if (En == 1) begin
		if(Slt == 0)
			Output0 <= Output0 + 1;
		else begin
			tmp <= tmp +1;
			if (tmp % 4 ==3) 
				Output1 <= Output1 +1;
			else
				Output1 <= Output1;
		end
	end 
	else begin
	end
end
endmodule
