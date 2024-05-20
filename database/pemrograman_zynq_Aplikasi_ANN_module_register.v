// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

// *** Author : Erwin Ouyang
// *** Date   : 8 May 2018
`timescale 1ns / 1ps

module register
    (
        input wire               clk,
        input wire               rst_n,
        input wire               en,
        input wire               clr,
        input wire signed [15:0] d,
        output reg signed [15:0] q
    );
    
    always @(posedge clk)
    begin
        if (!rst_n || clr)
            q <= 0;
        else if (en)
            q <= d;
    end
    
endmodule
