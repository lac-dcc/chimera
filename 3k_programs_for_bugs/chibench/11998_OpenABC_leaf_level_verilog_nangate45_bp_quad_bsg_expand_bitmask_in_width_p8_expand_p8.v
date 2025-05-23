// This program was cloned from: https://github.com/NYU-MLDA/OpenABC
// License: BSD 3-Clause "New" or "Revised" License

module bsg_expand_bitmask_in_width_p8_expand_p8
(
  i,
  o
);

  input [7:0] i;
  output [63:0] o;
  wire [63:0] o;
  wire o_63_,o_55_,o_47_,o_39_,o_31_,o_23_,o_15_,o_7_;
  assign o_63_ = i[7];
  assign o[56] = o_63_;
  assign o[57] = o_63_;
  assign o[58] = o_63_;
  assign o[59] = o_63_;
  assign o[60] = o_63_;
  assign o[61] = o_63_;
  assign o[62] = o_63_;
  assign o[63] = o_63_;
  assign o_55_ = i[6];
  assign o[48] = o_55_;
  assign o[49] = o_55_;
  assign o[50] = o_55_;
  assign o[51] = o_55_;
  assign o[52] = o_55_;
  assign o[53] = o_55_;
  assign o[54] = o_55_;
  assign o[55] = o_55_;
  assign o_47_ = i[5];
  assign o[40] = o_47_;
  assign o[41] = o_47_;
  assign o[42] = o_47_;
  assign o[43] = o_47_;
  assign o[44] = o_47_;
  assign o[45] = o_47_;
  assign o[46] = o_47_;
  assign o[47] = o_47_;
  assign o_39_ = i[4];
  assign o[32] = o_39_;
  assign o[33] = o_39_;
  assign o[34] = o_39_;
  assign o[35] = o_39_;
  assign o[36] = o_39_;
  assign o[37] = o_39_;
  assign o[38] = o_39_;
  assign o[39] = o_39_;
  assign o_31_ = i[3];
  assign o[24] = o_31_;
  assign o[25] = o_31_;
  assign o[26] = o_31_;
  assign o[27] = o_31_;
  assign o[28] = o_31_;
  assign o[29] = o_31_;
  assign o[30] = o_31_;
  assign o[31] = o_31_;
  assign o_23_ = i[2];
  assign o[16] = o_23_;
  assign o[17] = o_23_;
  assign o[18] = o_23_;
  assign o[19] = o_23_;
  assign o[20] = o_23_;
  assign o[21] = o_23_;
  assign o[22] = o_23_;
  assign o[23] = o_23_;
  assign o_15_ = i[1];
  assign o[8] = o_15_;
  assign o[9] = o_15_;
  assign o[10] = o_15_;
  assign o[11] = o_15_;
  assign o[12] = o_15_;
  assign o[13] = o_15_;
  assign o[14] = o_15_;
  assign o[15] = o_15_;
  assign o_7_ = i[0];
  assign o[0] = o_7_;
  assign o[1] = o_7_;
  assign o[2] = o_7_;
  assign o[3] = o_7_;
  assign o[4] = o_7_;
  assign o[5] = o_7_;
  assign o[6] = o_7_;
  assign o[7] = o_7_;

endmodule