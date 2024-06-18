// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  integer value;

  initial begin
    value = 0;
    $strobe("%0d %0d", value, value + 1);
    value = 2;
  end
endmodule
