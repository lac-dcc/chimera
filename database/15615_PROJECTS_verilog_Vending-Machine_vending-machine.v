// This program was cloned from: https://github.com/Aman-Pani/PROJECTS
// License: MIT License

module vending_machine(input c5,c10,clk,rst,
                       output can,
                       output [1:0]s
                      );
  parameter s0=3'd0,s5=3'd1,s10=3'd2,s15=3'd3;
  reg [1:0]st;
  always@(posedge clk)
    if(rst == 0)	st<=s0;
    else
      case(st)
        s0:	st=c5?s5 :c10?s10:s0 ;
        s5:	st=c5?s10:c10?s15:s5 ;
        s10:st=c5?s15:c10?s15:s10;
        s15:st=c5?s5 :c10?s10:s0 ;
      endcase
  assign s=st;
  assign can=(st==s15);
endmodule	