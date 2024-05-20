// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module full_adder (a, b, cin, sum, cout);

input a;
input b;
input cin;
output sum;
output cout;

BUFX2 BUFX2_1 ( .A(1'b0), .Y(cout) );
BUFX2 BUFX2_2 ( .A(1'b0), .Y(sum) );
FILL FILL_0_0_0 ( );
FILL FILL_0_0_1 ( );
FILL FILL_0_0_2 ( );
endmodule
