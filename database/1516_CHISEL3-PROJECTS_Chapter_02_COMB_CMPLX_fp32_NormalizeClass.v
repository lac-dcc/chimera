// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module NormalizeClass(
  input         clock,
  input         reset,
  input  [22:0] io_mantissa,
  output [22:0] io_normMantissa,
  output [4:0]  io_shift
);
  wire [15:0] _GEN_0 = {{8'd0}, io_mantissa[15:8]}; // @[Bitwise.scala 108:31]
  wire [15:0] _number_T_4 = _GEN_0 & 16'hff; // @[Bitwise.scala 108:31]
  wire [15:0] _number_T_6 = {io_mantissa[7:0], 8'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _number_T_8 = _number_T_6 & 16'hff00; // @[Bitwise.scala 108:80]
  wire [15:0] _number_T_9 = _number_T_4 | _number_T_8; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_1 = {{4'd0}, _number_T_9[15:4]}; // @[Bitwise.scala 108:31]
  wire [15:0] _number_T_14 = _GEN_1 & 16'hf0f; // @[Bitwise.scala 108:31]
  wire [15:0] _number_T_16 = {_number_T_9[11:0], 4'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _number_T_18 = _number_T_16 & 16'hf0f0; // @[Bitwise.scala 108:80]
  wire [15:0] _number_T_19 = _number_T_14 | _number_T_18; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_2 = {{2'd0}, _number_T_19[15:2]}; // @[Bitwise.scala 108:31]
  wire [15:0] _number_T_24 = _GEN_2 & 16'h3333; // @[Bitwise.scala 108:31]
  wire [15:0] _number_T_26 = {_number_T_19[13:0], 2'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _number_T_28 = _number_T_26 & 16'hcccc; // @[Bitwise.scala 108:80]
  wire [15:0] _number_T_29 = _number_T_24 | _number_T_28; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_3 = {{1'd0}, _number_T_29[15:1]}; // @[Bitwise.scala 108:31]
  wire [15:0] _number_T_34 = _GEN_3 & 16'h5555; // @[Bitwise.scala 108:31]
  wire [15:0] _number_T_36 = {_number_T_29[14:0], 1'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _number_T_38 = _number_T_36 & 16'haaaa; // @[Bitwise.scala 108:80]
  wire [15:0] _number_T_39 = _number_T_34 | _number_T_38; // @[Bitwise.scala 108:39]
  wire [22:0] _number_T_59 = {_number_T_39,io_mantissa[16],io_mantissa[17],io_mantissa[18],io_mantissa[19],io_mantissa[
    20],io_mantissa[21],io_mantissa[22]}; // @[Cat.scala 33:92]
  wire [4:0] _number_T_83 = _number_T_59[21] ? 5'h15 : 5'h16; // @[Mux.scala 47:70]
  wire [4:0] _number_T_84 = _number_T_59[20] ? 5'h14 : _number_T_83; // @[Mux.scala 47:70]
  wire [4:0] _number_T_85 = _number_T_59[19] ? 5'h13 : _number_T_84; // @[Mux.scala 47:70]
  wire [4:0] _number_T_86 = _number_T_59[18] ? 5'h12 : _number_T_85; // @[Mux.scala 47:70]
  wire [4:0] _number_T_87 = _number_T_59[17] ? 5'h11 : _number_T_86; // @[Mux.scala 47:70]
  wire [4:0] _number_T_88 = _number_T_59[16] ? 5'h10 : _number_T_87; // @[Mux.scala 47:70]
  wire [4:0] _number_T_89 = _number_T_59[15] ? 5'hf : _number_T_88; // @[Mux.scala 47:70]
  wire [4:0] _number_T_90 = _number_T_59[14] ? 5'he : _number_T_89; // @[Mux.scala 47:70]
  wire [4:0] _number_T_91 = _number_T_59[13] ? 5'hd : _number_T_90; // @[Mux.scala 47:70]
  wire [4:0] _number_T_92 = _number_T_59[12] ? 5'hc : _number_T_91; // @[Mux.scala 47:70]
  wire [4:0] _number_T_93 = _number_T_59[11] ? 5'hb : _number_T_92; // @[Mux.scala 47:70]
  wire [4:0] _number_T_94 = _number_T_59[10] ? 5'ha : _number_T_93; // @[Mux.scala 47:70]
  wire [4:0] _number_T_95 = _number_T_59[9] ? 5'h9 : _number_T_94; // @[Mux.scala 47:70]
  wire [4:0] _number_T_96 = _number_T_59[8] ? 5'h8 : _number_T_95; // @[Mux.scala 47:70]
  wire [4:0] _number_T_97 = _number_T_59[7] ? 5'h7 : _number_T_96; // @[Mux.scala 47:70]
  wire [4:0] _number_T_98 = _number_T_59[6] ? 5'h6 : _number_T_97; // @[Mux.scala 47:70]
  wire [4:0] _number_T_99 = _number_T_59[5] ? 5'h5 : _number_T_98; // @[Mux.scala 47:70]
  wire [4:0] _number_T_100 = _number_T_59[4] ? 5'h4 : _number_T_99; // @[Mux.scala 47:70]
  wire [4:0] _number_T_101 = _number_T_59[3] ? 5'h3 : _number_T_100; // @[Mux.scala 47:70]
  wire [4:0] _number_T_102 = _number_T_59[2] ? 5'h2 : _number_T_101; // @[Mux.scala 47:70]
  wire [4:0] _number_T_103 = _number_T_59[1] ? 5'h1 : _number_T_102; // @[Mux.scala 47:70]
  wire [4:0] _number_T_104 = _number_T_59[0] ? 5'h0 : _number_T_103; // @[Mux.scala 47:70]
  wire [4:0] number = _number_T_104 + 5'h1; // @[NormalizeClass.scala 13:51]
  wire [53:0] _GEN_4 = {{31'd0}, io_mantissa}; // @[NormalizeClass.scala 16:34]
  wire [53:0] _io_normMantissa_T = _GEN_4 << number; // @[NormalizeClass.scala 16:34]
  assign io_normMantissa = _io_normMantissa_T[22:0]; // @[NormalizeClass.scala 16:19]
  assign io_shift = _number_T_104 + 5'h1; // @[NormalizeClass.scala 13:51]
endmodule
