// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;
   logic y;

   always_latch begin
      y = 1'b0;
   end

  initial $display("FAILED");
endmodule
