// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  integer res;
  initial begin
    $hello;
    $check_sys_task;
    res = $check_sys_func;
    $hello;
  end
endmodule
