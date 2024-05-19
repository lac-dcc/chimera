// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();
// wire r;
a ua ( .r ( !r ));
endmodule

module a ( r );
input  r;
endmodule
