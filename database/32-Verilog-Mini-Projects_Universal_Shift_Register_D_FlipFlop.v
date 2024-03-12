`timescale 1ns / 1ps

module D_FlipFlop(O , D , clk , clear);

input D , clk , clear;
output reg O;

always@(posedge clk , negedge clear)
begin
	
	if(clear == 1'b0)
		O <= 1'b0;
	else
		O <= D;
	
end
endmodule
