`default_nettype none
`include "tests/top_tb_header.vh"
module test;

    reg reset = 0;
    wire signed [15:0] out_real;
    wire signed [15:0] out_imag;

    integer i;
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);
        b_real = 2;
        b_imag = -1;
        a_real = 3;
        a_imag = 1;
        `assert("1", out_real, 16'sd7);
        `assert("1", out_imag, -16'sd1);
        # 4
        b_real = -2;
        b_imag = -2;
        a_real = -3;
        a_imag = -3;
        `assert("2", out_real, 16'sd0);
        `assert("2", out_imag, 16'sd12);
        # 4
        b_real = 2;
        b_imag = 4;
        a_real = 3;
        a_imag = 4;
        `assert("3", out_real, -16'sd10);
        `assert("3", out_imag, 16'sd20);
        # 4

        $finish;
    end

    // clock
    reg clk = 0;
    always #1 clk = !clk;

    reg signed [7:0] b_real;
    reg signed [7:0] b_imag;
    reg signed [7:0] a_real;
    reg signed [7:0] a_imag;

    complex_mult complex_mult_dut(.a_real(a_real), .a_imag(a_imag), .b_real(b_real), .b_imag(b_imag), .out_real(out_real), .out_imag(out_imag));


endmodule // test

