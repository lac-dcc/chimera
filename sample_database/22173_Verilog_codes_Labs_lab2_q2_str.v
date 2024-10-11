// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module q2_str( input a, input b, input c,output result);
wire w1,w2,w3,w4,w5;

not n1(w1,a);
not n2(w2,b);
and a1(w3,w1,c);
and a2(w4,w2,c);
or o1(w5,w3,w4);
or o2(result,w5,w1);

endmodule