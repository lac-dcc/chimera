// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg result;

  initial begin

    result = $onehot(top);
    result = $onehot("a string");
    result = $onehot(4'b001, 1'b0);

  end

endmodule
