// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module logic_gates(
    input a, b,
    output reg and_g,
    output reg or_g,
    output reg not_g,
    output reg nand_g,
    output reg nor_g,
    output reg xor_g,
    output reg xnor_g
    );
    always@(*)
        begin
            and_g = a&b;
            or_g = a|b;
            not_g = ~a;
            nand_g = ~(a&b);
            nor_g = ~(a|b);
            xor_g = a^b;
            xnor_g = ~(a^b);
        end
    
endmodule
