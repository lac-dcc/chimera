// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;
  reg [2:0] value;

  initial begin
    for(value = 0; value <= 6; value = value + 1) begin
      $displayh(value,, 1<<(6-value));
    end
  end
endmodule
