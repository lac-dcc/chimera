// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`timescale 1us/100ns

module top;
  reg pass = 1'b1;

  real ra = 1.0;
  wire real rufunc;

  assign #10 rufunc = rl_func(ra);

  initial begin
    #1 if (rufunc == 2.0) begin
      pass = 1'b0;
      $display("Real: user function value (%f) not delayed.", rufunc);
    end
    #8 if (rufunc == 2.0) begin
      pass = 1'b0;
      $display("Real: user function value (%f) not delayed.", rufunc);
    end
    #2;
    if (rufunc != 2.0) begin
      pass = 1'b0;
      $display("Real: user function value not delayed correctly.");
    end
    if (pass) $display("PASSED");
  end

  function real rl_func;
    input real in;
    rl_func = in * 2.0;
  endfunction

endmodule
