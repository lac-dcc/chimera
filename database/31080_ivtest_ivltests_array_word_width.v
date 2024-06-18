// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg [15:0] array [1:0];

  initial begin
    array[1] = 15'd48;

    // This should display 0003
    $displayh(array[1]>>4);
  end
endmodule
