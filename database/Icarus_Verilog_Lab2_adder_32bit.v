`include "ADDER_8bit.v"

module adder_32bit(cfinal,sum,num1,num2,cin);
	input [31:0] num1,num2;
	input cin;
	output [31:0] sum;
	output cfinal;
	wire cout[3:0];
	
	ADDER_8bit add1(cout[0],sum[7:0],num1[7:0],num2[7:0],cin);
	ADDER_8bit add2(cout[1],sum[15:8],num1[15:8],num2[15:8],cout[0]);
	ADDER_8bit add3(cout[2],sum[23:16],num1[23:16],num2[23:16],cout[1]);
	ADDER_8bit add4(cout[3],sum[31:24],num1[31:24],num2[31:24],cout[2]);
	
	assign cfinal = cout[2];
	
endmodule