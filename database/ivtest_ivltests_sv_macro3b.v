// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define PREFIX_		my_prefix_
`define SUFFIX		my_suffix

`define BACKTICK	"`"

`define name1		`PREFIX``_```SUFFIX
`define name2(p,s)	p``_``s

`define stringify(text)	`"text`"

module test();

initial begin
  $display(`BACKTICK);
  $display(`stringify(`name1));
  $display(`stringify(`name2(`PREFIX, `SUFFIX)));
end

endmodule
