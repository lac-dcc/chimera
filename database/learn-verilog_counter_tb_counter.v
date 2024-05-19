// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_counter ();

    reg clk;
    reg rst_n;
    wire [23:0] cnt;

    counter #(10, 50) component(
        .clk (clk),
        .rst_n (rst_n),
        .cnt (cnt)
    );

    initial begin
        clk = 1'b1;
        rst_n = 1'b0;
        #10
        rst_n = 1'b1;
        #20000
        $finish;
    end

    always #10 clk = ~clk;

    initial begin
        $dumpfile("tb_counter.vcd");
        $dumpvars(0, component);
    end

endmodule
