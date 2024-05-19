// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define FOO bar
module foo;
         initial begin
                 $display("macro FOO = %s", ``FOO);
         end
endmodule
