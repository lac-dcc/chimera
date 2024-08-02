// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

integer count = 0;

initial begin
  repeat (10.4) begin
    count = count + 1;
    $display(count);
  end
  if (count === 10)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule
