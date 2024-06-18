// This program was cloned from: https://github.com/FPGADude/Digital-Design
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module sim_gray;
    reg clk;
    reg reset;
    wire [2:0] gray_code;
    wire [2:0] bin_count;

    gray_counter gc(.clk(clk), .reset(reset), .o_bin(bin_count), .o_gray_code(gray_code));

    always #1 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #2 
        reset = 0;
        
        #20 $finish;
    end

endmodule
