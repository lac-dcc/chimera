// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define MAC(i) $display(i);

module top;
initial begin
  if ("$display(in);" != ``MAC(in))
    $display("FAILED: expected \"display(in);\", got \"`MAC(in)\"");
  else $display("PASSED");
end
endmodule
