// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module xnor_gate(a,b,y);
input a,b;
output y;
xnor(y,a,b);
endmodule