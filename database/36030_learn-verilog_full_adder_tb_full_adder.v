// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`timescale 1ns/1ns

module tb_full_adder ();

    reg a;
    reg b;
    reg cin;
    wire cout;
    wire sum;

    full_adder full_adder_instance(
        .a(a),
        .b(b),
        .cin(cin),
        .cout(cout),
        .sum(sum)
    );

    initial begin
        a = 1'b0;
        b = 1'b0;
        cin = 1'b0;
        #10
        a = 1'b0;
        b = 1'b0;
        cin = 1'b1;
        #10
        a = 1'b0;
        b = 1'b1;
        cin = 1'b0;
        #10
        a = 1'b0;
        b = 1'b1;
        cin = 1'b1;
        #10
        a = 1'b1;
        b = 1'b0;
        cin = 1'b0;
        #10
        a = 1'b1;
        b = 1'b0;
        cin = 1'b1;
        #10
        a = 1'b1;
        b = 1'b1;
        cin = 1'b0;
        #10
        a = 1'b1;
        b = 1'b1;
        cin = 1'b1;
        #10
        $finish;
    end

    initial begin
        $dumpfile("tb_full_adder.vcd");
        $dumpvars(0, full_adder_instance);
    end

endmodule
