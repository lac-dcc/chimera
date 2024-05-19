// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

`timescale 1ns / 1ps

module tb;
    parameter PERIOD = 1;

    reg clk;
    reg [23:0] data = 24'hFF5500;

    sevenseg uut(
        .clk(clk),
        .data(data)
    );

    initial begin
        $dumpfile("test/tb.vcd");
        $dumpvars(0, tb);
        clk = 0;
    end

    always #PERIOD clk = ~clk;

    initial begin
        $monitor("t=%3d clk=%d\n", $time, clk);
        #1_000_000; // Simulate for 1ms
        $finish;
    end

endmodule
