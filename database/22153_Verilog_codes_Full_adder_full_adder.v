// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module full_adder(a, b, cin,sum, cout);
	input a,b,cin;
	output sum,cout;
   	assign sum = a ^ b ^ cin;
   	assign cout = (a & b) | (cin & (a ^ b));
endmodule
