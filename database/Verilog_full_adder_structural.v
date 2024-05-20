// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
 P1.1 FULL ADDER STRUCTURAL
 ************************************************/

 module full_adder_st(s, cout, a, b, cin); 
 	input a, b, cin;
 	output s, cout;

 	wire n1,n2,n3;

 	xor xor1(s,a,b,cin);
 	and and1(n1,a,b);
 	and and2(n2,a,cin);
 	and and3(n3,b,cin);
 	or or1(cout,n1,n2,n3);

 endmodule