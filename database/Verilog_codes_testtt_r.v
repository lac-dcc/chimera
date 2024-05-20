// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module adder_4bit(input [3:0]a,input [3:0]b,input cin, output [3:0]sum, output cout);
	wire [2:0]c;
	adder a1(a[0],b[0],cin,sum[0],c[0]);
	adder a2(a[1],b[1],c[0],sum[1],c[1]);
	adder a3(a[2],b[2],c[1],sum[2],c[2]);
	adder a4(a[3],b[3],c[2],sum[3],cout);
 
endmodule 
module adder(a,b,cin,sum,cout);
	input a,b,cin;
	output sum,cout;
	wire w1,w2,w3;
	xor(sum,a,b,cin);
	and and1(w1,a,cin);
	and and2(w2,b,cin);
	and and3(w3,a,b);
	or(cout,w1,w2,w3);
endmodule