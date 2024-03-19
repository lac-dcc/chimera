////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//File Name: Iteration.v
//Created By: Sheetal Swaroop Burada
//Date: 30-04-2019
//Project Name: Design of 32 Bit Floating Point ALU Based on Standard IEEE-754 in Verilog and its implementation on FPGA.
//University: Dayalbagh Educational Institute
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module Iteration(
	input [31:0] operand_1,
	input [31:0] operand_2,
	output [31:0] solution
	);

wire [31:0] Intermediate_Value1,Intermediate_Value2;

Multiplication M1(operand_1,operand_2,,,,Intermediate_Value1);

//32'h4000_0000 -> 2.
Addition_Subtraction A1(32'h4000_0000,{1'b1,Intermediate_Value1[30:0]},1'b0,,Intermediate_Value2);

Multiplication M2(operand_1,Intermediate_Value2,,,,solution);

endmodule