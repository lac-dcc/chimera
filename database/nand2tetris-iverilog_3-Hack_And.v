/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */

`default_nettype none

module And(
    input wire a,
    input wire b,
    output wire out
);

// your implementation comes here:

wire n_out;

nand(n_out, a, b);
nand(out, n_out, n_out);

endmodule
