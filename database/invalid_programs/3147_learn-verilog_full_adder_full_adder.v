// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

`include "half_adder.v"

module full_adder(
    input a,
    input b,
    input cin,
    output cout,
    output sum
);

    wire t_cout1;
    wire t_cout2;
    wire t_sum;

    half_adder h1(
        .a(a),
        .b(b),
        .cout(t_cout1),
        .sum(t_sum)
    );

    half_adder h2(
        .a(t_sum),
        .b(cin),
        .cout(t_cout2),
        .sum(sum)
    );

    assign cout = t_cout1 | t_cout2;

endmodule
