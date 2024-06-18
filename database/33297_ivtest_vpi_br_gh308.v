// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;

reg [31:0] vec;

initial begin
  vec = 0;  // make sure vec is not pruned
  $test;
end

endmodule
