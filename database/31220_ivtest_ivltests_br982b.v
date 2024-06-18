// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module example;
  task simple_task;
    input in;
    output out;
    begin
      out = in;
    end
  endtask

  reg x = 0;
  initial begin
    simple_task(x,x,x);
    $finish;
  end
endmodule
