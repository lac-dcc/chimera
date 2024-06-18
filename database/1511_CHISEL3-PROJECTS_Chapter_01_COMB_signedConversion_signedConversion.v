// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module signedConversion(
  input        clock,
  input        reset,
  input        io_sign,
  input  [7:0] io_mag,
  output [8:0] io_twos
);
  wire [7:0] _io_twos_T = ~io_mag; // @[signedConversion.scala 12:25]
  wire [8:0] _io_twos_T_1 = {1'h1,_io_twos_T}; // @[Cat.scala 33:92]
  wire [9:0] _io_twos_T_2 = _io_twos_T_1 + 9'h1; // @[signedConversion.scala 12:34]
  wire [9:0] _GEN_0 = io_sign ? _io_twos_T_2 : {{2'd0}, io_mag}; // @[signedConversion.scala 11:18 12:13 14:13]
  assign io_twos = _GEN_0[8:0];
endmodule
