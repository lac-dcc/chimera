// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

`timescale 1 ns / 100 ps

/* No inputs, no outputs */
module testbench();

/* Represents clock, initial value is 0 */
reg clk = 1'b0;

always begin
    /* Toggle clock every 1ns */
    #1 clk = ~clk;
end

/* For output of repeater module */
wire clk1; 

/* Repeater module instance */
repeater repeater(.in(clk), .out(clk1)); 

/* For output of invertor module */
wire clk2;

/* Invertor module instance */
invertor invertor(.in(clk1), .out(clk2)); 

initial begin
    /* Open for dump of signals */
    $dumpvars;

    /* Write to console */
    $display("Test started...");

    /* Stop simulation after 10ns */
    #10 $finish;
end

endmodule
