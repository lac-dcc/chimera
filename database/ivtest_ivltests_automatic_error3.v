// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`begin_keywords "1364-2005"
module automatic_error();

reg  global;

task automatic auto_task;

begin:block
  reg local;

  global <= @(local) 0;
end

endtask

endmodule
`end_keywords
