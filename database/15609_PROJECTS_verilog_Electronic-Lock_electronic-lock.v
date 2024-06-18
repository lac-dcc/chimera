// This program was cloned from: https://github.com/Aman-Pani/PROJECTS
// License: MIT License


module lock(input b0,b1,clk,rst ,output unlc,output [2:0]s);
  parameter sr=3'd0,s0=3'd1,s01=3'd2,s010=3'd3,s0101=3'd4,s01011=3'd5;
  reg [2:0]st;
  always@(posedge clk)
    if(rst == 0)	st<=sr;
    else
      case(st)
        sr:		st=b0?s0	:b1?sr		:st;
        s0:		st=b0?s0	:b1?s01		:st;
        s01:	st=b0?s010	:b1?sr		:st;
        s010:	st=b0?s0	:b1?s0101	:st;
        s0101:	st=b0?s010	:b1?s01011	:st;
        s01011:	st=b0?s0	:b1?sr		:st;
        //sr		: if(b0) st = s0;		else if(b1) st = sr;
        //s0		: if(b0) st = s0;		else if(b1) st = s01;
        //s01		: if(b0) st = s010;		else if(b1) st = sr;
        //s010		: if(b0) st = s0;		else if(b1) st = s0101;
        //s0101		: if(b0) st = s010;		else if(b1) st = s01011;
        //s01011	: if(b0) st = s0;		else if(b1) st = sr;
      endcase
  assign s=st;
  assign unlc=(st==s01011);
endmodule