// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
    reg a, b;
    wire xor_out, xnor_out;
         
    gates_mux dut(a, b, xor_out, xnor_out);
    initial begin
            a= 1'b0; b= 1'b0;
        #10 a= 1'b0; b= 1'b1;
        #10 a= 1'b1; b= 1'b0;
        #10 a= 1'b1; b= 1'b1;
    end
    initial 
     begin $monitor("a: %b  b: %b  xor: %b  xnor: %b ",a, b, xor_out, xnor_out );
     #40 $finish;
     end
endmodule
