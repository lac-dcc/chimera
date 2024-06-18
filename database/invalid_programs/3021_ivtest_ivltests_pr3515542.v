// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  integer a;

  initial begin
    a = 15'1;
    a = 15'0;
    a = 15'x;
    a = 15'X;
    a = 15'z;
    a = 15'Z;
  end
endmodule
