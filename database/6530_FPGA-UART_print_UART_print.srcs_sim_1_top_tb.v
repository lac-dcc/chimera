// This program was cloned from: https://github.com/MoonGrt/FPGA-UART_print
// License: MIT License

`timescale 1ns/1ns

module top_tb;

parameter T = 10;

reg  clk = 0;
reg  rst_n = 0;
wire txp;
wire rxp;

initial
    forever #(T/2) clk = ~clk;

initial
    #(T*2) rst_n = 1;

top top (
    .clk(clk),
    .rst_n(rst_n),
    .txp(txp),
    .rxp(rxp)
);

endmodule
