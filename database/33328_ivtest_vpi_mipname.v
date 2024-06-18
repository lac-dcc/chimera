// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test3;
    initial #1 $mytest;
endmodule

module test2;
    initial #2 $mytest;
    test3 t3();
endmodule

module test;
    initial #3 $mytest;
    test2 t2();
endmodule
