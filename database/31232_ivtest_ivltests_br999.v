// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module bug();

localparam integer a = 1;

integer b = 2;

initial begin
  if (a == b)
    $display("FAILED");
  else
    $display("PASSED");
end

endmodule
