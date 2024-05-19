// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_dff ();

    reg clk;
    reg rst_n;
    reg d;
    wire out;

    dff dff_instance(
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .out(out)
    );

    initial begin
        clk = 1'b1;
        rst_n = 1'b0;
        d = 1'b0;
        #50
        rst_n = 1'b1;
        #500
        $finish;
    end

    always #10 begin
        clk = ~clk;
    end

    always #20 begin
        #5 d = ~d;
    end

    initial begin
        $dumpfile("tb_dff.vcd");
        $dumpvars(0, dff_instance);
    end

endmodule
