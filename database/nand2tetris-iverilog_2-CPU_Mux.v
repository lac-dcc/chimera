/** 
 * Multiplexor:
 * out = a if sel == 0
 *       b otherwise
 */
`default_nettype none

module Mux(
    input wire a,
    input wire b,
    input wire sel,
    output wire out
);

// your implementation comes here:

wire ab, nota, notb, not_sel, b_sel, and2_out, and3_out, and4_out, and5_out, or1_out;

Not not_1(a, nota);
Not not_2(b, notb);
Not not_3(sel, not_sel);
And and_1(b, sel, b_sel);
And and_2(nota, b_sel, and2_out);
And and_3(a, notb, and3_out);
And and_4(and3_out, not_sel, and4_out);
And and_5(a, b, ab);
Or or_1(and2_out, and4_out, or1_out);
Or or_2(or1_out, ab, out);

endmodule
