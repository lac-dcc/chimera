// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`timescale 1ns/1ns
module top;

  initial begin
    $timeformat(-9,6,"ns",20);
    $display("here");
    $display("in top, time: %t",$time);

    $finish(0);
  end

endmodule
