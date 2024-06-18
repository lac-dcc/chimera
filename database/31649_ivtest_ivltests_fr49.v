// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// Check that a SystemVerilog do/while loop works correctly.
module top;
  int i;

  initial begin
    i = 0;
    do begin
      i += 1;
      $display("The value of i is %0d", i);
    end while (i < 2);
    $display("PASSED");
  end
endmodule
