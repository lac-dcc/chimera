// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
/* verilator lint_off ASSIGNDLY */
/* verilator lint_off STMTDLY */

`include "../lib/assertion.v"
`include "./hct74154.v"
`timescale 1ns/1ns

module tb();

      logic [3:0] A;
      wire [15:0] Y;

      logic _E0, _E1;

      hct74154 decoder(._E0, ._E1, .A, .Y);

    always @*
        $display($time, "_E0=%1b", _E0, " _E1=%1b", _E1, " A=%4b", A, " Y=%16b ", Y);
     
    initial begin
      
        _E0 = 1;
        _E1 = 1;
        #20 
        `Equals(Y , 16'b1111111111111111)

        _E0 = 0;
        _E1 = 1;
        #20 
        `Equals(Y , 16'b1111111111111111)

        _E0 = 1;
        _E1 = 0;
        #20 
        `Equals(Y , 16'b1111111111111111)

        #20
        _E0 = 0;
        _E1 = 0;
        A = 0; 
        #20 // not enought time to stabilise
        `Equals(Y , 16'b1111111111111110)

        A = 1; 
        #20 // not enought time to stabilise
        `Equals(Y , 16'b1111111111111101)

        A = 15; 
        #20 // not enought time to stabilise
        `Equals(Y , 16'b0111111111111111)
A = 15; 
    end

endmodule

