// This program was cloned from: https://github.com/Nilesh002/Multiplication-and-Accumulation-Unit-MAC-
// License: MIT License

module mul8(a,b,p);
input [7:0]a,b;
output [15:0]p;

wire [7:0]q0,q1,q2,q3;
wire [7:0]t1;
wire [15:0]t2,t3,t4;
wire [7:0]q4;
wire [11:0]q5,q6;

mul4 m1(a[3:0], b[3:0], q0[7:0]);
mul4 m2(a[7:4], b[3:0], q1[7:0]);
mul4 m3(a[3:0], b[7:4], q2[7:0]);
mul4 m4(a[7:4], b[7:4], q3[7:0]);

add8  k1(q1[7:0],{4'b0,q0[7:4]},q4);
add12 k2({4'b0,q2[7:0]},{q3[7:0],4'b0},q5);
add12 k3(q5,{4'b0,q4[7:0]},q6);


assign p[3:0]=q0[3:0];
assign p[15:4]=q6[11:0];

endmodule
