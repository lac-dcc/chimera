/*
 * add8_3:
 *
 * 8 bit adder with 3 inputs and 2 operation select bits
 *
 */
module add8_3(
    input CI,
    input [7:0] I0,
    input [7:0] I1,
    input [7:0] I2,
    input [1:0] op,
    output [7:0] O,
    output CO 
    );

    parameter INIT = 64'h0;

wire [7:0] P;       // carry propagate
wire [7:0] G;       // carry generate

genvar i;
generate for (i = 0; i < 8; i = i + 1 )
begin : add
LUT6_2 #(.INIT(INIT)) add(
    .O6(P[i]),
    .O5(G[i]),
    .I0(I0[i]),
    .I1(I1[i]),
    .I2(I2[i]),
    .I3(op[0]),
    .I4(op[1]),
    .I5(1'b1));
end
endgenerate

wire [3:0] COL;  // carry out of lower nibble
wire [3:0] COH;  // carry out of higher nibble

CARRY4 carry_l ( .CO(COL), .O(O[3:0]), .CI(CI),     .CYINIT(1'b0), .DI(G[3:0]), .S(P[3:0]) );
CARRY4 carry_h ( .CO(COH), .O(O[7:4]), .CI(COL[3]), .CYINIT(1'b0), .DI(G[7:4]), .S(P[7:4]) );

assign CO = COH[3];

endmodule
