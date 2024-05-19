// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  parameter rval = 1.23456;
  real rlv = 1.23456;

  initial begin
    $display("Real :%g: has a width of %0d.", rlv, $bits(rlv));
    $display("Parameter real :%g: has a width of %0d.", rval, $bits(rval));
    $display("Real constant :%g: has a width of %0d.", 1.23456,
             $bits(1.23456));
  end
endmodule
