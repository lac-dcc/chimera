// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

`timescale 1 ns / 100 ps

module testbench();

/* Represents clock, initial value is 0 */
reg clk = 1'b0;

always begin

    /* Toggle clock every 1ns */
    #1 clk = ~clk;

end

/* CPU */
cpu cpu(.clk(clk));

initial begin
    
    /* Open for dump of signals */
    $dumpvars;
    
    /* Write to console */
    $display("Test started...");
    
    /* Stop simulation after 64ns */
    #256 $finish;

end

endmodule
