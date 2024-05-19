// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module hier_ref_error();

task my_task;

begin:block
end

endtask

initial my_task.missing = 0;

endmodule
