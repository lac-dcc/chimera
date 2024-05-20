// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module tb_or;
    reg a, b;
    wire or_out;
         
    decoder_or dut(a, b, or_out);
    initial begin
        #0  a= 1'b0; b= 1'b0;
        #10 a= 1'b0; b= 1'b1;
        #10 a= 1'b1; b= 1'b0;
        #10 a= 1'b1; b= 1'b1;
    end
    initial 
     begin $monitor("a: %b  b: %b  or: %b ",a, b, or_out);
     #40 $finish;
     end
endmodule
