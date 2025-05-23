// This program was cloned from: https://github.com/FPGAwars/apio
// License: GNU General Public License v2.0

// Code generated by Icestudio 0.8.1w202112300112

`default_nettype none

//---- Top entity
module main (
 input [1:0] v38003d,
 output [1:0] v81f397,
 output [1:0] vb6741a
);
 wire [0:1] w0;
 wire [0:1] w1;
 wire [0:1] w2;
 assign w0 = v38003d;
 assign v81f397 = w0;
 assign vb6741a = w1;
 assign w2 = v38003d;
 assign w2 = w0;
 v76f7ce v6ccb58 (
  .v8fd8fb(w1),
  .va8fcbc(w2)
 );
endmodule

//---- Top entity
module v76f7ce (
 input [1:0] va8fcbc,
 output [1:0] v8fd8fb
);
 wire [0:1] w0;
 wire [0:1] w1;
 wire w2;
 wire w3;
 wire w4;
 wire w5;
 assign w0 = va8fcbc;
 assign v8fd8fb = w1;
 v0dbcb9 v7d1cb8 (
  .v8b19dd(w0),
  .v3f8943(w2),
  .v64d863(w4)
 );
 v80ac84 v1cc6f4 (
  .v67a3fc(w1),
  .vee8a83(w3),
  .v03aaf0(w5)
 );
 v3676a0 v214cf3 (
  .v0e28cb(w2),
  .vcbab45(w3)
 );
 v3676a0 v8b12b1 (
  .v0e28cb(w4),
  .vcbab45(w5)
 );
endmodule

//---------------------------------------------------
//-- not-x2
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- not-x2: 2-bits not gate
//---------------------------------------------------
//---- Top entity
module v0dbcb9 (
 input [1:0] v8b19dd,
 output v3f8943,
 output v64d863
);
 wire w0;
 wire w1;
 wire [0:1] w2;
 assign v3f8943 = w0;
 assign v64d863 = w1;
 assign w2 = v8b19dd;
 v0dbcb9_v9a2a06 v9a2a06 (
  .o1(w0),
  .o0(w1),
  .i(w2)
 );
endmodule

//---------------------------------------------------
//-- Bus2-Split-all
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- Bus2-Split-all: Split the 2-bits bus into two wires
//---------------------------------------------------

module v0dbcb9_v9a2a06 (
 input [1:0] i,
 output o1,
 output o0
);
 assign o1 = i[1];
 assign o0 = i[0];
endmodule
//---- Top entity
module v80ac84 (
 input vee8a83,
 input v03aaf0,
 output [1:0] v67a3fc
);
 wire w0;
 wire w1;
 wire [0:1] w2;
 assign w0 = vee8a83;
 assign w1 = v03aaf0;
 assign v67a3fc = w2;
 v80ac84_v9a2a06 v9a2a06 (
  .i1(w0),
  .i0(w1),
  .o(w2)
 );
endmodule

//---------------------------------------------------
//-- Bus2-Join-all
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- Bus2-Join-all: Joint two wires into a 2-bits Bus
//---------------------------------------------------

module v80ac84_v9a2a06 (
 input i1,
 input i0,
 output [1:0] o
);
 assign o = {i1, i0};
 
endmodule
//---- Top entity
module v3676a0 (
 input v0e28cb,
 output vcbab45
);
 wire w0;
 wire w1;
 assign w0 = v0e28cb;
 assign vcbab45 = w1;
 v3676a0_vd54ca1 vd54ca1 (
  .a(w0),
  .q(w1)
 );
endmodule

//---------------------------------------------------
//-- NOT
//-- - - - - - - - - - - - - - - - - - - - - - - - --
//-- NOT gate (Verilog implementation)
//---------------------------------------------------

module v3676a0_vd54ca1 (
 input a,
 output q
);
 //-- NOT Gate
 assign q = ~a;
 
 
endmodule
