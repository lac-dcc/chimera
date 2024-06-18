// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg a, b;
    wire and_g, 
         or_g,
         not_g,
         nand_g,
         nor_g,
         xor_g,
         xnor_g;
         
    logic_gates dut(a, b, and_g,or_g,not_g,nand_g,nor_g,xor_g,xnor_g);
    initial begin
        #10 a= 1'b0; b= 1'b0;
        #10 a= 1'b0; b= 1'b1;
        #10 a= 1'b1; b= 1'b0;
        #10 a= 1'b1; b= 1'b1;
    end
endmodule
