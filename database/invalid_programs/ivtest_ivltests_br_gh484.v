// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define MY_FILE(dir, file) `"dir/file`"

module top;
initial $display("Using include file: ", `MY_FILE(ivltests, br_gh484.vh));

`include `MY_FILE(ivltests, br_gh484.vh)
endmodule
