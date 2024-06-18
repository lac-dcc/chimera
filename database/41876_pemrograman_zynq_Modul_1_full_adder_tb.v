// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module full_adder_tb();
    localparam T = 10;
    
    reg a;
    reg b;
    reg c;
    wire sum;
    wire carry;
    
    full_adder full_adder_0
    (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .carry(carry)
    );
    
    initial
    begin
        a = 0;
        b = 0;
        c = 0;
        #T;
        a = 0;
        b = 0;
        c = 1;
        #T;
        a = 0;
        b = 1;
        c = 0;
        #T;
        a = 0;
        b = 1;
        c = 1;
        #T;
        a = 1;
        b = 0;
        c = 0;
        #T;
        a = 1;
        b = 0;
        c = 1;
        #T;
        a = 1;
        b = 1;
        c = 0;
        #T;
        a = 1;
        b = 1;
        c = 1;
        #T;                
    end
    
endmodule
