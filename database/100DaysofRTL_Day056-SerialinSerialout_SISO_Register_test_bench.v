// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk, reset, serial_in;
wire serial_out;

siso dut(clk, reset, serial_in, serial_out);

initial begin
    clk=1'b0;
    forever #5 clk=~clk;
    end
    
 initial begin
    reset= 1'b1;
    serial_in= 1'b0;
    #10 reset= 1'b0;
    
    #0  serial_in= 1'b1;
    #10 serial_in= 1'b0;
    #10 serial_in= 1'b1;
    #10 serial_in= 1'b1;
    #10 serial_in= 1'b0;
    #10 serial_in= 1'b0;
    #10 serial_in= 1'b1;
    #10 serial_in= 1'b0;
    #10 serial_in= 1'bx;
    end
    
 initial begin
    $monitor("\t\t clk: %d  reset: %d  serial_in: %d  serial_out: %d", clk, reset, serial_in, serial_out);
    #120 $finish;
    end
endmodule