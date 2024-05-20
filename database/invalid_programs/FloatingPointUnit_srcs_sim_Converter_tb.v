// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License

`timescale 1ns / 1ps
`include "../sources/Converter.v"

module Converter_tb #(parameter XLEN = 32);
reg [XLEN-1:0] A,B;
reg clk;
reg overflow, underflow, exception;
wire [XLEN-1:0] result;
real  value;

Converter F_Add (.clk(clk),.A(A),.B(B),.result(result));

initial  
begin

A = 32'b0_10000000_10011001100110011001100;  // 3.2
B = 32'b0_10000001_00001100110011001100110;  // 4.2
#20
A = 32'b11000010100011000011111011111010;  // 70.123
B = 32'b11000001111100011001100110011010;  // -30.2
#20
A = 32'b1_01111110_00000000000000000000000;  // -0.5
B = 32'b0_10000001_10011001100110011001100;  // -6.4
#20
A = 32'b11000001011100011001100110011010;  // 15.1
B = 32'b01000000000100110011001100110011;  //  2.3
#20
A = 32'h4034b4b5;
B = 32'hbf70f0f1;
end

initial
begin
#20
value =(2**(result[30:23]-127))*($itor({1'b1,result[22:0]})/2**23)*((-1)**(result[31]));
$display("Result : %b",result);
$display("Expected Value : %f Result : %f",3.2+4.2,value);
#20
$display("Result : %b",result);
value =(2**(result[30:23]-127))*($itor({1'b1,result[22:0]})/2**23)*((-1)**(result[31]));
$display("Expected Value : %f Result : %f",0.66+0.51,value);
#20
$display("Result : %b",result);
value =(2**(result[30:23]-127))*($itor({1'b1,result[22:0]})/2**23)*((-1)**(result[31]));
$display("Expected Value : %f Result : %f",-0.5+6.4,value);

#20

value =(2**(result[30:23]-127))*($itor({1'b1,result[22:0]})/2**23)*((-1)**(result[31]));
$display("Expected Value : %f Result : %f",-0.46799183-0.28049564
,value);
#20
value =(2**(result[30:23]-127))*($itor({1'b1,result[22:0]})/2**23)*((-1)**(result[31]));
$display("Expected Value : %f Result : %f",2.82-0.94,value);
$finish;
end
endmodule