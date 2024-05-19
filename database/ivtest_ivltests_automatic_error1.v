// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module automatic_error();

task automatic auto_task;

reg local;

local = 1;

endtask

initial auto_task.local = 0;

endmodule
