// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module rega(A);
input [0:0] A;
endmodule

module test(A);
input [0:0] A;

    rega a (.A(A[(5 > 4 ? 0 : 1) : 0]));
    rega b (.A(A[(4 < 5 ? 0 : 1) : 0]));

    initial $display("PASSED");
endmodule
