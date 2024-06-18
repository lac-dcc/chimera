// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg [79:0] str;

  initial begin
    $readmempath(str);
    str = "test";
    str[7:0] = 'd2;
    $readmempath(str);
  end
endmodule
