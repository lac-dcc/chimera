// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg [79:0] str;
  integer val;

  initial begin
    str = "5";
    $sscanf(str, "%d", val);
    if (val == 5) $display("PASSED");
    else $display("Failed to convert string, got %d", val);
  end
endmodule
