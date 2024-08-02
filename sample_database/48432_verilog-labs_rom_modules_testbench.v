// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

`timescale 1 ns / 100 ps

module testbench();

/* Represents clock, initial value is 0 */
reg clk = 1'b1;

always begin

    /* Toggle clock every 1ns */
    #1 clk = ~clk;

end

/* Wire for divided clock signal from clk_div module */
wire clk_divided;

/* Clock divider */
clk_div #(.X(8)) clk_div(.clk(clk), .clk_divided(clk_divided));

/* Data fetched from rom */
wire [15:0]data;

/* Read-Only Memory fetcher */
rom_fetcher #(.ADDR_WIDTH(3), .DATA_WIDTH(16)) rom_fetcher(.clk(clk_divided), .q(data));

initial begin
    
    /* Open for dump of signals */
    $dumpvars;
    
    /* Write to console */
    $display("Test started...");
    
    /* Stop simulation after 64ns */
    #136 $finish;

end

endmodule
