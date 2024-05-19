// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  integer correct, incorrect;
  reg [5:0] bits;

  initial begin
    bits = 32;
    incorrect = -180 + bits*(360.0/63.0);
    correct = bits*(360.0/63.0) - 180;
    $display("Both of these should be the same (3): %3d, %3d", incorrect,
                                                               correct);
    $finish(0);
  end
endmodule
