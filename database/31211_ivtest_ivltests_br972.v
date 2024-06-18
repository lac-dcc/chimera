// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

reg  in;
wire out;

assign out = out | in;

reg failed;

initial begin
  #1 in = 0;
  #0 $display("out = %b", out);
  if (out !== 1'bx) failed = 1;
  #1 in = 1;
  #0 $display("out = %b", out);
  if (out !== 1'b1) failed = 1;
  #1 in = 0;
  #0 $display("out = %b", out);
  if (out !== 1'b1) failed = 1;

  if (failed)
    $display("FAILED");
  else
    $display("PASSED");

  $finish;
end

endmodule
