// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg [256*8:1] name;

  initial begin
    name = "work/dumptest";
    $dumpfile({name, ".vcd"});
    $dumpvars;
  end
endmodule
