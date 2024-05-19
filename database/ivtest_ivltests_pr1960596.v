// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;
   initial begin
      $write("expected 32'h55555552; got 32'h%0h\n", (-(32'h9) / 32'h3));
      $write("expected 1; got %0d\n", (-(32'h9) % 32'h3));
   end
endmodule
