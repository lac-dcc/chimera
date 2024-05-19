// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef V_74157 
`define V_74157 

// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY

`include "../lib/assertion.v"
`include "./hct74157.v"
`timescale 1ns/1ns

module tb();

      wire [3:0]I0;
      wire [3:0]I1;
      wire [3:0]Y;

      logic [3:0] VI1='0;
      logic [3:0] VI0='1;

      logic _E;
      logic S;

      assign I1=VI1;
      assign I0=VI0;

      hct74157 mux(.I0, .I1, .S, ._E, .Y);

    time st;

    always @*
        $display($time, ":delta=%5d ", ($time-st), " => S=%1b", S, " _E=%1b", _E, " I0=%4b", VI0, " I1=%4b ", I1," Y=%4b ", Y);
     
    initial begin
      
      VI0='x;
      VI1='x;
      S = 1; // a->b
      _E = 1;
      st =$time;
      #2 // not enough time to stabilise
      `Equals(Y , 4'bxxxx)

      st =$time; #(10+2+1) // After Epd+1 0 appears on output
      `Equals(Y , 4'b0)

      // enable and set new data => data should appear longest of Epd or Ipd - therefore Ipd
      VI0=4'b1010;
      VI1=4'b0101;
      S = 1; // stays same
      _E = 0; // is enabled
      st =$time; #(13+1)
      `Equals(Y , 4'b0101)

      // flip the selection ..
      S = 0; 
      st =$time; #(19) // old data data still there at 18 secs (== 19 delay)..... 
      `Equals(Y , 4'b0101)
      st =$time; #(1) // but data appears after 1 more nS
      `Equals(Y , 4'b1010)
      
    end

endmodule: tb


`endif
