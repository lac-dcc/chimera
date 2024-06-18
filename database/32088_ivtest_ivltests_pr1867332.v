// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test (
  input CL,
  input CSB
);

 reg a;

 specify specparam
   tps = 0.0;
   $setup(posedge CSB, edge[01,0x,x1,1x] CL, tps, a);
 endspecify

endmodule
