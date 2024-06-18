// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module multiplier(    
	input [3:0]a,b,
	output reg [7:0] out
	);
	
	reg [7:0] t1,t2,t3,t4;

	always@(a,b)
	begin
		t1=0; t2=0; t3=0; t4=0;
		if(b[0]) 
			t1 = a<<0;
		if(b[1]) 
			t2 = a<<1;
		if(b[2]) 
			t3 = a<<2;
		if(b[3]) 
			t4 = a<<3;

		out = t1+t2+t3+t4;
	end
endmodule
