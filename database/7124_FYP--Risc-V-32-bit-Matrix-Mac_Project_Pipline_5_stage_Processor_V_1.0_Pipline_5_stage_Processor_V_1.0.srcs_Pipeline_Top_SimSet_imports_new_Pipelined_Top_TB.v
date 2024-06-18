// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0






module Pipelined_Top_Testbench();

    reg clk = 1'b0, rst;
    
    
    Five_Stage_Pipline_Top dut(
        .clk(clk),
        .rst(rst)
    );
    
    always begin
        clk = ~clk;
        #50;
    end
    
    initial begin
        rst <= 1'b0;
        #200;
        rst <= 1'b1;
        #1000;
        $finish;
    
    end
    
    












endmodule