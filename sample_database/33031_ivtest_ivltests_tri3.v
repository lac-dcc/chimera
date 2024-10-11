// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

tri1 a;
tri0 b;

assign (pull1,pull0) a = 1'b0;
assign (pull1,pull0) b = 1'b1;

reg failed;

initial begin
  failed = 0; #1;
  $display("a = %b, expect x", a); if (a !== 1'bx) failed = 1;
  $display("b = %b, expect x", b); if (b !== 1'bx) failed = 1;

  if (failed)
    $display("FAILED");
  else
    $display("PASSED");
end

endmodule
