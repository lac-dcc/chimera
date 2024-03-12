/*
 * add8_3x:
 *
 * 8 bit adder with 3 inputs and 3 operation select bits
 *
 * Note that the 3rd operation select bit has very restricted
 * function. For regular adders, we need to use two LUT5s, only
 * giving 5 inputs to work with, and the 6th input needs to be
 * tied to '1'. 
 *
 * However, by setting the 6th input to '0', we get a function
 * where both P and G are set by the O5 LUT. Usually this doesn't
 * lead to anything useful, but when G = 0, then the output is 
 * either 00 or 01 depending on carry input. 
 */
module add8_3x(
    input CI,
    input [7:0] I0,
    input [7:0] I1,
    input [7:0] I2,
    input [2:0] op,
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
    .I5(op[2]));
end
endgenerate

wire [3:0] COL;  // carry out of lower nibble
wire [3:0] COH;  // carry out of higher nibble

CARRY4 carry_l ( .CO(COL), .O(O[3:0]), .CI(CI),     .CYINIT(1'b0), .DI(G[3:0]), .S(P[3:0]) );
CARRY4 carry_h ( .CO(COH), .O(O[7:4]), .CI(COL[3]), .CYINIT(1'b0), .DI(G[7:4]), .S(P[7:4]) );

assign CO = COH[3];

endmodule
