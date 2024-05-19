// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define msg(x,y) `"x: `\`"y`\`"`"

module test();

initial begin
  $display(`msg(left side,right side));
end

endmodule
