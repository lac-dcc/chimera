// This program was cloned from: https://github.com/techiepriyansh/zktsim
// License: Apache License 2.0

module cla_adder_6b (sum, c_out, a, b, c_in);

input [5:0] a, b;
input c_in;

output [5:0] sum;
output c_out;

wire p0, p1, p2, p3, p4, p5;
wire g0, g1, g2, g3, g4, g5;

wire c1, c2, c3, c4, c5;

wire c1_t0;
wire c2_t0, c2_t1;
wire c3_t0, c3_t1, c3_t2;
wire c4_t0, c4_t1, c4_t2, c4_t3;
wire c5_t0, c5_t1, c5_t2, c5_t3, c5_t4;
wire c_out_t0, c_out_t1, c_out_t2, c_out_t3, c_out_t4, c_out_t5;

// propagates

xor(p0, a[0], b[0]);
xor(p1, a[1], b[1]);
xor(p2, a[2], b[2]);
xor(p3, a[3], b[3]);
xor(p4, a[4], b[4]);
xor(p5, a[5], b[5]);

// generates

and(g0, a[0], b[0]);
and(g1, a[1], b[1]);
and(g2, a[2], b[2]);
and(g3, a[3], b[3]);
and(g4, a[4], b[4]);
and(g5, a[5], b[5]);


//carries

and(c1_t0, p0, c_in);
or(c1, c1_t0, g0);

and(c2_t1, p1, g0);
and(c2_t0, p1, p0, c_in);
or(c2, c2_t1, c2_t0, g1);

and(c3_t2, p2, g1);
and(c3_t1, p2, p1, g0);
and(c3_t0, p2, p1, p0, c_in);
or(c3, c3_t2, c3_t1, c3_t0, g2);

and(c4_t3, p3, g2);
and(c4_t2, p3, p2, g1);
and(c4_t1, p3, p2, p1, g0);
and(c4_t0, p3, p2, p1, p0, c_in);
or(c4, c4_t3, c4_t2, c4_t1, c4_t0, g3);

and(c5_t4, p4, g3);
and(c5_t3, p4, p3, g2);
and(c5_t2, p4, p3, p2, g1);
and(c5_t1, p4, p3, p2, p1, g0);
and(c5_t0, p4, p3, p2, p1, p0, c_in);
or(c5, c5_t4, c5_t3, c5_t2, c5_t1, c5_t0, g4);

and(c_out_t5, p5, g4);
and(c_out_t4, p5, p4, g3);
and(c_out_t3, p5, p4, p3, g2);
and(c_out_t2, p5, p4, p3, p2, g1);
and(c_out_t1, p5, p4, p3, p2, p1, g0);
and(c_out_t0, p5, p4, p3, p2, p1, p0, c_in);
or(c_out, c_out_t5, c_out_t4, c_out_t3, c_out_t2, c_out_t1, c_out_t0, g5);

// sum

xor(sum[0], p0, c_in);
xor(sum[1], p1, c1);
xor(sum[2], p2, c2);
xor(sum[3], p3, c3);
xor(sum[4], p4, c4);
xor(sum[5], p5, c5);

endmodule