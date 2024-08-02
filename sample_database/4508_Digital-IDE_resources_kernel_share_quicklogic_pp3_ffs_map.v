// This program was cloned from: https://github.com/Nitcloud/Digital-IDE
// License: GNU General Public License v3.0

module \$_DFFSRE_PPPP_ (input C, S, R, E, D, output Q);
  wire _TECHMAP_REMOVEINIT_Q_ = 1;
  dffepc #(.INIT(1'b0)) _TECHMAP_REPLACE_ (.CLK(C), .PRE(S), .CLR(R), .EN(E), .D(D), .Q(Q));
endmodule
