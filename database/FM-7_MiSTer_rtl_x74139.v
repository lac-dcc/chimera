// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module x74139(

  input  E1,
  input  E2,
  input  [1:0] A1,
  input  [1:0] A2,
  output reg [3:0] O1,
  output reg [3:0] O2

);

always @*
  if (~E1)
    case (A1)
      2'b00: O1 = 4'b1110;
      2'b01: O1 = 4'b1101;
      2'b10: O1 = 4'b1011;
      2'b11: O1 = 4'b0111;
    endcase
  else
    O1 = 4'b1111;

always @*
  if (~E2)
    case (A2)
      2'b00: O2 = 4'b1110;
      2'b01: O2 = 4'b1101;
      2'b10: O2 = 4'b1011;
      2'b11: O2 = 4'b0111;
    endcase
  else
    O2 = 4'b1111;

endmodule
