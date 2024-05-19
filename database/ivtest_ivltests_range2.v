// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * This is frpm PR#138. It is supposed to generate an error.
 */
module  bug;
        wire[1:0]       dout;
        wire[1:0]       din;

        assign dout = din[3:2];
   /* foo.vl:9: bit/part select [3:2] out of range for bug.din */
endmodule
