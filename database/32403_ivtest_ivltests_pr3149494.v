// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module m;

  reg [4'b1111 + 4'b0001 >> 1:0] x;
  reg [4'b1111 + 1 >> 1:0] y;

  initial
  begin
    x = -1;
    y = -1;
    $display("x = %b", x);
    $display("y = %b", y);
  end
endmodule
