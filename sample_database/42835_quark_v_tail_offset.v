// This program was cloned from: https://github.com/drom/quark
// License: MIT License

module tail_offset (ir, toff_0_0, toff_1_0, toff_2_0, toff_3_0, toff_4_0, toff_5_0, toff_6_0, toff_7_0, toff_8_0, toff_9_0, toff_10_0, toff_11_0, toff_12_0, toff_13_0, toff_14_0, toff_15_0);
input  [63:0] ir;
output [3:0] toff_0_0, toff_1_0, toff_2_0, toff_3_0, toff_4_0, toff_5_0, toff_6_0, toff_7_0, toff_8_0, toff_9_0, toff_10_0, toff_11_0, toff_12_0, toff_13_0, toff_14_0, toff_15_0;

reg [3:0] toff_0_0, toff_1_1, toff_2_2, toff_3_3, toff_4_4, toff_5_5, toff_6_6, toff_7_7, toff_8_8, toff_9_9, toff_10_10, toff_11_11, toff_12_12, toff_13_13, toff_14_14, toff_15_15;

reg [3:0] ir0, ir1, ir2, ir3, ir4, ir5, ir6, ir7, ir8, ir9, ir10, ir11, ir12, ir13, ir14, ir15;

reg [3:0] toff_1_0, toff_3_2, toff_2_0, toff_3_0, toff_5_4, toff_7_6, toff_6_4, toff_7_4, toff_4_0, toff_5_0, toff_6_0, toff_7_0, toff_9_8, toff_11_10, toff_10_8, toff_11_8, toff_8_0, toff_9_0, toff_10_0, toff_11_0;

wire [3:0] tlen_1, tlen_2, tlen_3, tlen_4, tlen_5, tlen_6, tlen_7, tlen_8, tlen_9, tlen_10, tlen_11, tlen_12, tlen_13, tlen_14;

tail_length u_len1 (.ir(ir1), .len(tlen_1));
tail_length u_len2 (.ir(ir2), .len(tlen_2));
tail_length u_len3 (.ir(ir3), .len(tlen_3));
tail_length u_len4 (.ir(ir4), .len(tlen_4));
tail_length u_len5 (.ir(ir5), .len(tlen_5));
tail_length u_len6 (.ir(ir6), .len(tlen_6));
tail_length u_len7 (.ir(ir7), .len(tlen_7));
tail_length u_len8 (.ir(ir8), .len(tlen_8));
tail_length u_len9 (.ir(ir9), .len(tlen_9));
tail_length u_len10 (.ir(ir10), .len(tlen_10));
tail_length u_len11 (.ir(ir11), .len(tlen_11));
tail_length u_len12 (.ir(ir12), .len(tlen_12));
tail_length u_len13 (.ir(ir13), .len(tlen_13));

always @ (ir) { ir15, ir14, ir13, ir12, ir11, ir10, ir9, ir8, ir7, ir6, ir5, ir4, ir3, ir2, ir1, ir0 } = ir;

always @ ( toff_0_0, toff_1_1, toff_2_2, toff_3_3, toff_4_4, toff_5_5, toff_6_6, toff_7_7, toff_8_8, toff_9_9, toff_10_10, toff_11_11 )

begin
  toff_1_0 = toff_1_1 + toff_0_0;
  toff_3_2 = toff_3_3 + toff_2_2;
  toff_2_0 = toff_2_2 + toff_1_0;
  toff_3_0 = toff_3_2 + toff_1_0;
  toff_5_4 = toff_5_5 + toff_4_4;
  toff_7_6 = toff_7_7 + toff_6_6;
  toff_6_4 = toff_6_6 + toff_5_4;
  toff_7_4 = toff_7_6 + toff_5_4;
  toff_4_0 = toff_4_4 + toff_3_0;
  toff_5_0 = toff_5_4 + toff_3_0;
  toff_6_0 = toff_6_4 + toff_3_0;
  toff_7_0 = toff_7_4 + toff_3_0;
  toff_9_8 = toff_9_9 + toff_8_8;
  toff_11_10 = toff_11_11 + toff_10_10;
  toff_10_8 = toff_10_10 + toff_9_8;
  toff_11_8 = toff_11_10 + toff_9_8;
  toff_8_0 = toff_8_8 + toff_7_0;
  toff_9_0 = toff_9_8 + toff_7_0;
  toff_10_0 = toff_10_8 + toff_7_0;
  toff_11_0 = toff_11_8 + toff_7_0;;
end

/*
mux16 #(.W(4)) u_offset_mux (
    .sel(pc),
    .i0000(of0001),
    .i0001(of0010),
    .i0010(of0011),
    .i0011(of0100),
    .i0100(of0101),
    .i0101(of0110),
    .i0110(of0111),
    .i0111(of1000),
    .i1000(of1001),
    .i1001(of1010),
    .i1010(of1011),
    .i1011(of1100),
    .i1100(of1101),
    .i1101(4'b????),
    .i1110(4'b????),
    .i1111(4'b????),
    .o(offset)
);
*/

/*
mux16 #(.W(3)) u_len_mux (
    .sel(pc),
    .i0000(len0001),
    .i0001(len0010),
    .i0010(len0011),
    .i0011(len0100),
    .i0100(len0101),
    .i0101(len0110),
    .i0110(len0111),
    .i0111(len1000),
    .i1000(len1001),
    .i1001(len1010),
    .i1010(len1011),
    .i1011(len1100),
    .i1100(len1101),
    .i1101(len1110),
    .i1110(len1111),
    .i1111(len1111),
    .o(len)
);
*/

/*
mux16 #(.W(4)) imm3_0_mux (
    .sel(offset),
    .i0000(ir1111),
    .i0001(ir1110),
    .i0010(ir1101),
    .i0011(ir1100),
    .i0100(ir1011),
    .i0101(ir1010),
    .i0110(ir1001),
    .i0111(ir1000),
    .i1000(ir0111),
    .i1001(ir0110),
    .i1010(ir0101),
    .i1011(ir0100),
    .i1100(4'b????),
    .i1101(4'b????),
    .i1110(4'b????),
    .i1111(4'b????),
    .o(imm3_0)
);
*/
/*
always @ (imm31_16, imm15_8, imm7_4, imm3_0) imm = {imm31_16, imm15_8, imm7_4, imm3_0};
*/

endmodule
