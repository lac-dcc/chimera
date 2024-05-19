// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

`define MACRO \
  $display("file %s line %0d", \
           `__FILE__, `__LINE__);

initial begin
  $display("file %s line %0d", `__FILE__, `__LINE__);
`line 1 "real_source.v" 0
  $display("file %s line %0d", `__FILE__, `__LINE__);
`include "line_directive_inc.v"
  $display("file %s line %0d", `__FILE__, `__LINE__);
  `MACRO
  $display("file %s line %0d", `__FILE__, `__LINE__);
end

endmodule
