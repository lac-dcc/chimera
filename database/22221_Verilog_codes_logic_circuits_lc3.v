// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module lc3(a,b,c,w,x,y,z,q);
input a,b,c ;
output w,x,y,z,q;

and(w,a,b);
or(x,b,c);
and(y,c,b);
and(z,x,y);
or(q,w,z);

endmodule
