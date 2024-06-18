// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module pr2842185();

// check that dection of signal/genvar name collisions
// observes scope boundaries.

genvar i;

task MyTask;

integer i;

begin
  $display("PASSED");
end

endtask

initial MyTask;

endmodule
