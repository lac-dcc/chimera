/**
 * Not gate:
 * out = not in
 */
`default_nettype none

module Not(
    input wire in,
    output wire out
);

// your implementation comes here:

Nand Nand_1(in, in, out);

endmodule
