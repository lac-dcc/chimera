// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module divide(
    input [3:0]dividend,divisor,
    output reg [3:0]quotient,remainder);

    always@(dividend,divisor)
        begin
        quotient = 0;
        remainder= dividend;
            while(remainder>=divisor)
            begin	
                remainder = remainder - divisor;
                quotient = quotient + 1;
            end
        end
endmodule
