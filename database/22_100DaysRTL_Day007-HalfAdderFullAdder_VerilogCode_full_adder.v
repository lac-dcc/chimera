// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module full_adder(
    input a, b, cin,
    output sout, cout
    );
    
    assign sout = a ^ b ^ cin;
    assign cout = (a&b) | cin&(a^b);
endmodule
