/*
 * mux8_3:
 *
 * 8 bit mux with 3 inputs and 3 operation select bits. The exact 
 * functionality depends on the INIT string.
 *
 * (C) Arlet Ottens <arlet@c-scape.nl>
 */
module mux8_3(
    input [7:0] I0,
    input [7:0] I1,
    input [7:0] I2,
    input [2:0] op,
    output [7:0] O );

    parameter INIT = 64'h0;

genvar i;
generate for (i = 0; i < 8; i = i + 1 )
begin: mux8_3 
LUT6 #(.INIT(INIT)) mux8_3 (
    .I0(I0[i]), 
    .I1(I1[i]), 
    .I2(I2[i]), 
    .I3(op[0]), 
    .I4(op[1]), 
    .I5(op[2]), 
    .O(O[i]) );
end
endgenerate

endmodule
