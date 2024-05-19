// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`begin_keywords "1364-2005"
module automatic_error();

task automatic auto_task;

integer local;

begin
  $monitor("%0d", local);
  #1 local = 0;
  #1 local = 1;
end

endtask

initial auto_task;

endmodule
`end_keywords
