// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module example;
  function simple_func;
    input in;
    begin
      simple_func = in;
    end
  endfunction

  reg x = 0;
  initial begin
    x = simple_func(x,x);
    $finish;
  end
endmodule
