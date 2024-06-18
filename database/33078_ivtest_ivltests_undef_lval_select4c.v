// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  wire [2:-1] vec;
  integer idx;

  initial begin
    idx = 'bx;
    force vec[idx+:1] = 1'b1;
    release vec[idx+:1];
  end
endmodule
