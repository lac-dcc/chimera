// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`timescale 1us/1us
module top_timescale;
  initial begin
    $printtimescale(top_timescale);
    $printtimescale(top_timescale2);
  end
endmodule

`resetall
`timescale 1ns/1ns
module top_timescale2;
  reg a;
  initial a = 1'b1;
endmodule
