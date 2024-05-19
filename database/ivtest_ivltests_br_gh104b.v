// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

task start;
  top.dut.signal = 1;
endtask

module dut();
  logic signal = 0;

  initial begin
    $display(signal);
    @(signal);
    $display(signal);
    if (signal === 1)
      $display("PASSED");
    else
      $display("FAILED");
    $finish;
  end
endmodule

module top();
  initial begin
    #1 start();
  end

  dut dut();
endmodule
