 /**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */
`default_nettype none

module Or(
    input wire a,
    input wire b,
    output wire out
);

// your implementation comes here:

wire n_a, n_b;

Not not_a(a, n_a);
Not not_b(b, n_b);
Nand Nand_1(n_a, n_b, out);

endmodule
