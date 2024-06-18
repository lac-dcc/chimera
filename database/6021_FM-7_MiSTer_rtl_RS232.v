// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module RS232(
  //input _2500kHz,
  input [15:0] MADDRBUS,
  output RS232_CEn,
  output [7:0] dout
);

wire RS232_CE = MADDRBUS == 16'hfd06 || MADDRBUS == 16'hfd07;
assign RS232_CEn = ~RS232_CE;
assign dout = RS232_CE ? 8'hff : 8'h00;


// intel 8251A

endmodule
