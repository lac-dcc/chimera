// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;
    integer i;
    initial begin
        i = 7+1;
        if (i != 8)
            $display ("FAILED -- i = %0d != 8", i);
        else
            $display ("PASSED");
    end
endmodule
