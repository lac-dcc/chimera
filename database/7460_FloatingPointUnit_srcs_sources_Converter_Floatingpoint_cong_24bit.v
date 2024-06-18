// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License



module cong_24bit(in1,in2,sum,c);
  output [24:0] sum;
  output [24:0]c;
  input [23:0] in1;
  input [23:0] in2;  
  wire  [23:0]cout;
	
  FA FA[23:0] (in1[23:0], in2[23:0], {c[22:0],1'b0},  sum[23:0],c[23:0]);
	
  assign cout = c[23];
  assign sum[24] = cout;
	
endmodule

