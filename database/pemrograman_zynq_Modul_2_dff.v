// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

`timescale 1ns / 1ps

module dff
    (
        input wire clk,
        input wire rst,
        input wire d,
        output reg q
    );
    
    always @(posedge clk)
    begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end
    
endmodule
