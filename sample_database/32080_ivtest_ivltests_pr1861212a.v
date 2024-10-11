// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top2;
  real vo;

  initial begin
    vo = 3.3;
    #1000 vo = 4.5776;
    #1000 vo = -4;
  end

  always @(vo)
    $display("Real value is %f at %g", vo, $time);
endmodule
