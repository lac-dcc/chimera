// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module dut #(parameter a = 1, b = 2, c = 3) ();

initial begin
  $display("%0d %0d %0d", a, b, c);
  if (b === 2)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule

module top();

dut #(.a(4), .b(), .c(5)) dut();

endmodule
