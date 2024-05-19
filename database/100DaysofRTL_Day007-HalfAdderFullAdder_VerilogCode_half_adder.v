// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module half_adder(
    input a, b,
    output sout, cout
    );
    
    assign sout = a^b;
    assign cout = a&b;
    
endmodule
