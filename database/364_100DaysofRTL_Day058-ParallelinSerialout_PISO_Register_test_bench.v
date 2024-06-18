// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk, reset, load;
reg [2:0] parallel_in;
wire serial_out;

piso dut(clk, reset, load, parallel_in, serial_out);

initial begin
    clk=1'b0;
    forever #5 clk=~clk;
    end
    
 initial begin
    reset= 1;
    #10 reset= 0;
    load= 1'b1;
    parallel_in= 3'b001;
    #10 load= 1'b0;
    #30 load= 1'b1;
    parallel_in= 3'b100;
    #10 load= 1'b0;
    #30 load= 1'b1;
    parallel_in= 3'b101;
    #10 load= 1'b0;
    end
    
 initial begin
    $monitor("\t\t clk: %d  load: %d  paralel_in: %b  serial_out: %d", clk, load, parallel_in, serial_out);
    #120 $finish;
    end
endmodule