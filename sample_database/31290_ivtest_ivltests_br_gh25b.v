// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// Regression test for GitHub issue 25
// This should result in a compile-time error when the language generation
// is 1364-2005 or earlier.

task test(input i, output o);

begin
  o = i;
end

endtask

module tb;

reg passed = 0;

initial begin
  test(1, passed);
  if (passed)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule
