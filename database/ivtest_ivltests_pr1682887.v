// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// pr1682887

module tb();
   task mytask;
      begin end
   endtask

   initial mytask();
   initial #1 $display("PASSED");
endmodule
