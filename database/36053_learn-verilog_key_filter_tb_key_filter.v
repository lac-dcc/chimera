// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ms/1ms

module tb_key_filter ();

    reg clk;
    reg rst_n;
    reg key_in;
    wire key_out;

    key_filter #(
        .SYS_CLK (500), // 500 Hz
        .FILTER_TIME (20) // 20 ms
    )
    component(
        .clk (clk),
        .rst_n (rst_n),
        .key_in (key_in),
        .key_out (key_out)
    );

    initial begin
        clk = 1'b1;
        rst_n = 1'b0;
        #15
        rst_n = 1'b1;
        #2
        key_in = 1'b0;
        #4
        key_in = 1'b1;
        #4
        key_in = 1'b0;
        #40
        key_in = 1'b1;
        #5
        key_in = 1'b0;
        #4
        key_in = 1'b1;
        #5
        key_in = 1'b0;
        #50
        key_in = 1'b1;
        #3
        key_in = 1'b0;
        #4
        key_in = 1'b1;
        #5
        key_in = 1'b0;
        #25
        key_in = 1'b1;
        #10
        $finish;
    end

    always #1 clk = ~clk;

    initial begin
        $dumpfile("tb_key_filter.vcd");
        $dumpvars(0, component);
    end
endmodule
