// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  initial begin
    // This will fail at run time.
    $fdisplay(32'h8000_000f, "write to invalid FD");
  end
endmodule
