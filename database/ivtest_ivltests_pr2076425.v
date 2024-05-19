// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;

  task delay;
    z.delay;
  endtask

  always begin
    delay;
  end

  initial begin
    #10 $display("PASSED");
    $finish;
  end
endmodule

module z;
  task delay;
    #1;
  endtask
endmodule
