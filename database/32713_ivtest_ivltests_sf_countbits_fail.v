// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  integer result;

  initial begin

    result = $countbits(top);
    result = $countbits("a string");
    result = $countbits(1'bx);
    result = $countbits("a string", 1'bx);
    result = $countbits(1'bx, "a string");
    result = $countbits(1'bx, 1'bx, "a string");

  end

endmodule
