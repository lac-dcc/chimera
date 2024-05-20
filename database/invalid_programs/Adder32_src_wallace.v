// This program was cloned from: https://github.com/HVT06/Adder32
// License: Apache License 2.0

 `include "adder.v"

module wallace(a_0, b_0, result);
  
  input [7:0] a_0, b_0;
  output [15:0] result;
  
  //first stage
  wire s11, s12, s13, s14, s15, s16, s17, s18;
  wire c11, c12, c13, c14, c15, c16, c17, c18;
  wire s21, s22, s23, s24, s25, s26, s27, s28;
  wire c21, c22, c23, c24, c25, c26, c27, c28;
  //second stage
  wire s31, s32, s33, s34, s35, s36, s37, s38;
  wire c31, c32, c33, c34, c35, c36, c37, c38;
  wire s41, s42, s43, s44, s45, s46, s47, s48;
  wire c41, c42, c43, c44, c45, c46, c47, c48;
  //third stage
  wire s51, s52, s53, s54, s55, s56, s57, s58, s59, s5_10; 
  wire c51, c52, c53, c54, c55, c56, c57, c58, c59, c5_10; 
  //fourth stage
  wire s61, s62, s63, s64, s65, s66, s67, s68, s69, s6_10, s6_11;
  wire c61, c62, c63, c64, c65, c66, c67, c68, c69, c6_10, c6_11; 
  //fith stage
  wire s71, s72, s73, s74, s75, s76, s77, s78, s79, s7_10, s7_11;
  wire c71, c72, c73, c74, c75, c76, c77, c78, c79, c7_10, c7_11; 
  //cpa stage
  wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10;
  
  
  //generating partial product
  
  integer i, j;
  reg p [15:0][15:0];
  
  always @(a_0, b_0) begin
  for(i=0; i<=7; i=i+1)
    for(j=0; j<=7; j=j+1)
      p[i][j] <= a_0[i] & b_0[j];
  end
  
  
 
  
  
  
  //result
  assign result[0] = p[0][0];
  assign result[1] = s11;
  assign result[2] = s31;
  assign result[3] = s51;
  assign result[4] = s61;
  assign result[5] = s71;
  assign result[6] = s72;
  assign result[7] = s73;
  assign result[8] = s74;
  assign result[9] = s75;
  assign result[10] = s76;
  assign result[11] = s77;
  assign result[12] = s78;
  assign result[13] = s79;
  assign result[14] = s7_10;
  assign result[15] = s7_11;
  
  
  //first stage
  ha ha11(p[1][0], p[0][1], s11, c11);
  fa fa12(p[2][0], p[1][1], p[0][2], s12, c12);
  fa fa13(p[3][0], p[2][1], p[1][2], s13, c13);
  fa fa14(p[4][0], p[3][1], p[2][2], s14, c14);
  fa fa15(p[5][0], p[4][1], p[3][2], s15, c15);
  fa fa16(p[6][0], p[5][1], p[4][2], s16, c16);
  fa fa17(p[7][0], p[6][1], p[5][2], s17, c17);
  ha ha18(p[7][1], p[6][2], s18, c18);
  
  
  ha ha21(p[1][3], p[0][4], s21, c21);
  fa fa22(p[2][3], p[1][4], p[0][5], s22, c22);
  fa fa23(p[3][3], p[2][4], p[1][5], s23, c23);
  fa fa24(p[4][3], p[3][4], p[2][5], s24, c24);
  fa fa25(p[5][3], p[4][4], p[3][5], s25, c25);
  fa fa26(p[6][3], p[5][4], p[4][5], s26, c26);
  fa fa27(p[7][3], p[6][4], p[5][5], s27, c27);
  ha ha28(p[7][4], p[6][5], s28, c28);
          
  //second stage
  ha ha31(s12, c11, s31, c31);
  fa fa32(s13, c12, p[0][3], s32, c32);
  fa fa33(s14, c13, s21, s33, c33);
  fa fa34(s15, c14, s22, s34, c34);
  fa fa35(s16, c15, s23, s35, c35);
  fa fa36(s17, c16, s24, s36, c36);
  fa fa37(s18, c17, s25, s37, c37);
  fa fa38(p[7][2], c18, s26, s38, c38);
  
  ha ha41(c22, p[0][6], s41, c41);
  fa fa42(c23, p[1][6], p[0][7], s42, c42);
  fa fa43(c24, p[2][6], p[1][7], s43, c43);
  fa fa44(c25, p[3][6], p[2][7], s44, c44);
  fa fa45(c26, p[4][6], p[3][7], s45, c45);
  fa fa46(c27, p[5][6], p[4][7], s46, c46);
  fa fa47(c28, p[6][6], p[5][7], s47, c47);
  ha ha48(p[7][6], p[6][7], s48, c48);
  
  //third stage
  ha ha51(s32, c31, s51, c51);
  ha ha52(s33, c32, s52, c52);
  fa fa53(s34, c33, c21, s53, c53);
  fa fa54(s35, c34, s41, s54, c54);
  fa fa55(s36, c35, s42, s55, c55);
  fa fa56(s37, c36, s43, s56, c56);
  fa fa57(s38, c37, s44, s57, c57);
  fa fa58(s27, c38, s45, s58, c58);
  ha ha59(s28, s46, s59, c59);
  ha ha510(p[7][5], s47, s5_10, c5_10);
  
  //fourth stage
  ha ha61(s52, c51, s61, c61);
  ha ha62(s53, c52, s62, c62);
  ha ha63(s54, c53, s63, c63);
  fa fa64(s55, c54, c41, s64, c64);
  fa fa65(s56, c55, c42, s65, c65);
  fa fa66(s57, c56, c43, s66, c66);
  fa fa67(s58, c57, c44, s67, c67);
  fa fa68(s59, c58, c45, s68, c68);
  fa fa69(s5_10, c59, c46, s69, c69);
  fa fa610(s48, c5_10, c47, s6_10, c6_10);
  ha ha611(p[7][7], c48, s6_11, c6_11);
  
  //will be displaced by cpa
  /*
  ha ha71(s62, c61, s71, c71);
  fa fa72(s63, c62, c71, s72, c72);
  fa fa73(s64, c63, c72, s73, c73);
  fa fa74(s65, c64, c73, s74, c74);
  fa fa75(s66, c65, c74, s75, c75);
  fa fa76(s67, c66, c75, s76, c76);
  fa fa77(s68, c67, c76, s77, c77);
  fa fa78(s69, c68, c77, s78, c78);
  fa fa79(s6_10, c69, c78, s79, c79);
  fa fa710(s6_11, c6_10, c79, s7_10, c7_10);
  ha ha711(c6_11, c7_10, s7_11,c7_11);
  */
  
  //last cpa part
  assign c1 = s62&c61;
  assign c2 = s63&c62 | c1&(s63|c62);
  assign c3 = s64&c63 | c2&(s63|c62);
  assign c4 = s65&c64 | c3&(s65|c64);
  assign c5 = s66&c65 | c4&(s66|c65);
  assign c6 = s67&c66 | c5&(s67|c66);
  assign c7 = s68&c67 | c6&(s68|c67);
  assign c8 = s69&c68 | c7&(s69|c68);
  assign c9 = s6_10&c69 | c8&(s6_10|c69);
  assign c10 = s6_11&c6_10 | c9&(s6_11|c6_10);
 
  fa_no_carry_out fa0(1'b0, s62, c61, s71);
  fa_no_carry_out fa1(c1, s63, c62, s72);
  fa_no_carry_out fa2(c2, s64, c63, s73);
  fa_no_carry_out fa3(c3, s65, c64, s74);
  fa_no_carry_out fa4(c4, s66, c65, s75);
  fa_no_carry_out fa5(c5, s67, c66, s76);
  fa_no_carry_out fa6(c6, s68, c67, s77);
  fa_no_carry_out fa7(c7, s69, c68, s78);
  fa_no_carry_out fa8(c8, s6_10, c69, s79);
  fa_no_carry_out fa9(c9, s6_11, c6_10, s7_10);
  fa_no_carry_out fa10(c10, 1'b0, c6_11, s7_11);
  
endmodule