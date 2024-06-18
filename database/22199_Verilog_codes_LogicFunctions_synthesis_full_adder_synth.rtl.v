// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module full_adder ( gnd, vdd, a, b, cin, sum, cout);

input gnd, vdd;
input a;
input b;
input cin;
output sum;
output cout;

BUFX2 BUFX2_1 ( .gnd(gnd), .vdd(vdd), .A(gnd), .Y(cout) );
BUFX2 BUFX2_2 ( .gnd(gnd), .vdd(vdd), .A(gnd), .Y(sum) );
endmodule
