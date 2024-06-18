// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module bug;

reg [4:0] a = 5'b01010;

reg failed = 0;

initial begin
  foreach (a[i]) begin
    $display("Value of a[%0d]=%0d", i, a[i]);
    if (a[i] !== i[0]) failed = 1;
  end
  if (failed)
    $display("FAILED");
  else
    $display("PASSED");
end

endmodule
