// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define simple      "simple name"
`define \escaped    "escaped name"
`define \`name      "backtick name"
`define \`          "backtick"
`define \quote (x)  `"`\`"x`\`"`"
`define \`\`"       "escaped quote"

module test();

initial begin
  $display(`simple);
  $display(`\simple );
  $display(`escaped);
  $display(`\escaped );
  $display(`\`name );
  $display(`\` );
  $display(`quote(text));
  $display(`\quote (text));
  $display(`\`\`" );
end

endmodule
