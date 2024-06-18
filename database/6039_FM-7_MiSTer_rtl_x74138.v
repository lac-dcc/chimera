// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module x74138(
  input G2B,
  input G2A,
  input G1,
  input A,
  input B,
  input C,
  output reg Y0,
  output reg Y1,
  output reg Y2,
  output reg Y3,
  output reg Y4,
  output reg Y5,
  output reg Y6,
  output reg Y7
);

always @*
  if (~G2B & ~G2A & G1) { Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0 }  = ~(1<<{ C, B, A });
  else { Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0 } = 8'b11111111;

endmodule
