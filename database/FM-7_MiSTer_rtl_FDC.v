// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module FDC(
  input CLKSYS,
  input FD_MRn, // reset
  input [7:0] FD_Din,
  output [7:0] FD_Dout,
  input [2:0] FD_RS,
  output FD_DRQn,
  output FD_INTRQn,
  input FD_CSn,
  input FD_WEn,
  input FD_REn
);

assign FD_Dout = 8'hff; // no FDC

endmodule
