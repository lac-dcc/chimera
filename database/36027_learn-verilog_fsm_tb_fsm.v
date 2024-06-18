// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_fsm();

    reg clk;
    reg rst_n;
    reg key_in;
    wire [1:0] state;

    initial begin
        clk = 1'b1;
        rst_n = 1'b0;
        key_in = 1'b1;
        #100
        rst_n = 1'b1;
        #100
        key_in = 1'b0;
        #20
        key_in = 1'b1;
        #80
        key_in = 1'b0;
        #20
        key_in = 1'b1;
        #80
        key_in = 1'b0;
        #20
        key_in = 1'b1;
        #80
        key_in = 1'b0;
        #20
        key_in = 1'b1;
        #80
        key_in = 1'b0;
        #20
        key_in = 1'b1;
        #80
        $finish;
    end

    always #10 clk = ~clk;

    fsm component (
        .clk (clk),
        .rst_n (rst_n),
        .key_in (key_in),
        .out (state)
    );

    initial begin
        $dumpfile("tb_fsm.vcd");
        $dumpvars(0, component);
    end
endmodule
