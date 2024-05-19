// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;

  // A join_any will always take the shortest path
  always fork
    #2;
    #1;
  join_none

  initial begin
     $display("FAILED");
     #1;
     $finish;
  end

endmodule
