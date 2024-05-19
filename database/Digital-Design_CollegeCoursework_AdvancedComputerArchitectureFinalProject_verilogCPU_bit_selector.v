// This program was cloned from: https://github.com/FPGADude/Digital-Design
// License: GNU General Public License v3.0

module bit_selector( y, shift_value );

  input      [15:0]	y;
  output reg [3:0]	shift_value;

always @*
  begin  
    output <= y[3:0];
  end

endmodule