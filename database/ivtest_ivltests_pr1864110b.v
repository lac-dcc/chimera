// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  wire real minus;
  real in;

  assign minus = -in; // Should be arith/sub.r Cr<0>, <net>

  initial begin
    $monitor(minus,, in);

       in = 3.0;
    #1 in = 4.0;
    #1 in = 6.0;
  end
endmodule
