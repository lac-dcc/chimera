// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module enumtestcase();

typedef enum logic { STATE_A, STATE_B } t_STATE;

t_STATE state;

bit select;

reg failed = 0;

initial begin
  select = 0;
  state = select ? STATE_B : STATE_A;
  $display(state);
  if (state != STATE_A) failed = 1;
  select = 1;
  state = select ? STATE_B : STATE_A;
  $display(state);
  if (state != STATE_B) failed = 1;

  if (failed)
    $display("FAILED");
  else
    $display("PASSED");
end

endmodule
