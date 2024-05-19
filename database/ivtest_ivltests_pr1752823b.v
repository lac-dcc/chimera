// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  real zero, mzero, inf, minf;

  initial begin
    zero = 0.0;
    mzero = -1.0 * zero;
    inf = 1/0.0;
    minf = -1 * inf;

    $display("+0=%f, -0=%f, inf=%f and minf=%f.", zero, mzero, inf, minf);
  end
endmodule
