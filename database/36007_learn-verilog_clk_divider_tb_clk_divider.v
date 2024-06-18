// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_clk_divider ();

    reg clk;
    reg rst;
    wire clk2;
    wire clk4;
    wire clk8;

    initial begin
        clk = 1'b1;
        rst = 1'b1;
        #100
        rst = 1'b0;
    end

    always #10 clk = ~clk;

    clk_divider ins(
        .clk(clk),
        .rst(rst),
        .clk2(clk2),
        .clk4(clk4),
        .clk8(clk8)
    );

endmodule
