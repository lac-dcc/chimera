// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;

wire real array[1:0];

reg [7:0] index;

real value;

initial begin
  index = 3;
  value = array[index];
  if (value == 0.0)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule
