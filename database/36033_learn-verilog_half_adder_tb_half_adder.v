// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_half_adder ();

    reg a;
    reg b;
    wire cout;
    wire sum;

    half_adder half_adder_instance(
        .a(a),
        .b(b),
        .cout(cout),
        .sum(sum)
    );

    initial begin
        a = 1'b0;
        b = 1'b0;
        #10
        a = 1'b1;
        b = 1'b0;
        #10
        a = 1'b0;
        b = 1'b1;
        #10
        a = 1'b1;
        b = 1'b1;
        #10
        a = 1'b0;
        b = 1'b0;
        #10
        $finish;
    end

    initial begin
        $dumpfile("tb_half_adder.vcd");
        $dumpvars(0, half_adder_instance);
    end

endmodule
