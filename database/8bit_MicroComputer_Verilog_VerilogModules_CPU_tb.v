`timescale 1ns/1ps
`include "CPU.v"
module CPUtb();
reg clk;
wire [7:0] outPut;
wire [6:0] LED1;
wire [6:0] LED2;

initial begin
    clk <= 0;
    forever begin
        #10;
        clk <= ~clk;
    end
end

CPU cpu(.clkin(clk), .OutPut(outPut), .LED1(LED1), .LED2(LED2));

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, CPUtb);
    #1000;
    $finish;
end

endmodule