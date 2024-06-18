// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg [79:0] data = 0;

  initial begin
    data = data + 80'h12345678901234567890;
    if (data !== 80'h12345678901234567890) $display("FAILED");
    else $display("PASSED");
  end
endmodule
