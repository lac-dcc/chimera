// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg [7:0] val;
  reg [3:0] idx;
  reg [7:0] res;

  initial begin
    val = 8'hff;
    idx = 4'bx;
    $sformat(res, "%b", val[idx]);
    if (res !== "x") $display("Failed: expected 'bx , got 'b%s", res);
    else $display("PASSED");
  end
endmodule
