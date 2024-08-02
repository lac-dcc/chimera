// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg pass = 1;
  initial begin
    if (4'sd2 < -2) begin
      $display("Failed for operator <");
      pass = 0;
    end
    if (4'sd2 <= -2) begin
      $display("Failed for operator <=");
      pass = 0;
    end
    if (-2 > 4'sd2) begin
      $display("Failed for operator >");
      pass = 0;
    end
    if (-2 >= 4'sd2) begin
      $display("Failed for operator >=");
      pass = 0;
    end
    if (pass) $display("PASSED");
  end
endmodule
