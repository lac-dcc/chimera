// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define PATH		/usr/local/bin/
`define STRINGIFY(x)	`"x`"

module test();

initial begin
  $display( `STRINGIFY(`PATH) );
end

endmodule
