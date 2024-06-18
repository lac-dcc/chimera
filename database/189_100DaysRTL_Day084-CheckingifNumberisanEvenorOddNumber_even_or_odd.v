// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module even_or_odd(
    input [3:0] number,
    output reg even_odd);

parameter EVEN= 1'b1, ODD= 1'b0;

always@(number)
    begin
        even_odd= check_even_odd(number);

            if(even_odd== 1'b1) $display("\t\t %d is an even number", number);
            else $display("\t\t %d is an odd number", number);
    end


function check_even_odd;
    input [3:0]num;
        begin
            if(num%2== 0) check_even_odd= EVEN;
            else check_even_odd= ODD;
        end
endfunction

endmodule
