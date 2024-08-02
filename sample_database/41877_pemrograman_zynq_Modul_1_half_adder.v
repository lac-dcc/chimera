// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module half_adder
    (
        input wire  a,
        input wire  b,
        output wire sum,
        output wire carry    
    );
    
    assign sum = a ^ b;
    assign carry = a & b;
    
endmodule
