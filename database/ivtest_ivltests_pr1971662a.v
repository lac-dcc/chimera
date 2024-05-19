// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  parameter rep = 4'bx;

  reg [31:0] a;

  initial begin
    a = {rep{8'hab}}; // This should be a compilation error!
    $display("FAILED");
  end
endmodule
