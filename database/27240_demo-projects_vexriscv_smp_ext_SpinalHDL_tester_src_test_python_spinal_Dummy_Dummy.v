// This program was cloned from: https://github.com/openXC7/demo-projects
// License: BSD 3-Clause "New" or "Revised" License

module Dummy();
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(1, Dummy);
  end
endmodule
