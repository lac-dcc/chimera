// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  initial begin
    // This will fail at run time.
    $fdisplay(32'h4000_0000, "write to invalid MCD");
  end
endmodule
