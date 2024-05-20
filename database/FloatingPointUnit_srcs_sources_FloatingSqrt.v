// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License

`timescale 1ns / 1ps
module FloatingSqrt#(parameter XLEN=32)
                    (input [XLEN-1:0]A,
                     input clk,
                     output overflow,
                     output underflow,
                     output exception,
                     output [XLEN-1:0] result);
wire [7:0] Exponent;
wire [22:0] Mantissa;
wire Sign;
wire [XLEN-1:0] temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp;
wire [XLEN-1:0] x0,x1,x2,x3;
wire [XLEN-1:0] sqrt_1by05,sqrt_2,sqrt_1by2;
wire [7:0] Exp_2,Exp_Adjust;
wire remainder;
wire pos;
assign x0 = 32'h3f5a827a;
assign sqrt_1by05 = 32'h3fb504f3;  // 1/sqrt(0.5)
assign sqrt_2 = 32'h3fb504f3;
assign sqrt_1by2 = 32'h3f3504f3;
assign Sign = A[31];
assign Exponent = A[30:23];
assign Mantissa = A[22:0];
/*----First Iteration----*/
FloatingDivision D1(.A({1'b0,8'd126,Mantissa}),.B(x0),.result(temp1));
FloatingAddition A1(.A(temp1),.B(x0),.result(temp2));
assign x1 = {temp2[31],temp2[30:23]-1,temp2[22:0]};
/*----Second Iteration----*/
FloatingDivision D2(.A({1'b0,8'd126,Mantissa}),.B(x1),.result(temp3));
FloatingAddition A2(.A(temp3),.B(x1),.result(temp4));
assign x2 = {temp4[31],temp4[30:23]-1,temp4[22:0]};
/*----Third Iteration----*/
FloatingDivision D3(.A({1'b0,8'd126,Mantissa}),.B(x2),.result(temp5));
FloatingAddition A3(.A(temp5),.B(x2),.result(temp6));
assign x3 = {temp6[31],temp6[30:23]-1,temp6[22:0]};
FloatingMultiplication M1(.A(x3),.B(sqrt_1by05),.result(temp7));

assign pos = (Exponent>=8'd127) ? 1'b1 : 1'b0;
assign Exp_2 = pos ? (Exponent-8'd127)/2 : (Exponent-8'd127-1)/2 ;
assign remainder = (Exponent-8'd127)%2;
assign temp = {temp7[31],Exp_2 + temp7[30:23],temp7[22:0]};
//assign temp7[30:23] = Exp_2 + temp7[30:23];
FloatingMultiplication M2(.A(temp),.B(sqrt_2),.result(temp8));
assign result = remainder ? temp8 : temp;
endmodule
