// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   reg bool [31:0] idx;

   initial begin
      idx = 0;
      if (idx < 17) $display("PASSED");
      else $display("FAILED");
   end

endmodule
