// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

// TODO: Implement the sub module (negate b if it's positive)

module sub(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);

// Negate b using two's complement
wire [31:0] neg_b = ~b + 1;

add add_op(a, neg_b, cin, sum, cout);


endmodule