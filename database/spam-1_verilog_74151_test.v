// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off ASSIGNDLY 
// verilator lint_off STMTDLY 
// verilator lint_off PINMISSING 


`include "../lib/assertion.v"
`include "./hct74151.v"
`timescale 1ns/1ns

module test();

  logic [2:0] S;
  logic [7:0] I;
  logic _E;

  hct74151 demux(._E, .S, .I);

  always @*
    begin
      $display("%9t %m ", $time, "_E=%1b  I=%8b  S=%1d   Y=%b _Y=%b", demux._E, demux.I, demux.S, demux.Y, demux._Y);
    end
  
    initial begin

      
      $display("%9t ",$time, "disabled - _Y lags behind Y by 5ns");
      _E=1;

      `TIMEOUT((demux.Y === 0), 14, "Y changes first")
      `TIMEOUT((demux._Y === 'x), 0, "_Y lags")
      `TIMEOUT((demux._Y === 1), 5, "_Y set later")
      

      $display("%9t ",$time, "enabled s0 i0");
      _E=0;
      S=0;
      I=8'b00000000;
      #100
      `TIMEOUT((demux.Y === 0), 0, "ok")
      `TIMEOUT((demux._Y === 1), 0, "ok")
      

      $display("%9t ",$time, "enabled s0 i1");
      _E=0;
      S=0;
      I=8'b00000001;
      `TIMEOUT((demux.Y === 1), 20, "ok")
      `TIMEOUT((demux._Y === 0), 0, "ok")

      $display("%9t ",$time, "enabled s1 i2 - Y will glitch low during the transution because S is faster than I <<<<<<<");
        _E=0;
        S=1;
        I=8'b00000010;

      `TIMEOUT((demux.Y === 1), 0, "ok")
      `TIMEOUT((demux.Y === 0), 20, "ok")
      `TIMEOUT((demux.Y === 1), 1, "ok")

      $display("%9t ",$time, "disabled");
      _E=1;
      S=0;
      I=8'b00000000;

      `TIMEOUT((demux.Y === 0), 14, "Y set first")
      `TIMEOUT((demux._Y === 0), 0, "_Y lags")
      `TIMEOUT((demux._Y === 1), 5, "_Y set later")

      
       $display("%9t ",$time, "demonstrate passing thru transient glitches");
      _E=0;
      S=0;
      I=8'b00000001;
      #1
      I=8'b00000000;
      #1
      I=8'b00000001;
      #1
      
      `TIMEOUT((demux.Y === 1), (20-3), "Y wiggle")
      `TIMEOUT((demux.Y === 0), 1, "Y wiggle")
      `TIMEOUT((demux.Y === 1), 1, "Y wiggle");
      
      
      #1000
      $display("%9t ",$time, "PASS");
      $finish;
    end

    initial begin
      #10000
      $display("FAIL DIDN'T FINISH");
`ifndef verilator
      $finish_and_return(1);
`endif
    end
endmodule : test

