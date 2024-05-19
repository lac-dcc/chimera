// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  integer ival=-1;
  initial begin
    $display("The value is %5.2f", ival);
    $display("The value is %5.2f", -1);
  end
endmodule
