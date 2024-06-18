// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

integer src;
reg     dst;

initial begin
  assign dst = src;
  src = 1;
  #1 $display(dst);
  if (dst === 1)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule
