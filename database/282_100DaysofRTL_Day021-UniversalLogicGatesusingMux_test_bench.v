// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg a, b;
    wire nand_out, nor_out;
         
    gates_mux dut(a, b, nand_out, nor_out);
    initial begin
        #0  a= 1'b0; b= 1'b0;
        #10 a= 1'b0; b= 1'b1;
        #10 a= 1'b1; b= 1'b0;
        #10 a= 1'b1; b= 1'b1;
    end
    initial 
     begin $monitor("a: %b  b: %b  nand: %b  nor: %b ",a, b, nand_out, nor_out );
     #40 $finish;
     end
endmodule
