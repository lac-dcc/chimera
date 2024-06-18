// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
    genvar i;
    for (i = 100; i < 101; i = i + 1)
        for (i = 100; i < 101; i = i + 1)
            initial $display("%b %0d", i, $bits(i));
endmodule
