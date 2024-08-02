// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module factorial( input [3:0]n, output reg [31:0] result);
  
  function automatic integer fact(input integer i);
    begin
        if (i > 1)    fact = i * fact(i - 1);
        else    fact = 1;
    end
  endfunction

    always@(n)  result = fact(n);
    
endmodule
