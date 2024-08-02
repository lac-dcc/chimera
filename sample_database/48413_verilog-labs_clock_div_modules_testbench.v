// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

`timescale 1 ns / 100 ps

module testbench();

/* Represents clock, initial value is 0 */
reg clk = 1'b0;

/* Toggle clock every 1ns */
always begin
    #1 clk = ~clk;
end

wire clk_divided;

clk_div #(.X(8)) clk_div(.clk(clk), .clk_divided(clk_divided));

initial begin
    
    /* Open for dump of signals */
    $dumpvars;
    
    /* Write to console */
    $display("Test started...");
    
    /* Stop simulation after 64ns */
    #64 $finish;
end

endmodule
