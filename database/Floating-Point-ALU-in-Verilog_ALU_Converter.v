////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//File Name: Converter.v
//Created By: Sheetal Swaroop Burada
//Date: 30-04-2019
//Project Name: Design of 32 Bit Floating Point ALU Based on Standard IEEE-754 in Verilog and its implementation on FPGA.
//University: Dayalbagh Educational Institute
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module Floating_Point_to_Integer(
		input [31:0] a_operand,
		output [31:0] Integer
		);

reg [23:0] Integer_Value;

always @(*)
begin
	if (a_operand[30:23] == 8'd127)
			begin
				Integer_Value = 23'd0;
			end

	else if (a_operand[30:23] == 8'd128)
			begin
				Integer_Value = {a_operand[22],22'd0};
				 
			end

	else if (a_operand[30:23] == 8'd129)
			begin
				Integer_Value = {a_operand[22:21],21'd0};
				 
			end

	else if (a_operand[30:23] == 8'd130)
			begin
				Integer_Value = {a_operand[22:20],20'd0};
				 
			end

	else if (a_operand[30:23] == 8'd131)
			begin
				Integer_Value = {a_operand[22:19],19'd0};
				 
			end

	else if (a_operand[30:23] == 8'd132)
			begin
				Integer_Value = {a_operand[22:18],18'd0};
				 
			end

	else if (a_operand[30:23] == 8'd133)
			begin
				Integer_Value = {a_operand[22:17],17'd0};
				 
			end

	else if (a_operand[30:23] == 8'd134)
			begin
				Integer_Value = {a_operand[22:16],16'd0};
				 
			end

	else if (a_operand[30:23] == 8'd135)
			begin
				Integer_Value = {a_operand[22:15],15'd0};
				 
			end

	else if (a_operand[30:23] == 8'd136)
			begin
				Integer_Value = {a_operand[22:14],14'd0};
				 
			end

	else if (a_operand[30:23] == 8'd137)
			begin
				Integer_Value = {a_operand[22:13],13'd0};
				 
			end

	else if (a_operand[30:23] == 8'd138)
			begin
				Integer_Value = {a_operand[22:12],12'd0};
				 
			end

	else if (a_operand[30:23] == 8'd139)
			begin
				Integer_Value = {a_operand[22:11],11'd0};
				 
			end

	else if (a_operand[30:23] == 8'd140)
			begin
				Integer_Value = {a_operand[22:10],10'd0};
				 
			end

	else if (a_operand[30:23] == 8'd141)
			begin
				Integer_Value = {a_operand[22:9],9'd0};
				 
			end

	else if (a_operand[30:23] == 8'd142)
			begin
				Integer_Value = {a_operand[22:8],8'd0};
				 
			end

	else if (a_operand[30:23] == 8'd143)
			begin
				Integer_Value = {a_operand[22:7],7'd0};
				 
			end

	else if (a_operand[30:23] == 8'd144)
			begin
				Integer_Value = {a_operand[22:6],6'd0};
				 
			end

	else if (a_operand[30:23] == 8'd145)
			begin
				Integer_Value = {a_operand[22:5],5'd0};
				 
			end

	else if (a_operand[30:23] == 8'd146)
			begin
				Integer_Value = {a_operand[22:4],4'd0};
				 
			end

	else if (a_operand[30:23] == 8'd147)
			begin
				Integer_Value = {a_operand[22:3],3'd0};
				 
			end

	else if (a_operand[30:23] == 8'd148)
			begin
				Integer_Value = {a_operand[22:2],2'd0};
				 
			end

	else if (a_operand[30:23] == 8'd149)
			begin
				Integer_Value = {a_operand[22:1],1'd0};
				 
			end

	else if (a_operand[30:23] >= 8'd150)
			begin
				Integer_Value = a_operand[22:0];
				 
			end

	else if (a_operand[30:23] <= 8'd126)
			begin
				Integer_Value = 24'd0;
				 
			end
end

assign Integer = {a_operand[31:23],Integer_Value[23:1]};

endmodule