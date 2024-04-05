`include "FADDER.v"
module ADDER_8bit(cfinal,sum,num1,num2,cin);
	
	input [7:0] num1,num2;
	output [7:0] sum;
	wire [7:0] cout;
	input cin;
	output cfinal;
	
		FADDER add0(sum[0],cout[0],num1[0],num2[0],cin);
		FADDER add1(sum[1],cout[1],num1[1],num2[1],cout[0]);
		FADDER add2(sum[2],cout[2],num1[2],num2[2],cout[1]);
		FADDER add3(sum[3],cout[3],num1[3],num2[3],cout[2]);
		FADDER add4(sum[4],cout[4],num1[4],num2[4],cout[3]);
		FADDER add5(sum[5],cout[5],num1[5],num2[5],cout[4]);
		FADDER add6(sum[6],cout[6],num1[6],num2[6],cout[5]);
		FADDER add7(sum[7],cout[7],num1[7],num2[7],cout[6]);
		
	assign cfinal = cout[7];
endmodule