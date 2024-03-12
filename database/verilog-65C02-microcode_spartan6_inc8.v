/*
 * inc8 : 8 bit incrementer using LUT5s
 *
 * (C) Arlet Ottens <arlet@c-scape.nl>
 */

module inc8(
    input [7:0] I,
    input CI,
    output [7:0] O,
    output CO);

wire C4;    // 4th bit carry

LUT5 #(.INIT(32'h80000000)) inc_c( .O(C4),   .I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(CI) );
LUT5 #(.INIT(32'h80000000)) inc_o( .O(CO),   .I0(I[4]), .I1(I[5]), .I2(I[6]), .I3(I[7]), .I4(C4) );

// lower nibble, add CI
LUT5 #(.INIT(32'h5555aaaa)) inc_0( .O(O[0]), .I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(CI) );
LUT5 #(.INIT(32'h6666cccc)) inc_1( .O(O[1]), .I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(CI) );
LUT5 #(.INIT(32'h7878f0f0)) inc_2( .O(O[2]), .I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(CI) );
LUT5 #(.INIT(32'h7f80ff00)) inc_3( .O(O[3]), .I0(I[0]), .I1(I[1]), .I2(I[2]), .I3(I[3]), .I4(CI) );

// upper nibble, add C4
LUT5 #(.INIT(32'h5555aaaa)) inc_4( .O(O[4]), .I0(I[4]), .I1(I[5]), .I2(I[6]), .I3(I[7]), .I4(C4) );
LUT5 #(.INIT(32'h6666cccc)) inc_5( .O(O[5]), .I0(I[4]), .I1(I[5]), .I2(I[6]), .I3(I[7]), .I4(C4) );
LUT5 #(.INIT(32'h7878f0f0)) inc_6( .O(O[6]), .I0(I[4]), .I1(I[5]), .I2(I[6]), .I3(I[7]), .I4(C4) );
LUT5 #(.INIT(32'h7f80ff00)) inc_7( .O(O[7]), .I0(I[4]), .I1(I[5]), .I2(I[6]), .I3(I[7]), .I4(C4) );

endmodule
