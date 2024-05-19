// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module automatic_error();

reg  global;

task automatic auto_task;

reg local;

begin:block
  assign global = local;
end

endtask

endmodule
