// This program was cloned from: https://github.com/Darkborderman/schoolWorks
// License: BSD 2-Clause "Simplified" License

`define TimeExpire 32'd25000000
module clk_div (clk,rst,counter,div_clk);
input clk,rst;
input [31:0]counter;
output div_clk;
reg div_clk;
reg [31:0]count;
always @ (posedge clk)
begin 
	if (!rst)
	begin 
	count <= 32'd0;
	div_clk <=1'b0;
	end
	else
	begin 
	if (count == `TimeExpire)
	begin 
	count<=32'd0;
	div_clk <=~div_clk;
	end
	else
	begin 
	count <= count + 32'd1;
end
end
end
endmodule

module counter (clock,reset,select,out);
input clock,reset,select;
output [6:0]out;
reg [6:0]out;
reg [3:0]temp;
clk_div myclk(clock,reset,div_clk);
always @(posedge div_clk)
begin 
	if (!reset)
		temp <= 0;
	else
	begin 
		if (select)
			temp <= temp+1;
		else
			temp <= temp - 1;
	end	
end
always @ (temp)
begin 
	case (temp)
	4'd0: out = 7'b1000000; //0
	4'd1: out = 7'b1111001; //1
	4'd2: out = 7'b0100100; //2
	4'd3: out = 7'b0110000; //3
	4'd4: out = 7'b0011001; //4
	4'd5: out = 7'b0010010; //5
	4'd6: out = 7'b0000010; //6
	4'd7: out = 7'b1111000; //7
	4'd8: out = 7'b0000000; //8
	4'd9: out = 7'b0010000; //9
	4'd10: out = 7'b0001000; //10 A
	4'd11: out = 7'b0000011; //11 B
	4'd12: out = 7'b1000110; //12 C
	4'd13: out = 7'b0100001; //13 D
	4'd14: out = 7'b0000110; //14 E
	4'd15: out = 7'b0001110; //15 F
	endcase
end
endmodule