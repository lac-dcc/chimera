// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module tb_nand;
    reg a, b;
    wire nand_out;
         
    demux_nand dut(a, b, nand_out);
    initial begin
            a= 1'b0; b= 1'b0;
        #10 a= 1'b0; b= 1'b1;
        #10 a= 1'b1; b= 1'b0;
        #10 a= 1'b1; b= 1'b1;
    end
    initial 
     begin $monitor("a: %b  b: %b  nand: %b ",a, b, nand_out);
     #40 $finish;
     end
endmodule