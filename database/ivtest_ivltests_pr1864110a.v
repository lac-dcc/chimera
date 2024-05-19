// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  wire real plus, minus;

  assign plus = 3.0;
  assign minus = -3.0; // This does not generate a Cr<>, so it core dumps.

  initial begin
    #1 $display(plus,, minus);
  end
endmodule
