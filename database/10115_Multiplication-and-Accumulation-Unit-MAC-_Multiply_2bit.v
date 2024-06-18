// This program was cloned from: https://github.com/Nilesh002/Multiplication-and-Accumulation-Unit-MAC-
// License: MIT License

module mul2(a,b,p);
input [1:0]a,b;
output [3:0]p;

wire [3:0]w;
wire [2:0]c;

and a1(w[0],a[0],b[0]);
and a2(w[1],a[1],b[0]);
and a3(w[2],a[0],b[1]);
and a4(w[3],a[1],b[1]);

assign p[0]=w[0];

ha b1(w[1],w[2],p[1],c[0]);
ha b2(w[3],c[0],p[2],p[3]);

endmodule
