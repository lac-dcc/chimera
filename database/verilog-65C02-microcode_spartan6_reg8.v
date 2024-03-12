/*
 * 8 bit register
 */
module reg8(
    input clk,
    input EN,
    input RST,
    input [7:0] D,
    output [7:0] Q );

    //parameter INIT = 64'h0;

genvar i;
generate for (i = 0; i < 8; i = i + 1 )
begin : fdre
FDRE fdre(
    .C(clk),
    .CE(EN),
    .R(RST), 
    .Q(Q[i]),
    .D(D[i]) );
end
endgenerate

endmodule
